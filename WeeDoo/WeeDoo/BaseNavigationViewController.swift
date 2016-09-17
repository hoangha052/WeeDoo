//
//  BaseNavigationViewController.swift
//  WeeDoo
//
//  Created by HoangHa on 6/1/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func addNavigation(titleView:NSString ,titleLeftButton: NSString, titleRightButton:NSString) -> Void {
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.title = titleView as String
        self.navigationController?.navigationBar.barTintColor = UIColor(red:  4.0/255.0, green: 102/255.0, blue: 89/255.0, alpha: 100.0/100.0)
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName:UIFont.systemFontOfSize(18.0)]
        
        let rightButton:UIButton = UIButton(type: UIButtonType.Custom)
        rightButton.setAttributedTitle(NSAttributedString(string: titleRightButton as String, attributes:
            [NSForegroundColorAttributeName : UIColor.whiteColor(),
                NSFontAttributeName:UIFont.systemFontOfSize(17.0)]),
                                       forState: UIControlState.Normal)
        rightButton.addTarget(self, action:#selector(BaseNavigationViewController.rightButtonClicked), forControlEvents: UIControlEvents.TouchUpInside)
        rightButton.frame = CGRectMake(0, 0, 100, 50)
        rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        let rightBarButton = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarButton

        let leftButton:UIButton = UIButton(type: UIButtonType.Custom)
//        button.setImage(UIImage(named: imageName),
//                        forState: UIControlState.Normal)
        leftButton.addTarget(self, action:#selector(BaseNavigationViewController.leftButtonClicked), forControlEvents: UIControlEvents.TouchUpInside)
        leftButton.frame = CGRectMake(0, 0, 100, 50)
        leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        let attributedTitle = NSAttributedString(string: titleLeftButton as String, attributes:
            [NSForegroundColorAttributeName : UIColor.whiteColor(),
                NSFontAttributeName:UIFont.systemFontOfSize(17.0)])
            
        leftButton.setAttributedTitle(attributedTitle, forState: UIControlState.Normal)
        let lefBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = lefBarButton

    }
    
    func addRightImageButton(imageName: String) {
        let rightButton:UIButton = UIButton(type: UIButtonType.Custom)
        rightButton.addTarget(self, action:#selector(BaseNavigationViewController.rightButtonClicked), forControlEvents: UIControlEvents.TouchUpInside)
        rightButton.frame = CGRectMake(0, 0, 30, 30)
        rightButton.setBackgroundImage(UIImage.init(named: imageName), forState: .Normal)
//        rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        let rightBarButton = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightBarButton

    }
    
    func rightButtonClicked() -> Void {
        print("heelloDone");
        
    }
    
    func leftButtonClicked()  {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
    
    func addNavRightUIBarButton(buttonName:String, selector:Selector, target:AnyObject?, buttonFrame:CGRect, buttonTextColor:UIColor){
        // Right Bar Button
           }
    
    func addNavBackButton(backImageName imageName:String, buttonName:String, selector:Selector, target:AnyObject?, buttonFrame:CGRect, buttonTextColor:UIColor){
        // Left Bar Button
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
