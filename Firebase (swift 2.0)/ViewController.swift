//
//  ViewController.swift
//  Firebase (swift 2.0)
//
//  Created by Rohan Lokesh Sharma on 08/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit
import AnimatedTextInput
import Firebase
import AMSmoothAlert

class ViewController: UIViewController {
    
    @IBOutlet var passwordField: AnimatedTextInput!
    
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var createAccButton: UIButton!
    @IBOutlet var emailField: AnimatedTextInput!
    struct CustomTextInputStyle: AnimatedTextInputStyle {
        
        let activeColor = UIColor.blueColor()
        let inactiveColor = UIColor.grayColor().colorWithAlphaComponent(0.3)
        let errorColor = UIColor.redColor()
        let textInputFont = UIFont.systemFontOfSize(14)
        let textInputFontColor = UIColor.blackColor()
        let placeholderMinFontSize: CGFloat = 9
        let counterLabelFont: UIFont? = UIFont.systemFontOfSize(9)
        let leftMargin: CGFloat = 10
        let topMargin: CGFloat = 20
        let rightMargin: CGFloat = 0
        let bottomMargin: CGFloat = 10
        let yHintPositionOffset: CGFloat = 7
    }
    
    

    override func viewDidLayoutSubviews() {
        
        
        //setting gradients
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(rgb:0x457fca).CGColor,UIColor(rgb:0x5691c8).CGColor]
       // gradient.locations = [0.0,1.0]
         gradient.frame = signInButton.bounds
        let gradient1 = CAGradientLayer()
        gradient1.colors = [UIColor(rgb:0x457fca).CGColor,UIColor(rgb:0x5691c8).CGColor]
        gradient1.frame = signInButton.bounds
        signInButton.layer.insertSublayer(gradient, atIndex:0)
        
        createAccButton.layer.insertSublayer(gradient1, atIndex: 0)
        
 
        
        
        //end setting gradients
        
    }
    override func viewDidLoad() {
        emailField.placeHolderText = "Email"
        passwordField.placeHolderText = "Password"
        emailField.backgroundColor = UIColor.whiteColor()
        passwordField.backgroundColor = UIColor.whiteColor()
       passwordField.style = CustomTextInputStyle()
    
        emailField.style = CustomTextInputStyle()
        
        passwordField.type = .password
        emailField.type = .standard

        
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func SignIn(sender: AnyObject) {
        self.emailField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        
        if((emailField.text?.characters.count == 0) || (passwordField.text?.characters.count == 0))
        {
            if(emailField.text?.characters.count == 0)
            {
                emailField.show(error: "Field can't be left blank")
                
            }
            if(passwordField.text?.characters.count == 0)
            {
                passwordField.show(error:  "Field can't be left blank")
            }
        }
        
        else
        {
            
            FIRAuth.auth()?.signInWithEmail(emailField.text!, password: passwordField.text!) {(user,error) in
            
            
            
                if(error != nil){
                    self.showAlert("Error", message: (error?.localizedDescription)!, error: true)
                }
                else
                {
                    self.performSegueWithIdentifier("login", sender: self)
                    
                }
                
            
            
            }
            
        }
        
        
        
    }
  
    @IBAction func createAcc(sender: AnyObject) {
        
        self.emailField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        
       if((emailField.text?.characters.count == 0) || (passwordField.text?.characters.count == 0))
       {
        if(emailField.text?.characters.count == 0)
        {
            emailField.show(error: "Field can't be left blank")
            
        }
        if(passwordField.text?.characters.count == 0)
        {
            passwordField.show(error:  "Field can't be left blank")
        }
       }
        else
        {
            FIRAuth.auth()?.createUserWithEmail(emailField.text!, password: passwordField.text!) { (user,error) in
                
                
                if(error != nil)
                {
                   self.showAlert("Error", message: (error?.localizedDescription)!,error: true)
                    
                }
                else
                {
                    self.showAlert("Success", message: "Account was created successfully",error: false)
                }
                
            }
            
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
    func showAlert(title:String, message:String,error:Bool)
    {
        
        let alert = AMSmoothAlertView(dropAlertWithTitle: title, andText: message, andCancelButton: true, forAlertType: AlertType.Failure)
        alert.show()
    /*    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: { _ in
        
            if(error)
            {
                self.emailField.show(error: "Error")
                self.passwordField.show(error: "Error")
            }
        
        
        })*/
    }

}

