//
//  secondViewController.swift
//  Firebase (swift 2.0)
//
//  Created by Rohan Lokesh Sharma on 08/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton

class secondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,LiquidFloatingActionButtonDelegate,LiquidFloatingActionButtonDataSource {

    @IBOutlet var myTableView: UITableView!
    override func viewDidLoad() {
        
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
        self.myTableView.backgroundView?.alpha = 0.5
        self.myTableView.backgroundColor = UIColor.clearColor()
        
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        
        myTableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        
        
        let frame = CGRectMake(305, 600, 50, 50)
        
        let floating = UIButton(frame: frame)
        floating.setTitle("+", forState: UIControlState.Normal)
        floating.backgroundColor = UIColor.clearColor()
        floating.titleLabel?.text = "+"
        floating.setBackgroundImage(UIImage(named: "plus")!, forState: .Normal)
        floating.addTarget(self, action: #selector(secondViewController.goToAdd)   , forControlEvents: .TouchUpInside)
        
     
        self.view.addSubview(floating)
        
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.animateCells()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        self.view.backgroundColor = UIColor.clearColor()
        
        setGradientBackground()
        
    }
    
    
    func numberOfCells(liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        return 0
    }
    func cellForIndex(index: Int) -> LiquidFloatingCell {
        let cell = LiquidFloatingCell(icon: UIImage(named: "bs")!)
        return cell
        
    }
    func setGradientBackground() {
       /* let colorTop =  UIColor(rgb:0x00d2ff).CGColor
        let colorBottom = UIColor(rgb:0x3a7bd5).CGColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
 
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)*/
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CardTableViewCell
     //   cell.fi
        
        cell.photo.image = UIImage(named: "bs")
        cell.firstLabel.text = "Something"
        cell.secondLabel.text = "Subtitle"
       cell.backgroundColor = UIColor.clearColor()
      //  cell.card.alpha = 0.5
      
        
        
        
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(Reusable.to_messages, sender: self)
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
    func goToAdd()
    {
        self.performSegueWithIdentifier("", sender: self)
    
        
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
