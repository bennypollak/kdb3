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

class CollectionViewController: UICollectionViewController {
    var activeConversation: MSConversation?
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        send(indexPath)
    }

    let ijomes = Ijomes.msgIjomes


//    weak var delegate: UICollectionViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
//        delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(IjomeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
    let cols = 3
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // rows
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ijomes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
            as? IjomeCollectionViewCell
        let i = indexPath.row // * cols + indexPath.section
        let imageName = ijomes[i][0]
        cell?.image.image = UIImage(named: imageName)
        cell?.captionLbl.text = ijomes[i][1]
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

    func send(_ indexPath: IndexPath) {
        let layout = MSMessageTemplateLayout()
        let ijomes = Ijomes.msgIjomes
        let i = indexPath.row
        let caption = ijomes[i][1]
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
        
        activeConversation?.insert(message, completionHandler: nil)
        let p = parent as? MessagesViewController
        p?.requestPresentationStyle(.compact)

//        p.?requestPresentationStyle
//        p?.removeAllChildViewControllers()
//        view.removeFromSuperview()
//        dismiss(animated: true, completion: nil)
    }
    // MARK: Convenience
}
// A delegate protocol for the `IceCreamsViewController` class

protocol CollectionViewControllerDelegate: class {
    
    /// Called when a user choses to add a new `IceCream` in the `IceCreamsViewController`.
    
    func collectionViewControllerDidSelect(_ controller: CollectionViewController)
}
