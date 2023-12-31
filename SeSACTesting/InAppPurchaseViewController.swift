//
//  InAppPurchaseViewController.swift
//  SeSACTesting
//
//  Created by 이은서 on 12/15/23.
//

import UIKit
import StoreKit

class InAppPurchaseViewController: UIViewController {
    /*
     1. 유료 계약 활성화 / 개발자 계정 / In App Purchase Capabilities
     2. AppStoreConnect In App Product 등록
     */
    
    @IBOutlet weak var productLabel: UILabel!
    
    //1. 인앱 상품 ID 정의
    var productIdentifier: Set<String> = ["com.eunseo.SeSACTestingUITests.ruby100"]
    var productArray = Array<SKProduct>()
    var product: SKProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //2. productIdentifier에 정의된 상품 ID가 실제로 Connect에 존재하는지 확인 + 사용자 디바이스가 인앱 결제 가능한지
    func requestProductData() {
        if SKPaymentQueue.canMakePayments() {
            print("인앱 결제 가능")
            
            //3. 인앱 상품 조회
            let request = SKProductsRequest(productIdentifiers: productIdentifier)
            request.delegate = self
            request.start() //인앱 상품 조회 시작
            
        } else {
            print("In App Purchase Not Enabled")
        }
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        //5. 구매 버튼 클릭
        let payment = SKPayment(product: product!)
        SKPaymentQueue.default().add(payment)
        SKPaymentQueue.default().add(self) //delegate 패턴 구현이 필요해서 self 추가
    }
}


extension InAppPurchaseViewController: SKProductsRequestDelegate {
    
    //4. 인앱 상품 정보 조회
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        let products = response.products //상품에 대한 내용 가져오기
        
        if products.count > 0 {
            
            for item in products {
                productArray.append(item)
                product = item //옵션
                
                print(item.productIdentifier)
                print(item.localizedTitle)
                print(item.price)
                print(item.priceLocale)
            }
            
        }
    }
}

extension InAppPurchaseViewController: SKPaymentTransactionObserver {
    
    //영수증 검증 메서드
    func receiptValidation(transaction: SKPaymentTransaction, productIdentifier: String) {
        
        //구매 영수증 정보
        let receiptFileURL = Bundle.main.appStoreReceiptURL
        let receiptData = try? Data(contentsOf: receiptFileURL!)
        let receiptString = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        print(receiptString)
    }
    
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                print("구매하는 중")
            case .purchased:
                print("구매 완료")
                print(transaction.payment.productIdentifier) //영수증이 이 아이디로 잘 구매된건지 확인
                receiptValidation(transaction: transaction, productIdentifier: transaction.payment.productIdentifier)
            case .failed:
                print("구매 실패")
                SKPaymentQueue.default().finishTransaction(transaction) //작업 끝내주기
            case .restored:
                print("구매 복원")
            @unknown default:
                print("Default")
            }
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        print("removedTransaction")
    }
    
    
    
    
}
