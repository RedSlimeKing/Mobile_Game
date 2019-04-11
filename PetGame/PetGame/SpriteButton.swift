//
//  SpriteButton.swift
//  PetGame
//
//  Created by Fukumoto Jared A. on 4/11/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import Foundation
import SpriteKit

class SpriteButton : SKSpriteNode{
    var label : SKLabelNode
    var clickEvent: () -> Void
    
    init(spriteName: String , clickEvent: @escaping ()-> Void ){
        let texture = SKTexture.init(imageNamed: spriteName)
        label = SKLabelNode(text: "")
        self.clickEvent = clickEvent
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        self.isUserInteractionEnabled = true
        self.size.width = self.size.width / 5.0
        self.size.height = self.size.height / 5.0
        self.zPosition = 1.0
        
        label.position = CGPoint(x: 0.0, y: -7.5)
        label.fontSize = 24.0
        label.zPosition = 2.0
        addChild(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        clickEvent()
    }
}
