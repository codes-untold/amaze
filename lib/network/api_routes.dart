class ApiRoutes {
  static const baseUrl =
      "http://amaze-staging.us-east-2.elasticbeanstalk.com/api";

  static Uri create(String endpoint, {bool ignoreBaseUrl = false}) {
    if (ignoreBaseUrl) return Uri.parse(endpoint);
    return Uri.parse(baseUrl + endpoint);
  }

  static _OnboardingRoutes onboarding = _OnboardingRoutes();
}

// private classes

class _OnboardingRoutes {
  final signUp = "/User/account/signup";
  final getCategories = "/App/categories/0";
  final getServices = "/App/amaze/services";
  final updateProfile = "/User/account/celebrity/update";
}
