//
//  UserProfileView.swift
//  BluePrint
//
//  Created by Magdalena Kopec on 08/09/2024.
//

import Foundation
import SwiftUI

struct UserProfileView: View {
    
    @StateObject
    private var viewModel: UserProfileViewModel
    private let imageSize: CGFloat = 80
    
    init(viewModel: UserProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HStack {
                profileImage
                VStack(alignment: .leading) {
                    userNameText
                    locationText
                }
                .redacted(reason: viewModel.userName == nil ? .placeholder : [])
                Spacer()
            }
            .padding(.top, 30)
            Spacer()
        }
        .navigationTitle("User Profile")
        .task {
            await viewModel.loadData()
        }
        
    }
    
    private var profileImage: some View {
        AsyncImage(url: viewModel.imageURL) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: imageSize, height: imageSize)
                .clipShape(.circle)
        } placeholder: {
            Image(systemName: "person.fill")
                .scaledToFill()
                .frame(width: imageSize, height: imageSize)
        }
        .padding(.trailing, 16)
        .padding(.leading, 30)
    }
    
    private var userNameText: some View {
        Text(viewModel.userName ?? "Username placeholder")
            .tracking(1)
            .font(.headline)
            .fontWeight(.bold)
    }
    
    private var locationText: some View {
        Text(viewModel.country ?? "")
            .font(.subheadline)
            .foregroundStyle(.gray)
    }
}
