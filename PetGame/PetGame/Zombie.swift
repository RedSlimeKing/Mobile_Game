//
//  Zombie.swift
//  ZombieConga
//
//  Created by Rennick Carter M. on 2019-01-31.
//  Copyright © 2019 kevin. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit

protocol Updatable {
    func update(_ currentTime: TimeInterval)
}

class Zombie: SKSpriteNode, Updatable{
    var counter = 0
    let zombieTextures: [SKTexture] =  [SKTexture.init(imageNamed: "zombie1"),
                                        SKTexture.init(imageNamed: "zombie2"),
                                        SKTexture.init(imageNamed: "zombie3"),
                                        SKTexture.init(imageNamed: "zombie4"),
                                        SKTexture.init(imageNamed: "zombie3"),
                                        SKTexture.init(imageNamed: "zombie2")]
    
    init(){
        let texture = SKTexture.init(imageNamed: "zombie1")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        let animation = SKAction.animate(with: zombieTextures, timePerFrame: 0.5)
        let counterAction = SKAction.run {
            self.counter += 1
        }
        let sequenceAction = SKAction.sequence([animation, counterAction])
        let repeatAction = SKAction.repeatForever(sequenceAction)
        
        run(repeatAction, withKey: "idle")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ currentTime: TimeInterval){
        if counter > 5 {
            removeAction(forKey: "idle")
        }
    }
}
