//
//  EditViewController.swift
//  markdownExplorer
//
//  Created by role on 2019/7/24.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit
import SVProgressHUD
import Social


class EditViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var fileName = ""
    var isMore = false //more windows is showing
    @IBOutlet weak var headToolView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = fileName
        self.textView.delegate = self
        self.textView.text = FileController.readFile(filename: self.fileName)
        
        //navigationbar
        let rightbutton = UIBarButtonItem.init(image: UIImage.init(named: "more"), style: UIBarButtonItem.Style.plain, target: self, action:#selector(more))
        self.navigationItem.setRightBarButton( rightbutton, animated: true)
    }
    
    @objc func more(){
        let navigationHeight = (self.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
        if !isMore {
            self.textView.endEditing(true)
            UIView.animate(withDuration: 0.5) {
                self.headToolView.frame = CGRect.init(x: 0, y: navigationHeight, width: self.headToolView.frame.width, height: self.headToolView.frame.height)
                self.view.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                self.textView.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }else{
            UIView.animate(withDuration: 0.5) {
                self.headToolView.frame = CGRect.init(x: 0, y: -self.headToolView.frame.height, width: self.headToolView.frame.width, height: self.headToolView.frame.height)
                self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.textView.textColor = #colorLiteral(red: 0.1809895784, green: 0.1809895784, blue: 0.1809895784, alpha: 1)
            }
        }
        
        isMore = !isMore
        
    }

    func setFileName(filename:String) {
        self.fileName = filename
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        SVProgressHUD.show(withStatus: "saving...")
        DispatchQueue.main.async {
           let result = FileController.modifyFile(filename: self.fileName, content: self.textView.text)
            if result {
                SVProgressHUD.showSuccess(withStatus: "Saved!")
                SVProgressHUD.dismiss(withDelay: 0.5)
            }else{
                SVProgressHUD.showSuccess(withStatus: "Save failed!")
                SVProgressHUD.dismiss(withDelay: 0.5)
            }
            
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if isMore {
            more()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isMore {
            more()
        }
    }
    
    
    
    @IBAction func preview(_ sender: UIButton) {
        let markVc = MarkDownViewController.init()
        markVc.setText(text: self.textView.text, title: self.title!)
        self.present(markVc, animated: true, completion: nil)
    }
    
    @IBAction func copyText(_ sender: UIButton) {
        UIPasteboard.general.string = self.textView.text
        SVProgressHUD.showSuccess(withStatus: "copied")
        SVProgressHUD.dismiss(withDelay: 0.5)
    }
    
    @IBAction func share(_ sender: UIButton) {
        let shareView = UIActivityViewController.init(activityItems: [self.textView.text], applicationActivities: nil)
        self.present(shareView, animated: true) {
            
        }
        
        shareView.completionWithItemsHandler = { (a : UIActivity.ActivityType?, b : Bool, c : [Any]?, e : Error?) in
            if b {
                SVProgressHUD.showSuccess(withStatus: "Success")
                SVProgressHUD.dismiss(withDelay: 1)
            }else{
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
