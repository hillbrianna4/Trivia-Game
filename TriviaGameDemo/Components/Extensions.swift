//
//  Extensions.swift
//  TriviaGameDemo
//
//  
//

import Foundation
import SwiftUI

extension Text {
    func mainTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
