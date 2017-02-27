//
//  LoginViewController.swift
//  barCodeSample
//
//  Created by Aileen Taboy on 2/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func loginButton(_ sender: Any) {
        
      
        
        if let email = emailField.text, let password = passwordField.text {
            
            if email.characters.count > 0 && password.characters.count > 0{
                
                FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
                    
                    if error == nil {
                        
                        self.performSegue(withIdentifier: "scanner", sender: self)
                        
                    }
                    
                }
                
            } else {
                 displayAlert(title: "fill in fields", message: "Please fill in all fields")
            }
            
           
            
        }
        
       
        
        
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //log out user
//                let firebaseAuth = FIRAuth.auth()
//                do {
//                    try firebaseAuth?.signOut()
//                } catch let signOutError as NSError {
//                    print ("Error signing out: %@", signOutError)
//                }
//
        
        //create listener
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            // ...
            self.performSegue(withIdentifier: "scanner", sender: self)
            
        } else {
            // No user is signed in.
            // ...
            print("user logged in")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension LoginViewController {
    
    func displayAlert(title:String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
   
    
}


