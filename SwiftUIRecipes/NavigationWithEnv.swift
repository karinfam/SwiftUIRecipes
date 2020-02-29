//
//  NavigationWithEnv.swift
//  SwiftUIRecipes
//
//  Created by Karin Fam on 29/02/2020.
//  Copyright © 2020 Karin Fam. All rights reserved.
//

import SwiftUI

struct NavigationWithEnv: View {
    var body: some View {
        ViewMother()
    }
}

class PageRouterState: ObservableObject {
    @Published var currentPage: Page = Page.page_1
}

struct ViewMother: View {
    @EnvironmentObject var pageRouterState : PageRouterState
    
    var body: some View {
        VStack{
            showView()
        }
    }
    
    func showView() -> AnyView {
       switch pageRouterState.currentPage {
       case Page.page_1:
           return AnyView(ViewA())
       case Page.page_2:
           return AnyView(ViewB())
       case Page.page_3:
           return AnyView(ViewC())
       default:
            return AnyView(Text("Something went wrong!"))
       }
    }

}


struct ViewA: View {
    @EnvironmentObject var pageRouterState : PageRouterState
    var body: some View{
        Button(action: {
            self.pageRouterState.currentPage = Page.page_2
        }){Text("This is View A. Click for View B.")}
    }
}

struct ViewB: View {
    @EnvironmentObject var pageRouterState : PageRouterState
    var body: some View{
        VStack{
            Button(action: {
                self.pageRouterState.currentPage = Page.page_1
            }){Text("This is View B. Click for View A.")}
            
            Button(action: {
                self.pageRouterState.currentPage = Page.page_3
            }){Text("This is View B. Click for View C.")}

        }
        
    }
}

struct ViewC: View {
    @EnvironmentObject var pageRouterState : PageRouterState
    var body: some View{
        Text("This is View C. NO MO VIEWS FOR YOU.")
    }
}

enum Page {
    case page_1
    case page_2
    case page_3
}

struct NavigationWithEnv_Previews: PreviewProvider {
    static var previews: some View {
        NavigationWithEnv()
    }
}
