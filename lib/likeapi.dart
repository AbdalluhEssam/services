class AppLink {
//================================== Hosting ===============================//
  static const String serverLink = "https://abdalluh-essam.com/service/app";
  static const String serverLinkAdmin = "https://abdalluh-essam.com/service/admin";
  static const String serverLinkImage = "https://abdalluh-essam.com/service";
//================================== Image ===============================//
  static const String imageStatic = "$serverLinkImage/upload";
  static const String imageServices = "$imageStatic/services";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  static const String imageCart = "$imageStatic/cart";
  static const String imageBanner = "$imageStatic/banner";
//================================== Auth ===============================//
  static const String signUp = "$serverLink/auth/signup.php";
  static const String verfiyCodeSignUp = "$serverLink/auth/verfiycode.php";
  static const String reSend = "$serverLink/auth/resend.php";
  static const String login = "$serverLink/auth/login.php";
//================================== Forget Password ===============================//
  static const String checkEmail = "$serverLink/forgetpassword/checkemail.php";
  static const String verfiyCodeForgetPass ="$serverLink/forgetpassword/verfiycode.php";
  static const String resetPassword ="$serverLink/forgetpassword/resetpassword.php";
//================================== Home ===============================//
  static const String homePage = "$serverLink/home.php";
  static const String searchPage = "$serverLink/search.php";
  static const String senp = "$serverLink/s.php";
  static const String catPage = "$serverLink/categories/view.php";
  static const String catSerPage = "$serverLink/categories/glucategories.php";
  static const String glusSerPage = "$serverLink/categories/glusservies.php";
  static const String glusAdditions = "$serverLink/categories/glusadditions.php";
  static const String glusEvent = "$serverLink/cart/checkout/checkout_glusevent.php";
//================================== CART ===============================//
  static const String cardView = "$serverLink/cart/viewcard.php";
  static const String cardAdd = "$serverLink/cart/insertcart.php";
  static const String cardDelete = "$serverLink/cart/deletecart.php";
  static const String cardEdit = "$serverLink/cart/updatacart.php";
  static const String del = "$serverLink/cart/checkout/delete.php";
//================================== ORDERS ===============================//
  static const String checkOutAdd = "$serverLink/cart/checkout/insertcheckoutglu.php";
  static const String checkOutGlusAdd = "$serverLink/cart/checkout/checkoutglus.php";
  static const String orderView = "$serverLink/order/vieworder.php";
  static const String orderViewGlus = "$serverLink/order/vieworderglus.php";
  static const String orderDetView = "$serverLink/order/vieworderdet.php";
  //================================== Address ===============================//
  static const String addressView   = "$serverLink/address/view.php";
  static const String addressAdd    = "$serverLink/address/add.php";
  static const String addressEdit   = "$serverLink/address/edit.php";
  static const String addressDelete = "$serverLink/address/delete.php";
//================================== Address ===============================//
  static const String governoratesView   = "$serverLink/address/governorates/view.php";
  static const String governoratesAdd    = "$serverLink/address/governorates/add.php";
  static const String governoratesEdit   = "$serverLink/address/governorates/edit.php";
  static const String governoratesDelete = "$serverLink/address/governorates/delete.php";
//================================== Check Coupon ===============================//
  static const String couponView   = "$serverLink/coupon/checkcoupon.php";
//================================== Check Coupon ===============================//
  static const String notification   = "$serverLink/notification.php";
//================================== Favorite ===============================//
  static const String addFavorite       = "$serverLink/favorite/add.php";
  static const String deleteFavorite    = "$serverLink/favorite/delete.php";
  static const String deleteEndFavorite = "$serverLink/favorite/deleteend.php";
  static const String viewFavorite      = "$serverLink/favorite/view.php";
//================================== Booking ===============================//
  static const String addBooking       = "$serverLink/booking/add.php";
  static const String deleteBooking    = "$serverLink/booking/add.php";
  static const String viewBooking      = "$serverLink/booking/view.php";
//================================== ADMIN ===============================//
  static const String addCategories       = "$serverLinkAdmin/categories/add.php";
  static const String deleteCategories    = "$serverLinkAdmin/categories/delete.php";
  static const String addProduct      = "$serverLinkAdmin/product/addproduct.php";
  static const String deleteProduct      = "$serverLinkAdmin/product/deleteproduct.php";
  static const String addBanner      = "$serverLinkAdmin/banner/addbanner.php";
//================================== END ===============================//
}
