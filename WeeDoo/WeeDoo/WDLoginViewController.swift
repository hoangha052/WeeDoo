//
//  WDLoginViewController.swift
//  WeeDoo
//
//  Created by HoangHa on 5/4/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit

class WDLoginViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
