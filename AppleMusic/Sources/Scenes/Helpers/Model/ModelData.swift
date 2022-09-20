//
//  ModelData.swift
//  AppleMusic
//
//  Created by Vadim Kim on 14.09.2022.
//

import Foundation

class ModelData: ObservableObject {
    @Published var searchCategories: [SearchCategoryModel] = SearchCategoryModel.getData()
    @Published var radioPreviewData: [RadioModel] = RadioModel.getPreviewData()
    @Published var stations: [RadioModel] = RadioModel.getStations()

}
