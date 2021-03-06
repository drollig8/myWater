//
//  Controller.swift
//  myWater
//
//  Created by Marc Felden on 11.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

let testColor = UIColor.redColor().colorWithAlphaComponent(0.2)
class MainViewController: UIViewController {
    
    var selectionView:SelectionView!
    var amountView: AmountView!
    
    var dismissButton: UIButton!
    let heightRatioCollectionViewToSuperView: CGFloat = 0.68
    
    
    var pokalButton:UIButton!
    var ideaButton:UIButton!
    var infoButton:UIButton!
    var addEntryButton: UIButton!
    
    var settingsButton:UIButton!
    
    var heuteHastDuGetrunkenLabel:UILabel!
    var percentageLabel:UILabel!
    var entryManager = EntryManager()
    
    override func viewDidLoad() {

        layoutButtons()
        layoutLabels()
        subscribeForNotification()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    @IBAction func addEntry(sender: UIButton) {
        let selectionFrame = CGRectMake(0, super.view.frame.height,super.view.frame.width, super.view.frame.height*heightRatioCollectionViewToSuperView)
        
        dismissButton = UIButton(frame: view.frame)
        dismissButton.addTarget(self, action: "dissmissSelectionView", forControlEvents: .TouchUpInside)
        view.addSubview(dismissButton)
        

        
        // Animation ohne Test
        selectionView = SelectionView(frame: selectionFrame)

        view.addSubview(selectionView)
        UIView.animateWithDuration(0.7) { () -> Void in
            self.selectionView.frame.origin.y = self.view.frame.height - selectionFrame.height }
    
    }
    
    private func subscribeForNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dissmissSelectionView", name: "DismissSelectionView", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showAmountView:", name: "ItemSelectedNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dismissAmountView", name: "DismissAmountView", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "save:", name: "ValueEnteredNotification", object: nil)
    }
    
    

    func showAmountView(notification:NSNotification) {
       
        // Animation ohne Test - place amount view add left side
        let amountViewFrame = CGRectMake(view.frame.width, view.frame.height - view.frame.height*heightRatioCollectionViewToSuperView,view.frame.width, view.frame.height*heightRatioCollectionViewToSuperView)
        amountView = AmountView(frame: amountViewFrame)
        guard let index = notification.userInfo?["index"] as? Int else {fatalError()}
        guard let page = notification.userInfo?["page"] as? Int else {fatalError()}
        amountView.itemInfo = (index,page)
        view.addSubview(amountView)
        UIView.animateWithDuration(0.7) { () -> Void in
            
            if let amountView = self.amountView {
                amountView.frame.origin.x = 0
            }
            
        
            // at the same time - no test with this - we need to push the selectionView out of the way
            if let selectionView = self.selectionView {
                selectionView.frame.origin.x = -self.selectionView.frame.width
            }

        }
    }
    
    
    
    func save(notification:NSNotification) {
        
        // TODO DAS IST ZU TESTEN UND ZU ASSERTEN
  //      let index = amountView.itemInfo?.index ?? 0
  //      let page = amountView.itemInfo?.page ?? 0
  //      let beverage = BeverageManager().itemAtIndex(index, page: page)
        if let amount = notification.userInfo?["value"] as? Int {
            let entry = Entry(date: NSDate(), beverage: Beverage(name: "TESTE"), amount: amount)
            entryManager.addEntry(entry)
        }
        selectionView?.removeFromSuperview()
        
        dismissAmountAndSlectionView()
    }
    
    
    func dismissAmountAndSlectionView() {
        selectionView?.removeFromSuperview()
        if let amountView = self.amountView {
            UIView.animateWithDuration(0.7, animations: { () -> Void in
                amountView.frame.origin.y = self.view.frame.height
                }) { (bool) -> Void in
                    amountView.removeFromSuperview()
            }
        }

    
    }
    
    
    
    func dismissAmountView() {
        
        // Animation ohne Test - move to right side und remove amountView
        
        let animation = { () -> Void in
            self.amountView.frame.origin.x = self.amountView.frame.width
            self.selectionView.frame.origin.x = 0
        }
        
        let completion = {(bool:Bool) -> Void in
            self.amountView.removeFromSuperview()
        }
        UIView.animateWithDuration(0.7, animations: animation, completion: completion)

    }
    
    private func layoutButtons() {
        
        let xDistanceBetweenButtons = (self.view.frame.width - 110 - 3*45 ) / 2
        
        pokalButton = UIButton(frame: CGRect(x: 55, y: 38, width: 45, height: 45))
        pokalButton.setImage(UIImage(named: "main_pokal"), forState: .Normal)
        view.addSubview(pokalButton)
        
        ideaButton = UIButton(frame: CGRect(x: 55 + 45 + xDistanceBetweenButtons, y: 38, width: 45, height: 45))
        ideaButton.setImage(UIImage(named: "main_idea"), forState: .Normal)
        view.addSubview(ideaButton)
        
        infoButton = UIButton(frame: CGRect(x: 55 + 45 + xDistanceBetweenButtons + 45 + xDistanceBetweenButtons, y: 38, width: 45, height: 45))
        infoButton.setImage(UIImage(named: "main_info"), forState: .Normal)
        view.addSubview(infoButton)
        
        let xPos = self.view.frame.width / 2 - 100
        addEntryButton = UIButton(frame: CGRect(x: xPos, y: 350, width: 200, height: 45))
        addEntryButton.setTitle("Eintrag hinzufügen", forState: .Normal)
        addEntryButton.addTarget(self, action: "addEntry:", forControlEvents: .TouchUpInside)
        addEntryButton.backgroundColor = UIColor.myWaterTextColorDarkBlue()
        addEntryButton.layer.cornerRadius = 5
        addEntryButton.layer.borderWidth = 1
        view.addSubview(addEntryButton)
        
        let yPos = self.view.frame.height - 41 - 45
        settingsButton = UIButton(frame: CGRect(x: 55 + 45 + xDistanceBetweenButtons + 45 + xDistanceBetweenButtons, y:yPos, width: 45, height: 45))
        settingsButton.setImage(UIImage(named:"main_settings"), forState: .Normal)
        settingsButton.addTarget(self, action: "showSettings", forControlEvents:  .TouchUpInside)
        view.addSubview(settingsButton)
    }
    
    private func layoutLabels() {
        let labelWidth = self.view.frame.width - 150
        heuteHastDuGetrunkenLabel = UILabel(frame: (CGRect(x: 75, y: 168, width: labelWidth, height: 88)))
        heuteHastDuGetrunkenLabel.textColor = UIColor.myWaterTextColorDarkBlue()
        heuteHastDuGetrunkenLabel.text = "Heute hast du getrunken"
        heuteHastDuGetrunkenLabel.font = UIFont(name: "Helvetica", size: 24)
        heuteHastDuGetrunkenLabel.numberOfLines = 0
        heuteHastDuGetrunkenLabel.textAlignment = .Center
        self.view.addSubview(heuteHastDuGetrunkenLabel)
        
        percentageLabel = UILabel(frame: (CGRect(x: 75, y: 244, width: labelWidth, height: 88)))
        percentageLabel.textColor = UIColor.myWaterTextColorDarkBlue()
        percentageLabel.text = "6%"
        percentageLabel.font = UIFont(name: "Helvetica", size: 70)
        percentageLabel.numberOfLines = 0
        percentageLabel.textAlignment = .Center
        self.view.addSubview(percentageLabel)
    }
    

    func showSettings() {
        
        let viewController = storyboard?.instantiateViewControllerWithIdentifier("SettingsViewController") as! SettingsViewController
        self.presentViewController(viewController, animated: true, completion: nil)
        
    }
    
    func dissmissSelectionView() {
        // Animation ohne Test
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            // animation
            self.selectionView?.frame.origin.y = super.view.frame.height
            }) { (result) -> Void in
                self.selectionView?.removeFromSuperview()
        }
       // selectionView?.removeFromSuperview()
        dismissButton?.removeFromSuperview()
    }

}
