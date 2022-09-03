//
//  ProductListViewModelTests.swift
//  pos-swiftuiTests
//
//  Created by Elder Brenner Andrade Santos on 02/09/22.
//

import Quick
import Nimble
import XCTest
@testable import pos_swiftui

class ProductListViewModelTests: QuickSpec {
    override func spec() {
        super.spec()

        let api = APIMock()
        var sut: ProductListViewModel!

        describe("ProductListViewModel") {
            
            context("error fetching data") {
                beforeEach {
                    api.shouldError = true
                    sut = ProductListViewModel(api: api)
                    sut.loadProducts()
                }

                it("should show error") {
                    expect(sut.showError).toEventually(equal(true))
                }
                
                it("should have an error message") {
                    expect(sut.errorMessage.count).toEventually(beGreaterThan(0))
                }
                
                it("should stop loading") {
                    expect(sut.isLoading).toEventually(equal(false))
                }
            }
            
            context("success fetching data") {
                beforeEach {
                    api.shouldError = false
                    sut = ProductListViewModel(api: api)
                    sut.loadProducts()
                }

                it("should not show error") {
                    expect(sut.showError).toEventually(equal(false))
                }
                
                it("should not have an empty product list") {
                    expect(sut.products.count).toEventually(beGreaterThan(0))
                }
                
                it("should stop loading") {
                    expect(sut.isLoading).toEventually(equal(false))
                }
                
                it("should populate page and totalPages"){
                    expect(sut.page).toEventually(equal(api.dummyResult.currentPage))
                    expect(sut.totalPages).toEventually(equal(api.dummyResult.pageCount))
                }
            }
            
            context("trigger last visible cell") {
                beforeEach {
                    api.shouldError = false
                    sut = ProductListViewModel(api: api)
                    sut.isLoading = true
                    sut.page = 1
                    sut.totalPages = 2
                    sut.lastVisibleRow.send(sut.products.count - 1)
                }

                it("should make request and stop loading") {
                    expect(sut.isLoading).toEventually(equal(false))
                }
            }
        }
    }
}
