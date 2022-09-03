//
//  ProductListViewTests.swift
//  pos-swiftuiTests
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import Quick
import Nimble
import XCTest
import ViewInspector
import SwiftUI

@testable import pos_swiftui

class ProductListViewTests: QuickSpec {

    override func spec() {
        super.spec()

        var product = Product(productId: 123, productName: "Name", salesPriceIncVat: 18.91)
        let api = APIMock()
        let viewModel = ProductListViewModel(api: api)
        var sut: ProductListView!

        describe("ProductListView") {
            
            context("product list is not empty") {
                beforeEach {
                    sut = ProductListView(viewModel: viewModel)
                    viewModel.isLoading = false
                    viewModel.products = [product]
                }

                it("should show list") {
                    expect {try sut.inspect().find(viewWithTag: "productList")}.toNot( throwError() )
                }
                
                it("should not show empty text") {
                    expect {try sut.inspect().find(viewWithTag: "textNotFound")}.to( throwError() )
                }
            }
            
            context("product list empty") {
                beforeEach {
                    sut = ProductListView(viewModel: viewModel)
                    viewModel.isLoading = false
                    viewModel.products = []
                }

                it("should not show list") {
                    expect {try sut.inspect().find(viewWithTag: "productList")}.to( throwError() )
                }
                
                it("should show empty text") {
                    expect {try sut.inspect().find(viewWithTag: "textNotFound")}.toNot( throwError() )
                }
            }
        }
        
        describe("productRow") {
        
            context("display product info") {
        
                product.reviewInformation = ReviewInformation(reviewSummary: ReviewSummary(reviewAverage: 9.0, reviewCount: 1))
                var productRow = ProductListView(viewModel: viewModel).productRow(product: product)
                
                it("should show product name") {
                    let textProductName = try productRow.inspect().find(viewWithTag: "textProductName").text().string()
                    expect(textProductName).to(equal(product.productName))
                }
                
                it("should display price in correct format") {
                    
                    let textPrice = try productRow.inspect().find(viewWithTag: "textProductPrice").text().string()
                    
                    let price = product.salesPriceIncVat?.asCurrency()
                    
                    expect(textPrice).to(equal(price))
                }
                
                it("should display rating if has reviews") {
                    expect {try productRow.inspect().find(viewWithTag: "productRating")}.toNot( throwError() )
                }
                
                it("should display rating in correct format") {
                    
                    let textRating = try productRow.inspect().find(viewWithTag: "textRating").text().string()
                    
                    let rating = product.reviewInformation?.reviewSummary?.reviewAverage?.asRating()
                    
                    expect(textRating).to(equal(rating))
                }
                
                it("should not display rating if has not reviews") {
                    product.reviewInformation = nil
                    productRow = ProductListView(viewModel: viewModel).productRow(product: product)
                    
                    expect {try productRow.inspect().find(viewWithTag: "productRating")}.to( throwError() )
                }
            }
        }
    }
}

extension ProductListView: Inspectable{}
extension RatingView: Inspectable{}
