//
//  MLWall.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLWall: SKSpriteNode {
   
    let WALL_WIDTH: CGFloat = 15.0
    let WALL_HEIGHT: CGFloat = 40.0
    let WALL_COLOR = UIColor.black
    
    init() {
        let size = CGSize(width: WALL_WIDTH, height: WALL_HEIGHT)
        super.init(texture: nil, color: WALL_COLOR, size: size)
        
        loadPhysicsBodyWithSize(size: size)
        startMoving()
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = wallCategory
        physicsBody?.collisionBitMask = 0
        physicsBody?.affectedByGravity = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startMoving() {
        let moveLeft = SKAction.moveBy(x: -kDefaultXToMovePerSecond, y: 0, duration: 5)
        let moveUp = SKAction.moveBy(x: 0, y: 5, duration: 1)
        let moveDown = SKAction.moveBy(x:0, y: -5, duration: 1)
        
        run(moveLeft)
        
        self.run(moveUp, completion: { () -> Void in
            self.run(moveDown)
                self.startMoving()
        })
        
        //run(SKAction.repeatForever(moveLeft))
        
        
    }
    
    @objc func stopMoving() {
        removeAllActions()
    }
}
