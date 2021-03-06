//
//  ProgressBar.swift
//  PetGame
//
//  Copied by Fukumoto Jared A. on 4/18/19.
//  Created by Rennick Carter M. on 4/11/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit

class ProgressBar : SKSpriteNode{
    var label : SKLabelNode
    private var fillValue : CGFloat //How full the progress bar is
    private var filledWidth : CGFloat //How wide the progress bar is when completely filled
    
    init(textureName: String, text: String = ""){
        let texture = SKTexture.init(imageNamed: textureName)
        fillValue = 1.0
        filledWidth = 1.0 //Fake initialization, actual value is set later
        label = SKLabelNode(text: text)
        label.fontColor = UIColor.white
        label.fontName = "Arial-BoldMT"
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        self.isUserInteractionEnabled = true
        
        filledWidth = size.width / 3.0
        size.width = filledWidth
        size.height = size.height / 6.0
        
        self.zPosition = 10.0
        label.position = CGPoint(x: 0.0, y: -7.5)
        label.fontSize = 24.0
        label.zPosition = 20.0
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
