<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Entity\Activites;
use App\Entity\Administrateur;
use App\Entity\ConcoursVideo;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin.index')]

    public function index(): Response
    {
        //return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
    //     $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
    //     return $this->redirect($adminUrlGenerator->setController(ActivitesCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
         return $this->render('admin/dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('JNM-Administration');
    }

    public function configureMenuItems(): iterable
    {
      yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
      //yield MenuItem::linkToCrud('Users', 'fas fa-users', User::class);
      yield MenuItem::subMenu('Users', 'fas fa-users')->setSubItems([
          MenuItem::linkToCrud('Creation User', 'fas fa-plus', User::class)->setAction(Crud::PAGE_NEW),
          MenuItem::linkToCrud('Affichage Users', 'fas fa-eye', User::class)
      ]);
    //  yield MenuItem::linkToCrud('Administrateurs', 'fas fa-lock', Administrateur::class);
      yield MenuItem::linkToCrud('Concours', 'fas fa-video-camera', ConcoursVideo::class);
      yield MenuItem::subMenu('Activites', 'fas fa-list')->setSubItems([
          MenuItem::linkToCrud('Creation Activite', 'fas fa-plus', Activites::class)->setAction(Crud::PAGE_NEW),
          MenuItem::linkToCrud('Affichage Activites', 'fas fa-eye', Activites::class)
      ]);
      // yield MenuItem::linkToCrud('The Label', 'fas fa-list', EntityClass::class);
    }
}
