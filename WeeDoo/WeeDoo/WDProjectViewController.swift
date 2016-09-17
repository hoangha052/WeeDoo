//
//  WDProjectViewController.swift
//  WeeDoo
//
//  Created by HoangHa on 5/30/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit


class WDProjectViewController: BaseNavigationViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var scrollView: UIScrollView!

    var projectData: [ProjectModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addNavigation("Project", titleLeftButton:"", titleRightButton: "")
        self.addRightImageButton("ic_newproject")
        self.tableview .registerNib((UINib (nibName: "ProjectTableViewCell", bundle: nil)), forCellReuseIdentifier: "TitleCell")
        hardcodeData()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        self.scrollView.contentSize = CGSizeMake(490, 400);
        self.scrollView.scrollsToTop = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func rightButtonClicked() {
        self.performSegueWithIdentifier("CreateProjectSegue", sender: nil)
        
    }
    func hardcodeData() {
        for _ in 1...10 {
            let project = ProjectModel()
            projectData.append(project)
        }
    }
    
    //MARK - UITableView Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ProjectTableViewCell = tableView.dequeueReusableCellWithIdentifier("TitleCell") as! ProjectTableViewCell
        if indexPath.row != 0
        {
            cell.contentView.backgroundColor = UIColor.whiteColor()
            cell.reloadDataCell(projectData[indexPath.row - 1], index: indexPath.row)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Project", bundle: nil)
        let newTabbar: UITabBarController = storyBoard.instantiateViewControllerWithIdentifier("ProjectTabBarController") as! UITabBarController
        
        self.presentViewController(newTabbar, animated: false) { 
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
     func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true;
    }

    
}
