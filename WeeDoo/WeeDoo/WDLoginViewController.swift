//
//  WDLoginViewController.swift
//  WeeDoo
//
//  Created by HoangHa on 5/4/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit

class WDLoginViewController: UIViewController {

    @IBOutlet weak var tfName: WDTextField!
    
    @IBOutlet weak var tfPassword: WDTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        // Do any additional setup after loading the view.
//        let leftUserView:UIImageView = UIImageView (image: UIImage(named: "icon_username"))
//        leftUserView.frame = CGRectMake(0, 0, 100, 100)
//        leftUserView.contentMode = UIViewContentMode.ScaleAspectFit
//        let leftPWView:UIImageView = UIImageView (image: UIImage(named: "icon_password"))
//        
//        self.tfName.leftView = leftUserView
//        self.tfName.leftViewMode = UITextFieldViewMode.Always
//        self.tfPassword.leftView = leftPWView
//        self.tfPassword.leftViewMode = UITextFieldViewMode.Always
        self.tfName.addLeftView("icon_username")
        self.tfPassword.addLeftView("icon_password")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnLoginPressed(sender: AnyObject) {
    }
    
    
    @IBAction func btnSignUpPressed(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
