<?php

namespace App\Controller;

use App\Entity\OrderDetail;
use App\Form\OrderDetailType;
use App\Repository\OrderDetailRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/order/detail")
 */
class OrderDetailController extends AbstractController
{
    /**
     * @Route("/", name="order_detail_index", methods={"GET"})
     */
    public function index(OrderDetailRepository $orderDetailRepository): Response
    {
        return $this->render('order_detail/index.html.twig', [
            'order_details' => $orderDetailRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="order_detail_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $orderDetail = new OrderDetail();
        $form = $this->createForm(OrderDetailType::class, $orderDetail);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($orderDetail);
            $entityManager->flush();

            return $this->redirectToRoute('order_detail_index');
        }

        return $this->render('order_detail/new.html.twig', [
            'order_detail' => $orderDetail,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="order_detail_show", methods={"GET"})
     */
    public function show(OrderDetail $orderDetail): Response
    {
        return $this->render('order_detail/show.html.twig', [
            'order_detail' => $orderDetail,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="order_detail_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, OrderDetail $orderDetail): Response
    {
        $form = $this->createForm(OrderDetailType::class, $orderDetail);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('order_detail_index');
        }

        return $this->render('order_detail/edit.html.twig', [
            'order_detail' => $orderDetail,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="order_detail_delete", methods={"DELETE"})
     */
    public function delete(Request $request, OrderDetail $orderDetail): Response
    {
        if ($this->isCsrfTokenValid('delete'.$orderDetail->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($orderDetail);
            $entityManager->flush();
        }

        return $this->redirectToRoute('order_detail_index');
    }
}
