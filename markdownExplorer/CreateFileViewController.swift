//
//  CreateFileViewController.swift
//  markdownExplorer
//
//  Created by role on 2019/7/24.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit
import SVProgressHUD

class CreateFileViewController: UIViewController {

    @IBOutlet weak var filenameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        if filenameLabel.text == nil || filenameLabel.text! == "" {
            SVProgressHUD.showError(withStatus: "File name cannot be empty！")
            SVProgressHUD.dismiss(withDelay: 1)
        }else{
            let result = FileController.saveFile(filename: filenameLabel.text! + ".md", content: "")
            if !result{
                SVProgressHUD.showError(withStatus: "File exists！")
                SVProgressHUD.dismiss(withDelay: 1)
            }else{
                SVProgressHUD.showSuccess(withStatus: "Success！")
                SVProgressHUD.dismiss(withDelay: 1)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(0.9)) {
                    self.navigationController?.popViewController(animated: true)
                }
            }
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
