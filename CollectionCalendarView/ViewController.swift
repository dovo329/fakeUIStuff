//
//  ViewController.swift
//  CollectionCalendarView
//
//  Created by Douglas Voss on 8/5/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bottomView: UIView!
    
    let kCollectionCellId = "collection.view.cell.id"
    let kTableCellId = "table.view.cell.id"
    
    var toggle = false

    var bottomViewConstraint : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomViewConstraint =
        NSLayoutConstraint(
            item: bottomView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1.0,
            constant: 100.0)
        bottomViewConstraint.active = true
    }
    
    // MARK: Table View Stuff
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kTableCellId, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = String(format:"row %d", indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("do the animated constraint here")
        
        UIView.animateWithDuration(2.0, delay: 0.0,
            usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0,
            options: nil, animations: {
                self.bottomViewConstraint.constant = self.toggle ? 100.0 : 0.0
                self.bottomView.backgroundColor = self.toggle ? UIColor.redColor() : UIColor.blueColor()
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        /*for constraint in bottomView.constraints() as! [NSLayoutConstraint] {
            if constraint.firstAttribute == .Height {
                bottomView.removeConstraint(constraint)
                //constraint.constant = toggle ? 100.0 : 0.0
                //continue
                
                    let newConstraint = NSLayoutConstraint(
                        item: bottomView,
                        attribute: NSLayoutAttribute.Height
                        relatedBy: NSLayoutRelation.Equal
                        toItem: nil,
                        attribute: nil,
                        multiplier: 1.0,
                        constant: toggle ? 100.0 : 0.0)
                    newConstraint.active = true
            }
        }*/
        toggle = !toggle
    }
    
    /*titleLabel.superview!.removeConstraint(constraint)
    
    //add new constraint
    let newConstraint = NSLayoutConstraint(
        item: titleLabel,
        attribute: .CenterY,
        relatedBy: .Equal,
        toItem: titleLabel.superview!,
        attribute: .CenterY,
        multiplier: isMenuOpen ? 0.67 : 1.0,
        constant: 5.0)
    newConstraint.active = true*/
    
    // MARK: Collection View Stuff
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 20
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCollectionCellId, forIndexPath: indexPath) as! UICollectionViewCell
        
        let label = UILabel(frame: cell.frame)
        label.text = String(format:"%d", indexPath.section)
        cell.backgroundView = label
        cell.backgroundView?.backgroundColor = UIColor.orangeColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("you selected section \(indexPath.section)")
    }
}
