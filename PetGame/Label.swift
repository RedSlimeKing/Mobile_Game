//
//  ProgressBar.swift
//  PetGame
//
//  Created by Rennick Carter M. on 4/11/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import SpriteKit

class Label : SKLabelNode{
    init(labelText: String, color : UIColor){
        super.init()
        
        text = labelText
        fontSize = 20
        fontColor = color
        fontName = "Arial-BoldMT"
        zPosition = 900
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
