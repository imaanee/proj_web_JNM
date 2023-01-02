<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Controller\RegistrationController;
use App\Form\RegistrationFormType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;

class UserCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
          ->setEntityPermission('ROLE_ADMIN')
          ->setEntityLabelInPlural('Utilisateurs')
          ->setEntityLabelInSingular('Utilisateur')
          ->setPageTitle("index", "Administration des utilisateurs")
          ->setPaginatorPageSize(10);
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')
              ->hideOnForm(),
            TextField::new('nom'),
            TextField::new('prenom'),
            ArrayField::new('roles')
              ->hideOnForm(),
            TextField::new('miage'),
            Field::new('email'),
            TextField::new('password')
              ->setFormType(PasswordType::class)
              ->setRequired($pageName === Crud::PAGE_NEW),

            Field::new('id_logement'),
            Field::new('id_transport'),
        ];
    }
}
