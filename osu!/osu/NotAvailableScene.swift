//
//  NotAvailableScene.swift
//  osu
//
//  Created by Jiajun Ma on 18/10/18.
//  Copyright © 2018 Jiajun Ma. All rights reserved.
//

// TODOs for this Scene:
// 1. Find a way to transfer between scenes, spritekit
// 2. Make the not available scene look better

import Foundation
import SpriteKit

class NotAvailableScene: SKScene {
    
    var backButton: SKSpriteNode?
    
    var notAvailableNode: SKSpriteNode?
    
    var notAvailableNotification: SKSpriteNode?
    
    var backgroundGenerator: Int = Int(UInt32(arc4random_uniform(1) + 1))
    var backgroundNode: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        backButton = SKSpriteNode(color: UIColor(red: 186/255, green: 107/255, blue: 192/255, alpha: 1), size: CGSize(width: 300, height: 50))
        backButton!.position = CGPoint(x: 0, y: -100)
        backButton!.name = "backButton"
        addChild(backButton!)
        
        let backButtonLabel = SKLabelNode(text: "Back")
        backButtonLabel.fontName = "Arial Bold"
        backButtonLabel.fontSize = 20
        backButtonLabel.fontColor = SKColor.white
        backButtonLabel.name = "backLabel"
        backButtonLabel.alpha = 1
        backButtonLabel.position = CGPoint(x: 0, y: -6)
        backButton!.addChild(backButtonLabel)
        
        let notAvailableTexture = SKTexture(imageNamed: "notAvailableTexture")
        
        notAvailableNode = SKSpriteNode(texture: notAvailableTexture)
        notAvailableNode!.position = CGPoint(x: 0, y: 0)
        notAvailableNode!.size = CGSize(width: 150, height: 150)
        notAvailableNode!.name = "notAvailableNode"
        addChild(notAvailableNode!)
        
        notAvailableNotification = SKSpriteNode(color: UIColor(red: 134/255, green: 182/255, blue: 48/255, alpha: 1), size: CGSize(width: 350, height: 50))
        notAvailableNotification!.position = CGPoint(x: 0, y: 93)
        notAvailableNotification!.zPosition = 0
        notAvailableNotification!.name = "notAvailableNotification"
        addChild(notAvailableNotification!)
        
        let notAvailableNotificationLabel = SKLabelNode(text: "Sorry, this feature is currently not available :(")
        notAvailableNotificationLabel.fontName = "Arial Bold"
        notAvailableNotificationLabel.fontSize = 15
        notAvailableNotificationLabel.fontColor = SKColor.white
        notAvailableNotificationLabel.name = "notAvailableNotificationLabel"
        notAvailableNotificationLabel.alpha = 1
        notAvailableNotificationLabel.position = CGPoint(x: 0, y: -6)
        notAvailableNotification!.addChild(notAvailableNotificationLabel)
        
        let backgroundTexture = SKTexture(imageNamed: "bg\(backgroundGenerator)")
        
        backgroundNode = SKSpriteNode(texture: backgroundTexture, size: CGSize(width: 750, height: 423))
        backgroundNode!.zPosition = -3
        addChild(backgroundNode!)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if touchedNode.name == "backButton" || touchedNode.name == "backLabel" {
            
            let gameScene = SKScene(fileNamed: "GameScene")
            gameScene!.scaleMode = .aspectFill
            scene!.view!.presentScene(gameScene!)
        }
        
    }
    
    
}
