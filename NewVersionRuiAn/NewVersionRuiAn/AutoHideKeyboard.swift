//
//  AutoHideKeyboard.swift
//  RuiAnMedicalCare
//
//  Created by 姚懿恒 on 2019/8/26.
//  Copyright © 2019 姚懿恒. All rights reserved.
//

import Foundation
import UIKit

private var kUIViewFrame = "kk_UIViewFrame"
extension UIViewController {
    
    func setUpKeyboardAutoHidden() {
        let notficaCenter = NotificationCenter.default
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIViewController.touchedHiddenKeyBoard))
        
        objc_setAssociatedObject(self, &kUIViewFrame, NSValue(cgRect: self.view.frame), .OBJC_ASSOCIATION_RETAIN)
        
        // 添加tap手势,收起键盘
        notficaCenter.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: OperationQueue.main) { (notification) -> Void in
                self.view.addGestureRecognizer(tapGesture)
        }
        
        // 移除Tap手势,避免和App中的UIResponder链冲突
        notficaCenter.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: OperationQueue.main){ (notification) -> Void in
                self.view.removeGestureRecognizer(tapGesture)
        }
        
        // 键盘遮挡处理
        notficaCenter.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil,
            queue: OperationQueue.main) { (notification) -> Void in
                let usrInfo = notification.userInfo!
                let keyboardRect = (usrInfo[UIResponder.keyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue
                if let respView = self.view.window?.firstResponder {
                    
                    let convertRect = self.view.convert(respView.frame, from: respView.superview)
                    let offset = convertRect.origin.y + convertRect.height - keyboardRect!.origin.y + 30
                    var orignRect = (objc_getAssociatedObject(self, &kUIViewFrame) as AnyObject).cgRectValue
                    
                    if offset > 0 {
                        orignRect!.origin.y = -offset
                    }
                    
                    UIView.animate(withDuration: 0.3, animations: { () -> Void in
                        self.view.frame = orignRect!
                    })
                }
        }
    }
    
    //取消所有的响应者
    @objc func touchedHiddenKeyBoard() {
        self.view.endEditing(true)
    }
}
extension UIView {
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }
        
        for subview in subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }
        
        return nil
    }
}
