import SwiftUI

/// Tracks first-run onboarding completion and "what's new" per app version,
/// persisted in `UserDefaults`.
@MainActor
public final class OnboardingState: ObservableObject {
    @AppStorage("anvora.onboarding.completed") public var hasCompletedOnboarding = false
    @AppStorage("anvora.onboarding.lastSeenVersion") private var lastSeenVersion = ""

    public init() {}

    private var currentVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    /// `true` when the app updated to a new version the user hasn't seen yet.
    public var shouldShowWhatsNew: Bool {
        hasCompletedOnboarding && lastSeenVersion != currentVersion
    }

    public func completeOnboarding() {
        hasCompletedOnboarding = true
        lastSeenVersion = currentVersion
    }

    public func markWhatsNewSeen() {
        lastSeenVersion = currentVersion
    }
}
