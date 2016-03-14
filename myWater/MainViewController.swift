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
    var dismissButton: UIButton!
    let heightRatioCollectionViewToSuperView: CGFloat = 2/3
    
    
    var pokalButton:UIButton!
    var ideaButton:UIButton!
    var infoButton:UIButton!
    var addEntryButton: UIButton!
    
    var heuteHastDuGetrunkenLabel:UILabel!
    var percentageLabel:UILabel!
    
    
    
    
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
    }
    
    private func layoutButtons() {
        
        let xDistanceBetweenButtons = (self.view.frame.width - 110 - 3*45 ) / 2
        
        pokalButton = UIButton(frame: CGRect(x: 55, y: 38, width: 45, height: 45))
        pokalButton.setImage(UIImage(named: "main_pokal"), forState: .Normal)
        self.view.addSubview(pokalButton)
        
        ideaButton = UIButton(frame: CGRect(x: 55 + 45 + xDistanceBetweenButtons, y: 38, width: 45, height: 45))
        ideaButton.setImage(UIImage(named: "main_idea"), forState: .Normal)
        self.view.addSubview(ideaButton)
        
        infoButton = UIButton(frame: CGRect(x: 55 + 45 + xDistanceBetweenButtons + 45 + xDistanceBetweenButtons, y: 38, width: 45, height: 45))
        infoButton.setImage(UIImage(named: "main_info"), forState: .Normal)
        self.view.addSubview(infoButton)
        
        let xPos = self.view.frame.width / 2 - 100
        addEntryButton = UIButton(frame: CGRect(x: xPos, y: 350, width: 200, height: 45))
        addEntryButton.setTitle("Eintrag hinzufügen", forState: .Normal)
        addEntryButton.addTarget(self, action: "addEntry:", forControlEvents: .TouchUpInside)
        addEntryButton.backgroundColor = UIColor.myWaterTextColorDarkBlue()
        addEntryButton.layer.cornerRadius = 5
        addEntryButton.layer.borderWidth = 1
        self.view.addSubview(addEntryButton)
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
    
    @IBAction func amountTest(sender: AnyObject) {
        
        let selectionFrame = CGRectMake(0, super.view.frame.height,super.view.frame.width, super.view.frame.height*heightRatioCollectionViewToSuperView)
        
        dismissButton = UIButton(frame: view.frame)
        dismissButton.addTarget(self, action: "dissmissSelectionView", forControlEvents: .TouchUpInside)
        view.addSubview(dismissButton)
        
        
        
        // Animation ohne Test
        let amountView = AmountView(frame: selectionFrame)
        
        view.addSubview(amountView)
        UIView.animateWithDuration(0.7) { () -> Void in
            amountView.frame.origin.y = self.view.frame.height - selectionFrame.height }
        
    }
}
