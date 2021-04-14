//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by PC-SYSKAI551 on 2021/04/13.
//

import UIKit
import FirebaseUI

class CommentTableViewCell: UITableViewController {
        
    @IBOutlet weak var commentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setPostData(_ postData: PostData) {
     // コメントの表示
        if postData.commentname == nil || postData.comment == nil {
            return
        }
        else {
            self.commentTextView.text = "\(postData.commentname!) : \(postData.comment!)"
        }
    }
}
