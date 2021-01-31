//
//  MLMovingGround.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLMovingGround: SKSpriteNode {
    
    let NUMBER_OF_SEGMENTS = 20
    let COLOR_ONE = UIColor(red: 88.0/255.0, green: 148.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    let COLOR_TWO = UIColor(red: 120.0/255.0, green: 195.0/255.0, blue: 118.0/255.0, alpha: 1.0)
    
    var dirt: SKSpriteNode!
    var grass: SKSpriteNode!
    var lowerDirt: SKSpriteNode!
    
    init(size: CGSize) {
        super.init(texture: nil, color: UIColor.brown, size: CGSize(width: size.width*8, height: size.height))
        loadGround()
        /*
        anchorPoint = CGPoint(x: 0, y: 0.5)
        
        for i in 0..<NUMBER_OF_SEGMENTS {
            var segmentColor: UIColor!
            if i % 2 == 0 {
                segmentColor = COLOR_ONE
            } else {
                segmentColor = COLOR_TWO
            }
            
            let segment = SKSpriteNode(color: segmentColor, size: CGSize(width: self.size.width / CGFloat(NUMBER_OF_SEGMENTS), height: self.size.height))
            segment.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            segment.position = CGPoint(x: CGFloat(i)*segment.size.width, y: 0)
            addChild(segment)
        }
 */
    }
    
    func loadGround() {
        lowerDirt = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 2*self.frame.size.width, height: 30))
        lowerDirt.position = CGPoint(x:0, y: 0)
        addChild(lowerDirt)
        
        let dirtColor = UIColor(red: 51.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        dirt = SKSpriteNode(color: dirtColor, size: CGSize(width: 2*self.frame.size.width, height: 15))
        dirt.position = CGPoint(x: 0, y: 3)
        lowerDirt.addChild(dirt)
        
        let grassColor = UIColor(red: 0.0/255.0, green: 153.0/255.0, blue: 76.0/255.0, alpha: 1.0)
        grass = SKSpriteNode(color: grassColor, size: CGSize(width: 2*self.frame.size.width, height: 12))
        grass.position = CGPoint(x: 0, y: 7)
        lowerDirt.addChild(grass)
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func start() {
        let adjustedDuration = TimeInterval(frame.size.width / kDefaultXToMovePerSecond)
        
        let moveLeft = SKAction.moveBy(x: -frame.size.width/2, y: 0, duration: adjustedDuration/2)
        let resetPosition = SKAction.moveTo(x: 0, duration: 0)
        let moveSequence = SKAction.sequence([moveLeft, resetPosition])
        
        run(SKAction.repeatForever(moveSequence))
    }
    
    func stop() {
        removeAllActions()
    }
}
