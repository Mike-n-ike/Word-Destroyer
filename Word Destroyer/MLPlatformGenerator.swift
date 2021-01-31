//
//  MLPlatformGenerator.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-31.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLPlatformGenerator: SKSpriteNode {
    
    var generationTimer: Timer?
    var platforms = [MLPlatform]()
    var platformTrackers = [MLPlatform]()
    
    func startGeneratingPlatformssEvery(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generatePlatform), userInfo: nil, repeats: true)
        
    }
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    @objc func generatePlatform() {
        var scale: CGFloat
        
        let rand = arc4random_uniform(2)
        
        if rand % 2 == 0 {
            scale = -3
        } else {
            scale = -5*CGFloat(rand)
        }
        
        let platform = MLPlatform()
        platform.position.x = size.width/2 + platform.size.width/2
        platform.position.y = scale * (kMLGroundHeight/2 + platform.size.height/2)
        platforms.append(platform)
        platformTrackers.append(platform)
        addChild(platform)
    }
    
    @objc func stopPlatforms() {
        stopGenerating()
        for platform in platforms {
            platform.stopMoving()
        }
    }
    
}
