//
//  MarkDownViewController.swift
//  markdownExplorer
//
//  Created by role on 2019/7/25.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit
import markymark
import SVProgressHUD

class MarkDownViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var text = ""

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show(withStatus: "loading...")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
            self.titleLabel.text = self.title!
        
            let markDownView = self.getMarkDownView()
            self.scrollView.addSubview(markDownView)
            
            let views: [String: Any] = [
                "view": view,
                "scrollView": scrollView,
                "markDownView": markDownView
            ]
            
            self.scrollView.translatesAutoresizingMaskIntoConstraints = false
            markDownView.translatesAutoresizingMaskIntoConstraints = false
            
            var constraints: [NSLayoutConstraint] = []
            constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: [], metrics: [:], views: views)
            constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: [], metrics: [:], views: views)
            constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[markDownView(==scrollView)]|", options: [], metrics: [:], views: views)
            constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[markDownView]|", options: [], metrics: [:], views: views)
            self.view.addConstraints(constraints)
            SVProgressHUD.showSuccess(withStatus: "success!")
            SVProgressHUD.dismiss(withDelay: 0.5)
        
    }
    
    func setText(text:String, title:String){
        self.text = text
        self.title = title
    }

    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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

private extension MarkDownViewController {
    
    func getMarkDownView() -> UIView {
        let markDownView = MarkDownTextView(markDownConfiguration: .view)
        
        //Styling. See README for more styling options
        markDownView.styling.headingStyling.textColorsForLevels = [.orange, .green, .black]
        markDownView.styling.linkStyling.textColor = .blue
        markDownView.styling.listStyling.bulletImages = [
            UIImage(named: "circle"),
            UIImage(named: "emptyCircle"),
            UIImage(named: "line"),
            UIImage(named: "square")
        ]
        
        markDownView.styling.paragraphStyling.baseFont = .systemFont(ofSize: 14)
        
        markDownView.text = getMarkDownString()
        return markDownView
    }
    
    func getMarkDownString() -> String {
        let markdownString: String = self.text
//        if let filepath = Bundle.main.path(forResource: "markdown", ofType: "txt") {
//            markdownString = try! String(contentsOfFile: filepath)
//        }
        
        return markdownString
    }
}
