//
//  MLPlatform.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-31.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLPlatform: SKSpriteNode {
   
    let PLATFORM_WIDTH: CGFloat = 80.0
    let PLATFORM_HEIGHT: CGFloat = 10.0
    let PLATFORM_COLOR = UIColor.black
    
    //var platform: SKSpriteNode!
    var dirt: SKSpriteNode!
    var grass: SKSpriteNode!
    var lowerDirt: SKSpriteNode!
    
    init() {
        let size = CGSize(width: PLATFORM_WIDTH, height: PLATFORM_HEIGHT)
        super.init(texture: nil, color: PLATFORM_COLOR, size: size)
        
        loadPlatform()
        
        loadPhysicsBodyWithSize(size: size)
        startMoving()
    }
    
    func loadPlatform() {
        lowerDirt = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 80, height: 10))
        lowerDirt.position = CGPoint(x:0, y: 0)
        addChild(lowerDirt)
        
        let dirtColor = UIColor(red: 51.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        dirt = SKSpriteNode(color: dirtColor, size: CGSize(width: 80, height: 10))
        dirt.position = CGPoint(x: 0, y: 3)
        lowerDirt.addChild(dirt)
        
        let grassColor = UIColor(red: 0.0/255.0, green: 153.0/255.0, blue: 76.0/255.0, alpha: 1.0)
        grass = SKSpriteNode(color: grassColor, size: CGSize(width: 80, height: 17))
        grass.position = CGPoint(x: 0, y: 7)
        lowerDirt.addChild(grass)
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        physicsBody?.categoryBitMask = platformCategory
        physicsBody?.collisionBitMask = 1
        physicsBody?.affectedByGravity = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startMoving() {
        let moveLeft = SKAction.moveBy(x: -0.8*kDefaultXToMovePerSecond, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    @objc func stopMoving() {
        removeAllActions()
    }
}
