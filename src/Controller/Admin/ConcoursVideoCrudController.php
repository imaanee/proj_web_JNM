<?php

namespace App\Controller\Admin;

use App\Entity\ConcoursVideo;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;

class ConcoursVideoCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return ConcoursVideo::class;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
          ->setEntityLabelInPlural('Concours Vidéos')
          ->setEntityLabelInSingular('Concours Vidéo')
          ->setPageTitle("index", "Administration des Vidéos")
          ->setPaginatorPageSize(10);
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('miage'),
            ImageField::new('titreVideo')
              ->setBasePath('upload/videosConcours')
              ->setUploadDir('public/upload/videosConcours')
              ->setSortable(false),
        ];
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
