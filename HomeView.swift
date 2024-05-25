//
//  ContentView.swift
//  DIMVVMBootcamp
//
//  Created by Yacobu.Gaddala on 25/05/24.
//

import SwiftUI
enum views {
    
}

struct HomeView: View {
    var body: some View {
       
            TabView {
                NavigationStack{
                    UserView()
                        .padding(.bottom,16)
                }
                .tabItem {
                    Label("Users", systemImage: "person.3")
                }
                NavigationStack {
                    PostView()
                        .padding(.bottom,16)
                }
                
                .tabItem {
                    Label("Post", systemImage: "text.bubble")
                }
                NavigationStack {
                    CommentView()
                        .padding(.bottom,16)
                }
                .tabItem {
                    Label("Comments", systemImage: "text.bubble.fill")
                }
                NavigationStack {
                    AlbumView()
                        .padding(.bottom,16)
                }
                .tabItem {
                    Label("Album", systemImage: "photo.on.rectangle")
                    
                }
                NavigationStack {
                    TodoView()
                        .padding(.bottom,16)
                }
                .tabItem {
                    Label("Todo", systemImage: "checkmark.square")
                }
                NavigationStack {
                    PhotoView()
                        .padding(.bottom,16)
                }
                .tabItem {
                    Label("Photo-Section", systemImage: "photo")
                }
            }
        }

}

#Preview {
    HomeView()
}
