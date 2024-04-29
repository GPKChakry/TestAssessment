//
//  PostViewModel.swift
//  TestAssessment
//
//  Created by Chakry GPK on 29/04/24.
//

import Foundation

class PostViewModel {
    var posts: [Post] = []
    private var currentPage = 0
    
    func loadNextPage(completion: @escaping () -> Void) {
        let resource = Resource<Post>(urlString: "https://jsonplaceholder.typicode.com/posts?page=\(currentPage + 1)", params: nil, headers: ["Content-Type": "Application/json"])
        APIService.fetchPage(resoucrce: resource) { result in
            switch result {
            case .success(let newPosts):
                DispatchQueue.main.async {
                    self.posts.append(contentsOf: newPosts)
                    self.currentPage += 1
                    completion()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
