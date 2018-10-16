//
//  OsuScene.swift
//  Rythem Game ARKit
//
//  Created by Axel Raut on 24/9/18.
//  Copyright © 2018 JJ & Axel. All rights reserved.
//

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
    var circleCountLableValue: Int = 1
    
    var timer: Timer?
    var totalTime: Int = 0
    
    var timeTouch = 0
    
    var spawnArray: [Float] = []
    
    var circleCount = 0
    
    override func didMove(to view: SKView) {
        
//            self.spawnCircle(xPoint: 0, yPoint: 0)

        
        //
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (theTimer) in

            self.totalTime += 1
            
            if self.totalTime % 25 == 0 {

                let nr = Range((-667 ...  667)).randomInt
                let mr = Range((-375 ...  375)).randomInt
                
                print(self.totalTime)

            self.spawnCircle(xPoint: mr, yPoint: nr)
                
//                self.Circle?.removeFromParent()
//                self.Circle2?.removeFromParent()

            }

        })
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
//        print(touchedNode.name)
//
//        for i in 0...spawnArray.count {
//
        if touchedNode.name == "circleMaster"{
//
//            print("Hello")
//
//            timeTouch = totalTime
//
//            var clickNumber = 0
//
//        }
//
////            let finalTime = timeTouch - spawnArray[]
//
//            //print(finalTime)
//
//            touchedNode.removeAllActions()
//            touchedNode.removeFromParent()
//
//        }
//
        
        touchedNode.removeAllActions()
        touchedNode.removeFromParent()
        }
    }
    
    
    
    func spawnCircle(xPoint: Int, yPoint: Int) {
        
//        var spawnTime = Float(totalTime)
//
//        let circleNumber = circleCount
//
//        spawnArray.insert(spawnTime, at: circleCount)
//
//        circleCount += 1
        
        
        
        
         
//         class CircleMaster {
//
//         let circleMaster = SKShapeNode(circleOfRadius: 110)
//         self.position = CGPoint(x: xPoint, y: yPoint)
//         self.zPosition = 100
//         self.name = "circleMaster\(circleNumber)"
//         self.glowWidth = 0
//         self.strokeColor = UIColor.clear
//         self.addChild(circleMaster)
//
//         }
        
        let transparentCenterMask = SKShapeNode(circleOfRadius: 100)
        transparentCenterMask.lineWidth = 7
        transparentCenterMask.fillColor = UIColor.purple
        let transparentCenterCrop = SKCropNode()
        transparentCenterCrop.maskNode = transparentCenterMask
        
        
        let CircleCounterLabel = SKLabelNode(text: "\(circleCountLableValue)")
        CircleCounterLabel.fontName = "AvenirNext-DemiBold"
        CircleCounterLabel.fontSize = 100
        CircleCounterLabel.fontColor = UIColor(hex: 0xedf0f2)
        CircleCounterLabel.zPosition = -10
        CircleCounterLabel.position = CGPoint(x: 0, y: -30)
        
        let circleMaster = SKShapeNode(circleOfRadius: 110)
        circleMaster.position = CGPoint(x: xPoint, y: yPoint)
        circleMaster.zPosition = 100
//        circleMaster.name = "circleMaster\(circleNumber)"
        circleMaster.name = "circleMaster"
        circleMaster.glowWidth = 0
        circleMaster.strokeColor = UIColor.clear
//        spawnArray.insert(spawnTime, at: circleNumber)
        self.addChild(circleMaster)

        
        let Circle = SKShapeNode(circleOfRadius: 200 ) // Size of Circle
        Circle.position = CGPoint(x: 0, y: 0)
        Circle.strokeColor = UIColor.white
        Circle.glowWidth = 2
        Circle.zPosition = -50
        Circle.name = "Circle"
        
        circleMaster.addChild(Circle)
        
        let Circle2 = SKShapeNode(circleOfRadius: 100 ) // Size of Circle
        Circle2.position = CGPoint(x: 0, y: 0)
//        Circle2.strokeColor = UIColor(hex: 0xedf0f2)
        Circle2.fillColor = UIColor.black
        Circle2.zPosition = -100
//        Circle2.glowWidth = 100.0
        Circle2.addChild(transparentCenterMask)
        
        circleMaster.addChild(CircleCounterLabel)
        
        circleMaster.addChild(Circle2)
        
        
        
        
        let pulseDown = SKAction.scale(to: 1/2, duration: 1)
        let wait = SKAction.wait(forDuration: 0.15)
        
        
        let pulse = SKAction.sequence([pulseDown, wait])
        
        
        circleCountLableValue += 1
        
        let randCircleValueReset = Range((3 ...  10)).randomInt
        
        if circleCountLableValue >= randCircleValueReset {
            
            circleCountLableValue = 1
            
            
        }
        
        Circle.run(pulse, completion: {
            
            circleMaster.removeFromParent()
            
        })
        

    }
    
    
    
}
