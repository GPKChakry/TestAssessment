//
//  PostTableViewCell.swift
//  TestAssessment
//
//  Created by Chakry GPK on 29/04/24.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        idLabel.text = nil
        titleLabel.text = nil
    }
    
    func configurePostCell(_ post: Post) {
        idLabel.text = "\(post.id)"
        titleLabel.text = post.title
    }
    
}
