//
//  SwiftUIView.swift
//  Example
//
//  Created by iOS on 2023/5/30.
//

import SwiftUI
import SwiftRoute
import SwiftShow
import SwiftBrick
struct SwiftUIView: View {
    var body: some View {
        List {
            Section {
                Button("OpenURL") {
                    Router.shared.open("push://xxx")
                }
                
            } header: {
                Text("URL")
            }
            
            Section {
                Button("Push") {
                    Router.shared.push("push://xxx")
                }
 
            } header: {
                Text("Push")
            }
            
            Section {
                Button("Present") {
                    Router.shared.present("push://xxx")
                }
 
            } header: {
                Text("Present")
            }
            
            Section {

                Button("callInstanceFunc") {
                    Router.shared.callInstanceFunc("push://xxx", params: ["papa": "haha"]) { str in
                        debugPrint("\(String(describing: str))")
                        Dispatch.main().after(2, closure: {
                            Show.toast("接收到闭包返回参数\(String(describing: str))")
                        })
                    }
                }
                
                Button("callInstanceFunc") {
                    Router.shared.callInstanceFunc("push://xxx", params: ["kaka": "haha"])
                }
                
            } header: {
                Text("InstanceFunc")
            }
            
            Section {

                Button("callInstanceFunc") {
                    Router.shared.callStaticFunc("push://xxx", params: ["jaja": "haha"]) { str in
                        debugPrint("\(String(describing: str))")
                        Dispatch.main().after(2, closure: {
                            Show.toast("接收到闭包返回参数\(String(describing: str))")
                        })
                    }
                }
                
                Button("callInstanceFunc") {
                    Router.shared.callStaticFunc("push://xxx", params: ["lala": "haha"])
                }
                
            } header: {
                Text("StaticFunc")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
