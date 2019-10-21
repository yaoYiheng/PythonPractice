//
//  YYDetailViewController.swift
//  RuiAnMedicalCare
//
//  Created by 姚懿恒 on 2019/8/26.
//  Copyright © 2019 姚懿恒. All rights reserved.
//

import UIKit
import CoreData

class YYDetailViewController: UIViewController {
    
//    var YYClientInfo = YYClientInfo()
    
//    var YYClientInfo: YYClientInfo?
    public var YYClientInfo: YYClientInfo?

    
    @IBOutlet weak var DetailTextView: UITextView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.configureUI()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
        YYClientInfo = nil
    }
    override func viewWillAppear(_ animated: Bool) {
//        print(YYClientInfo?.phoneNumber)
    }
    
    func configureUI()
    {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: .done, target: self, action: #selector(Editting))
        
        self.DetailTextView.delegate = self as UITextViewDelegate

        self.confirmBtn!.isHidden = true

        setUpKeyboardAutoHidden()
        
//        self.nameLabel.text = YYClientInfo?.clientName
//        self.DetailTextView.text = YYClientInfo?.descriptions
//        self.comeCount.text = "已来: \(self.YYClientInfo?.comeCount ?? 0)" + "次"
        self.genderLabel.text = YYClientInfo?.gender == "0" ? "男" : "女"
        self.phoneLable.text = YYClientInfo?.phoneNumber
        
        self.DetailTextView.isEditable = false
        //初始状态下, 不显示编辑的对话框
        self.nameTextField.isHidden = true
        self.phoneTextField.isHidden = true
        
        self.nameTextField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)

        
    }
    
    @objc func textFieldChange()
    {
        self.confirmBtn.isHidden = false
    }
    @objc func Editting()
    {
        if self.navigationItem.rightBarButtonItem?.title == "编辑"
        {
            self.navigationItem.rightBarButtonItem!.title = "取消";

            self.DetailTextView.isEditable = true;
            self.nameTextField.isHidden = true
            self.phoneLable.isHidden = true
            
            self.nameTextField.isHidden = false
            self.phoneTextField.isHidden = false
//            self.nameTextField.placeholder = self.YYClientInfo?.clientName
            
            self.phoneTextField.placeholder = self.YYClientInfo?.phoneNumber
            
            self.nameTextField.becomeFirstResponder()
        }
        else
        {
            self.navigationItem.rightBarButtonItem!.title = "编辑"
            self.DetailTextView.isEditable = false
            self.confirmBtn!.isHidden = true
            self.nameLabel.isHidden = true
            
            self.nameTextField.isHidden = true
            self.phoneTextField.isHidden = true
            self.nameLabel.isHidden = false
            self.phoneLable.isHidden = false
            
            self.view.endEditing(true)
        }
        
    }
    @IBAction func AddBtnClick()
    {

//        self.comeCount.text = "已来: \(self.YYClientInfo?.comeCount ?? 0)" + "次"
        
        self.DetailTextView.isEditable = true
        self.DetailTextView.becomeFirstResponder()
//        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
//        let temp = formatter.string(from: now)
//        let tempStr = self.YYClientInfo!.descriptions! + "\n" + "\n" + temp
//        let tempStr = "ceshi"
        
        
//        self.DetailTextView.text = tempStr + " "
        
    }
    
    @IBAction func ConfirmBtnClick()
    {

        
        
        self.nameTextField.isHidden = true
        self.phoneTextField.isHidden = true
        
        self.nameLabel.isHidden = false
        self.phoneLable.isHidden = false
        
        self.confirmBtn.isHidden = true
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

extension YYDetailViewController: UITextViewDelegate
{

    func textViewDidChange(_ textView: UITextView)
    {
        self.confirmBtn?.isHidden = false
    }
}

