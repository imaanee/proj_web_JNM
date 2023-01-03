<?php

namespace App\Controller;
use App\Form\TransportFormType;
use App\Entity\Transport;
use App\Repository\TransportRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TransportController extends AbstractController
{
    private $repository;
    private $om;

    function __construct(TransportRepository $repository, EntityManagerInterface $om) {

        $this->repository = $repository;
        $this->om=$om;
    }

    #[Route('/transport', name: 'app_transport')]
    public function register(Request $request, EntityManagerInterface $entityManager): Response
    {
        $listeTransport = $this->repository->findAll();

        $transport = new Transport();
        $form = $this->createForm(TransportFormType::class, $transport);
        //$transport->handleRequest($request);
        //$name =$concours->getMiage();
        if ($form->isSubmitted() && $form->isValid()) {
            //$file = $form->get('titreVideo')->getData();

            $this->addFlash('success', 'Votre réservation a bien été pris en compte !');

            //return $this->redirectToRoute('app_home');
        }

        return $this->render('transport/index.html.twig', [
            'transport' => $form->createView(),
            'listeTransport' => $listeTransport,
        ]);
    }

}
