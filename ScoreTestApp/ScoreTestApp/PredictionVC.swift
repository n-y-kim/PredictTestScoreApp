//
//  PredictionVC.swift
//  ScoreTestApp
//
//  Created by Nayeon Kim on 2021/08/27.
//

import UIKit

class PredictionVC: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var str:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel.text = str
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
