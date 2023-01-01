<?php

namespace App\Controller;
use App\Form\ConcoursVideoType;
use App\Entity\ConcoursVideo;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ConcoursVideoController extends AbstractController
{
    #[Route('/concours/video', name: 'app_concours_video')]
    public function register(Request $request): Response
    {
        $concours = new ConcoursVideo();
        $form = $this->createForm(ConcoursVideoType::class, $concours);
        $form->handleRequest($request);
        $name =$concours->getMiage();
        if ($form->isSubmitted() && $form->isValid()) {
            $file = $form->get('titreVideo')->getData();
           
            //Générer nouveau nom de fichier
            $fileName = $name.'-'.uniqid().'.'.$file->guessExtension();
            
            //Copier le fichier dans le dossier upload/videosConcours
            $file->move($this->getParameter('upload_directory'), $fileName);
            
            //Stocker nom vidéo dans bdd
            $concours->setTitreVideo($fileName);

            $this->addFlash('success', 'Votre vidéo a bien été envoyé !');
            //return $this->redirectToRoute('app_home');
        }

        return $this->render('concours_video/index.html.twig', [
            'concoursVideo' => $form->createView(),
        ]);
    }

    #[Route('/concours', name: 'app_presentation_concours')]
    public function index(): Response
    {
        return $this->render('concours_video/presentation.html.twig');
    }
}
