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
    func SwitchScreens(string: String)
}
class GameViewController: UIViewController,ScreenSwitchable {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = LobbyScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
        scene.screenDelegate = self
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        
        NotificationCenter.default.addObserver(self, selector: #selector(disableButtons), name: Notification.Name.didRecieveButtonInput, object: nil)
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
    
    func  SwitchScreens(string: String) {
        let skView = view as! SKView
        switch string {
        case "LobbyScene":
            let lobbyScene = LobbyScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
            lobbyScene.screenDelegate = self
            skView.presentScene(lobbyScene)
        case "WashScene":
            let washScene = WashScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
            washScene.screenDelegate = self
            skView.presentScene(washScene)
        case "FeedingScene":
            let feedingScene = FeedingScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
            feedingScene.screenDelegate = self
            skView.presentScene(feedingScene)
        case "WalkingScene":
            let walkingScene = GameScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
            walkingScene.screenDelegate = self
            skView.presentScene(walkingScene)
        case "PettingScene":
            let pettingScene = PettingScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height ))
            pettingScene.screenDelegate = self
            skView.presentScene(pettingScene)
        default:
            self.view = LobbyScene(size: CGSize(width:self.view.frame.size.width ,  height:self.view.frame.size.height )) as! SKView
        }
    }
    
    @objc func disableButtons(notification: Notification){
        //let data = notification.userInfo?["name"] as? String
        guard let subviews = self.view?.subviews else {
            return
        }
        for view in subviews as [UIView] {
            if let button = view as? UIButton {
                button.isHidden = true
                button.isEnabled = false
            }
        }
        
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

