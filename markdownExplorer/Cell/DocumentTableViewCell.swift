//
//  DocumentTableViewCell.swift
//  markdownExplorer
//
//  Created by role on 2019/7/23.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class DocumentTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    var titleText = ""
    var timeText = ""
    var sizeText = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        self.titleLabel.text = titleText
        self.timeLabel.text = timeText
        self.sizeLabel.text = sizeText + "KB"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo(title:String) {
        self.titleText = title
        let attribute = FileController.getFileAttribute(filename: title)
        let date = attribute[FileAttributeKey.creationDate] as! Date
        let size = attribute[FileAttributeKey.size] as! Float
        self.timeText = TimeController.getTimeFormate(date: date)
        self.sizeText = String(format: "%.2f", size / 1024)
    }
    
    class func getDoucmentCell() -> DocumentTableViewCell{
        return Bundle.main.loadNibNamed("DocumentTableViewCell", owner: nil, options: nil)![0] as! DocumentTableViewCell
    }
    
}
