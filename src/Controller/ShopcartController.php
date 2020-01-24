<?php

namespace App\Controller;

use App\Entity\Shopcart;
use App\Form\ShopcartType;
use App\Repository\ShopcartRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/shopcart")
 */
class ShopcartController extends AbstractController
{
    /**
     * @Route("/", name="shopcart_index", methods={"GET"})
     */
    public function index(ShopcartRepository $shopcartRepository): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY'); // login kontrolü güvenlik için
        $user = $this->getUser();
        $id = $user->getId();
        // dump($request);
        // echo $user->getId();
        //die();

        $em = $this->getDoctrine()->getManager();

        $sql = "SELECT p.title, p.price , s.*

                FROM shopcart s , product p
                
                WHERE s.userid = $id AND p.id = s.productid ";

        $statement = $em->getConnection()->prepare($sql);
        $statement->bindValue('userid', $user->getid());
        $statement->execute();
        $shopcart = $statement->fetchAll();
        //dump($shopcart);
        //die();
        return $this->render('shopcart/index.html.twig', [
            'shopcarts' => $shopcart,
        ]);
    }
    /**
     * @Route("/new", name="shopcart_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $shopcart = new Shopcart();
        $form = $this->createForm(ShopcartType::class, $shopcart);
        $form->handleRequest($request);

        if ($form->isSubmitted()) {

            $params = $request->request->get('shopcart');
            // dump($params['Q']);
            //dump($request);
            //die();

            $entityManager = $this->getDoctrine()->getManager();
            $shopcart->setProductid($params['ID']);
            $shopcart->setQuantity($params['Q']);
            $user = $this->getUser();
            $shopcart->setUserid($user->getid());
            $entityManager->persist($shopcart);
            $entityManager->flush();

            return $this->redirectToRoute('shopcart_index');
        }

        return $this->render('shopcart/new.html.twig', [
            'shopcart' => $shopcart,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="shopcart_show", methods={"GET"})
     */
    public function show(Shopcart $shopcart): Response
    {
        return $this->render('shopcart/show.html.twig', [
            'shopcart' => $shopcart,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="shopcart_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Shopcart $shopcart): Response
    {
        $form = $this->createForm(ShopcartType::class, $shopcart);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('shopcart_index');
        }

        return $this->render('shopcart/edit.html.twig', [
            'shopcart' => $shopcart,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}/del", name="shopcart_del", methods={"GET","POST"})
     */
    public function del(Request $request, Shopcart $shopcart): Response
    {
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($shopcart);
        $entityManager->flush();
        return $this->redirectToRoute('shopcart_index');
        $this->addFlash('success','Ürün sepetten silindi');
    }
    /**
     * @Route("/{id}", name="shopcart_delete")
     */
    public function delete(Request $request, Shopcart $shopcart): Response
    {
        if ($this->isCsrfTokenValid('delete'.$shopcart->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($shopcart);
            $entityManager->flush();
        }

        return $this->redirectToRoute('shopcart_index');
    }
}
