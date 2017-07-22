//
//  KeyboardViewController.swift
//  AC Keyboard
//
//  Created by Benny Pollak on 7/16/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        //
    
        let buttonTitles = ["Q", "W", "E", "R", "T", "Y","a","n","d","m","o","r","n","d","m","o","r"]
        let buttons = createButtons(titles: buttonTitles)
        //let topRow = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
       let topRow = UIView()
        self.view.addSubview(topRow)
        topRow.translatesAutoresizingMaskIntoConstraints=false
        for button in buttons {
            topRow.addSubview(button)
        }
        
     
        self.view.addConstraint(NSLayoutConstraint(item: topRow, attribute: NSLayoutAttribute.width, relatedBy: .equal, toItem: self.view, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0.0))
        self.view.addConstraint(NSLayoutConstraint(item: topRow, attribute: NSLayoutAttribute.height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50))
        self.view.addConstraint(NSLayoutConstraint(item: topRow, attribute: NSLayoutAttribute.bottom, relatedBy: .equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -20))
        self.view.addConstraint(NSLayoutConstraint(item: topRow, attribute: NSLayoutAttribute.right, relatedBy: .equal, toItem: self.view, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0.0))
        addConstraints(buttons, containingView: topRow)

        /*
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as! UIView;
 */
    }
    func createButtons(titles: [String]) -> [UIButton] {
        
        var buttons = [UIButton]()
        
        for title in titles {
            let button = UIButton.init(type:.system) as UIButton
            button.setTitle(title, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints=false
            button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.addTarget(self, action: #selector(KeyboardViewController.keyPressed(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        return buttons
    }
    func addConstraints(_ buttons: [UIButton], containingView: UIView){
        for (index, button) in buttons.enumerated() {
            let topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal
                , toItem: containingView, attribute: .top, multiplier: 1.0, constant: 1)
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: containingView, attribute: .bottom, multiplier: 1.0, constant: -1)
            var leftConstraint : NSLayoutConstraint!
            if index == 0 {
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: containingView, attribute: .left, multiplier: 1.0, constant: 1)
            }else{
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: buttons[index-1], attribute: .right, multiplier: 1.0, constant: 1)
                let widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1.0, constant: 0)
                containingView.addConstraint(widthConstraint)
            }
            
            var rightConstraint : NSLayoutConstraint!
            if index == buttons.count - 1 {
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: containingView, attribute: .right, multiplier: 1.0, constant: -1)
            }else{
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: buttons[index+1], attribute: .left, multiplier: 1.0, constant: -1)
            }
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    @IBAction func keyPressed(_ button: UIButton) {
        let bstring = button.titleLabel!.text
        var string = "?"
        if bstring == "Y" {
            string = "yo372002@yahoo.com"
        } else if (bstring == "B") {
            let SharedDefaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!

            string = SharedDefaults.string(forKey: "Key") ?? ""

        } else if (bstring == "G") {
            string = "bpollak@gmail.com"
        } else if (bstring == "P") {
            string = "347-416-1525"
        }
        (textDocumentProxy as UIKeyInput).insertText("\(string)")
        UIDevice.current.playInputClick()
    }
    @IBAction func ijomePressed(_ button: UIButton) {
        let bstring = button.titleLabel!.text
        let string = ""+bstring!
        UIDevice.current.playInputClick()
        (textDocumentProxy as UIKeyInput).insertText("\(string) ")
        //advanceToNextInputMode()
    }
    @IBAction func nextKeyboardPressed(_ sender: Any) {
        advanceToNextInputMode()
        
    }
    @IBAction func dismissKeyboardPressed(_ sender: Any) {
        dismissKeyboard()
        
    }
    

}
