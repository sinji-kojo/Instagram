//
//  CommentViewController.swift
//  Instagram
//
//  Created by PC-SYSKAI551 on 2021/04/12.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentSendButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var postid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentSendButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
    }
    @IBAction func commentSendButton(_ sender: Any) {
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postid)
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        //
        guard  let commentname = Auth.auth().currentUser?.displayName  else { return }
        let comment =  self.commentTextField.text!
        let commentc = "："
        let commentFirebase = ( commentname + commentc + comment )
        let updateValue = FieldValue.arrayUnion([commentFirebase])
        postRef.updateData(["comment": updateValue])
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメント投稿しました")
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: Any) {
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)

    }
}
