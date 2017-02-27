//
//  CreateNewUser.swift
//  barCodeSample
//
//  Created by Aileen Taboy on 2/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit
import Firebase

class CreateNewUser: UIViewController {
    
    
    
    
    @IBOutlet weak var userNameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var firstNameField: UITextField!
    
    
    @IBOutlet weak var lastNameField: UITextField!
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        if let userName = userNameField.text, let email = emailField.text, let password = passwordField.text, let firstname = firstNameField.text, let lastName = lastNameField.text {
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                
                if error == nil {
                    
                    //append user
                    
                    
                    let userData: Dictionary<String, String> = [UserFields.email.rawValue : email, UserFields.firstName.rawValue : firstname, UserFields.lastName.rawValue : lastName, UserFields.userName.rawValue : userName]
                    
                    appendValues(values: userData as Dictionary<String, AnyObject> )
                    
                    // perform segue 
                    self.performSegue(withIdentifier: "scan", sender: self)
                    
                }else {
                    
                    self.displayAlert(title: "servor error", message: (error?.localizedDescription)!)
                    
                }
                
            }
            
            
        } else {
            
            self.displayAlert(title: "Fill in Fields", message: "please fill in all fields")
        }
        
       
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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




extension CreateNewUser {
    
    func displayAlert(title:String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
