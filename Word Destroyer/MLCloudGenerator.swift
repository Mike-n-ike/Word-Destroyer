//
//  MLCloudGenerator.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import SpriteKit

class MLCloudGenerator: SKSpriteNode {
    
    let CLOUD_WIDTH: CGFloat = 125.0
    let CLOUD_HEIGHT: CGFloat = 55.0
    
    var generationTimer: Timer!
    
    func populate(num: Int) {
        for i in 0..<num {
            let cloud = MLCloud(size: CGSize(width: CLOUD_WIDTH, height: CLOUD_HEIGHT))
            let x = CGFloat(arc4random_uniform(UInt32(size.width))) - size.width/2
            let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
            cloud.position = CGPoint(x: x, y: y)
            cloud.zPosition = -5
            addChild(cloud)
        }
    }
    
    func startGeneratingWithSpawnTime(seconds: TimeInterval) {
        generationTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(generateCloud), userInfo: nil, repeats: true)
    }
    
    func stopGenerating() {
        generationTimer.invalidate()
    }
        
    @objc func generateCloud() {
        let x_pos = size.width/2 + CLOUD_WIDTH/2
        let y_pos = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
        let cloud = MLCloud(size: CGSize(width: CLOUD_WIDTH, height: CLOUD_HEIGHT))
        cloud.position = CGPoint(x: x_pos, y: y_pos)
        cloud.zPosition = -5
        addChild(cloud)
    }
    
}
