//
//  MLEnemyGenerator.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLEnemyGenerator: SKSpriteNode {
    
    var generationTimer: Timer?
    var enemies = [MLEnemy]()
    var enemyTrackers = [MLEnemy]()
    
    func startGeneratingEnemiesEvery(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generateEnemy), userInfo: nil, repeats: true)
        
    }
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    @objc func generateEnemy() {
        var scale: CGFloat
        
        let rand = arc4random_uniform(2)
        if rand == 0 {
            scale = 2.5
        } else {
            scale = 1.0
        }
        
        
        let enemy = MLEnemy()
        enemy.position.x = size.width/2 + enemy.size.width/2
        enemy.position.y = scale * (kMLGroundHeight/2 + enemy.size.height/2)
        enemies.append(enemy)
        enemyTrackers.append(enemy)
        addChild(enemy)
    }
    
    @objc func stopEnemies() {
        stopGenerating()
        for enemy in enemies {
            enemy.stopMoving()
        }
    }
    
}
