//
//  MLHero.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLHero: SKSpriteNode {
    
    var body: SKSpriteNode!
    var arm: SKSpriteNode!
    var right_arm: SKSpriteNode!
    var leftFoot: SKSpriteNode!
    var rightFoot: SKSpriteNode!
    
    var gunHandle: SKSpriteNode!
    var gunBarrel: SKSpriteNode!
    
    var isUpsideDown = false
    
    init() {
        let size = CGSize(width: 32, height: 44)
        super.init(texture: nil, color: UIColor.clear, size: size)
        
        loadAppearance()
        loadPhysicsBodyWithSize(size: size)
    }
    
    func loadAppearance() {
        body = SKSpriteNode(color: UIColor.black, size: CGSize(width: self.frame.size.width, height: 40))
        body.position = CGPoint(x: 0, y: 2)
        addChild(body)
        
        let skinColor = UIColor(red: 207.0/255.0, green: 193.0/255.0, blue: 168.0/255.0, alpha: 1.0)
        let face = SKSpriteNode(color: skinColor, size: CGSize(width: self.frame.size.width, height: 12))
        face.position = CGPoint(x: 0, y: 6)
        body.addChild(face)
        
        let eyeColor = UIColor.white
        let leftEye = SKSpriteNode(color: eyeColor, size: CGSize(width: 6, height: 6))
        let rightEye = leftEye.copy() as! SKSpriteNode
        let pupil = SKSpriteNode(color: UIColor.black, size: CGSize(width: 3, height: 3))
        
        pupil.position = CGPoint(x: 2, y: 0)
        leftEye.addChild(pupil)
        rightEye.addChild(pupil.copy() as! SKSpriteNode)
        
        leftEye.position = CGPoint(x: -4, y: 0)
        face.addChild(leftEye)
        
        rightEye.position = CGPoint(x: 14, y: 0)
        face.addChild(rightEye)
        
        let eyebrow = SKSpriteNode(color: UIColor.black, size: CGSize(width: 11, height: 1))
        eyebrow.position = CGPoint(x: -1, y: leftEye.size.height/2)
        leftEye.addChild(eyebrow)
        rightEye.addChild(eyebrow.copy() as! SKSpriteNode)
        
        let armColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1.0)
        arm = SKSpriteNode(color: armColor, size: CGSize(width: 8, height: 14))
        arm.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        arm.position = CGPoint(x: -10, y: -7)
        body.addChild(arm)
        
        right_arm = SKSpriteNode(color: armColor, size: CGSize(width: 8, height: 14))
        right_arm.anchorPoint = CGPoint(x: 1.0, y: 0.9)
        right_arm.position = CGPoint(x: 15, y: -7)
        body.addChild(right_arm)
        
        let hand = SKSpriteNode(color: skinColor, size: CGSize(width: arm.size.width, height: 5))
        let right_hand = SKSpriteNode(color: skinColor, size: CGSize(width: arm.size.width, height: 5))
        
        let new_arm_height = -arm.size.height*0.9
        let new_hand_height = hand.size.height/2
        
        hand.position = CGPoint(x: 0, y: new_arm_height + new_hand_height)
        arm.addChild(hand)
        
        
        right_hand.position = CGPoint(x: -4, y: new_arm_height + new_hand_height)
        right_arm.addChild(right_hand)
        
        let gunColor = UIColor(red: 0/255, green: 255/255, blue: 128/255, alpha: 1.0)
        gunHandle = SKSpriteNode(color: gunColor, size: CGSize(width: 8, height: 6))
        gunBarrel = SKSpriteNode(color: gunColor, size: CGSize(width: 6, height: 20))
        
        gunHandle.anchorPoint = CGPoint(x: 1, y: 0.5)
        gunBarrel.anchorPoint = CGPoint(x: 0, y: 0.9)
        
        right_hand.addChild(gunHandle)
        right_hand.addChild(gunBarrel)
        
        leftFoot = SKSpriteNode(color: UIColor.black, size: CGSize(width: 9, height: 4))
        leftFoot.position = CGPoint(x: -6, y: -size.height/2 + leftFoot.size.height/2)
        addChild(leftFoot)
        
        rightFoot = leftFoot.copy() as? SKSpriteNode
        rightFoot.position.x = 8
        addChild(rightFoot)
        
        
        
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = heroCategory
        physicsBody?.contactTestBitMask = wallCategory
        physicsBody?.affectedByGravity = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func flip() {
        isUpsideDown = !isUpsideDown
        
        var scale: CGFloat!
        if isUpsideDown {
            scale = -1.0
        } else {
            scale = 1.0
        }
        let translate = SKAction.moveBy(x: 0, y: scale*(size.height + kMLGroundHeight), duration: 0.1)
        let flip = SKAction.scaleY(to: scale, duration: 0.1)
        
        run(translate)
        run(flip)
    }
    
    func jump() {
        let jump_up = SKAction.moveBy(x: 0, y: 80, duration: 0.2)
        let fall_down = SKAction.moveBy(x: 0, y: -80, duration: 0.2)
        
        run(jump_up)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.run(fall_down)
        }
        
    }
    
    func fall() {
        physicsBody?.affectedByGravity = true
        physicsBody?.applyImpulse(CGVector(dx: -5, dy: 30))
        
        let rotateBack = SKAction.rotate(byAngle: CGFloat(Double.pi) / 2, duration: 0.4)
        run(rotateBack)
    }
    
    func startRunning() {
        let rotateForward = SKAction.rotate(byAngle: CGFloat(Double.pi)/2.0, duration: 0.15)
        right_arm.run(rotateForward)
        
        runningArm()
        performOneRunCycle()
    }
    
    func performOneRunCycle() {
        let up = SKAction.moveBy(x: 0, y: 2, duration: 0.05)
        let down = SKAction.moveBy(x: 0, y: -2, duration: 0.05)
        
        leftFoot.run(up, completion: { () -> Void in
            self.leftFoot.run(down)
            self.rightFoot.run(up, completion: { () -> Void in
                self.rightFoot.run(down, completion: { () -> Void in
                    self.performOneRunCycle()
                })
            })
        })
    }
    
    func runningArm() {
        let rotateBack = SKAction.rotate(byAngle: -CGFloat(Double.pi)/2.0, duration: 0.15)
        let rotateForward = SKAction.rotate(byAngle: CGFloat(Double.pi)/2.0, duration: 0.15)
        
        arm.run(rotateBack, completion: { () -> Void in
            self.arm.run(rotateForward, completion: { () -> Void in
                self.runningArm()
            })
        })
    }
    
    func breathe() {
        let breatheOut = SKAction.moveBy(x: 0, y: -2, duration: 1)
        let breatheIn = SKAction.moveBy(x: 0, y: 2, duration: 1)
        let breath = SKAction.sequence([breatheOut, breatheIn])
        body.run(SKAction.repeatForever(breath))
    }
    
    func stop() {
        body.removeAllActions()
        leftFoot.removeAllActions()
        rightFoot.removeAllActions()
        arm.removeAllActions()
    }
    
    
    
    
}
