//
//  StoreView.swift
//  SeSACTesting
//
//  Created by 이은서 on 12/18/23.
//

import SwiftUI
import _StoreKit_SwiftUI

struct StoreView: View {
    
    @StateObject var shop = SeSACShop()
    
    var body: some View {
        VStack {
            HStack {
                Text("광고 제거")
                Spacer()
                Button("$999.99") {
                    print("구매 버튼 클릭")
                }
            }
            .padding()
            ForEach(shop.allProducts, id: \.id) { item in
//                Text(item.displayName)
                ProductView(item)
                    .productViewStyle(.compact)
            }
//            StoreView(shop: <#T##SeSACShop#>)
//            SubscriptionStoreView
        }
        .task {
            await shop.fetchAllProducts()
        }
    }
}

#Preview {
    StoreView()
}
