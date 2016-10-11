/**
 *  SparkUIKitProtocolExtensionsTests.swift
 *  SparkKitTests
 *
 *  Created by Steve Elliott on 05/04/2016.
 *  Copyright (c) 2016 eBay Software Foundation.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 **/

import XCTest
import SparkChamber
@testable import SparkKit


class SparkUIKitProtocolExtensionsTests: XCTestCase {
	func testSparkKitUIApplicationTouchesEnded() {
		guard UIApplicationExtensionSupport.enabled else {
			return
		}
		
		let view = PointInsideViewMock()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didEndTouch, trace: "UIApplication touch event") {
			_ in
			expectation.fulfill()
		}
		view.sparkEvents = [sparkEvent]
		
		let touch = UITouchMock()
		touch.view = view
		let fakeTouches: Set<UITouch> = [touch]
		
		UIApplication.shared.keyWindow?.addSubview(view)
		
		UIApplication.shared.touchesEnded(fakeTouches, with:nil)
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitTableViewWillDisplayCell() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let tableView = UITableView()
		tableView.delegate = viewController
		viewController.view = tableView
		let cell = UITableViewCell()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didAppear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		cell.sparkEvents = [sparkEvent]
		
		viewController.tableView(tableView, willDisplay: cell, forRowAt: IndexPath(row: 1, section: 0))
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitTableViewDidEndDisplayingCell() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let tableView = UITableView()
		tableView.delegate = viewController
		viewController.view = tableView
		let cell = UITableViewCell()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didDisappear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		cell.sparkEvents = [sparkEvent]
		
		viewController.tableView(tableView, didEndDisplaying: cell, forRowAt: IndexPath(row: 1, section: 0))
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitTableViewWillDisplayHeaderView() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let tableView = UITableView()
		tableView.delegate = viewController
		viewController.view = tableView
		let headerView = UIView()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didAppear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		headerView.sparkEvents = [sparkEvent]
		
		viewController.tableView(tableView, willDisplayHeaderView: headerView, forSection: 0)
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitTableViewDidEndDisplayingHeaderView() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let tableView = UITableView()
		tableView.delegate = viewController
		viewController.view = tableView
		let headerView = UIView()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didDisappear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		headerView.sparkEvents = [sparkEvent]
		
		viewController.tableView(tableView, didEndDisplayingHeaderView: headerView, forSection: 0)
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitTableViewWillDisplayFooterView() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let tableView = UITableView()
		tableView.delegate = viewController
		viewController.view = tableView
		let footerView = UIView()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didAppear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		footerView.sparkEvents = [sparkEvent]
		
		viewController.tableView(tableView, willDisplayFooterView: footerView, forSection: 0)
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitTableViewDidEndDisplayingFooterView() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let tableView = UITableView()
		tableView.delegate = viewController
		viewController.view = tableView
		let footerView = UIView()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didDisappear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		footerView.sparkEvents = [sparkEvent]
		
		viewController.tableView(tableView, didEndDisplayingFooterView: footerView, forSection: 0)
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitCollectionViewWillDisplayCell() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 100, height: 100)
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.delegate = viewController
		viewController.view = collectionView
		let cell = UICollectionViewCell()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didAppear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		cell.sparkEvents = [sparkEvent]
		
		viewController.collectionView(collectionView, willDisplay: cell, forItemAt: IndexPath(row: 1, section: 0))
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitCollectionViewDidEndDisplayingCell() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 100, height: 100)
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.delegate = viewController
		viewController.view = collectionView
		let cell = UICollectionViewCell()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didDisappear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		cell.sparkEvents = [sparkEvent]
		
		viewController.collectionView(collectionView, didEndDisplaying: cell, forItemAt: IndexPath(row: 1, section: 0))
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitCollectionViewWillDisplaySupplementaryView() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 100, height: 100)
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.delegate = viewController
		viewController.view = collectionView
		let supplementaryView = UICollectionReusableView()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didAppear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		supplementaryView.sparkEvents = [sparkEvent]
		
		
		viewController.collectionView(collectionView, willDisplaySupplementaryView: supplementaryView, forElementKind: "foo", at: IndexPath(row: 1, section: 0))
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
	
	func testSparkKitCollectionViewDidEndDisplayingSupplementaryView() {
		let viewController = SparkViewController()
		UIApplication.shared.keyWindow?.rootViewController = viewController
		
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 100, height: 100)
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.delegate = viewController
		viewController.view = collectionView
		let supplementaryView = UICollectionReusableView()
		
		let expectation: XCTestExpectation = self.expectation(description: "A Spark Event's action failed to execute.")
		let sparkEvent = SparkEvent(trigger: SparkTriggerType.didDisappear, trace: nil) {
			_ in
			expectation.fulfill()
		}
		supplementaryView.sparkEvents = [sparkEvent]
		
		viewController.collectionView(collectionView, didEndDisplayingSupplementaryView: supplementaryView, forElementKind: "foo", atIndexPath: IndexPath(row: 1, section: 0))
		
		waitForExpectations(timeout: 3.0, handler: nil)
	}
}
