// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `عربي`
  String get arabic {
    return Intl.message(
      'عربي',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Featured`
  String get featured {
    return Intl.message(
      'Featured',
      name: 'featured',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Search by Name or Keyword`
  String get searchbynameorkeyword {
    return Intl.message(
      'Search by Name or Keyword',
      name: 'searchbynameorkeyword',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Zone`
  String get zone {
    return Intl.message(
      'Zone',
      name: 'zone',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Filter By`
  String get filterby {
    return Intl.message(
      'Filter By',
      name: 'filterby',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Click`
  String get click {
    return Intl.message(
      'Click',
      name: 'click',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Become a Service Provider`
  String get becomeaserviceprovider {
    return Intl.message(
      'Become a Service Provider',
      name: 'becomeaserviceprovider',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get inviteFriends {
    return Intl.message(
      'Invite Friends',
      name: 'inviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `Manage Address`
  String get manageAddress {
    return Intl.message(
      'Manage Address',
      name: 'manageAddress',
      desc: '',
      args: [],
    );
  }

  /// `My Favorites`
  String get myFavorites {
    return Intl.message(
      'My Favorites',
      name: 'myFavorites',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsconditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsconditions',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUS {
    return Intl.message(
      'Contact us',
      name: 'contactUS',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Searching...`
  String get searching {
    return Intl.message(
      'Searching...',
      name: 'searching',
      desc: '',
      args: [],
    );
  }

  /// `Location error. Please try again !`
  String get LocationErrorpleasetryagain {
    return Intl.message(
      'Location error. Please try again !',
      name: 'LocationErrorpleasetryagain',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message(
      'Help Center',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Certifications`
  String get Certifications {
    return Intl.message(
      'Certifications',
      name: 'Certifications',
      desc: '',
      args: [],
    );
  }

  /// `Working Hours`
  String get WorkingHours {
    return Intl.message(
      'Working Hours',
      name: 'WorkingHours',
      desc: '',
      args: [],
    );
  }

  /// `Specialities`
  String get Specialities {
    return Intl.message(
      'Specialities',
      name: 'Specialities',
      desc: '',
      args: [],
    );
  }

  /// `away`
  String get away {
    return Intl.message(
      'away',
      name: 'away',
      desc: '',
      args: [],
    );
  }

  /// `Km`
  String get Km {
    return Intl.message(
      'Km',
      name: 'Km',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Liked`
  String get liked {
    return Intl.message(
      'Liked',
      name: 'liked',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get projects {
    return Intl.message(
      'Projects',
      name: 'projects',
      desc: '',
      args: [],
    );
  }

  /// `No reviews Yet !`
  String get noreviewsyet {
    return Intl.message(
      'No reviews Yet !',
      name: 'noreviewsyet',
      desc: '',
      args: [],
    );
  }

  /// `No Projects Yet !`
  String get NoProjectsyet {
    return Intl.message(
      'No Projects Yet !',
      name: 'NoProjectsyet',
      desc: '',
      args: [],
    );
  }

  /// `Your favorites page is empty`
  String get Yourfavoritespageisempty {
    return Intl.message(
      'Your favorites page is empty',
      name: 'Yourfavoritespageisempty',
      desc: '',
      args: [],
    );
  }

  /// `Save your preferred professionals here. Mark profiles as\n favorites to easily access them later`
  String get Saveyourpreferredprofessionalshere {
    return Intl.message(
      'Save your preferred professionals here. Mark profiles as\n favorites to easily access them later',
      name: 'Saveyourpreferredprofessionalshere',
      desc: '',
      args: [],
    );
  }

  /// `No results match your filters`
  String get Noresultsmatchyourfilters {
    return Intl.message(
      'No results match your filters',
      name: 'Noresultsmatchyourfilters',
      desc: '',
      args: [],
    );
  }

  /// `Adjust your filters to find the professionals you're looking\n for`
  String get Adjustyourfilters {
    return Intl.message(
      'Adjust your filters to find the professionals you\'re looking\n for',
      name: 'Adjustyourfilters',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't find any matches for your search`
  String get Wecouldntfindanymatchesforyoursearch {
    return Intl.message(
      'We couldn\'t find any matches for your search',
      name: 'Wecouldntfindanymatchesforyoursearch',
      desc: '',
      args: [],
    );
  }

  /// `Try different keywords or browse our categories to find\n the professionals you're looking for`
  String get Trydifferentkeywords {
    return Intl.message(
      'Try different keywords or browse our categories to find\n the professionals you\'re looking for',
      name: 'Trydifferentkeywords',
      desc: '',
      args: [],
    );
  }

  /// `Find professionals you can rely on`
  String get Findprofessionalsyoucanrelyon {
    return Intl.message(
      'Find professionals you can rely on',
      name: 'Findprofessionalsyoucanrelyon',
      desc: '',
      args: [],
    );
  }

  /// `Search by name or Keyword to find what you \nare looking for`
  String get SearchbynameorKeywordtofindwhatyouarelookingfor {
    return Intl.message(
      'Search by name or Keyword to find what you \nare looking for',
      name: 'SearchbynameorKeywordtofindwhatyouarelookingfor',
      desc: '',
      args: [],
    );
  }

  /// `Become a service provider`
  String get Becomeaserviceprovider {
    return Intl.message(
      'Become a service provider',
      name: 'Becomeaserviceprovider',
      desc: '',
      args: [],
    );
  }

  /// `Call us for more information`
  String get Callusformoreinformation {
    return Intl.message(
      'Call us for more information',
      name: 'Callusformoreinformation',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP`
  String get invalidotp {
    return Intl.message(
      'Invalid OTP',
      name: 'invalidotp',
      desc: '',
      args: [],
    );
  }

  /// `You already have an account`
  String get alreadyhaveanaccount {
    return Intl.message(
      'You already have an account',
      name: 'alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get error {
    return Intl.message(
      'Failed',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidphonenumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidphonenumber',
      desc: '',
      args: [],
    );
  }

  /// `success`
  String get success {
    return Intl.message(
      'success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `OTP verified successfully`
  String get otpverefiedsuccessfully {
    return Intl.message(
      'OTP verified successfully',
      name: 'otpverefiedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `You have signed up successfully`
  String get signedupsuccessfuly {
    return Intl.message(
      'You have signed up successfully',
      name: 'signedupsuccessfuly',
      desc: '',
      args: [],
    );
  }

  /// `User updated successfully`
  String get userupdatedsuccessfully {
    return Intl.message(
      'User updated successfully',
      name: 'userupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `User name already exists`
  String get usernamealreadyexists {
    return Intl.message(
      'User name already exists',
      name: 'usernamealreadyexists',
      desc: '',
      args: [],
    );
  }

  /// `Please check your network connection`
  String get checknetwork {
    return Intl.message(
      'Please check your network connection',
      name: 'checknetwork',
      desc: '',
      args: [],
    );
  }

  /// `results found`
  String get resultsFound {
    return Intl.message(
      'results found',
      name: 'resultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Exit application`
  String get exit {
    return Intl.message(
      'Exit application',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the application?`
  String get areyousureyouwanttoexittheapp {
    return Intl.message(
      'Are you sure you want to exit the application?',
      name: 'areyousureyouwanttoexittheapp',
      desc: '',
      args: [],
    );
  }

  /// `Your current location`
  String get Yourcurrentlocation {
    return Intl.message(
      'Your current location',
      name: 'Yourcurrentlocation',
      desc: '',
      args: [],
    );
  }

  /// `Enter location manually`
  String get Enterlocation {
    return Intl.message(
      'Enter location manually',
      name: 'Enterlocation',
      desc: '',
      args: [],
    );
  }

  /// `Leave Review`
  String get LeaveReview {
    return Intl.message(
      'Leave Review',
      name: 'LeaveReview',
      desc: '',
      args: [],
    );
  }

  /// `Your overall rating`
  String get Youroverallrating {
    return Intl.message(
      'Your overall rating',
      name: 'Youroverallrating',
      desc: '',
      args: [],
    );
  }

  /// `Enter here`
  String get Enterhere {
    return Intl.message(
      'Enter here',
      name: 'Enterhere',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Oops!`
  String get ops {
    return Intl.message(
      'Oops!',
      name: 'ops',
      desc: '',
      args: [],
    );
  }

  /// `There is a connection error. Please check your internet\n and try again`
  String get noenternetconnection {
    return Intl.message(
      'There is a connection error. Please check your internet\n and try again',
      name: 'noenternetconnection',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryagain {
    return Intl.message(
      'Try Again',
      name: 'tryagain',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message(
      'Call',
      name: 'call',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
