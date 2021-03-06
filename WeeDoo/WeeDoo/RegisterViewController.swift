//
//  RegisterViewController.swift
//  WeeDoo
//
//  Created by HoangHa on 6/14/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var tfFullName: WDTextField!
    @IBOutlet weak var tfEmail: WDTextField!
    @IBOutlet weak var tfPassword: WDTextField!
    @IBOutlet weak var tfMobile: WDTextField!
    @IBOutlet weak var tfBirthday: WDTextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView()  {
        self.navigationController?.navigationBarHidden = false
        tfFullName.addLeftView("icon_username")
        tfEmail.addLeftView("ic_mail")
        tfPassword.addLeftView("icon_password")
        tfMobile.addLeftView("ic_phone")
        tfBirthday.addLeftView("ic_calendar")
        btnSignUp.layer.cornerRadius = 15
        
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
