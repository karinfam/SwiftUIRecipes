//
//  HideNavBackBtn.swift
//  SwiftUIRecipes
//
//  Created by Karin Fam on 24/02/2020.
//  Copyright © 2020 Karin Fam. All rights reserved.
//

import SwiftUI

struct PageOne: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: PageTwo()){
                    Text("Go to Page Two")
                }
            }
        }
    }
}

// Hide from page 2 -> page 1
struct PageTwo: View {
    var body: some View {
        VStack{
            NavigationLink(destination: PageThree()){
                Text("Go to Page Three")
            }.navigationBarBackButtonHidden(true)
        }
    }
}

// Hide from page 3 -> page 2
struct PageTwo: View {
    var body: some View {
        VStack{
            NavigationLink(destination: PageThree().navigationBarBackButtonHidden(true)){
                Text("Go to Page Three")
            }
        }
    }
}


struct PageThree: View {
    var body: some View {
        Text("Hello!")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PageOne()
    }
}
