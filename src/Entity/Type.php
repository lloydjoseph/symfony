<?php

    namespace app\Entity;

    class Type 
    {
        const TYPE_FIRE = 1;
        const TYPE_WATER = 2;
        const TYPE_PLANT = 3;
        const TYPE_NORMAL = 4;

        /*
        @param integer $type
        @param integer $type_atk
        @return bool
        */
        public function isTypeWeakAgainst($type, $type_atk) {
            if($type === self::TYPE_FIRE){
                return (self::TYPE_WATER === $type_atk) ? true : false;
            }
            elseif($type === self::TYPE_WATER){
                return (self::TYPE_PLANT === $type_atk) ? true : false;
            }
            elseif($type === self::TYPE_PLANT){
                return (self::TYPE_FIRE === $type_atk) ? true : false;
            }
            else{
                return false;
            }
        }
    }

?>