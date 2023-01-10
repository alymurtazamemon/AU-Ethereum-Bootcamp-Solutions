// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./Hero.sol";

contract Mage is Hero(50) {
    function attack(address enemy) public override {
        Enemy(enemy).takeAttack(Hero.AttackTypes.Spell);
        super.attack(enemy);
    }
}

contract Warrior is Hero(200) {
    function attack(address enemy) public override {
        Enemy(enemy).takeAttack(Hero.AttackTypes.Brawl);
        super.attack(enemy);
    }
}
