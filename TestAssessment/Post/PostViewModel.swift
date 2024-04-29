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
        //Incrementing the page number helps us for fetching data from neext pages if available.
        let resource = Resource<Post>(urlString: "https://jsonplaceholder.typicode.com/posts", params: nil, headers: ["Content-Type": "Application/json"], pageNumber: currentPage + 1)
        APIService.fetchPage(resoucrce: resource) { result in
            switch result {
            case .success(let newPosts):
                DispatchQueue.global(qos: .background).async {
                    let computedItems = newPosts.map { self.computeDetails(for: $0) }
                    DispatchQueue.main.async {
                        self.posts.append(contentsOf: computedItems)
                        self.currentPage += 1
                        completion()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func computeDetails(for item: Post) -> Post {
        // Perform computation
        return item
    }
}
