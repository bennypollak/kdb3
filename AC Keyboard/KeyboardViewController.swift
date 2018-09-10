//
//  KeyboardViewController.swift
//  AC Keyboard
//
//  Created by Benny Pollak on 7/16/17.
//  Copyright © 2017 Alben Software. All rights reserved.
//
/*

 */
import UIKit

class KeyboardViewController: UIInputViewController, UIGestureRecognizerDelegate {

    var backCount:[Int] = []
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    let emoticons = [
        // must add leading space
        [" :)", "😂 Smiled!"]
        , [" :'-)", "😩 So sad!"]
        , [" >:(", "Fuck you!"]
        , ["😠", "Fuck you!"]
        , [" :-*", "Kisses!"]
        , [" ;)", "Wink!"]
        , [" :-D", "Funny!"]
        , [" :$", "So embarrassed!"]
        ]
    
    let ijomes1 = [
        ["🖕", "Fuck you!"]
        , ["sad.png", "☹️ So sad!"]
        , ["love2.png", "❤️ ###lovism"]
        , ["trump2.png", "###trumpism"]
        , ["insult2.jpg", "😤 ###insult"]
        , ["shakespeare.jpg", "###bard"]
        ]
    
    let ijomes2 = [
            ["secret1.png", "@@@secret1"]
            , ["secret2.png", "@@@secret2"]
            , ["secret3.png", "@@@secret3"]
            , ["secret4.png", "@@@secret4"]
            , ["secret5.png", "@@@secret5"]
        ]
    
    let ijomes3 = [
        ["imsick.png", "😷 So sick!"]
        , ["💘", "Love you!"]
        , ["sohappy.png", "😂 So happy!"]
        , ["boobs1.jpg", "👏 Life is beautiful!"]
        , ["what.png", " What?"]
        , ["😱", "WTF!"]
    ]
    let ijomes4 = [
        ["stella.jpg", "Stella!"]
        , ["truelove2.png", "We'll always have Paris!"]
        , ["haveadrink.jpg", "Have a drink!"]
        , ["ahhhhh.jpg", "Ahhh!"]
        , ["truelove.png", "True love!"]
        , ["badday.png", "Having a bad day!"]
    ]
    let ijomes5 = [
        ["yahoomail.png", "@@@yo372002@yahoo.com"]
        , ["gmail2.png", "@@@bpollak@gmail.com"]
        , ["Phone.png", "@@@+1-347-416-1525"]
        , ["👍", "Ok!"]
        , ["😫", "Oh no!"]
        , ["wink.png", "Wink!"]
    ]
    
    
    let ijomes6 = [
        ["imsick.png", "So sick!"]
        , ["angry.jpeg", "Very angry!"]
        , ["thumbs_down_angry.png", "No way!"]
        , ["wasntme.png", "😇 It wasn't me!"]
        , ["what.png", "What?"]
        , ["wtf.png", "WTF!"]
    ]

    var textValues:[String:String] = [:]
    var languages:[[String]] = [[]]
    var language = 0
    var languageBtn:UIButton = UIButton()
    var languageImageFiles:[String : String] = [
        "en": "thebard3.jpeg"
        , "es": "cervantes.png"
    ]
    var languageImages:[String : UIImage] = [:]
    var useLanguageImages = true
    let preferredLanguage = NSLocale.preferredLanguages[0].components(separatedBy: "-")[0]
    
    var keyboardBtn:UIButton = UIButton()
    var keyboards:[[UIView]] = [[]]
    var currentKeyboard = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backCount = []
        view = KeyboardView()
        languages.removeAll()
        var all = Set(languageImageFiles.keys)
        for lang_region in NSLocale.preferredLanguages {
            let lang = lang_region.components(separatedBy: "-")[0]
            if languageImageFiles[lang] != nil {
                languageImages[lang] = UIImage(named: languageImageFiles[lang]!)
                languages.append([lang , ""])
                all.remove(lang)
            }
        }
        // add the rest
        for lang in all {
            languageImages[lang] = UIImage(named: languageImageFiles[lang]!)
            languages.append([lang , ""])
        }
        
        let next = createImgButton(named: "", imgNamed: "next.png", action: #selector(KeyboardViewController.nextKeyboardPressed(_:)))
        next.backgroundColor = .clear
        
        let lang = languages[language][0]
        
        languageBtn = createImgButton(named: lang, imgNamed: languageImageFiles[lang]!, action: #selector(KeyboardViewController.nextLanguagePressed(_:)))
        languageBtn.backgroundColor = .clear
        
        keyboardBtn = createImgButton(named: "more", imgNamed: "more2.png", action: #selector(KeyboardViewController.selectNextKeyboardPressed(_:)))
        keyboardBtn.backgroundColor = .white
        
        let back = createImgButton(named: "", imgNamed: "back.jpg", action: #selector(KeyboardViewController.backKeyboardPressed(_:)))
        back.backgroundColor = .clear
        
        let returnKey = createImgButton(named: "\n", imgNamed: "return.png")
        returnKey.backgroundColor = .clear
        
        let bottomRow = addBottomRow([languageBtn, next, keyboardBtn, returnKey, back])

//        var row: UIView? = nil
//        _ = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
//        if false {
//            row = addTextButtonRow(row, buttonTitles: buttonTitles)
//        }
//
        keyboards.removeAll()
        var lastKdb:UIView = UIView()
        lastKdb = addKeyboard( [ijomes1, ijomes3, ijomes4, ijomes2])
        lastKdb = addKeyboard([ijomes5, ijomes6, emoticons, ijomes2])
        setupKeyboard()
        
        view.addConstraint(NSLayoutConstraint(item: lastKdb, attribute: .bottom, relatedBy: .equal, toItem: bottomRow, attribute: .top, multiplier: 1.0, constant: 0.0))

        /*
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as! UIView;
 */
    }
    func addBottomRow(_ buttons:[UIButton]) -> UIView {
        let height = CGFloat(40.0)
        let wideHeight = CGFloat(80.0)
        var button:UIButton = UIButton()
        for i in 0..<buttons.count {
            button = buttons[i]
            view.addSubview(button)
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            view.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height))
            view.addConstraint(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: (button.titleLabel?.text == "\n" ? wideHeight : height)))
            if i == buttons.count-1 {
                button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            } else {
                if i == 0 {
                    button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
                } else {
                    view.addConstraint(NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: buttons[i-1], attribute: .right, multiplier: 1.0, constant: 5))
                }
            }
        }
        return button
    }
    func addKeyboard(_ keyboard:[[[String]]]) -> UIView {
        var rows:[UIView] = []
        var row:UIView? = nil
        for ijomes in keyboard {
            row = addButtonRow(row, buttonInfo: ijomes)
            rows.append(row!)
        }
        keyboards.append(rows)
        return row!
    }
    func setupKeyboard() {
        for i in 0..<keyboards.count {
            let hidden = i != currentKeyboard
            for r in keyboards[i] {
                r.isHidden = hidden
            }
        }
    }
    func createRow(topView:UIView?, botView:UIView, buttons:[UIButton]) -> UIView {
        let row = UIView()
        view.addSubview(row)
        row.translatesAutoresizingMaskIntoConstraints=false
        for button in buttons {
            row.addSubview(button)
        }
        addRowConstraints(row, topView: topView)
        return row
    }
    func addButtonRow(_ prevView: UIView?, buttonInfo: [[String]]) -> UIView {
        var buttons: [UIButton] = []
        for i in 0..<buttonInfo.count {
            let info = buttonInfo[i]
            if (info[0].hasPrefix(" ")) {
                let r = info[0].index(info[0].startIndex, offsetBy: 1)..<info[0].endIndex
                let substring = info[0][r]
                buttons.append(createTextButton(title: substring, target: info[1]))
            } else if info[0].containsEmoji {
                buttons.append(createTextButton(title: info[0], target: info[1]))
            } else {
                buttons.append(createImgButton(named: info[1], imgNamed: info[0]))
            }
        }
        let row = createRow(topView: prevView, botView: view, buttons: buttons)
        addConstraints(buttons, containingView: row)
        return row
    }
    func createImgButton(named: String, imgNamed: String, action: Selector = #selector(KeyboardViewController.ijomePressed(_:))) -> UIButton  {
        let button = UIButton(type: .custom)
        let image = UIImage(named: imgNamed)
        button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        button.setImage(image, for: UIControlState.normal)
        button.sizeToFit()
        button.backgroundColor = .white
        button.setTitle(named, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchUpInside)

        return button
    }
    func createTextButton(title: String, target:String, action: Selector = #selector(KeyboardViewController.ijomePressed(_:))) -> UIButton  {
        let button = UIButton.init(type:.system) as UIButton
        textValues[title] = target
        if title.containsEmoji {
            button.titleLabel?.font = UIFont(name: "AppleColorEmoji", size:35.0)
            button.setTitle(title, for: .normal)
        } else {
            button.setTitle(title, for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    func addRowConstraints(_ row: UIView, topView: UIView?/*, leftView: UIView?*/) {
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40))
        if topView != nil {
            view.addConstraint(NSLayoutConstraint(item: row, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1.0, constant: 0))
        } else {
            view.addConstraint(NSLayoutConstraint(item: row, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        }
        view.addConstraint(NSLayoutConstraint(item: row, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 0.0))
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
        var string:String = ""+bstring!
        var space = " "
        var lang:String = languages[language][0]
        if languageImageFiles[lang] == nil {
            lang = preferredLanguage
        }
        var ijome = ""
        if string[0].containsEmoji {
            ijome = string[0]
            if string != ijome {
                let r = string.index(string.startIndex, offsetBy: 2)..<string.endIndex
                string = string[r]
            }
        }
        if (string.hasPrefix("@@@")) {
            let r = string.index(string.startIndex, offsetBy: 3)..<string.endIndex
            let substring1 = string[r]
            let SharedDefaults = UserDefaults.init(suiteName: "group.com.alben.kdb3")!
            string = SharedDefaults.string(forKey: substring1) ?? substring1
            space = ""
        } else if (string.hasPrefix("###")) {
            let r = string.index(string.startIndex, offsetBy: 3)..<string.endIndex
            let substring1 = string[r]
            if substring1 == "bard" {
                string = Bard.bardInsult()
            } else if substring1 == "trumpism" {
                string = Bard.trumpism()
            } else if substring1 == "insult" {
                if lang == "en" {
                    string = Bard.insult()
                } else {
                    string = Cervantes.insult()
                }
            } else if substring1 == "lovism" {
                if lang == "en" {
                    string = Bard.lovism()
                } else {
                    string = Cervantes.lovism()
                }
            }
            space = " "
//        } else if string.characters.count == 1 {
//            space = ""
        } else {
            string = (textValues[string] ?? string).localized(lang)
        }
        UIDevice.current.playInputClick()
        let text = ijome == "" ? "\(string)\(space)" : "\(ijome) (\(string)\(space))"
        backCount.append(text.characters.count)
        (textDocumentProxy as UIKeyInput).insertText(text)
    }
    @IBAction func nextKeyboardPressed(_ sender: Any) {
        UIDevice.current.playInputClick()
        //        handleInputModeList(from: view, with: UIEvent.tou)
        advanceToNextInputMode()
    }
    @IBAction func selectNextKeyboardPressed(_ sender: Any) {
        UIDevice.current.playInputClick()
        currentKeyboard = (currentKeyboard+1)%keyboards.count
        setupKeyboard()
    }
    @IBAction func nextLanguagePressed(_ sender: Any) {
        UIDevice.current.playInputClick()
        language = (language+1)%languages.count
        let lang = languages[language][0]
        if language == 0  { useLanguageImages = !useLanguageImages }
        if useLanguageImages {
            languageBtn.setImage(languageImages[lang], for: .normal)
        } else {
            languageBtn.setImage(nil, for: .normal)
            languageBtn.setTitle(lang, for: .normal)
            languageBtn.setTitleColor(.black, for: .normal)
        }
    }
    @IBAction func backKeyboardPressed(_ sender: Any) {
        if backCount.count == 0 { backCount.append(1) }
        let count = backCount.removeLast()
        for _ in 0..<count {
            UIDevice.current.playInputClick()
            (textDocumentProxy as UIKeyInput).deleteBackward()
        }
    }
    @IBAction func handleLongPress(gesture : UILongPressGestureRecognizer!) {
        if gesture.state != .ended {
            return
        }
        UIDevice.current.playInputClick()
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }

    @IBAction func dismissKeyboardPressed(_ sender: Any) {
       UIDevice.current.playInputClick()
       dismissKeyboard()
        
    }
    

}
