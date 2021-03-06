//
//  BaseScene.swift
//  PetGame
//
//  Created by Rennick Carter M. on 3/21/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import Foundation

import SpriteKit
import GameplayKit
import UIKit

class BaseScene : SKScene{
    
    var screenDelegate: ScreenSwitchable?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
    
    func MoveToScene(newScene : Scenes){
        screenDelegate?.SwitchScreens(string: newScene)
    }
    
    override func update(_ currentTime: TimeInterval){
        super.update(currentTime)
        
        self.children.forEach { (child) in
            if let updatable = child as? Updatable{
                updatable.update(currentTime)
            }
        }
    }
}
