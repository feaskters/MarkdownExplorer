//
//  FeedbackViewController.swift
//  markdownExplorer
//
//  Created by role on 2019/7/25.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit
import SVProgressHUD

class FeedbackViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "FeedBack"
        textView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        textView.layer.borderWidth = 1.0
        
        textView.layer.cornerRadius = 5.0
    }

    @IBAction func submitText(_ sender: UIButton) {
        if textView.text == "" {
            SVProgressHUD.showError(withStatus: "Can not submit empty!")
            SVProgressHUD.dismiss(withDelay: 0.5)
        }else{
            SVProgressHUD.showSuccess(withStatus: "success!")
            SVProgressHUD.dismiss(withDelay: 0.5)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
