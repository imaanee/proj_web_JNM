<?php

namespace App\Form;

use App\Entity\ConcoursVideo;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ConcoursVideoType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // ->add('titreVideo', TextType::class, [
            //     'attr' => [
            //         'class' => 'form-control'
            //     ]
            // ])

            ->add('miage', TextType::class, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Votre Miage'
            ])

            ->add('titreVideo', FileType::class, [
                'attr' => [
                    'class' => 'form-control'
                ],
                'label' => 'Charger votre vidéo'

        ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => ConcoursVideo::class,
        ]);
    }
}
