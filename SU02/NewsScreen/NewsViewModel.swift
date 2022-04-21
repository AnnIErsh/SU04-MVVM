//
//  NewsViewModel.swift
//  SU02
//
//  Created by Anna Ershova on 23.12.2021.
//

import Core
import Combine
import Networking
import Foundation

final class NewsViewModel: ObservableObject {
    @Injected var network: NewsService?
    @Published var articles: [Article] = []
    @Published var isPageLoading: Bool = false
    @Published var currentHeading: String?
    private var cancellable: AnyCancellable?
    var page: Int = 0
    var totalResults: Int = Int.max
    var headings = HeadingManager.shared.heads
    var toCange: String {
        get{
            currentHeading ?? ""
        }
        set {
            currentHeading = newValue
        }
    }
        
    init() {}
    
    func loadNextPage() {
        guard !isPageLoading && totalResults > articles.count else {
            print("Nothing to load \(self.articles.count)/\(self.totalResults)")
            return
        }
        isPageLoading = true
        page += 1
        network?.doRequest(withHeading: self.currentHeading, andPage: self.page)
        cancellable = network?.future?.sink(receiveCompletion: { _ in
            
        }, receiveValue: { [weak self] list in
            if list?.status != "ok" {
                print("list status is KO")
                return
            }
            self?.totalResults = list?.totalResults ?? Int.max
            let noEmptyArticles = list?.articles?.filter { article in
                article.title != nil
            } ?? []
            let tmp = NSOrderedSet(array: noEmptyArticles).array
            self?.articles.append(contentsOf: tmp as? [Article] ?? [])
            self?.isPageLoading = false
        })
    }
    
    func refreshList() {
        articles = []
        isPageLoading = false
        page = 0
        totalResults = Int.max
    }
}
