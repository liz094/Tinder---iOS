//
//  CardsViewController.swift
//  Tinder
//
//  Created by Lin Zhou on 4/26/17.
//  Copyright © 2017 Lin Zhou. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    var cardInitialCenter: CGPoint!

    @IBOutlet var cardImageVIew: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //create the gesture recognizers
        // Here we use the method didPan(sender:), which we defined in the previous step, as the action.
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(sender:)))
        
        cardImageVIew.isUserInteractionEnabled = true
        cardImageVIew.addGestureRecognizer(panGestureRecognizer)
        
        cardInitialCenter = cardImageVIew.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "toProfileVC", sender: self)
    }
    
    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        var reverse = false
        let location = sender.location(in: cardImageVIew)
        let translation = sender.translation(in: view)
        //cardInitialCenter = cardImageVIew.center
        
        if sender.state == .began{
            print("pan began")
            UIView.animate(withDuration: 0.2, animations: { 
                self.cardImageVIew.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
            })
            if location.y <= cardImageVIew.frame.height/2{
                reverse = false
            }
            else {reverse = true}
            
        }
        else if sender.state == .changed{
            print("pan changing")
            UIView.animate(withDuration: 0.2, animations: {
                if(!reverse){
                    self.cardImageVIew.transform = CGAffineTransform(rotationAngle: CGFloat(45 * Double.pi / 180))
                }
                else{
                    self.cardImageVIew.transform = CGAffineTransform(rotationAngle: CGFloat(-45 * Double.pi / 180))

                }
                self.cardImageVIew.center = CGPoint(x: self.cardInitialCenter.x + translation.x, y: self.cardInitialCenter.y + translation.y)
                    })
            

            //cardImageVIew.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y + translation.y)
        }
        else if sender.state == .ended{
            print("Pan ended")
            UIView.animate(withDuration: 0.2, animations: {
                self.cardImageVIew.transform = CGAffineTransform(rotationAngle: CGFloat(0 * Double.pi / 180))
                self.cardImageVIew.transform = self.view.transform.scaledBy(x: 1.0, y: 1.0)
                if translation.x > 0{
                    if translation.x > 50{
                        self.cardImageVIew.center = CGPoint(x: self.cardInitialCenter.x + translation.x*10, y: self.cardInitialCenter.y + translation.y)
                    }
                    else{
                        self.cardImageVIew.center = self.cardInitialCenter
                    }
                    
                }
                else{
                    if translation.x < -50{
                        self.cardImageVIew.center = CGPoint(x: self.cardInitialCenter.x + translation.x*10, y: self.cardInitialCenter.y + translation.y)
                        
                    }
                    else{
                        self.cardImageVIew.center = self.cardInitialCenter
                    }
                }
            })
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let mainVC = sender as! CardsViewController
        
        let profileVC = segue.destination as! ProfileViewController
        profileVC.cardViewImage = mainVC.cardImageVIew.image
        
        
        //performSegue(withIdentifier: "toProfileVC", sender: Any?.self)
    }
    

}
