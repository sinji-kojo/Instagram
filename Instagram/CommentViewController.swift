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
    @IBOutlet weak var commentnameTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentSendButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    var outputValue : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentSendButton.layer.cornerRadius = 10
        cancelButton.layer.cornerRadius = 10
    }
    @IBAction func commentSendButton(_ sender: Any) {

        let postRef = Firestore.firestore().collection(Const.PostPath).document(outputValue!)
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        let postDic = [
            "commentname": self.commentnameTextField.text!,
            "comment": self.commentTextField.text!,
            ] as [String : Any]
        postRef.updateData(postDic)

        print(postDic)
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメント投稿しました")
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: Any) {
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
 
    }
    
    
    
}
