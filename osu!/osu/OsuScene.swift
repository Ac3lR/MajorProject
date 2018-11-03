//
//  OsuScene.swift
//  Rythem Game ARKit
//
//  Created by Axel Raut on 24/9/18.
//  Copyright © 2018 JJ & Axel. All rights reserved.
//

//import SpriteKit
//import AVFoundation
//extension UIColor {
//
//    convenience init(hex: Int, alpha: CGFloat = 1.0) {
//
//        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
//        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
//        let blue = CGFloat((hex & 0xFF)) / 255.0
//
//        self.init(red:red, green:green, blue:blue, alpha:alpha)
//    }
//}
//extension Range
//{
//    var randomInt: Int
//    {
//        get
//        {
//            var offset = 0
//
//            if (self.lowerBound as! Int) < 0   // allow negative ranges
//            {
//                offset = abs(lowerBound as! Int)
//            }
//
//            let mini = UInt32(lowerBound as! Int + offset)
//            let maxi = UInt32(upperBound   as! Int + offset)
//
//            return Int(mini + arc4random_uniform(maxi - mini)) - offset
//        }
//    }
//}
//
//class OsuScene: SKScene {
//
//
//    //let VideoSprite = SKVideoNode(
//
//    //let videoURL: URL = Bundle.main.url!(forResource: "home_video", withExtension: ".mp4")
//
//
//    var circleCountLableValue: Int = 1
//
//    var zPositionMain = -1
//
//    var timer: Timer?
//    var totalTime: Int = 0
//
//    var timeTouch = 0
//
//    var spawnArray: [Float] = []
//
//    var circleCount = 0
//
//    var Player: AVAudioPlayer?
//    var songMusic = SKAudioNode(fileNamed: "menu-music-1")
//    var MusicPath = Bundle.main.url(forResource: "menu-music-1", withExtension: ".mp3")
//    override func didMove(to view: SKView) {
//
//
//        do {
//            Player = try AVAudioPlayer(contentsOf: MusicPath!)
//            Player!.play()
//
//
//        }
//
//        catch {
//            let theError = error as NSError
//
//            print("Could not play song \(theError)")
//
//        }
//
//
//        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (theTimer) in
//
//            self.totalTime += 1
//
//            if self.totalTime % 11 == 0 {
//
////                let deviceWidth = UIScreen.mainScreen().bounds.width
////                let deviceHeight = UIScreen.mainScreen().bounds.height
//
//                let displaySize: CGRect = UIScreen.main.bounds
//                let displayWidth = Int(displaySize.width / 2)
//                let displayHeight = Int(displaySize.height / 2)
//
//                let heightScreen = Range((-(displayHeight) ... displayHeight)).randomInt
//                let widthScreen = Range((-(displayWidth) ... displayWidth)).randomInt
//
//                print(self.totalTime)
//
//            self.spawnCircle(xPoint: widthScreen, yPoint: heightScreen)
//
////                self.Circle?.removeFromParent()
////                self.Circle2?.removeFromParent()
//
//            }
//
//        })
//
//
//
//
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        let touch = touches.first!
//        let touchLocation = touch.location(in: self)
//        let touchedNode = atPoint(touchLocation)
//
////        print(touchedNode.name)
////
////        for i in 0...spawnArray.count {
////
//        if touchedNode.name == "circleMaster"{
////
////            print("Hello")
////
////            timeTouch = totalTime
////
////            var clickNumber = 0
////
////        }
////
//////            let finalTime = timeTouch - spawnArray[]
////
////            //print(finalTime)
////
////            touchedNode.removeAllActions()
////            touchedNode.removeFromParent()
////
////        }
////
//
//        touchedNode.removeAllActions()
//        touchedNode.removeFromParent()
//        }
//    }
//
//    func circleNumberVaueFunc() {
//
//        circleCountLableValue += 1
//
//        let randCircleValueReset = Range((3 ...  10)).randomInt
//
//        if circleCountLableValue >= randCircleValueReset {
//
//            circleCountLableValue = 1
//
//        }
//
//    }
//
//
//    func spawnCircle(xPoint: Int, yPoint: Int) {
//
////        var spawnTime = Float(totalTime)
////
////        let circleNumber = circleCount
////
////        spawnArray.insert(spawnTime, at: circleCount)
////
////        circleCount += 1
//
//
//
//
//
////         class CircleMaster {
////
////         let circleMaster = SKShapeNode(circleOfRadius: 110)
////         self.position = CGPoint(x: xPoint, y: yPoint)
////         self.zPosition = 100
////         self.name = "circleMaster\(circleNumber)"
////         self.glowWidth = 0
////         self.strokeColor = UIColor.clear
////         self.addChild(circleMaster)
////
////         }
//
//        let transparentCenterMask = SKShapeNode(circleOfRadius: 55)
//        transparentCenterMask.lineWidth = 7
//        transparentCenterMask.fillColor = UIColor.purple
//        let transparentCenterCrop = SKCropNode()
//        transparentCenterCrop.maskNode = transparentCenterMask
//
//
//        let CircleCounterLabel = SKLabelNode(text: "\(circleCountLableValue)")
//        CircleCounterLabel.fontName = "AvenirNext-DemiBold"
//        CircleCounterLabel.fontSize = 75
//        CircleCounterLabel.fontColor = UIColor(hex: 0xedf0f2)
//        CircleCounterLabel.zPosition = CGFloat(zPositionMain - 10)
//        CircleCounterLabel.position = CGPoint(x: 0, y: -25)
//
//        let circleMaster = SKShapeNode(circleOfRadius: 55)
//        circleMaster.position = CGPoint(x: xPoint, y: yPoint)
//        circleMaster.zPosition = CGFloat(zPositionMain)
////        circleMaster.name = "circleMaster\(circleNumber)"
//        circleMaster.name = "circleMaster"
//        circleMaster.glowWidth = 0
//        circleMaster.strokeColor = UIColor.clear
////        spawnArray.insert(spawnTime, at: circleNumber)
//        self.addChild(circleMaster)
//
//
//        let Circle = SKShapeNode(circleOfRadius: 110 ) // Size of Circle
//        Circle.position = CGPoint(x: 0, y: 0)
//        Circle.strokeColor = UIColor.white
//        Circle.glowWidth = 2
//        Circle.zPosition = CGFloat(zPositionMain - 50)
//        Circle.name = "Circle"
//
//        circleMaster.addChild(Circle)
//
//        let Circle2 = SKShapeNode(circleOfRadius: 55 ) // Size of Circle
//        Circle2.position = CGPoint(x: 0, y: 0)
////        Circle2.strokeColor = UIColor(hex: 0xedf0f2)
//        Circle2.fillColor = UIColor.black
//        Circle2.zPosition = CGFloat(zPositionMain - 100)
////        Circle2.glowWidth = 100.0
//        Circle2.addChild(transparentCenterMask)
//
//        circleMaster.addChild(CircleCounterLabel)
//
//        circleMaster.addChild(Circle2)
//
//
//        let pulseDown = SKAction.scale(to: 1/2, duration: 1)
//        let wait = SKAction.wait(forDuration: 0.15)
//
//
//        let pulse = SKAction.sequence([pulseDown, wait])
//
//
//
//        circleNumberVaueFunc()
//
//        zPositionMain -= 1
//
//        Circle.run(pulse, completion: {
//
//            circleMaster.removeFromParent()
//
//        })
//
//
//    }
//
//
//
//}



//  OsuScene.swift
//  Rythem Game ARKit
//
//  Created by Isaac, Axel and JJ on 24/9/18.
//  Copyright © 2018 Isaac, JJ & Axel. All rights reserved.

import AVFoundation
import SpriteKit
extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
extension Range
{
    var randomInt: Int
    {
        get
        {
            var offset = 0
            
            if (self.lowerBound as! Int) < 0   // allow negative ranges
            {
                offset = abs(lowerBound as! Int)
            }
            
            let mini = UInt32(lowerBound as! Int + offset)
            let maxi = UInt32(upperBound   as! Int + offset)
            
            return Int(mini + arc4random_uniform(maxi - mini)) - offset
        }
    }
}

class OsuScene: SKScene {
    
    let maxCircles = 5                             // Controls number of circles on screen at the same time
    
    var objectCounter = 0
    
    var zPositionMain = -1
    
    var circleCountLableValue: Int = 1             // Counter of circle numbers, cycles 1-maxCircles
    var timer: Timer?                              // Pulse timer for animations and actions
    var totalTime: Int = 0                         // Time since start in 100ths of seconds
    var circleTimer: Timer?                              // Pulse timer for animations and actions
    var circleSpawnTime: Int = 0
    
    var spawnArray = Array(repeating: 0, count: 5) // Array of times when circles were spawned
    var score = 0;                                 // Player's score
    let ScoreLabel = SKLabelNode(text: "Score: 0")
    let screenWidth = Int(UIScreen.main.bounds.width)
    let screenHeight = Int(UIScreen.main.bounds.height)
    
    var Player: AVAudioPlayer?
    //var songMusic = SKAudioNode(fileNamed: "level-music-3")
    var MusicPath = Bundle.main.url(forResource: "level-music-3", withExtension: ".mp3")
    
    
    //Manage the overall animations and actions
    override func didMove(to view: SKView) {
        
        do {
            Player = try AVAudioPlayer(contentsOf: MusicPath!)
            Player!.play()
            
            
        }
            
        catch {
            let theError = error as NSError
            
            print("Could not play song \(theError)")
            
        }
        
        // Add label for score.
        ScoreLabel.fontName = "AvenirNext-DemiBold"
        ScoreLabel.fontSize = 20
        ScoreLabel.fontColor = UIColor.white
        ScoreLabel.zPosition = -20
        ScoreLabel.position = CGPoint(x: -self.screenWidth/2, y: self.screenHeight/2+100)
        self.addChild(ScoreLabel)
        
        // Create the control timer, repeating every 100th of a second
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (theTimer) in
            
            
            
            self.totalTime += 1
            
            //print(self.totalTime)
            
            if self.totalTime == 145 {
                
                self.circleTimerFunc(tempo: 0.2703)
                
            }
            
            //Simple Boi
            
            if self.totalTime == 880 {
                
                self.circleTimer?.invalidate()
                
                self.circleTimerFunc(tempo: 0.2703 * 2)
                
            }
            
            if self.totalTime == 1300 {
                
                self.circleTimer?.invalidate()
                
                self.circleTimerFunc(tempo: 0.2703)
                
            }
            
            if self.totalTime == 1550 {
                
                self.circleTimer?.invalidate()
                
                self.circleTimerFunc(tempo: 0.2703 / 1.5)
                
            }
            
            if self.totalTime == 2370 {
                
                self.circleTimer?.invalidate()
                
            }
            
            
            //if self.totalTime == 
            // Every quarter of a second, spawn a new circle
            /*if self.totalTime % 25 == 0 {
                
                // Randomly pick a new location
                //                let nr = Range((-self.screenHeight/2+110 ... self.screenHeight/2-110)).randomInt
                //                let mr = Range((-self.screenWidth/2+110 ... self.screenWidth/2-110)).randomInt
                //
                //                // Spawn new the circle.
                //                self.spawnCircle(xPoint: mr, yPoint: nr)
                
                
                
                
                
                let heightScreen = Range((-(self.screenHeight/2) ... self.screenHeight/2)).randomInt
                let widthScreen = Range((-(self.screenWidth/2) ... self.screenWidth/2)).randomInt
                
                //                                print(self.totalTime)
                
                self.spawnCircle(xPoint: widthScreen, yPoint: heightScreen)
                
                // Add spawn time to array of spawn times.
                self.spawnArray[self.circleCountLableValue-1] = self.totalTime
                
                // Increment the counter.
                self.circleCountLableValue += 1
                if self.circleCountLableValue > self.maxCircles {
                    self.circleCountLableValue = 1
                }
            }*/
        })
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)                                                            // Constant assigned to clicked node
        //if touchedNode is SKShapeNode && touchedNode.name != "notTarget" && touchedNode.name != "displayNode" {    // Runs code if the inside circle was clicked
        if touchedNode is SKShapeNode && touchedNode.name != "notTarger" {
        let circleRefNumber: Int = Int(touchedNode.name!)!                                              // Creates an integer equal to the cirlces number
            let timeToTouch = totalTime - spawnArray[circleRefNumber-1]                                     // Time taken to click the circle after it spawns
            print(timeToTouch)
            score += 150-timeToTouch;
            self.ScoreLabel.text = "Score: \(score)"
            
            print(touchedNode)
            touchedNode.removeAllActions()
            touchedNode.removeFromParent()
        }
    }
    
    func circleTimerFunc(tempo: Double) {
        circleTimer = Timer.scheduledTimer(withTimeInterval: tempo, repeats: true, block: { (theTimer) in
            
            // Every quarter of a second, spawn a new circle
            //            if self.totalTime % 2703 == 0 {
            
            // Randomly pick a new location
            //                let nr = Range((-self.screenHeight/2+110 ... self.screenHeight/2-110)).randomInt
            //                let mr = Range((-self.screenWidth/2+110 ... self.screenWidth/2-110)).randomInt
            //
            //                // Spawn new the circle.
            //                self.spawnCircle(xPoint: mr, yPoint: nr)
            
            
            
            
            
            let heightScreen = Range((-(self.screenHeight/2) ... self.screenHeight/2)).randomInt
            let widthScreen = Range((-(self.screenWidth/2) ... self.screenWidth/2)).randomInt
            
            //                                print(self.totalTime)
            
            self.spawnCircle(xPoint: widthScreen, yPoint: heightScreen)
            
            self.objectCounter += 1
            
            // Add spawn time to array of spawn times.
            self.spawnArray[self.circleCountLableValue-1] = self.totalTime
            
            // Increment the counter.
            self.circleCountLableValue += 1
            if self.circleCountLableValue > self.maxCircles {
                self.circleCountLableValue = 1
            }
            //        }
        })
    }
    
    
    func spawnCircle(xPoint: Int, yPoint: Int) {
        
        // Create the shape.
        let circleMaster = SKShapeNode(circleOfRadius: 55)
        circleMaster.position = CGPoint(x: xPoint, y: yPoint)
        circleMaster.zPosition = CGFloat(zPositionMain + 100)
        circleMaster.name = "\(circleCountLableValue)"
        circleMaster.glowWidth = 0
        circleMaster.strokeColor = UIColor.clear
        self.addChild(circleMaster)
        
        // Add the inner circle to the shape.
        let Circle = SKShapeNode(circleOfRadius: 110 ) // Size of Circle
        Circle.position = CGPoint(x: 0, y: 0)
        Circle.strokeColor = UIColor.white
        Circle.name = "notTarget"
        Circle.glowWidth = 2
        Circle.zPosition = CGFloat(zPositionMain - 99)
        Circle.name = "\(circleCountLableValue)"
        circleMaster.addChild(Circle)
        
        // Add label inside inner circle
        let CircleCounterLabel = SKLabelNode(text: "\(circleCountLableValue)")
        CircleCounterLabel.fontName = "AvenirNext-DemiBold"
        CircleCounterLabel.fontSize = 75
        CircleCounterLabel.fontColor = UIColor(hex: 0xedf0f2)
        CircleCounterLabel.zPosition = CGFloat(zPositionMain - 10)
        CircleCounterLabel.position = CGPoint(x: 0, y: -30)
        CircleCounterLabel.name = "\(circleCountLableValue)"
        circleMaster.addChild(CircleCounterLabel)
        
        // Add the outer circle to the shape.
        let transparentCenterMask = SKShapeNode(circleOfRadius: 55)
        transparentCenterMask.lineWidth = 7

        transparentCenterMask.fillColor = UIColor.purple
        let transparentCenterCrop = SKCropNode()
        transparentCenterCrop.maskNode = transparentCenterMask
        let Circle2 = SKShapeNode(circleOfRadius: 55) // Size of Circle
        Circle2.position = CGPoint(x: 0, y: 0)
        //        Circle2.strokeColor = UIColor(hex: 0xedf0f2)
        
        Circle2.fillColor = UIColor.black
        Circle2.zPosition = CGFloat(zPositionMain - 100)
        //        Circle2.glowWidth = 100.0
        Circle2.addChild(transparentCenterMask)
        circleMaster.addChild(Circle2)
        
        // Animate the outer circle.
        let pulseDown = SKAction.scale(to: 1/2, duration: 1/2)
        let wait = SKAction.wait(forDuration: 0.08)
        let pulse = SKAction.sequence([pulseDown, wait])
        
        zPositionMain -= 1
        
        Circle.run(pulse, completion: {
            circleMaster.removeFromParent()
        })
    }
}
