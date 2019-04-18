//
//  ProgressBar.swift
//  PetGame
//
//  Created by Rennick Carter M. on 4/11/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit

class ProgressBar : SKSpriteNode{
    private var fillValue : CGFloat //How full the progress bar is
    private var filledWidth : CGFloat //How wide the progress bar is when completely filled
    
    init(textureName: String){
        let texture = SKTexture.init(imageNamed: textureName)
        fillValue = 1.0
        filledWidth = 1.0 //Fake initialization, actual value is set later
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        self.isUserInteractionEnabled = true
        
        filledWidth = size.width / 3.0
        size.width = filledWidth
        size.height = size.height / 6.0
        
        self.zPosition = 10.0
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetFillValue(value : CGFloat){
        fillValue = value
        
        //Clamp
        if fillValue < 0.0{
            fillValue = 0.0
        }else if fillValue > 1.0{
            fillValue = 1.0
        }
        
        //Set height based on fill value
        if fillValue == 0.0 {
            size.width = 0.0
        }else{
            size.width = filledWidth * fillValue
        }
    }
}
