<?php

namespace App\Entity;

use App\Repository\ConcoursVideoRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ConcoursVideoRepository::class)]
class ConcoursVideo
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $titreVideo ;

    #[ORM\Column(length: 255)]
    private ?string $miage = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitreVideo() : ?string
    {
        return $this->titreVideo;
    }

    public function setTitreVideo(string $titreVideo): self
    {
        $this->titreVideo = $titreVideo;

        return $this;
    }

    public function getMiage(): ?string
    {
        return $this->miage;
    }

    public function setMiage(string $miage): self
    {
        $this->miage = $miage;

        return $this;
    }
}
