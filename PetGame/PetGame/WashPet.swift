//
//  WashPet.swift
//  PetGame
//
//  Created by Rennick Carter M. on 4/7/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import Foundation

import SpriteKit

class WashPet : SKSpriteNode, Updatable{
    private var isBeingTouched : Bool
    
    init(petTexture: String){
        isBeingTouched = false
        
        let texture = SKTexture.init(imageNamed: petTexture)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        self.isUserInteractionEnabled = true
        self.size.width = self.size.width / 5.0
        self.size.height = self.size.height / 5.0
        self.zPosition = 10.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func IsBeingTouched() -> Bool{
        return isBeingTouched
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        isBeingTouched = true
    }
    
    func update(_ currentTime: TimeInterval){
        isBeingTouched = false
    }
}
