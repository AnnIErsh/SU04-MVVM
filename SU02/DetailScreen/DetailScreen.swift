//
//  DetailScreen.swift
//  SU02
//
//  Created by Anna Ershova on 29.12.2021.
//

import SwiftUI
import UIComponents

struct DetailScreen: View {
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    @EnvironmentObject var detailViewModel: DetailViewModel
    var body: some View {
        VStack {
            let title: String = detailViewModel.data.articleName ?? "No Name"
            let text: String = detailViewModel.data.content ?? "No Content"
            let author: String = detailViewModel.data.author ?? "unknown"
            Info(info: (title, text, author)).infoView
            Button {
                withAnimation {
                    self.routeModel.push(screeView: PictureScreen().toAnyView())
                }
            } label: {
                Text("NEXT")
                    .padding()
                    .background(Color.blue.opacity(0.8))
                    .foregroundColor(.white)
            }
            Button {
                withAnimation {
                    self.routeModel.pop()
                }
            } label: {
                Text("BACK")
                    .padding()
                    .background(Color.purple.opacity(0.8))
                    .foregroundColor(.white)
            }
        }
    }
}

