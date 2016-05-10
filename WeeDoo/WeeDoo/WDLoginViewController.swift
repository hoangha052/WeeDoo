//
//  WDLoginViewController.swift
//  WeeDoo
//
//  Created by HoangHa on 5/4/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

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
    
    
    @IBAction func btnLoginTwitterPressed(sender: AnyObject) {
    }
    
    
    @IBAction func btnLoginFacebookPressed(sender: AnyObject) {
        let loginManager = FBSDKLoginManager ()
        FBSDKLoginManager.renewSystemCredentials { (accountResult : ACAccountCredentialRenewResult, error : NSError! ) -> Void in
            loginManager.logInWithReadPermissions(["email"], fromViewController: self, handler: { (loginResult : FBSDKLoginManagerLoginResult!, loginError : NSError!) -> Void in
                if (loginError != nil) {
                    
                } else if (loginResult.isCancelled)
                {
                    //handle cancel
                } else {
                    if loginResult.grantedPermissions.contains("email") {
                    self.returnUserData()
                    }
                }
            })
            }
    }
    
    
    @IBAction func btnLoginGooglePressed(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func returnUserData(){
        let parameter:NSMutableDictionary = NSMutableDictionary()
        parameter.setValue("id,name,email", forKey: "fields")
        
        let graphRequest = FBSDKGraphRequest(graphPath: "me",
            parameters:parameter as [NSObject : AnyObject])
        
//        let HUD = BBK_Utils.displayBabyLoaderHUD(self.navigationController?.view, contentText: "")
        // After finishing authentication with Facebook, go on to login to Babykins backend
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil){
//                self.promptWarning("Error", message: error.description,
//                    buttonColor: self.mainThemeColor,
//                    completionBlock: {})
//                HUD.hide(false)
            }
            else{
                guard let facebookEmail = result.valueForKey("email") as? String else{
//                    HUD.hide(false)
//                    self.promptWarning("User email unreachable from Facebook account",
//                        message: "Couldn't login without user email!",
//                        buttonColor: self.mainThemeColor,
//                        completionBlock: {
//                            let loginManager = FBSDKLoginManager()
//                            loginManager.logOut()
//                    })
                    return
                }
                
                guard let facebookName = result.valueForKey("name") as? String else{
//                    HUD.hide(false)
//                    self.promptWarning("Facebook user name unreachable",
//                        message: "Couldn't login without user name!",
//                        buttonColor: self.mainThemeColor,
//                        completionBlock: {
//                            let loginManager = FBSDKLoginManager()
//                            loginManager.logOut()
//                    })
                    return
                }
                
                if let facebookId = result.valueForKey("id") as? String {
                    let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                    let facebookIdNumber = NSNumber(unsignedLongLong: UInt64(facebookId)!)
                    
                            }
            }
        })
    }

}
