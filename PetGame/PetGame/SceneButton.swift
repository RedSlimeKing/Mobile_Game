//
//  SceneButton.swift
//  PetGame
//
//  Created by Rennick Carter M. on 3/21/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import Foundation
import SpriteKit

class SceneButton : SKSpriteNode{
    var label : SKLabelNode
    var clickEvent: () -> Void
    
    init(text: String, clickEvent: @escaping ()-> Void ){
        let texture = SKTexture.init(imageNamed: "button")
        label = SKLabelNode(text: text)
        label.fontColor = UIColor.blue
        label.fontName = "Arial-BoldMT"
        self.clickEvent = clickEvent
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        self.isUserInteractionEnabled = true
        self.size.width = self.size.width / 4
        self.size.height = self.size.height / 4
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
