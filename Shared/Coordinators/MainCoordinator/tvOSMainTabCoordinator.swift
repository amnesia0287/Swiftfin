//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2022 Jellyfin & Jellyfin Contributors
//

import Foundation
import Stinsen
import SwiftUI

final class MainTabCoordinator: TabCoordinatable {
	var child = TabChild(startingItems: [
		\MainTabCoordinator.home,
		\MainTabCoordinator.tv,
		\MainTabCoordinator.movies,
		\MainTabCoordinator.other,
		\MainTabCoordinator.settings,
	])

	@Route(tabItem: makeHomeTab)
	var home = makeHome
	@Route(tabItem: makeTvTab)
	var tv = makeTv
	@Route(tabItem: makeMoviesTab)
	var movies = makeMovies
	@Route(tabItem: makeOtherTab)
	var other = makeOther
	@Route(tabItem: makeSettingsTab)
	var settings = makeSettings

	func makeHome() -> NavigationViewCoordinator<HomeCoordinator> {
		NavigationViewCoordinator(HomeCoordinator())
	}

	@ViewBuilder
	func makeHomeTab(isActive: Bool) -> some View {
		HStack {
			Image(systemName: "house")
			L10n.home.text
		}
	}

	func makeTv() -> NavigationViewCoordinator<TVLibrariesCoordinator> {
		NavigationViewCoordinator(TVLibrariesCoordinator(viewModel: TVLibrariesViewModel(), title: L10n.tvShows))
	}

	@ViewBuilder
	func makeTvTab(isActive: Bool) -> some View {
		HStack {
			Image(systemName: "tv")
			L10n.tvShows.text
		}
	}

	func makeMovies() -> NavigationViewCoordinator<MovieLibrariesCoordinator> {
		NavigationViewCoordinator(MovieLibrariesCoordinator(viewModel: MovieLibrariesViewModel(), title: L10n.movies))
	}

	@ViewBuilder
	func makeMoviesTab(isActive: Bool) -> some View {
		HStack {
			Image(systemName: "film")
			L10n.movies.text
		}
	}

	func makeOther() -> NavigationViewCoordinator<LibraryListCoordinator> {
		NavigationViewCoordinator(LibraryListCoordinator(viewModel: LibraryListViewModel()))
	}

	@ViewBuilder
	func makeOtherTab(isActive: Bool) -> some View {
		HStack {
			Image(systemName: "folder")
			L10n.other.text
		}
	}

	func makeSettings() -> NavigationViewCoordinator<SettingsCoordinator> {
		NavigationViewCoordinator(SettingsCoordinator())
	}

	@ViewBuilder
	func makeSettingsTab(isActive: Bool) -> some View {
		Image(systemName: "gearshape.fill")
			.accessibilityLabel(L10n.settings)
	}
}
