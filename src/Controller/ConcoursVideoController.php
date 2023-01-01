<?php

namespace App\Controller;
use App\Form\ConcoursVideoType;
use App\Entity\ConcoursVideo;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ConcoursVideoController extends AbstractController
{
    #[Route('/concours', name: 'app_concours_video')]
    public function register(Request $request): Response
    {
        //$miages = $this->repository->findAll();
        
        $concours = new ConcoursVideo();
        $form = $this->createForm(ConcoursVideoType::class, $concours);
        $form->handleRequest($request);
        $name =$concours->getMiage();
        if ($form->isSubmitted() && $form->isValid()) {
            $file = $concours->getTitreVideo();
            $fileName = $name.'-'.uniqid().'.'.$file->guessExtension();
            $file->move($this->getParameter('upload_directory'), $fileName);
            $concours->setTitreVideo($fileName);

            $this->addFlash('success', 'Votre vidéo a bien été envoyé !');
            //return $this->redirectToRoute('app_home');
        }

        return $this->render('concours_video/index.html.twig', [
            'registrationForm' => $form->createView(),
            //'miages' => $miages,
        ]);
    }
}
