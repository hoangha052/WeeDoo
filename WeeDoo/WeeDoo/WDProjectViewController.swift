//
//  WDProjectViewController.swift
//  WeeDoo
//
//  Created by HoangHa on 5/30/16.
//  Copyright © 2016 HoangHa. All rights reserved.
//

import UIKit


class WDProjectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableview .registerNib((UINib (nibName: "ProjectTableViewCell", bundle: nil)), forCellReuseIdentifier: "TitleCell")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        self.scrollView.contentSize = CGSizeMake(500, 500);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - UITableView Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ProjectTableViewCell = tableView.dequeueReusableCellWithIdentifier("TitleCell") as! ProjectTableViewCell
        
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
     func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true;
    }

    
}
