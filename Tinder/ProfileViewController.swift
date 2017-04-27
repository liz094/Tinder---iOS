//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Lin Zhou on 4/26/17.
//  Copyright © 2017 Lin Zhou. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var cardViewImage: UIImage!
    @IBOutlet weak var cardView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.image = cardViewImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
