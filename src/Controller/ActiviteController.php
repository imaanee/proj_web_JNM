<?php

namespace App\Controller;

use App\Entity\Activites;
use App\Repository\ActivitesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ActiviteController extends AbstractController
{
    #[Route('/activite', name: 'app_activite')]
    public function show(ActivitesRepository $activitesRepository): Response
    {
        $activites = $activitesRepository->findAll();
        return $this->render('activite/index.html.twig', ['activites' => $activites]);
    }
}
