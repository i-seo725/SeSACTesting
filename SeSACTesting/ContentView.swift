//
//  ContentView.swift
//  SeSACTesting
//
//  Created by 이은서 on 12/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var emailText = ""
    @State private var idText = ""
    @State private var passwordText = ""
    @State private var showPage = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            TextField("이메일을 입력해주세요", text: $emailText)
                .accessibilityIdentifier("emailTextField") //개발자가 쓰는 내용, 고유해야 함
                .accessibilityLabel("이메일 기입란") //읽어주는 내용
            TextField("아이디를 입력해주세요", text: $idText)
                .accessibilityIdentifier("idTextField")
            TextField("비밀번호 입력해주세요", text: $passwordText)
                .accessibilityIdentifier("passwordTextField")
            Button("로그인") {
                showPage = true
            }
            .accessibilityIdentifier("loginButton")
        }
        .padding()
        .sheet(isPresented: $showPage, content: {
            NextView()
        })
    }
}

struct NextView: View {
    var body: some View {
        Text("다음 페이지")
    }
}

#Preview {
    ContentView()
}
