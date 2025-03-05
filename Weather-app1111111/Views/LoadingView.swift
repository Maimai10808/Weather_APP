//
//  LoadingView.swift
//  Weather-app1111111
//
//  Created by mac on 3/4/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}



struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}




