//
//  EpubView.swift
//  EpubView
//
//  Created by 沈达 on 2021/8/8.
//

import SwiftUI

struct EpubView: View {
    @Binding var progressValue:Double
    @Binding var startReading:Bool
    var body: some View {
        VStack{
            if progressValue == 1.0 {
                Button(action: {
                    startReading = true
                }, label: {
                    Text("Read Manga")
                }).buttonStyle(.bordered)
            }else{
                ProgressView("Downloading...\(progressValue)", value: progressValue)
            }
        }
        
    }
}

struct EpubView_Previews: PreviewProvider {

    static var previews: some View {
        EpubView(progressValue: .constant(0), startReading: .constant(false))
    }
}
