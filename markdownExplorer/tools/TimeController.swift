//
//  TimeController.swift
//  markdownExplorer
//
//  Created by role on 2019/7/23.
//  Copyright © 2019 zmhProject. All rights reserved.
//

import UIKit

class TimeController: NSObject {

    class func getTimeFormate(date:Date) -> String{
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY/MM/dd HH:mm:ss"
        let date = dateFormatter.string(from: date)
        return date
    }
    
    class func chuShiHuaMark(){
        let flag = UserDefaults.standard.bool(forKey: "flag")
        if flag == false{
            UserDefaults.standard.set(true, forKey: "flag")
            let result = FileController.saveFile(filename: "Introduction.md", content: """
            # Welcome to Markdown #
            
            This is the first `markdown` document you created by **Markdown Editor**. Please do not delete this document. You can get help from this document when you need.
            
            ## Basic
            
            **Markdown Editor** is a full functional `markdown` editor. It contains these features:
            
            1. Create, edit and previrw `markdown` documents.
            2. Sync your documents with **Dropbox**.
            3. Send your documents to others by email.
            
            
            This editor use `markdown` syntax to make your document beautiful and formatted. The syntax is very simple, just like you make plain text.
            
            ## Markdown Syntax
            
            ### Heading
            
            ----------
            
            Put 1-6 `#` characters in the begining of line to make this line as *heading* line. The 1-6 number of `#` characters represent the level of heading respectively:
            
            # Heading 1
            
            ## Heading 2
            
            ### Heading 3
            
            #### Heading 4
            
            ##### Heading 5
            
            ###### Heading 6
            
            ### Emphasize
            
            ----------
            
            Bold：
            
            **Bold Text**
            
            Italic：
            
            *Italic Text*
            
            
            ### Link
            
            ----------
            
            [Link Text](http://example.com/)
            
            
            ### Image
            
            ----------
            
            ![Image Title](http://lkl.mx/img/EkZYGsPBg)
            
            ### List
            
            ----------
            
            Ordered List:
            
            1. First
            2. Second
            3. Third
            
            Unordered List:
            
            - Item
            - Item
            - Item
            
            ### Quote
            
            ----------
            
            > Stay hungry, stay foolish.
            
            ### Code
            
            ----------
            
            Inline Code ：`foo.go()` .
            
            Multiple Line Code：
            ```
            let app = "Markdown"
            print("Good")
            ```
            
            ### Indented Code
            
            ----------
            
            4 spaces or 1 tab represent Indented code
            
            This is a normal paragraph.
            
            This is a block
            of code.
            
            ### Table
            
            ----------
            
            A Simple Table:
            
            Heading | Heading | Heading
            ------- | ------- | -------
            Cell   |  Cell   |  Cell
            Cell   |  Cell   |  Cell
            
            
            You can also add some border if you like:
            
            | Heading | Heading | Heading |
            | ------- | ------- | ------- |
            |   Cell  |   Cell  |   Cell  |
            |   Cell  |   Cell  |   Cell  |
            
            You can control the alignment of the table cell:
            
            Heading | Heading | Heading
            :----- | :----: | ------:
            Left   | Center | Right
            Left   | Center | Right
            
            ### Deleteing
            
            ----------
            
            ~~Strikethrough~~
            
            ### Separator
            
            ----------
            
            Three types of separator:
            
            ---
            
            * * *
            
            - - - -
            
            
            ### Line break
            
            ----------
            
            一 add two space or the enter key at the end of line represent a line break:
            
            this line, have two space at the end
            this is a new line.
            
            """)
            print(result)
        }
    }
}
