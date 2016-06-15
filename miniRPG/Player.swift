//
//  Player.swift
//  miniRPG
//
//  Created by Jason McCoy on 6/15/16.
//  Copyright © 2016 Jason McCoy. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name = "Player"
    private var _inventory = [String]()
    
    var name: String {
        get {
            return _name
        }
    }
    
    var inventory: [String] {
        return _inventory
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        _name = name
    }
    
}
