//
//  WDProjectInfoViewController.swift
//  WeeDoo
//
//  Created by HoangHa on 6/5/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit

class WDProjectInfoViewController: WDBaseProjectDetailViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.addNavigation("Project Informations", titleLeftButton:"Back", titleRightButton: "Save")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func leftButtonClicked() {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
//MARK:UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ProjectInforTableViewCell = tableView.dequeueReusableCellWithIdentifier("InforCell") as! ProjectInforTableViewCell
        if indexPath.row != 0
        {
            cell.backgroundColor = UIColor.clearColor()
        }
        
        return cell
        
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
