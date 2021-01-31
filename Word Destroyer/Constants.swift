//
//  Constants.swift
//  Word Destroyer
//
//  Created by Michael Lu on 2021-01-30.
//  Copyright © 2021 NextGenApps. All rights reserved.
//

import Foundation
import UIKit

// Configuration
let kMLGroundHeight: CGFloat = 20.0

// Initial Variables
let kDefaultXToMovePerSecond: CGFloat = 320.0

// Collision Detection
let heroCategory: UInt32 = 0x1 << 0
let wallCategory: UInt32 = 0x1 << 1
let bulletCategory: UInt32 = 0x1 << 2
let enemyCategory: UInt32 = 0x1 << 4
let platformCategory: UInt32 = 0x1 << 8

