//
//  GameViewController.swift
//  MAPD724-W2022-ICE1
//
//  Created by Tom Tsiliopoulos on 2022-01-12.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var Lives: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let view = self.view as! SKView?
        {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene")
            {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            //view.showsFPS = true
            //view.showsNodeCount = true
            
        }
        
        // Initialozinf Lives and score
        CollisonManager.gameViewController = self
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    func updateScoreLabel() -> Void{
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    func updateLivesLabel() -> Void{
        Lives.text = "Lives: \(ScoreManager.Lives)"
    }
}
