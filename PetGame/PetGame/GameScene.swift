//
//  GameScene.swift
//  ZombieConga
//
//  Created by Kevin Kruusi on 2018-02-04.
//  Copyright © 2018 kevin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //let player : SKSpriteNode = Zombie()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2 )
        addChild(background)
        
        let player : SKSpriteNode = Zombie()
        
        addChild(player)
        
        player.zPosition = 1
        player.position = CGPoint(x: 400, y: 400)
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
