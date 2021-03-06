//
//  ViewController.swift
//  barCodeSample
//
//  Created by Aileen Taboy on 2/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit
import BarcodeScanner

class ViewController: UIViewController, BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var upcCodes = [String]()
    
    
    @IBAction func scan(_ sender: Any) {
        
        let controller = BarcodeScannerController()
        controller.codeDelegate = self
        controller.errorDelegate = self
        controller.dismissalDelegate = self
    
        
        present(controller, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func barcodeScanner(_ controller: BarcodeScannerController, didCaptureCode code: String, type: String) {
        print(code)
        
        
        //controller.reset()
        
        let delayTime = DispatchTime.now() + Double(Int64(6 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            
            self.upcCodes.append(code)
            self.tableView.reloadData()
            controller.dismiss(animated: true, completion: nil)
            controller.resetWithError()
        }

        
    }
    
    func barcodeScanner(_ controller: BarcodeScannerController, didReceiveError error: Error) {
        print(error)
    }
    
    
    func barcodeScannerDidDismiss(_ controller: BarcodeScannerController) {
        controller.dismiss(animated: true, completion: nil)
    }
    

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcCodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let upcCode = upcCodes[indexPath.row]
        cell?.textLabel?.text = upcCode
        
        return cell!
    }
    
    
}

