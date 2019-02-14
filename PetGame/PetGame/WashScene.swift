//
//  WashScene.swift
//  PetGame
//
//  Created by Gallagher Sean D. on 2019-02-14.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//


import SpriteKit
import GameplayKit

class WashScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "washscenebackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)

    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        self.children.forEach { (child) in
            if let updatable = child as? Updatable{
                updatable.update(currentTime)
            }
        }
    }
}
