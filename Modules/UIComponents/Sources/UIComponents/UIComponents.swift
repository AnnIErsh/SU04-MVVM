import SwiftUI
import Foundation

public struct Picture {
    private var url: String
    
    public init (url: String?) {
        self.url = url ?? ""
    }
    
    public var image: some View {
        AsyncImage(url: URL(string: self.url)) { img in
            img.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 250, maxHeight: 250)
        } placeholder: {
            ProgressView()
        }
    }
}

public struct Info {
    private var info: (String, String, String)
    
    public init(info: (String, String, String)) {
        self.info = info
    }
    
    public var infoView: some View {
        VStack {
            Text("\(self.info.0)")
                .foregroundColor(.black)
                .dynamicTypeSize(.large)
                .padding()
            Text("\(self.info.1)")
                .foregroundColor(.gray)
                .dynamicTypeSize(.medium)
                .padding()
            Text("Author: \(self.info.2)")
                .foregroundColor(.purple.opacity(0.8))
                .dynamicTypeSize(.small)
                .padding()
        }
    }
}



