//
//  DevilWizard.swift
//  miniRPG
//
//  Created by Jason McCoy on 6/15/16.
//  Copyright © 2016 Jason McCoy. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}
