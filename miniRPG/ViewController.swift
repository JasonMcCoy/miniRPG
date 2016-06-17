//
//  ViewController.swift
//  miniRPG
//
//  Created by Jason McCoy on 6/15/16.
//  Copyright © 2016 Jason McCoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var enemyImg2: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "dedsxy", hp: 100, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 200, attackPwr: 12)
            enemyImg.isHidden = true
            enemyImg2.isHidden = false
        } else {
            enemy = DevilWizard(startingHp: 100, attackPwr: 15)
            enemyImg.isHidden = false
            enemyImg2.isHidden = true
        }
        
        //enemyImg.isHidden = false
        
    }
    
    @IBAction func onChestTapped(_ sender: AnyObject) {
        chestBtn.isHidden = true
        printLbl.text = chestMessage
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func attackedTapped(_ sender: AnyObject) {
        if enemy.attemptAttack(attackPwr: player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP!"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful! GG lol."
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(item: loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.isHidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)!"
            enemyImg.isHidden = true
            enemyImg2.isHidden = true
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

