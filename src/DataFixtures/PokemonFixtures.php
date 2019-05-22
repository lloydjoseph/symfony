<?php

namespace App\DataFixtures;

use App\Entity\Pokemon;
use App\Entity\Type;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class PokemonFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        foreach ($this->getPokemons() as [$name, $attack, $type, $hp]) {
            $pokemon = new Pokemon;
            $pokemon
            ->setName($name);
            for ($i=0; $i < sizeof($attack); $i++) { 
                $pokemon->addAttack($attack[$i]);
            };
            $pokemon
            ->setType($type)
            ->setHp($hp);
            $manager->persist($pokemon);
            $reference = $this->addReference($name, $pokemon);
        }
        $manager->flush();
    }
    
    public function getPokemons()
    {
        return [
            ['Arcko', [$this->getReference("TranchHerbe"), $this->getReference("Charge")], Type::TYPE_PLANT, 60],
            ['Poussifeu', [$this->getReference("Flammèche"), $this->getReference("Charge")], Type::TYPE_FIRE, 60],
            ['Gobou', [$this->getReference("Hydrocanon"), $this->getReference("Charge")], Type::TYPE_WATER, 60]
        ];
    }
}