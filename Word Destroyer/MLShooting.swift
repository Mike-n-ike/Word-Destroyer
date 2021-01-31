//
//  MLShooting.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLShooting: SKSpriteNode {
    
    var generationTimer: Timer?
    var bullets = [MLBullet]()
    var bulletTrackers = [MLBullet]()
    
    func startGeneratingBulletsEvery(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generateBullets), userInfo: nil, repeats: true)
        
    }
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    func bulletJump() {
        let jump_up = SKAction.moveBy(x: 0, y: 80, duration: 0.2)
        let fall_down = SKAction.moveBy(x: 0, y: -80, duration: 0.2)
        
        run(jump_up)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.run(fall_down)
        }
        
    }
    
    @objc func generateBullets() {
        
        let bullet = MLBullet()
        bullet.position.x = -210 //size.width/2 + bullet.size.width/2
        bullet.position.y =  -100 // (kMLGroundHeight/2 + bullet.size.height/2)
        bullets.append(bullet)
        bulletTrackers.append(bullet)
        addChild(bullet)
    }
    
    @objc func stopBullets() {
        stopGenerating()
        for bullet in bullets {
            bullet.stopMoving()
        }
    }
    
}
