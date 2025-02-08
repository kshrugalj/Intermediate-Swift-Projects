//
//  FollowedUserCollectionViewCell.swift
//  Habits
//
//  Created by Kshrugal Reddy Jangalapalli on 12/6/24.
//
import UIKit

class FollowedUserCollectionViewCell: UICollectionViewCell {
    @IBOutlet var primaryTextLabel: UILabel!
    @IBOutlet var secondaryTextLabel: UILabel!
    @IBOutlet var separatorLineView: UIView!
    @IBOutlet var separatorLineHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        separatorLineHeightConstraint.constant = 1 / UITraitCollection.current.displayScale
    }
}

