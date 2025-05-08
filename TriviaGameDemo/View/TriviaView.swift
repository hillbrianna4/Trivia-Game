//
//  TriviaView.swift
//  TriviaGameDemo
//
//  
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .mainTitle()
                
                Text("Congratulations, you completedthe game! 🥳")
                
                Text("you scored \(triviaManager.score) out of \(triviaManager.length)")
                
                Button {
                    dismiss()
                    Task.init {
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BGColor"))
            .navigationBarHidden(true)
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager(difficulty: "", category: "", type: ""))
    }
}
