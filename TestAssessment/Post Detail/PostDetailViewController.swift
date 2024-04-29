//
//  PostDetailViewController.swift
//  TestAssessment
//
//  Created by Chakry GPK on 29/04/24.
//

import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    var post: Post? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        // Do any additional setup after loading the view.
    }

    func configureLabels() {
        guard let post = post else { return }
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
}
