class AppLink {
 
 static const String server             = "https://mohamedrahal.000webhostapp.com/ecommerce";
 static const String test               = "$server/test.php";
 static const String imagestatic        = "$server/upload";

// --------------------Auth-----------------
 static const String signup            = "$server/delivery/auth/signup.php";
 static const String verifycodesignup  = "$server/delivery/auth/verifycode.php";
 static const String login             = "$server/delivery/auth/login.php";
 static const String resend            = "$server/delivery/auth/resend.php";
// --------------------ForgetPassword---------
 static const String verifycoderesetpassword  = "$server/delivery/forgetpassword/verifycode.php";
 static const String checkemail               = "$server/delivery/forgetpassword/checkemail.php";
 static const String resetpassword            = "$server/delivery/forgetpassword/resetpassword.php";
 //-------------------Home------------------
 static const String homepage        = "$server/home.php";
 //-------------------Images----------------
 static const String imagestCategories       = "$imagestatic/categories";
 static const String imagestaticItems            = "$imagestatic/items";
 //-------------------Items-----------------
 static const String items        = "$server/items/items.php";
 static const String search        = "$server/items/search.php";
 //-------------------Favorite-----------------
 static const String favoriteAdd        = "$server/favorite/add.php";
 static const String favoriteRemove     = "$server/favorite/remove.php";
 static const String favoriteView       = "$server/favorite/view.php";
 static const String deletefromFavorite = "$server/favorite/deletefromfavorite.php";
 //-------------------Cart-----------------
 static const String cartview = "$server/cart/view.php";
 static const String cartadd = "$server/cart/add.php";
 static const String cartdelete = "$server/cart/delete.php";
 static const String cartgetcountitems = "$server/cart/getcountitems.php";
 // ------------------Address---------------
 static const String addressView = "$server/address/view.php";
 static const String addressAdd = "$server/address/add.php";
 static const String addressEdit = "$server/address/edit.php";
 static const String addressDelete = "$server/address/delete.php";
 //------------------Coupon------------------
 static const String checkcoupon  = "$server/coupon/checkcoupon.php";
 //------------------checkout------------------
 static const String pendingorders        = "$server/delivery/orders/pending.php";
 static const String accepted             = "$server/delivery/orders/accepted.php";
 static const String ordersarchive        = "$server/delivery/orders/archive.php";
 static const String ordersdetails        = "$server/delivery/orders/details.php";
 static const String approveorder         = "$server/delivery/orders/approve.php";
 static const String doneorder            = "$server/delivery/orders/done.php";
 //------------------notification------------------
 static const String notification      = "$server/notification.php";
 //------------------offers----------------------------------
 static const String offers      = "$server/offers.php";
 //------------------rating----------------------------------
 static const String rating      = "$server/rating.php";

}

//pass : i)e3EZySSAi(WNwt6pUe
//dbpass : ARH9DgU]&\6bep0D
