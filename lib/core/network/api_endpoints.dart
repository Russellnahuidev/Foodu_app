class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.foodapp.com/v1';

  // ─── Auth ──────────────────────────────────────────────────
  static const String signIn = '/auth/login';
  static const String signUp = '/auth/register';
  static const String signOut = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyEmail = '/auth/verify-email';

  // ─── User ──────────────────────────────────────────────────
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/profile';
  static const String uploadAvatar = '/user/avatar';
  static const String changePassword = '/user/change-password';
  static const String addresses = '/user/addresses';

  // ─── Home ──────────────────────────────────────────────────
  static const String categories = '/categories';
  static const String restaurants = '/restaurants';
  static const String offers = '/offers';
  static const String featuredRestaurants = '/restaurants/featured';
  static const String nearbyRestaurants = '/restaurants/nearby';

  // ─── Restaurant ────────────────────────────────────────────
  static String restaurantDetail(String id) => '/restaurants/$id';
  static String restaurantMenu(String id) => '/restaurants/$id/menu';
  static String restaurantReviews(String id) => '/restaurants/$id/reviews';

  // ─── Orders ────────────────────────────────────────────────
  static const String placeOrder = '/orders';
  static const String myOrders = '/orders/mine';
  static String orderDetail(String id) => '/orders/$id';
  static String cancelOrder(String id) => '/orders/$id/cancel';
  static String trackOrder(String id) => '/orders/$id/track';

  // ─── Wallet ────────────────────────────────────────────────
  static const String walletBalance = '/wallet/balance';
  static const String walletTopUp = '/wallet/top-up';
  static const String walletTransactions = '/wallet/transactions';

  // ─── Chat ──────────────────────────────────────────────────
  static const String chats = '/chats';
  static String chatMessages(String id) => '/chats/$id/messages';

  // ─── Search ────────────────────────────────────────────────
  static const String search = '/search';

  // ─── Promos ────────────────────────────────────────────────
  static const String validatePromo = '/promos/validate';

  // ─── Help ──────────────────────────────────────────────────
  static const String faqs = '/help/faqs';
  static const String sendSupportMessage = '/help/contact';
}
