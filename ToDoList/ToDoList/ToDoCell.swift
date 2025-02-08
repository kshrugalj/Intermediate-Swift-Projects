//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Kshrugal Reddy Jangalapalli on 11/3/24.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
    
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {

    weak var delegate: ToDoCellDelegate?
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
