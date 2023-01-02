<?php

namespace App\Controller\Admin;

use App\Entity\Administrateur;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;

class AdministrateurCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Administrateur::class;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
        //  ->setEntityPermission('ROLE_ADMIN')
        ;
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
