//
//  levelSelection.swift
//  osu
//
//  Created by Jiajun Ma on 22/10/18.
//  Copyright © 2018 Jiajun Ma. All rights reserved.
//

import Foundation
import SpriteKit
import AVFoundation

class LevelSelectionScene: SKScene {
    
    var bottomBar: SKSpriteNode?
    var backButton: SKSpriteNode?
    var playButton: SKSpriteNode?
    
    var sideBar: SKSpriteNode?
    
    var topBar: SKSpriteNode?
    
    var levelTexture: SKTexture?
    
    var backGroundDamper: SKSpriteNode?
    
    var levelBackground: SKSpriteNode?
    var currentLevelSelected: Int = 1
    
    var levelOne: SKSpriteNode?
    var levelTwo: SKSpriteNode?
    var levelThree: SKSpriteNode?
    
    let levelName1: String = "Shelter [Easy]"
    let levelName2: String = "Atmosphere [Hard]"
    let levelName3: String = "Freedom Dive [Insane]"
    
    let levelLength1: String = "4:25"
    let levelLength2: String = "5:29"
    let levelLength3: String = "3:27"
    
    let levelBPM1: String = "100"
    let levelBPM2: String = "170"
    let levelBPM3: String = "222"
    
    let levelObjects1: String = "0"
    let levelObjects2: String = "0"
    let levelObjects3: String = "0"
    
    var levelNameLabel: SKLabelNode?
    var levelLengthLabel: SKLabelNode?
    var levelBPMLabel: SKLabelNode?
    var levelObjectsLabel: SKLabelNode?
    
    var Player: AVAudioPlayer?
    var MusicPath = Bundle.main.url(forResource: "level-preview-1", withExtension: ".mp3")
    
    
    
//-------------------------------------------------------------------------------------------------------------------------------------------
    
    override func didMove(to view: SKView) {
        
        levelTexture = SKTexture(imageNamed: "level-background-1")
        
        levelBackground = SKSpriteNode(texture: levelTexture)
        levelBackground!.position = CGPoint(x: 0, y: 0)
        levelBackground!.size = CGSize(width: 750, height: 430)
        levelBackground!.zPosition = -10
        addChild(levelBackground!)
        
        backGroundDamper = SKSpriteNode(color: .darkGray, size: CGSize(width: 750, height: 430))
        backGroundDamper!.position = CGPoint(x: 0, y: 0)
        backGroundDamper!.zPosition = -9
        backGroundDamper!.alpha = 0.5
        backGroundDamper!.name = "backGroundDamper"
        addChild(backGroundDamper!)
        
        bottomBar = SKSpriteNode(color: .black, size: CGSize(width: 1334, height: 75))
        bottomBar!.position = CGPoint(x: 0, y: -182)
        bottomBar!.name = "bottomBar"
        bottomBar!.zPosition = -9
        bottomBar!.alpha = 0.75
        addChild(bottomBar!)
        
        backButton = SKSpriteNode(color: UIColor(red: 186/255, green: 107/255, blue: 192/255, alpha: 1), size: CGSize(width: 150, height: 50))
        backButton!.position = CGPoint(x: -290, y: -180)
        backButton!.name = "backButton"
        backButton!.zPosition = 10
        addChild(backButton!)
        
        let backButtonLabel = SKLabelNode(text: "Back")
        backButtonLabel.position = CGPoint(x: 0, y: -6)
        backButtonLabel.fontName = "Arial Bold"
        backButtonLabel.fontSize = 20
        backButtonLabel.fontColor = SKColor.white
        backButtonLabel.name = "backButtonLabel"
        backButton!.addChild(backButtonLabel)
        
        playButton = SKSpriteNode(color: UIColor(red: 134/255, green: 182/255, blue: 48/255, alpha: 1), size: CGSize(width: 150, height: 50))
        playButton!.position = CGPoint(x: 290, y: -180)
        playButton!.name = "playButton"
        playButton!.zPosition = 10
        addChild(playButton!)
        
        let playButtonLabel = SKLabelNode(text: "Play")
        playButtonLabel.position = CGPoint(x: 0, y: -6)
        playButtonLabel.fontName = "Arial Bold"
        playButtonLabel.fontSize = 20
        playButtonLabel.fontColor = SKColor.white
        playButtonLabel.name = "playButtonLabel"
        playButton!.addChild(playButtonLabel)
        
        topBar = SKSpriteNode(color: .black, size: CGSize(width: 300, height: 75))
        topBar!.position = CGPoint(x: -220, y: 182)
        topBar!.name = "bottomBar"
        topBar!.zPosition = -9
        topBar!.alpha = 0.9
        addChild(topBar!)
        
        levelNameLabel = SKLabelNode(text: "\(levelName1)")
        levelNameLabel!.position = CGPoint(x: 0, y: -7)
        levelNameLabel!.fontName = "Arial Bold"
        levelNameLabel!.fontSize = 20
        levelNameLabel!.fontColor = SKColor.white
        levelNameLabel!.name = "levelNameLabel"
        topBar!.addChild(levelNameLabel!)
        
        sideBar = SKSpriteNode(color: .black, size: CGSize(width: 200, height: 200))
        sideBar!.position = CGPoint(x: -270, y: 40)
        sideBar!.name = "sideBar"
        sideBar!.zPosition = -9
        sideBar!.alpha = 0.5
        addChild(sideBar!)
        
        levelLengthLabel = SKLabelNode(text: "Length: \(levelLength1)")
        levelLengthLabel!.position = CGPoint(x: 0, y: 60)
        levelLengthLabel!.fontName = "Arial Bold"
        levelLengthLabel!.fontSize = 16
        levelLengthLabel!.fontColor = SKColor.white
        levelLengthLabel!.name = "levelLengthLabel"
        sideBar!.addChild(levelLengthLabel!)
        
        levelBPMLabel = SKLabelNode(text: "BPM: \(levelBPM1)")
        levelBPMLabel!.position = CGPoint(x: 0, y: 30)
        levelBPMLabel!.fontName = "Arial Bold"
        levelBPMLabel!.fontSize = 16
        levelBPMLabel!.fontColor = SKColor.white
        levelBPMLabel!.name = "levelBPMLabel"
        sideBar!.addChild(levelBPMLabel!)
        
        levelObjectsLabel = SKLabelNode(text: "Objects: \(levelObjects1)")
        levelObjectsLabel!.position = CGPoint(x: 0, y: 0)
        levelObjectsLabel!.fontName = "Arial Bold"
        levelObjectsLabel!.fontSize = 16
        levelObjectsLabel!.fontColor = SKColor.white
        levelObjectsLabel!.name = "levelObjectsLabel"
        sideBar!.addChild(levelObjectsLabel!)
        
        levelOne = SKSpriteNode(color: .gray, size: CGSize(width: 350, height: 80))
        levelOne!.position = CGPoint(x: 300, y: 162)
        levelOne!.name = "levelOne"
        levelOne!.zPosition = -8
        levelOne!.alpha = 1
        addChild(levelOne!)
        
        let levelOnePictureTexture = SKTexture(imageNamed: "level-background-1")
        
        let levelOnePicture = SKSpriteNode(texture: levelOnePictureTexture)
        levelOnePicture.anchorPoint = CGPoint(x: 0, y: 0.5)
        levelOnePicture.size = CGSize(width: 80, height: 74)
        levelOnePicture.position = CGPoint(x: -170, y: 0)
        levelOnePicture.name = "levelOne"
        levelOne!.addChild(levelOnePicture )
        
        let levelOneNameLabel = SKLabelNode(text: "Shelter")
        levelOneNameLabel.position = CGPoint(x: -30, y: 20)
        levelOneNameLabel.fontName = "Arial Bold"
        levelOneNameLabel.fontSize = 14
        levelOneNameLabel.fontColor = SKColor.white
        levelOneNameLabel.name = "levelOneNameLabel"
        levelOneNameLabel.zPosition = 10
        levelOne!.addChild(levelOneNameLabel)
        
        levelTwo = SKSpriteNode(color: .gray, size: CGSize(width: 350, height: 80))
        levelTwo!.position = CGPoint(x: 300, y: 62)
        levelTwo!.name = "levelTwo"
        levelTwo!.zPosition = -8
        levelTwo!.alpha = 1
        addChild(levelTwo!)
        
        let levelTwoPictureTexture = SKTexture(imageNamed: "level-background-2")
        
        let levelTwoPicture = SKSpriteNode(texture: levelTwoPictureTexture)
        levelTwoPicture.anchorPoint = CGPoint(x: 0, y: 0.5)
        levelTwoPicture.size = CGSize(width: 80, height: 74)
        levelTwoPicture.position = CGPoint(x: -170, y: 0)
        levelTwoPicture.name = "levelTwo"
        levelTwo!.addChild(levelTwoPicture )
        
        let levelTwoNameLabel = SKLabelNode(text: "Atmosphere")
        levelTwoNameLabel.position = CGPoint(x: -30, y: 20)
        levelTwoNameLabel.fontName = "Arial Bold"
        levelTwoNameLabel.fontSize = 14
        levelTwoNameLabel.fontColor = SKColor.white
        levelTwoNameLabel.name = "levelTwo"
        levelTwoNameLabel.zPosition = 10
        levelTwo!.addChild(levelTwoNameLabel)
        
        levelThree = SKSpriteNode(color: .gray, size: CGSize(width: 350, height: 80))
        levelThree!.position = CGPoint(x: 300, y: -38)
        levelThree!.name = "levelThree"
        levelThree!.zPosition = -8
        levelThree!.alpha = 1
        addChild(levelThree!)
        
        let levelThreePictureTexture = SKTexture(imageNamed: "level-background-3")
        
        let levelThreePicture = SKSpriteNode(texture: levelThreePictureTexture)
        levelThreePicture.anchorPoint = CGPoint(x: 0, y: 0.5)
        levelThreePicture.size = CGSize(width: 80, height: 74)
        levelThreePicture.position = CGPoint(x: -170, y: 0)
        levelThreePicture.name = "levelThree"
        levelThree!.addChild(levelThreePicture )
        
        let levelThreeNameLabel = SKLabelNode(text: "Freedom Dive")
        levelThreeNameLabel.position = CGPoint(x: -30, y: 20)
        levelThreeNameLabel.fontName = "Arial Bold"
        levelThreeNameLabel.fontSize = 14
        levelThreeNameLabel.fontColor = SKColor.white
        levelThreeNameLabel.name = "levelThree"
        levelThreeNameLabel.zPosition = 10
        levelThree!.addChild(levelThreeNameLabel)
        
        MusicPath = Bundle.main.url(forResource: "level-preview-1", withExtension: ".mp3")
        
        do {
            Player = try AVAudioPlayer(contentsOf: MusicPath!)
            Player!.play()
        }
            
        catch {
            let theError = error as NSError
            print("Could not play song \(theError)")
        }

        
    }
    
//-------------------------------------------------------------------------------------------------------------------------------------------
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if touchedNode.name == "backButton" || touchedNode.name == "backButtonLabel" {
            
            let gameScene = SKScene(fileNamed: "GameScene")
            gameScene!.scaleMode = .aspectFill
            scene!.view!.presentScene(gameScene!)
            
        }
        
        if touchedNode.name == "levelOne" {
            
            currentLevelSelected = 1

            levelBackground?.removeFromParent()
            levelTexture = SKTexture(imageNamed: "level-background-1")
            levelBackground = SKSpriteNode(texture: levelTexture)
            levelBackground!.position = CGPoint(x: 0, y: 0)
            levelBackground!.size = CGSize(width: 750, height: 430)
            levelBackground!.zPosition = -10
            addChild(levelBackground!)
            
            levelNameLabel!.removeFromParent()
            levelNameLabel = SKLabelNode(text: "\(levelName1)")
            levelNameLabel!.position = CGPoint(x: 0, y: -7)
            levelNameLabel!.fontName = "Arial Bold"
            levelNameLabel!.fontSize = 20
            levelNameLabel!.fontColor = SKColor.white
            levelNameLabel!.name = "levelNameLabel"
            topBar!.addChild(levelNameLabel!)
            
            levelLengthLabel!.removeFromParent()
            levelLengthLabel = SKLabelNode(text: "Length: \(levelLength1)")
            levelLengthLabel!.position = CGPoint(x: 0, y: 60)
            levelLengthLabel!.fontName = "Arial Bold"
            levelLengthLabel!.fontSize = 16
            levelLengthLabel!.fontColor = SKColor.white
            levelLengthLabel!.name = "levelLengthLabel"
            sideBar!.addChild(levelLengthLabel!)
            
            levelBPMLabel!.removeFromParent()
            levelBPMLabel = SKLabelNode(text: "BPM: \(levelBPM1)")
            levelBPMLabel!.position = CGPoint(x: 0, y: 30)
            levelBPMLabel!.fontName = "Arial Bold"
            levelBPMLabel!.fontSize = 16
            levelBPMLabel!.fontColor = SKColor.white
            levelBPMLabel!.name = "levelBPMLabel"
            sideBar!.addChild(levelBPMLabel!)
            
            levelObjectsLabel!.removeFromParent()
            levelObjectsLabel = SKLabelNode(text: "Objects: \(levelObjects1)")
            levelObjectsLabel!.position = CGPoint(x: 0, y: 0)
            levelObjectsLabel!.fontName = "Arial Bold"
            levelObjectsLabel!.fontSize = 16
            levelObjectsLabel!.fontColor = SKColor.white
            levelObjectsLabel!.name = "levelObjectsLabel"
            sideBar!.addChild(levelObjectsLabel!)
            
            Player?.stop()
            
            MusicPath = Bundle.main.url(forResource: "level-preview-1", withExtension: ".mp3")
            
            do {
                Player = try AVAudioPlayer(contentsOf: MusicPath!)
                Player!.play()
                
            }
                
            catch {
                let theError = error as NSError
                
                print("Could not play song \(theError)")
                
            }

            
        }
        
        if touchedNode.name == "levelTwo" {
            
            currentLevelSelected = 2

            levelBackground?.removeFromParent()
            levelTexture = SKTexture(imageNamed: "level-background-2")
            levelBackground = SKSpriteNode(texture: levelTexture)
            levelBackground!.position = CGPoint(x: 0, y: 0)
            levelBackground!.size = CGSize(width: 750, height: 430)
            levelBackground!.zPosition = -10
            addChild(levelBackground!)
            
            levelNameLabel!.removeFromParent()
            levelNameLabel = SKLabelNode(text: "\(levelName2)")
            levelNameLabel!.position = CGPoint(x: 0, y: -7)
            levelNameLabel!.fontName = "Arial Bold"
            levelNameLabel!.fontSize = 20
            levelNameLabel!.fontColor = SKColor.white
            levelNameLabel!.name = "levelNameLabel"
            topBar!.addChild(levelNameLabel!)
            
            levelLengthLabel!.removeFromParent()
            levelLengthLabel = SKLabelNode(text: "Length: \(levelLength2)")
            levelLengthLabel!.position = CGPoint(x: 0, y: 60)
            levelLengthLabel!.fontName = "Arial Bold"
            levelLengthLabel!.fontSize = 16
            levelLengthLabel!.fontColor = SKColor.white
            levelLengthLabel!.name = "levelLengthLabel"
            sideBar!.addChild(levelLengthLabel!)
            
            levelBPMLabel!.removeFromParent()
            levelBPMLabel = SKLabelNode(text: "BPM: \(levelBPM2)")
            levelBPMLabel!.position = CGPoint(x: 0, y: 30)
            levelBPMLabel!.fontName = "Arial Bold"
            levelBPMLabel!.fontSize = 16
            levelBPMLabel!.fontColor = SKColor.white
            levelBPMLabel!.name = "levelBPMLabel"
            sideBar!.addChild(levelBPMLabel!)
            
            levelObjectsLabel!.removeFromParent()
            levelObjectsLabel = SKLabelNode(text: "Objects: \(levelObjects2)")
            levelObjectsLabel!.position = CGPoint(x: 0, y: 0)
            levelObjectsLabel!.fontName = "Arial Bold"
            levelObjectsLabel!.fontSize = 16
            levelObjectsLabel!.fontColor = SKColor.white
            levelObjectsLabel!.name = "levelObjectsLabel"
            sideBar!.addChild(levelObjectsLabel!)
            
            Player?.stop()
            
            MusicPath = Bundle.main.url(forResource: "level-preview-2", withExtension: ".mp3")
            
            do {
                Player = try AVAudioPlayer(contentsOf: MusicPath!)
                Player!.play()
                
            }
                
            catch {
                let theError = error as NSError
                
                print("Could not play song \(theError)")
                
            }


            
        }
        
        if touchedNode.name == "levelThree" {
            
            currentLevelSelected = 3
 
            levelBackground?.removeFromParent()
            levelTexture = SKTexture(imageNamed: "level-background-3")
            levelBackground = SKSpriteNode(texture: levelTexture)
            levelBackground!.position = CGPoint(x: 0, y: 0)
            levelBackground!.size = CGSize(width: 750, height: 430)
            levelBackground!.zPosition = -10
            addChild(levelBackground!)
            
            levelNameLabel!.removeFromParent()
            levelNameLabel = SKLabelNode(text: "\(levelName3)")
            levelNameLabel!.position = CGPoint(x: 0, y: -7)
            levelNameLabel!.fontName = "Arial Bold"
            levelNameLabel!.fontSize = 20
            levelNameLabel!.fontColor = SKColor.white
            levelNameLabel!.name = "levelNameLabel"
            topBar!.addChild(levelNameLabel!)
            
            levelLengthLabel!.removeFromParent()
            levelLengthLabel = SKLabelNode(text: "Length: \(levelLength3)")
            levelLengthLabel!.position = CGPoint(x: 0, y: 60)
            levelLengthLabel!.fontName = "Arial Bold"
            levelLengthLabel!.fontSize = 16
            levelLengthLabel!.fontColor = SKColor.white
            levelLengthLabel!.name = "levelLengthLabel"
            sideBar!.addChild(levelLengthLabel!)
            
            levelBPMLabel!.removeFromParent()
            levelBPMLabel = SKLabelNode(text: "BPM: \(levelBPM3)")
            levelBPMLabel!.position = CGPoint(x: 0, y: 30)
            levelBPMLabel!.fontName = "Arial Bold"
            levelBPMLabel!.fontSize = 16
            levelBPMLabel!.fontColor = SKColor.white
            levelBPMLabel!.name = "levelBPMLabel"
            sideBar!.addChild(levelBPMLabel!)
            
            levelObjectsLabel!.removeFromParent()
            levelObjectsLabel = SKLabelNode(text: "Objects: \(levelObjects3)")
            levelObjectsLabel!.position = CGPoint(x: 0, y: 0)
            levelObjectsLabel!.fontName = "Arial Bold"
            levelObjectsLabel!.fontSize = 16
            levelObjectsLabel!.fontColor = SKColor.white
            levelObjectsLabel!.name = "levelObjectsLabel"
            sideBar!.addChild(levelObjectsLabel!)
            
            Player?.stop()
            
            MusicPath = Bundle.main.url(forResource: "level-preview-3", withExtension: ".mp3")
            
            do {
                Player = try AVAudioPlayer(contentsOf: MusicPath!)
                Player!.play()
                
            }
                
            catch {
                let theError = error as NSError
                
                print("Could not play song \(theError)")
                
            }

        }
        
        if touchedNode.name == "playButton" && currentLevelSelected == 1 {
            
            // Go to issacs level
            
        }
        
        if touchedNode.name == "playButton" && currentLevelSelected == 2 {
            
            // Go to jjs level
            
        }
        
        if touchedNode.name == "playButton" && currentLevelSelected == 3 {
            
            // Go to axel level
            
        }
        
        
    }
    
//-------------------------------------------------------------------------------------------------------------------------------------------
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
//-------------------------------------------------------------------------------------------------------------------------------------------

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

//-------------------------------------------------------------------------------------------------------------------------------------------
    
    
}

