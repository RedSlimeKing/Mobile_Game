//
//  GameViewController.swift
//  PetGame
//
//  Created by Rennick Carter M. on 2/7/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
protocol ScreenSwitchable {
    func SwitchScreens(string: Scenes)
}

enum Scenes: String {
    case lobby = "LobbyScene"
    case wash = "WashScene"
    case feeding = "FeedingScene"
    case petting = "PettingScene"
    case walking = "WalkingScene"
}

class GameViewController: UIViewController,ScreenSwitchable {
    
    var currentScene : BaseScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentScene = LobbyScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
        currentScene?.screenDelegate = self
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        currentScene?.scaleMode = .aspectFill
        skView.presentScene(currentScene)
        
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//
//                // Present the scene
//                view.presentScene(scene)
//            }
//
//            view.ignoresSiblingOrder = true
//
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    func  SwitchScreens(string: Scenes) {
        let skView = view as! SKView
        switch string {
        case .lobby:
            currentScene = LobbyScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
        case .wash:
            currentScene = WashScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
        case .feeding:
            currentScene = FeedingScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
        case .walking:
            currentScene = WalkScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
        case .petting:
            currentScene = PettingScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
        }
        
        currentScene?.screenDelegate = self
        skView.presentScene(currentScene)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}




extension Notification.Name {
    static let didRecieveButtonInput = Notification.Name("didRecieveButtonInput")
    
}

