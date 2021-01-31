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
   
    let ENEMY_WIDTH: CGFloat = 40.0
    let ENEMY_HEIGHT: CGFloat = 20.0
    //let ENEMY_COLOR = UIColor.yellow // Make clear later
    
    let ENEMY_COLOR = [UIColor.yellow, UIColor.green, UIColor.blue, UIColor.cyan, UIColor.brown, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.red]
    
    var leftWing: SKSpriteNode!
    var feather1: SKSpriteNode!
    var feather2: SKSpriteNode!
    var feather3: SKSpriteNode!
    var feather4: SKSpriteNode!
    var feather5: SKSpriteNode!
    
    var eye: SKSpriteNode!
    var pupil: SKSpriteNode!
    
    
    
    init() {
        let size = CGSize(width: ENEMY_WIDTH, height: ENEMY_HEIGHT)
        super.init(texture: nil, color: ENEMY_COLOR.randomElement() ?? UIColor.yellow, size: size)
        
        loadAppearance()
        flappingWing()
        
        loadPhysicsBodyWithSize(size: size)
        startMoving()
    }
    
    func loadAppearance() {
        leftWing = SKSpriteNode(color: UIColor.gray, size: CGSize(width: 5, height: 35))
        leftWing.anchorPoint = CGPoint(x: 1, y: 0)
        addChild(leftWing)
        
        let rotateForward = SKAction.rotate(byAngle: CGFloat(Double.pi)/5.0, duration: 0.15)
        leftWing.run(rotateForward)
        
        let darkGrey = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1.0)
        let lightGrey = UIColor(red: 104/255, green: 104/255, blue: 104/255, alpha: 1.0)
        
        feather1 = SKSpriteNode(color: lightGrey, size: CGSize(width: 20, height: 5))
        feather1.anchorPoint = CGPoint(x: 0, y: -5)
        leftWing.addChild(feather1)
        
        feather2 = SKSpriteNode(color: darkGrey, size: CGSize(width: 15, height: 5))
        feather2.anchorPoint = CGPoint(x: 0, y: -3)
        leftWing.addChild(feather2)
        
        feather3 = SKSpriteNode(color: darkGrey, size: CGSize(width: 10, height: 5))
        feather3.anchorPoint = CGPoint(x: 0, y: -1)
        leftWing.addChild(feather3)
        
        feather4 = SKSpriteNode(color: UIColor.black, size: CGSize(width: 17, height: 5))
        feather4.anchorPoint = CGPoint(x: 0, y: -4)
        leftWing.addChild(feather4)
        
        feather5 = SKSpriteNode(color: UIColor.black, size: CGSize(width: 13, height: 5))
        feather5.anchorPoint = CGPoint(x: 0, y: -2)
        leftWing.addChild(feather5)
        
        let eyeColor = UIColor.white
        eye = SKSpriteNode(color: eyeColor, size: CGSize(width: 6, height: 6))
        eye.position = CGPoint(x: -7, y: 0)
        
        pupil = SKSpriteNode(color: UIColor.black, size: CGSize(width: 3, height: 3))
        
        pupil.position = CGPoint(x: -2, y: 0)
        addChild(eye)
        
        eye.addChild(pupil)
    }
    
    func flappingWing() {
        let rotateBack = SKAction.rotate(byAngle: -CGFloat(Double.pi)/2.0, duration: 0.1)
        let rotateForward = SKAction.rotate(byAngle: CGFloat(Double.pi)/2.0, duration: 0.1)
        
        leftWing.run(rotateBack, completion: { () -> Void in
            self.leftWing.run(rotateForward)
            self.leftWing.run(rotateBack, completion: { () -> Void in
                self.leftWing.run(rotateForward, completion: { () -> Void in
                    self.flappingWing()
                })
            })
        })
        
    }
    
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = enemyCategory
        physicsBody?.collisionBitMask = 1
        physicsBody?.affectedByGravity = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startMoving() {
        let moveLeft = SKAction.moveBy(x: -kDefaultXToMovePerSecond, y: 0, duration: 1)
        run(SKAction.repeatForever(moveLeft))
    }
    
    @objc func stopMoving() {
        leftWing.removeAllActions()
        removeAllActions()
    }
}
