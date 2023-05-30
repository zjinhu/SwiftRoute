//
//  SwiftUIView.swift
//  Example
//
//  Created by iOS on 2023/5/30.
//

import SwiftUI
import SwiftRoute
struct SwiftUIView: View {
    var body: some View {
        List {
            Section {
                Button("Default") {
                    Router.shared.open("push://xxx")
                }
 
                
            } header: {
                Text("Present")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
