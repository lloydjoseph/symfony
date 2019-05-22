<?php

namespace App\DataFixtures;

use App\Entity\User;
use App\Entity\Type;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        foreach ($this->getUsers() as [$name, $role, $pass]) {
            $User = new User;
            $User
            ->setName($name)
            ->setRole($role)
            ->setPass($pass);
            $manager->persist($User);
            $reference = $this->addReference($name, $User);
        }
        $manager->flush();
    }
    
    public function getUsers()
    {
        return [
            ['Sacha', 'ROLE_USER', 'OndineLove'],
            ['Admin', 'ROLE_ADMIN', 'Admin']
        ];
    }
}