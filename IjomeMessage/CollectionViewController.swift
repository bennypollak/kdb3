//
//  CollectionViewController.swift
//  IjomeMessage
//
//  Created by Benny Pollak on 10/12/18.
//  Copyright © 2018 Alben Software. All rights reserved.
//

import UIKit
import Messages

private let reuseIdentifier = "IjomeCell"

class CollectionViewController: UICollectionViewController, UIGestureRecognizerDelegate {
    var activeConversation: MSConversation?
    var sticker:MSSticker?
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        send(indexPath)
    }
    
    let ijomes = Ijomes.msgIjomes
    let languages = ["en", "es"]
    var currentLanguage = 0
    
    
    //    weak var delegate: UICollectionViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let lang = Locale.current.languageCode ?? "en"
        for i in 0..<languages.count {
            if languages[i] == lang {
                currentLanguage = i
                break
            }
        }
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(CollectionViewController.handleLongPress))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.collectionView.addGestureRecognizer(lpgr)
    }
    @objc func handleLongPress() {
        toggleLanguage()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // rows
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ijomes.count + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            as? IjomeCollectionViewCell
        let lang = languages[currentLanguage]
        let i = indexPath.row
        if i == ijomes.count {
            cell?.backgroundColor = .black
            cell?.captionLbl.textColor = .white
            if lang == "en" {
                cell?.image.image = UIImage(named: "thebard3.jpeg")
                cell?.captionLbl.text = "Language: english"
            } else {
                cell?.image.image = UIImage(named: "cervantes.png")
                cell?.captionLbl.text = "Idioma: español"
            }
        } else {
            cell?.backgroundColor = .white
            cell?.captionLbl.textColor = .black
            
            let imageName = ijomes[i][0]
            let url = Bundle.main.url(forResource: imageName, withExtension: nil)
            cell?.image.image = UIImage(named: imageName)
            let string = ijomes[i][1]
            let text = string.range(of:"###") != nil  ? "" : Ijomes.textFor(string, [ijomes[i][0]: ijomes[i][1]], true, lang)
            UIDevice.current.playInputClick()
            cell?.captionLbl.text = text
            //        do {
            sticker = try? MSSticker(contentsOfFileURL: url!, localizedDescription: text)
            
            //        cell?.stickerView.sticker = sticker
            //        } catch {
            
            //        }
        }
        return cell!
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     */
    
    fileprivate func toggleLanguage() {
        currentLanguage = (currentLanguage + 1) % languages.count
        //            self.collectionView!.reloadData()
        collectionView.reloadSections([0])
    }
    
    func send(_ indexPath: IndexPath) {
        let layout = MSMessageTemplateLayout()
        let ijomes = Ijomes.msgIjomes
        let i = indexPath.row
        if i == ijomes.count {
            toggleLanguage()
        } else {
            let string = ijomes[i][1]
            //        let z:[String : String] =
            let caption = Ijomes.textFor(string, [ijomes[i][0]: ijomes[i][1]], true, languages[currentLanguage])
            //        let caption = ijomes[i][1]
            let imageName = ijomes[i][0]
            
            layout.caption = caption
            //        layout.imageSubtitle = "imageSubtitle"
            //        layout.imageTitle = "imageTitle"
            //        layout.subcaption = "subcaption"
            //        layout.trailingCaption = "trailingCaption"
            //        layout.trailingSubcaption = "trailingSubcaption"
            layout.image = UIImage(named: imageName)
            let message = MSMessage()
            message.layout = layout
            
            
            var components = URLComponents()
            let ijome = Ijome(imageName, caption)
            components.queryItems = ijome.queryItems
            message.url = components.url!
            
            let url = sticker?.imageFileURL
            message.url = url
            
            activeConversation?.insert(message, completionHandler: nil)
            let p = parent as? MessagesViewController
            p?.requestPresentationStyle(.compact)
        }
    }
    // MARK: Convenience
}
// A delegate protocol for the `IceCreamsViewController` class

protocol CollectionViewControllerDelegate: class {
    
    /// Called when a user choses to add a new `IceCream` in the `IceCreamsViewController`.
    
    func collectionViewControllerDidSelect(_ controller: CollectionViewController)
}
