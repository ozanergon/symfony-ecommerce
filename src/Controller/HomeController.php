<?php

namespace App\Controller;

use App\Entity\Admin\Messages;
use App\Entity\Product;
use App\Entity\Setting;
use App\Entity\User;
use App\Form\Admin\MessagesType;
use App\Form\UserType;
use App\Repository\Admin\CommentRepository;
use App\Repository\ImageRepository;
use App\Repository\ProductRepository;
use App\Repository\SettingRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Bridge\Google\Smtp\GmailTransport;
use Symfony\Component\Mailer\Mailer;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Mime\Email;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(SettingRepository $settingRepository, ProductRepository $productRepository)
    {
        $setting = $settingRepository->findBy(['id'=>3]);
        $slider = $productRepository->findBy([],['title'=>'ASC'],3);
        $product = $productRepository->findBy([],['title'=>'DESC'],6);
        $newproducts = $productRepository->findBy([],['title'=>'DESC'],10 );

        // array findBy(array $criteria, array $orderBy = null, int|null $limit = null, int|null $offset = null)
        // dump($slider);
        // die();
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'setting' => $setting,
            'slider' => $slider,
            'product' => $product,
            'newproducts' => $newproducts,
        ]);
    }

    /**
     * @Route("/product/{id}", name="product_show", methods={"GET"})
     */
    public function show(Product $product, $id, ImageRepository $imageRepository, CommentRepository $commentRepository): Response
    {
        $images = $imageRepository->findBy(['product'=>$id]);
        $comments = $commentRepository->findBy(['productid'=>$id,'status'=>'True']);


        return $this->render('home/productshow.html.twig', [
            'product' => $product,
            'images' => $images,
            'comments' => $comments,

        ]);
    }

    /**
     * @Route("/about", name="home_about")
     */
    public function abouts(SettingRepository $settingRepository): Response
    {
        $setting = $settingRepository->findAll();
        return $this->render('home/aboutus.html.twig', [
            'setting' => $setting,
        ]);
    }

    /**
     * @Route("/contact", name="home_contact", methods={"GET","POST"})
     */
    public function contact(SettingRepository $settingRepository, Request $request): Response
    {
        $message = new Messages();
        $form = $this->createForm(MessagesType::class, $message);
        $form->handleRequest($request);
        $submittedToken = $request->request->get('token');
        $setting=$settingRepository->findAll(); // Get setting data
        // dump($request);
        // die();

        if ($form->isSubmitted()) {
            if($this->isCsrfTokenValid('form-message',$submittedToken)){
                $entityManager = $this->getDoctrine()->getManager();
                $message->setStatus('New');
                $message->setIp($_SERVER['REMOTE_ADDR']);
                $entityManager->persist($message);
                $entityManager->flush();
                $this->addFlash('success','Your message has been sent successfully');

                // ************ SEND EMAIL ************

                $email = (new Email())
                    ->from($setting[0]->getSmtpemail())
                    ->to($form['email']->getData())
                    //->cc('cc@example.com')
                    //->bcc('bcc@example.com')
                    //->replyTo('fabien@example.com')
                    //->priority(Email::PRIORITY_HIGH)
                    ->subject('AllHoliday Your Request')
                    // ->text('Simple Text')
                    ->html("Dear ".$form['name']->getData() ."<br>
                    <p>We will eveluate your requests and contact you as soon as possible</p>
                    Thank You for your message<br> 
                    =====================================
                    <br>".$setting[0]->getCompany()." <br>
                    Address : ".$setting[0]->getAddress()."<br>
                    Phone : ".$setting[0]->getPhone()."<br>"
                    );

                $transport = new GmailTransport($setting[0]->getSmtpemail(), $setting[0]->getSmtppassword());
                $mailer = new Mailer($transport);
                $mailer->send($email);

                // ************ SEND EMAIL ************

                return $this->redirectToRoute('home_contact');


            }
        }

        $setting = $settingRepository->findAll();
        return $this->render('home/contact.html.twig', [
            'setting' => $setting,
            'form' => $form->createView(),
        ]);
    }


    /**
     * @Route("/newuser", name="new_user", methods={"GET","POST"})
     */
    public function newuser(Request $request, UserRepository $userRepository, UserPasswordEncoderInterface $passwordEncoder): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        $submittedToken = $request->request->get('token');

        if($this->isCsrfTokenValid('user-form', $submittedToken)){
            if($form->isSubmitted()){
                $emaildata=$userRepository->findBy(
                    ['email' => $user->getEmail()]
                );
                if($emaildata == null){
                    $em = $this->getDoctrine()->getManager();
                    $user->setPassword(
                        $passwordEncoder->encodePassword(
                            $user,
                            $form->get('password')->getData()
                        )
                    );
                    //$user->setRoles("ROLE_USER");
                    $user->setRoles($form->get("roles")->getData());
                    $em->persist($user);
                    $em->flush();
                    $this->addFlash('success','Üye kaydınız başarıyla gerçekleşmiştir. <br> Log in olabilirsiniz');
                    return $this->redirectToRoute('login_user');
                }
                else{
                    $this->addFlash('error', ' '. $user->getEmail(). " maili zaten kayıtlı!");

                }
            }
        }
        return $this->render('home/newuser.html.twig', [
            'user' => $user,
            'form' => $form->createView(),
        ]);

    }




}



