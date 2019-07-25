//
//  ViewController.swift
//  markdownExplorer
//
//  Created by role on 2019/7/23.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var filenames = [String].init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TimeController.chuShiHuaMark()
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        filenames = FileController.getFileNames()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DocumentTableViewCell.classForCoder(), forCellReuseIdentifier: "DocumentCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        filenames = FileController.getFileNames()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filenames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell") as! DocumentTableViewCell
        cell = DocumentTableViewCell.getDoucmentCell()
        cell.setInfo(title: self.filenames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let filename = filenames.remove(at: indexPath.row)
        FileController.deleteFile(filename: filename)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
        SVProgressHUD.showSuccess(withStatus: "Success!")
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editview = EditViewController.init()
        editview.setFileName(filename: self.filenames[indexPath.row])
        self.navigationController?.pushViewController(editview, animated: true)
    }
    
}

