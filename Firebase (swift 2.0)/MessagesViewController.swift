//
//  MessagesViewController.swift
//  Firebase (swift 2.0)
//
//  Created by Rohan Lokesh Sharma on 08/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet var myTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.backgroundColor = UIColor.clearColor()
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.animateCells()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! MessagesTableViewCell
        cell.photo.image = UIImage(named: "bs")
        cell.firstLabel.text = "Theory of Computation"
        cell.secondLabel.text = "Senthil Kumar"
        cell.backgroundColor = UIColor.clearColor()
        cell.card.layer.cornerRadius = 10
    
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func animateCells()
    {
        self.myTableView.reloadData()
        let cells = self.myTableView.visibleCells
        let tableHeight = self.myTableView.bounds.size.height
        for cell in cells{
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
            
        }
        
        var delay = 0
        for cell in cells{
            UIView.animateWithDuration(1.75, delay: Double(delay)*0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.CurveEaseInOut], animations: {
                
                
                cell.transform = CGAffineTransformIdentity
                
                }, completion: nil)
            delay += 1
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

}
