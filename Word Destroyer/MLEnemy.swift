//
//  MLEnemy.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLEnemy: SKSpriteNode {
   
    let ENEMY_WIDTH: CGFloat = 15.0
    let ENEMY_HEIGHT: CGFloat = 50.0
    let ENEMY_COLOR = UIColor.yellow
    
    init() {
        let size = CGSize(width: ENEMY_WIDTH, height: ENEMY_HEIGHT)
        super.init(texture: nil, color: ENEMY_COLOR, size: size)
        
        loadPhysicsBodyWithSize(size: size)
        startMoving()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.collisionBitMask = 0
        physicsBody?.affectedByGravity = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startMoving() {
        let moveLeft = SKAction.moveBy(x: -1.3*kDefaultXToMovePerSecond, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    @objc func stopMoving() {
        removeAllActions()
    }
}
