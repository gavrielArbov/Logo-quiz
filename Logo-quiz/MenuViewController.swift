//
//  MenuViewController.swift
//  Logo-quiz
//
//  Created by user216463 on 5/30/22.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaults.resetStandardUserDefaults()
        var score = UserDefaults.standard.integer(forKey: "score")
        if(score != 0){
            scoreLabel.text = "\(score)/15"
        }
    }
    

    @IBAction func startButton(_ sender: Any) {
        present((storyboard?.instantiateViewController(withIdentifier: "game"))!, animated: true)
    }


}
