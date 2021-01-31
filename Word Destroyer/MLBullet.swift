//
//  MLBullet.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLBullet: SKSpriteNode {
   
    let BULLET_WIDTH: CGFloat = 20.0
    let BULLET_HEIGHT: CGFloat = 10.0
    let BULLET_COLOR = UIColor.red
    
    init() {
        let size = CGSize(width: BULLET_WIDTH, height: BULLET_HEIGHT)
        super.init(texture: nil, color: BULLET_COLOR, size: size)
        
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
        let moveRight = SKAction.moveBy(x: 2*kDefaultXToMovePerSecond, y: 0, duration: 1)
        run(SKAction.repeatForever(moveRight))
    }
    
    @objc func stopMoving() {
        removeAllActions()
    }
}
