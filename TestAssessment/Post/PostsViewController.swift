//
//  PostsViewController.swift
//  TestAssessment
//
//  Created by Chakry GPK on 29/04/24.
//

import UIKit

class PostsViewController: UITableViewController {
    var viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupTableView()
    }
    
    private func setupTableView() {
        self.view.backgroundColor = .systemTeal
        let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "PostTableViewCell")
        viewModel.loadNextPage { [weak self] in
            guard let `self` = self else {return}
            self.tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell(frame: .zero)}
        cell.configurePostCell(viewModel.posts[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "PostDetailViewController") as? PostDetailViewController else {
            return
        }
        viewController.post = viewModel.posts[indexPath.row]
        self.present(viewController, animated: true)
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height-100 - scrollView.frame.size.height) {
            // Load more data
            viewModel.loadNextPage {
                self.tableView.reloadData()
            }
        }
    }
}


