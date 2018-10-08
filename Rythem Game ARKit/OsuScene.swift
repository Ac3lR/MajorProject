//
//  OsuScene.swift
//  Rythem Game ARKit
//
//  Created by Axel Raut on 24/9/18.
//  Copyright © 2018 JJ & Axel. All rights reserved.
//

import SpriteKit

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
        
        print(touchedNode.name)
        
        for i in 0...spawnArray.count {
        
        if touchedNode.name == "circleMaster\(i)"{

            print("Hello")
        
            timeTouch = totalTime
            
            var clickNumber = 0
            
        }
            
//            let finalTime = timeTouch - spawnArray[]
            
            //print(finalTime)
            
            touchedNode.removeAllActions()
            touchedNode.removeFromParent()
            
        }
        
        
        
        
    }
    
    
    
    func spawnCircle(xPoint: Int, yPoint: Int) {
        
        var spawnTime = Float(totalTime)
        
        let circleNumber = circleCount
        
        spawnArray.insert(spawnTime, at: circleCount)
        
        circleCount += 1
        
        
        
        
         
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
        
        
        let circleMaster = SKShapeNode(circleOfRadius: 110)
        circleMaster.position = CGPoint(x: xPoint, y: yPoint)
        circleMaster.zPosition = 100
        circleMaster.name = "circleMaster\(circleNumber)"
        circleMaster.glowWidth = 0
        circleMaster.strokeColor = UIColor.clear
        spawnArray.insert(spawnTime, at: circleNumber)
        self.addChild(circleMaster)

        
        let Circle = SKShapeNode(circleOfRadius: 200 ) // Size of Circle
        Circle.position = CGPoint(x: 0, y: 0)
        Circle.strokeColor = UIColor.black
        Circle.glowWidth = 5.0
        Circle.zPosition = -50
        Circle.name = "Circle"
        
        circleMaster.addChild(Circle)
        
        let Circle2 = SKShapeNode(circleOfRadius: 100 ) // Size of Circle
        Circle2.position = CGPoint(x: 0, y: 0)
        Circle2.strokeColor = UIColor.red
        Circle2.fillColor = UIColor.red
        Circle2.glowWidth = 1.0
        Circle2.zPosition = -100
        
        
        circleMaster.addChild(Circle2)
        
        
        
        let pulseDown = SKAction.scale(to: 1/2, duration: 1)
        let wait = SKAction.wait(forDuration: 0.15)
        
        
        let pulse = SKAction.sequence([pulseDown, wait])
        
        
        
        
        Circle.run(pulse, completion: {
            
            circleMaster.removeFromParent()
            
        })
        

    }
    
    
    
}
