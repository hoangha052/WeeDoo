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
import Google
import TwitterKit
import SnapKit

class WDLoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var tfName: WDTextField!
    
    @IBOutlet weak var tfPassword: WDTextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        registerGoogleSignin()
        
    }
    
    func initView() {
        //TODO: Replace icon twitter, facebook, google
        
        self.tfName.addLeftView("icon_username")
        self.tfPassword.addLeftView("icon_password")
        self.loginButton.layer.cornerRadius = 15
        self.signupButton.layer.cornerRadius = 15
        self.signupButton.layer.borderColor = UIColor(rgba: AppColors.mainBackground).CGColor
        self.signupButton.layer.borderWidth = 1.0
    }
    
    func registerGoogleSignin() {
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "120548501506-h3lmob0l06ierfkmjg7j32isj3gt630v.apps.googleusercontent.com"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnLoginPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("loginSegue", sender: nil)
        
    }
    
    
    @IBAction func btnSignUpPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("RegisterSegue", sender: nil)
    }
    
    
    @IBAction func btnLoginTwitterPressed(sender: AnyObject) {
        Twitter.sharedInstance().logInWithCompletion { session, error in
            if (session != nil) {
                print("signed in as \(session!.userName)");
            } else {
                print("error: \(error!.localizedDescription)");
            }
        }
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
        GIDSignIn.sharedInstance().signIn()
    }
    // [START signin_handler]
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        withError error: NSError!) {
            if (error == nil) {
                // Perform any operations on signed in user here.
                let userId = user.userID                  // For client-side use only!
                let idToken = user.authentication.idToken // Safe to send to the server
                let fullName = user.profile.name
                let givenName = user.profile.givenName
                let familyName = user.profile.familyName
                let email = user.profile.email
                // [START_EXCLUDE]
                NSNotificationCenter.defaultCenter().postNotificationName(
                    "ToggleAuthUINotification",
                    object: nil,
                    userInfo: ["statusText": "Signed in user:\n\(fullName)"])
                // [END_EXCLUDE]
            } else {
                print("\(error.localizedDescription)")
                // [START_EXCLUDE silent]
                NSNotificationCenter.defaultCenter().postNotificationName(
                    "ToggleAuthUINotification", object: nil, userInfo: nil)
                // [END_EXCLUDE]
            }
    }
    // [END signin_handler]
    
    // [START disconnect_handler]
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
        withError error: NSError!) {
            // Perform any operations when the user disconnects from app here.
            // [START_EXCLUDE]
            NSNotificationCenter.defaultCenter().postNotificationName(
                "ToggleAuthUINotification",
                object: nil,
                userInfo: ["statusText": "User has disconnected."])
            // [END_EXCLUDE]
    }
    func signIn(signIn: GIDSignIn!,
        presentViewController viewController: UIViewController!) {
            self.presentViewController(viewController, animated: true, completion: nil)
            
            print("Sign in presented")
            
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
        dismissViewController viewController: UIViewController!) {
            self.dismissViewControllerAnimated(true, completion: nil)
            
            print("Sign in dismissed")
    }
    // [END disconnect_handler]
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        
    }
    /*
    - (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
    
    }
    // Present a view that prompts the user to sign in with Google
    
    - (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController
    {
    [self presentViewController:viewController animated:YES completion:nil];
    }
    // Dismiss the "Sign in with Google" view
    
    - (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    }
    //completed sign In
    
    - (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user
    withError:(NSError *)error {
    //user signed in
    //get user data in "user" (GIDGoogleUser object)
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func returnUserData(){
        let parameter: [String: AnyObject] = ["id,name,email": "fields"]
        
        let graphRequest = FBSDKGraphRequest(graphPath: "me",
            parameters:parameter)
        
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
