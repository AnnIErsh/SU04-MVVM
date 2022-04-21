//
//  NewsService.swift
//  SU02
//
//  Created by Anna Ershova on 20.04.2022.
//

import Foundation
import Networking
import Combine

protocol INewsService {
    func doRequest(withHeading heading: String?, andPage page: Int?)
}

public class NewsService: INewsService {
    public var future: Future<ArticleList?, Error>?    
    public init() {}
    
    public func doRequest(withHeading heading: String?, andPage page: Int?) {
        print("do your request")
        self.future = Future<ArticleList?, Error> { promise in
            DispatchQueue.global(qos: .background).async {
                ArticlesAPI.everythingGet(q: heading ?? "",
                                          from: "2022-04-10",
                                          sortBy: "publishedAt",
                                          language: "en",
                                          //apiKey: "a59e5f24831a4322b535578654582973",
                                          //apiKey: "60c5d3082c324870a536db916da66ac6",
                                          //apiKey: "86346ae4bf054d819cc1d938a0ba75d7",
                                          //apiKey: "aebbd82e5b604687a498d79cc7dc24f1",
                                          apiKey: "9f3b3102ab704b7c9a874ee92cdb288f",
                                          page: page,
                                          completion: { data, error in
                    if let error = error {
                        print(error.localizedDescription)
                        promise(.failure(error))
                        return
                    }
                    promise(.success(data))
                })
            }
        }
    }
}
