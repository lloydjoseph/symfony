<?php

namespace App\DataFixtures;

use App\Entity\Attack;
use App\Entity\Type;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class AttackFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        foreach ($this->getAttacks() as [$name, $power, $type]) {
            $attack = new Attack;
            $attack
            ->setName($name)
            ->setPower($power)
            ->setType($type);
            $manager->persist($attack);
            $reference = $this->addReference($name, $attack);
        }
        $manager->flush();       
    }
    
    public function getAttacks()
    {
        return [
            ['Flammèche', 20, Type::TYPE_FIRE],
            ['Hydrocanon', 25, Type::TYPE_WATER],
            ['Charge', 10, Type::TYPE_NORMAL],
            ['TranchHerbe', 20, Type::TYPE_PLANT]
        ];
    }
}