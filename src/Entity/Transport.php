<?php

namespace App\Entity;

use App\Repository\TransportRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TransportRepository::class)]
class Transport
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nomTransport = null;

    #[ORM\Column]
    private ?int $tarif = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNomTransport(): ?string
    {
        return $this->nomTransport;
    }

    public function setNomTransport(string $nomTransport): self
    {
        $this->nomTransport = $nomTransport;

        return $this;
    }
    public function getTarif(): ?float

    {

        return $this->tarif;

    }



    public function setTarif(float $tarif): self

    {

        $this->tarif = $tarif;



        return $this;

    }
}
