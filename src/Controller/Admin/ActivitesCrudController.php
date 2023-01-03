<?php

namespace App\Controller\Admin;

use App\Entity\Activites;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use Doctrine\Persistence\ObjectManager;

class ActivitesCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Activites::class;
    }


    public function configureCrud(Crud $crud): Crud
    {
        return $crud
          ->setEntityLabelInPlural('Activités')
          ->setEntityLabelInSingular('Activité')
          ->setPageTitle("index", "Administration des activités")
          ->setPaginatorPageSize(10);
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('titre'),
            ImageField::new('image')
              ->setBasePath('upload/images/activites')
              ->setUploadDir('public/upload/images/activites')
              ->setSortable(false),

            TextField::new('content'),
            DateTimeField::new('created_at')
              ->setTimezone('Europe/Paris')
              ->hideOnForm(),
            DateTimeField::new('updated_at')
              ->setTimezone('Europe/Paris')
              ->hideOnForm(),
        ];
    }

/*    public function persistEntity(EntityManagerInterface $em, $entityInstance): void
    {
        if ($entityInstance instanceof Activites) return;
        $entityInstance->setCreateDate(new \DateTimeImmutable);
        parent::persistEntity($em, $entityInstance);
    }
*/

}
