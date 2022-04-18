//
//  ViewController.swift
//  Jokes
//
//  Created by Алексей Каземиров on 4/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var getJokeBtnUI: UIButton!
    
    override func viewDidLoad() {
        getJokeBtnUI.layer.cornerRadius = 15
        super.viewDidLoad()
    }
    
    @IBAction func getJokeButton(_ sender: Any) {
        ApiManager.shared.getAnyJoke(completion: { jokes in
            if let setup = jokes.setup {
                DispatchQueue.main.async {
                    self.setupLabel.text = "\(setup)"
                    if let delivery = jokes.delivery {
                        self.deliveryLabel.text = "\(delivery)"
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.getJokeButton(sender)
                }
                
            }
        })
    }
    
}


