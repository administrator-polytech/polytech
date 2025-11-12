import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // homePage
  {
    '834mb8j8': {
      'en': 'Building Scalable &\nModern Digital\nSolutions',
      'ar': '',
    },
    'hp94fp0j': {
      'en':
          'We specialize in full-stack cross-platform development \n crafting web and mobile applications\ndesigned for growth, scalability, and performance.',
      'ar': '',
    },
    '6yg84bxf': {
      'en':
          'We are full-stack developers specializing in cross-platform application development with a core focus on scalability and flexibility. Our expertise lies in creating comprehensive internal systems for small and medium enterprises (SMEs), where we excel at transforming business requirements into robust, tailored solutions.\n\n\n\n',
      'ar': '',
    },
    'vt4mjuq6': {
      'en': '',
      'ar': '',
    },
    '8i2uk972': {
      'en': '',
      'ar': '',
    },
    'po7mtqtk': {
      'en':
          'Every application we develop is built from scratch to precisely match user requirements and business objectives. Our approach emphasizes rapid delivery when project vision and requirements are clearly defined, enabling SMEs to quickly implement systems that drive their operations forward.\n',
      'ar': '',
    },
    'tjitczl6': {
      'en': '',
      'ar': '',
    },
    'hb6t3v9y': {
      'en': '',
      'ar': '',
    },
    'keall2di': {
      'en': 'DEVELOPMENT EXPERTISE',
      'ar': '',
    },
    'v05liuo9': {
      'en': 'Full-stack cross-platform application development',
      'ar': '',
    },
    'gtu1ii4t': {
      'en': '',
      'ar': '',
    },
    'qwts5ona': {
      'en': 'Custom internal system architecture for SMEs',
      'ar': '',
    },
    '8555k8jh': {
      'en': '',
      'ar': '',
    },
    'lir7hmba': {
      'en': 'Scalable and flexible application design',
      'ar': '',
    },
    '2juhbo4r': {
      'en': '',
      'ar': '',
    },
    'qia1bek5': {
      'en': 'Rapid prototyping and development cycles',
      'ar': '',
    },
    '14w0oeo7': {
      'en': '',
      'ar': '',
    },
    'nocybkvf': {
      'en': 'TECHNICAL CAPABILITIES',
      'ar': '',
    },
    'f50s3g5a': {
      'en':
          'Cross-Platform Development: Modern frameworks for mobile and web applications',
      'ar': '',
    },
    '18v5gpqx': {
      'en': '',
      'ar': '',
    },
    'qzcks2of': {
      'en':
          'Backend Systems: Robust database management and cloud infrastructure',
      'ar': '',
    },
    'xbc4c0qw': {
      'en': '',
      'ar': '',
    },
    '2l60z6l4': {
      'en':
          'Security Implementation: Advanced authentication and API protection protocols and policies',
      'ar': '',
    },
    'zi1l7sub': {
      'en': '',
      'ar': '',
    },
    'o7j5jt5e': {
      'en':
          'Development Workflow: Professional version control and multi-environment systems',
      'ar': '',
    },
    'ey8hla3o': {
      'en': '',
      'ar': '',
    },
    '84c7ll83': {
      'en': 'METHODOLOGIES & PRACTICES',
      'ar': '',
    },
    'enooz4ad': {
      'en': 'Requirement-driven tailored solutions',
      'ar': '',
    },
    'pe8gj0qz': {
      'en': '',
      'ar': '',
    },
    'p6vx481a': {
      'en': 'Custom application development from scratch',
      'ar': '',
    },
    '82xepucu': {
      'en': '',
      'ar': '',
    },
    'tl2il00b': {
      'en': 'Collaborative design integration with UI/UX specialists',
      'ar': '',
    },
    '9q9casaw': {
      'en': '',
      'ar': '',
    },
    'lkepnq0c': {
      'en': 'Rapid prototyping and development cycles',
      'ar': '',
    },
    'gr1xz653': {
      'en': '',
      'ar': '',
    },
    '4gvbt1uj': {
      'en': 'SPECIALIZATION AREAS',
      'ar': '',
    },
    's7eyrkor': {
      'en': 'SME internal system development',
      'ar': '',
    },
    '1wqg8zl1': {
      'en': '',
      'ar': '',
    },
    '90b79boo': {
      'en': 'Scalable application architecture',
      'ar': '',
    },
    'x9v86c3a': {
      'en': '',
      'ar': '',
    },
    'e1v2eypm': {
      'en': 'Cross-platform mobile and web applications',
      'ar': '',
    },
    'kwlm6chh': {
      'en': '',
      'ar': '',
    },
    '0c0c5sv2': {
      'en': 'Modern, clean interface implementation',
      'ar': '',
    },
    'pam0muoz': {
      'en': '',
      'ar': '',
    },
    'pr3srbu6': {
      'en': '/CASE STUDIES',
      'ar': '',
    },
    'muotop2e': {
      'en': 'Latest Works',
      'ar': '',
    },
    'isyty2b4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // aboutUsPage
  {
    'ymbrqrwt': {
      'en': 'WHAT WE DO',
      'ar': '',
    },
    '10cgzock': {
      'en': 'ABOUT POLY TECH',
      'ar': '',
    },
    '8lho59ed': {
      'en':
          'At POLY TECH, we are full-stack developers dedicated to creating cross-platform solutions that help small and medium enterprises grow faster. From robust internal systems to user-friendly applications, we turn ideas into high-performing digital products.',
      'ar': '',
    },
    '4z26euzp': {
      'en': '/WHAT WE DO',
      'ar': '',
    },
    '6paaknza': {
      'en': 'OUR EXPERTISE',
      'ar': '',
    },
    'u0638il1': {
      'en':
          'Building powerful digital solutions that combine performance, scalability, and elegant design.',
      'ar': '',
    },
    '2lf1niki': {
      'en': 'Home',
      'ar': '',
    },
  },
  // contactUsPage
  {
    'kt3866px': {
      'en': 'CONNECT WITH US',
      'ar': '',
    },
    'y52iqhkx': {
      'en':
          'Ready to transform your ideas into powerful digital solutions?\n\nWhether you need a cutting-edge mobile app, responsive website, or custom software platform, our expert team is here to bring your vision to life.\n\nFrom initial concept to successful launch, we build digital experiences that engage users and drive results.',
      'ar': '',
    },
    'wclly34t': {
      'en': 'Contact us on Whatsapp',
      'ar': '',
    },
    'fmf6j42u': {
      'en': 'OR',
      'ar': '',
    },
    'w268fusc': {
      'en': 'Fill out the form below',
      'ar': '',
    },
    '4jzmq0f9': {
      'en': 'CONTACT FORM',
      'ar': '',
    },
    'kysnzgs9': {
      'en': 'NAME',
      'ar': '',
    },
    '4dtefo58': {
      'en': 'EMAIL',
      'ar': '',
    },
    '97787707': {
      'en': 'PHONE',
      'ar': '',
    },
    '7ha7zqnt': {
      'en': 'SUBJECT',
      'ar': '',
    },
    '6o5mf5di': {
      'en': 'MESSAGE',
      'ar': '',
    },
    'kr2v82k5': {
      'en': 'Tell us what you need. We’ll take it from there.',
      'ar': '',
    },
    'tryxum9v': {
      'en': 'CONNECT',
      'ar': '',
    },
    'bbfxjgtp': {
      'en': 'I have read',
      'ar': '',
    },
    '0skd746g': {
      'en': 'Privacy Notice',
      'ar': '',
    },
    'g1er5a63': {
      'en': 'I agree to receive updates from POLY TECH.',
      'ar': '',
    },
    'n41vldv1': {
      'en': 'NAME is required',
      'ar': '',
    },
    '68l8q2cu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qfjvfyo8': {
      'en': 'EMAIL is required',
      'ar': '',
    },
    '9zmh8zb0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0yc0vdow': {
      'en': 'PHONE is required',
      'ar': '',
    },
    '79x1wq3l': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1aciugep': {
      'en': 'SUBJECT is required',
      'ar': '',
    },
    'wjrmzs55': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'w0wyidlh': {
      'en': 'MESSAGE is required',
      'ar': '',
    },
    'ci10dam7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1s6r23nk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // appBar
  {
    'dcd8ayqn': {
      'en': 'HOME',
      'ar': '',
    },
    'lk7moeva': {
      'en': 'ABOUT US',
      'ar': '',
    },
    'k3vofr9v': {
      'en': 'CONTACT US',
      'ar': '',
    },
    '5a43e6cs': {
      'en': 'Get In Touch',
      'ar': '',
    },
  },
  // footer
  {
    'p20abiyy': {
      'en': 'Ready to bring your vision to life?',
      'ar': '',
    },
    '87ulc8gt': {
      'en':
          'Whether you need a cutting-edge mobile app, responsive website, or custom software platform, our expert team is here to bring your vision to life.\nFrom initial concept to successful launch, we build digital experiences that engage users and drive results.\n',
      'ar': '',
    },
    'so0h7abk': {
      'en': '+',
      'ar': '',
    },
    'p6b9nrci': {
      'en': '+',
      'ar': '',
    },
    'w9evvcsr': {
      'en': '+',
      'ar': '',
    },
    '5bknln3k': {
      'en': '/EMAIL',
      'ar': '',
    },
    'zyah2yfr': {
      'en': 'INFO@POLYTECH.AE',
      'ar': '',
    },
    'zxtnia1o': {
      'en': '/PHONE',
      'ar': '',
    },
    '9mo39t2a': {
      'en': '+971 54 339 2924',
      'ar': '',
    },
    'hycfdkmt': {
      'en': '/NAVIGATION',
      'ar': '',
    },
    'x6q5cegv': {
      'en': 'HOME',
      'ar': '',
    },
    '6lkuexp0': {
      'en': 'ABOUT US',
      'ar': '',
    },
    'fenm6f9r': {
      'en': 'CONTACT US',
      'ar': '',
    },
    'v52zht9k': {
      'en': '/LEGAL',
      'ar': '',
    },
    'yetfoucg': {
      'en': 'TERMS OF SERVICES',
      'ar': '',
    },
    '180h8vjj': {
      'en': 'PRIVACY POLICY',
      'ar': '',
    },
    '0ywxteae': {
      'en': '/FOLLOW US',
      'ar': '',
    },
    'pya3ffl3': {
      'en': 'X/TWITTER',
      'ar': '',
    },
    'kc8co1g1': {
      'en': 'INSTAGRAM',
      'ar': '',
    },
    'c6ouka9t': {
      'en': 'LINKEDIN',
      'ar': '',
    },
    'w35vee02': {
      'en': 'YOUTUBE',
      'ar': '',
    },
    'opsy6b02': {
      'en': 'WHATSAPP',
      'ar': '',
    },
    'kjq1nv0e': {
      'en': '@2025 POLY TECH. ALL RIGHTS RESERVED.',
      'ar': '',
    },
  },
  // drawer
  {
    '6b1ar01o': {
      'en': 'HOME',
      'ar': '',
    },
    'pauynw6q': {
      'en': 'ABOUT US',
      'ar': '',
    },
    'nm0g5zu3': {
      'en': 'CONTACT US',
      'ar': '',
    },
    '2fmotnlx': {
      'en': 'Get In Touch',
      'ar': '',
    },
  },
  // contactUsDialog
  {
    '90v6fe84': {
      'en': 'GET IN TOUCH',
      'ar': '',
    },
    'xr8oimth': {
      'en': 'Contact us in Whatsapp‏‏‎ ‎‏‏‎ ‎‏‏‎‏‏‎ ',
      'ar': '',
    },
    'qrv9lqgq': {
      'en':
          'Send an inquiry‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ‎‏‏‎ ',
      'ar': '',
    },
  },
  // PrivacyPolicy
  {
    '7w0bbk1m': {
      'en': 'POLYTECH PRIVACY POLICY',
      'ar': '',
    },
    'pqz1xwqu': {
      'en':
          'PRIVACY POLICY\n\nLast Updated: November 2025\nEffective Date: [INSERT EFFECTIVE DATE]\n\n================================================================================\n\nINTRODUCTION\n\nThis Privacy Policy explains how [Your Company Name] (\"Company,\" \"we,\" \"us,\" or \"our\") collects, uses, stores, and protects personal information submitted through our application\'s Contact Us form and related communication channels (the \"Service\"). This policy applies to all users regardless of jurisdiction, including those in the European Union, California, Virginia, and other regions with privacy protections.\n\nBy submitting information through our Contact Us form, you acknowledge that you have read, understood, and agree to be bound by this Privacy Policy.\n\n================================================================================\n\n1. WHO WE ARE AND HOW TO CONTACT US\n\n1.1 Data Controller\nThe data controller responsible for your personal information is:\n\n[Your Company Name]\n[Your Company Street Address]\n[City, State/Province, Postal Code]\n[Country]\n\nEmail: [your-privacy@yourdomain.com]\nPhone: [Your Phone Number]\nWebsite: [Your Website URL]\n\n1.2 Data Protection Officer\nIf applicable in your region:\n[DPO Name]\nEmail: [DPO Email Address]\nPhone: [DPO Phone Number]\n\n1.3 Legal Representative\nFor users in the European Union:\n[Representative Name and Contact Information]\n\n================================================================================\n\n2. INFORMATION WE COLLECT\n\n2.1 Information You Provide Directly\nWhen you complete our Contact Us form, you may provide us with the following personal information:\n\n- Full name (required)\n- Email address (required)\n- Phone number (optional)\n- Company or organization name (optional)\n- Subject or topic of your inquiry (required)\n- Message content and details (required)\n- Any attachments, files, or additional documents you upload\n\nYou are not required to provide this information, but without it we cannot respond to your inquiry.\n\n2.2 Information We Collect Automatically\nWhen you access or use our Service, we automatically collect:\n\n- Internet Protocol (IP) address\n- Browser type and version\n- Operating system\n- Date and time of form submission\n- Pages or sections of our Service you access\n- Referrer website information\n- Device identifiers and type\n- Cookie data\n- Usage patterns and interaction data\n\nThis information is collected through cookies, web beacons, pixels, and similar tracking technologies.\n\n2.3 Information We Do Not Collect\nUnless you explicitly provide it, we do not collect:\n\n- Payment or financial information\n- Sensitive personal data including but not limited to race or ethnic origin, political opinions, religious or philosophical beliefs, trade union membership, genetic data, biometric data for identification purposes, health information, or data concerning sex life or sexual orientation\n- Information from users under 13 years of age\n- Biometric data or facial recognition information\n\n================================================================================\n\n3. WHY WE COLLECT YOUR INFORMATION\n\nWe collect and process your personal information for the following specific purposes:\n\n3.1 Primary Purposes\n- Responding to your inquiries and requests for information\n- Providing the services or information you have requested\n- Maintaining correspondence and communication with you\n- Delivering support and technical assistance\n\n3.2 Operational Purposes\n- Improving the functionality and user experience of our Service\n- Monitoring form performance and reliability\n- Analyzing usage patterns and trends\n- Testing new features and enhancements\n- Troubleshooting technical issues\n\n3.3 Security and Compliance Purposes\n- Detecting, investigating, and preventing fraud or unauthorized activity\n- Protecting against security threats and cyberattacks\n- Enforcing our Terms of Service and other legal agreements\n- Complying with applicable laws, regulations, and legal processes\n- Establishing, defending, or exercising legal claims\n- Maintaining records for audit and accountability purposes\n\n3.4 Business Purposes\n- Managing customer relationships\n- Creating and maintaining business records\n- Conducting quality assurance and performance reviews\n- Risk assessment and management\n- Business development and strategic planning\n\n================================================================================\n\n4. LEGAL BASIS FOR PROCESSING YOUR INFORMATION\n\nWe process your personal information based on one or more of the following legal grounds:\n\n4.1 Contract Performance\nWe process information necessary to respond to your inquiry and fulfill your request through the Contact Us form. This is required to perform our obligations to you.\n\n4.2 Your Consent\nBy submitting the Contact Us form, you provide explicit consent to the collection and processing of your personal information as described in this Privacy Policy.\n\n4.3 Legitimate Interests\nWe process information based on our legitimate business interests, including:\n\n- Protecting our Service from fraud, security threats, and abuse\n- Improving our products and services\n- Maintaining accurate business records\n- Communicating important information about service changes or issues\n- Understanding user needs and preferences\n- Defending against legal claims\n- Ensuring compliance with applicable laws\n\nWe have balanced these interests against your privacy rights and determined that our processing does not override those rights.\n\n4.4 Legal Obligations\nWe may process information when required by applicable law, court order, government request, regulatory authority demand, or other legal requirement.\n\n4.5 Vital Interests\nIn rare circumstances, we may process information where necessary to protect the vital interests of individuals, such as physical safety or health.\n\n================================================================================\n\n5. HOW WE SHARE YOUR INFORMATION\n\n5.1 Information We Do Not Share\n- We do not sell your personal information to third parties\n- We do not share your information for commercial marketing purposes without your consent\n- We do not trade or exchange your information for value\n- We do not rent or lease your personal data\n- We comply with the CCPA requirement to opt out of data sales by default\n\n5.2 Third-Party Service Providers\nWe work with carefully selected third-party service providers who process personal information on our behalf:\n\nService Provider Type: Email Service Provider\nName: [Email Service Provider Name]\nPurpose: Sending email responses to your inquiries\nLegal Basis: Data Processing Agreement (DPA) in place\n\nService Provider Type: Cloud Backend Services\nName: [Cloud Provider Name, e.g., Supabase]\nPurpose: Secure data storage, database management, and infrastructure\nLegal Basis: Data Processing Agreement (DPA) in place\n\nService Provider Type: Email Delivery Service\nName: [Email Service Provider Name]\nPurpose: Transactional email delivery and tracking\nLegal Basis: Data Processing Agreement (DPA) in place\n\nService Provider Type: Analytics Platform\nName: [Analytics Provider Name, if applicable]\nPurpose: Understanding form usage and performance\nLegal Basis: Data Processing Agreement (DPA) in place\n\nAll service providers are contractually required to:\n- Process data only on our documented instructions\n- Implement appropriate technical and organizational security measures\n- Not disclose information to unauthorized third parties\n- Not use information for their own purposes\n- Delete or return information upon contract termination\n- Notify us of any data breaches or security incidents\n\n5.3 Legal and Regulatory Disclosures\nWe may disclose your personal information when:\n\n- Required by law, court order, or government authority\n- Necessary to enforce our Terms of Service or other legal agreements\n- Required to protect the safety, rights, or property of the Company, users, or the public\n- Necessary to detect, investigate, prevent, or address fraud, security incidents, or abuse\n- Required by regulatory or investigative agencies\n- Necessary to establish, defend, or exercise legal claims\n- Required by subpoena, warrant, or similar legal process\n\n5.4 Business Transitions\nIn the event of a merger, acquisition, bankruptcy, asset sale, or similar business transaction, your personal information may be transferred as part of that transaction. We will provide notice of any such change and the choices you may have regarding your information.\n\n5.5 Anonymized and Aggregated Data\nWe may share anonymized and aggregated data (data that cannot identify individuals) for:\n- Research and analytics\n- Industry benchmarking\n- Marketing and business development\n- Public reporting and statistics\n- Third-party research without restriction\n\n================================================================================\n\n6. HOW LONG WE KEEP YOUR INFORMATION\n\n6.1 Standard Retention Periods\n\nContact Information (name, email, phone number):\nRetained for up to 3 years from the date of submission, or as required by applicable law, whichever is longer.\n\nMessage Content and Inquiry Details:\nRetained for up to 2 years from the date the inquiry is resolved or the relationship ends.\n\nIP Address and Technical Data:\nRetained for up to 90 days for security monitoring and fraud prevention purposes.\n\nCookies and Tracking Information:\nRetained according to cookie policy settings, typically 1-2 years.\n\nAnalytics and Usage Data:\nRetained for up to 12 months in anonymized or aggregated form.\n\n6.2 Extended Retention\nWe may retain your information beyond standard retention periods if:\n\n- Required by applicable law, regulation, or government authority\n- Necessary for pending, threatened, or ongoing litigation\n- Required for tax, accounting, or financial purposes\n- Necessary to investigate security incidents, fraud, or abuse\n- Subject to a legal hold by law enforcement or regulatory body\n- Necessary to establish, defend, or exercise legal claims\n\n6.3 Deletion Upon Your Request\nYou may request deletion of your personal information. Upon submission of a verified deletion request, we will delete your information within 30 days, unless:\n\n- Retention is required by law or regulation\n- Your information is necessary to resolve an outstanding inquiry\n- Your information is relevant to pending litigation or claims\n- Your information is necessary for fraud investigation or security purposes\n- Other legal exceptions apply\n\n================================================================================\n\n7. YOUR PRIVACY RIGHTS AND HOW TO EXERCISE THEM\n\nYour rights vary depending on your location. Below is a summary of rights that may apply to you.\n\n7.1 Rights for European Union and EEA Residents (GDPR)\n\nRight to Access:\nYou have the right to request a copy of the personal information we hold about you. We will provide this information in a structured, commonly-used, machine-readable format within 30 days of your verified request.\n\nRight to Rectification:\nYou have the right to correct any inaccurate, incomplete, or outdated personal information we hold. We will make corrections within 30 days of your request.\n\nRight to Erasure (Right to Be Forgotten):\nYou have the right to request deletion of your personal information, except where:\n- Processing is necessary to perform a contract with you\n- Processing is required by applicable law\n- Processing is necessary to establish, exercise, or defend legal claims\n- Processing is necessary for public interest or official authority functions\n\nWe will process erasure requests within 30 days where legally permitted.\n\nRight to Restrict Processing:\nYou may request that we limit processing of your information where:\n- You contest the accuracy of your data\n- Processing is unlawful and you object to deletion\n- We no longer need the data for the original purpose\n- You have objected to processing based on legitimate interest\n\nRight to Data Portability:\nYou have the right to receive your personal information in a portable, machine-readable format and to transmit it to another data controller, where processing is based on your consent or a contract.\n\nRight to Object:\nYou have the right to object to processing of your information based on our legitimate interests or for direct marketing purposes. We will cease processing unless we can demonstrate compelling legitimate grounds or legal obligations.\n\nRight to Withdraw Consent:\nWhere processing is based on your consent, you may withdraw that consent at any time. Withdrawal does not affect the lawfulness of processing based on consent before withdrawal.\n\nRights Related to Automated Decision-Making:\nYou have rights concerning any automated decision-making or profiling that would produce legal effects. We do not engage in solely automated decision-making with legal effects on individuals.\n\n7.2 Rights for California Residents (CCPA/CPRA)\n\nRight to Know:\nYou have the right to request what personal information we collect, how we use it, and who we share it with.\n\nRight to Delete:\nYou have the right to request deletion of personal information we have collected from you, subject to exceptions where retention is necessary for business or legal purposes.\n\nRight to Opt-Out of Sale or Sharing:\nYou have the right to opt out of the sale or sharing of your personal information for targeted advertising. We do not engage in the sale or sharing of personal information and opt out by default.\n\nRight to Correct:\nYou have the right to request correction of inaccurate personal information.\n\nRight to Limit Use and Disclosure:\nYou have the right to limit our use of your sensitive personal information to purposes necessary to provide the services you requested or as otherwise permitted by law.\n\nRight to Non-Discrimination:\nWe will not discriminate against you for exercising your privacy rights. We will not deny goods or services, charge different prices, or provide different service quality based solely on your exercise of CCPA/CPRA rights.\n\n7.3 Rights for Virginia Residents (Virginia CDPA)\n\nVirginia residents have the right to:\n- Confirm processing of personal data and access your information\n- Request deletion or correction of personal information\n- Opt out of targeted advertising\n- Opt out of sale of personal data\n- Appeal our decision regarding your rights request\n\n7.4 Rights for Other Jurisdictions\n\nIf you reside in another jurisdiction with privacy protections (such as Canada PIPEDA, Australia Privacy Act, or others), you have similar rights. Contact us for information specific to your location.\n\n7.5 How to Exercise Your Rights\n\nTo exercise any of the rights listed above, please submit a written request to:\n\nEmail: [your-privacy@yourdomain.com]\nMailing Address:\n[Your Company Name]\n[Your Company Address]\n[City, State/Province, Postal Code]\n[Country]\n\nPhone: [Your Phone Number]\n\nYour request should include:\n- Your full name and contact information\n- Specific right you wish to exercise (access, deletion, correction, etc.)\n- Clear description of your request\n- Any relevant identifying information (email address used, date of submission, etc.)\n- Your signature or confirmation that you are making the request\n\n7.6 Verification of Identity\nTo protect your privacy and security, we may request reasonable verification of your identity before processing your request. Requests that cannot be verified may be denied. We may also ask clarifying questions about your request.\n\n7.7 Response Timeline\nWe will respond to your request within the following timeframes:\n\nEuropean Union (GDPR): 30 days (extendable by up to 60 additional days for complex requests)\nCalifornia (CCPA/CPRA): 45 days (extendable by up to 45 additional days for difficult requests)\nVirginia (CDPA): 45 days\nOther Jurisdictions: Within reasonable timeframe as required by applicable law\n\nIf we deny your request, we will provide reasons for the denial.\n\n================================================================================\n\n8. CHILDREN\'S PRIVACY AND COMPLIANCE\n\n8.1 Age Restrictions\nOur Service is not directed to, and we do not knowingly collect personal information from, children under 13 years of age.\n\n8.2 COPPA Compliance\nWe comply with the Children\'s Online Privacy Protection Act (COPPA). If we become aware that we have collected personal information from a child under 13 without verifiable parental consent, we will promptly delete such information.\n\n8.3 Parental Notification\nIf you are a parent, guardian, or educator and believe we have collected information from a child under 13, please contact us immediately at [your-privacy@yourdomain.com]. We will investigate and delete the information if appropriate.\n\n8.4 Teen Privacy (Ages 13-18)\nFor users between 13 and 18 years of age, we provide enhanced privacy protections under applicable law, including GDPR Article 8 for EU users. Parents or guardians may exercise privacy rights on behalf of teens where required by law.\n\n================================================================================\n\n9. COOKIES AND TRACKING TECHNOLOGIES\n\n9.1 What Are Cookies?\nCookies are small files stored on your device that contain information about your interaction with our Service. We use cookies to:\n\n- Maintain your form session and authentication\n- Remember your preferences and settings\n- Prevent security threats and fraud\n- Analyze form performance and usage patterns\n- Track conversion and success rates\n\n9.2 Types of Cookies We Use\n\nEssential Cookies:\nRequired for the form to function properly. These include session cookies and security cookies. No user consent is required for essential cookies.\n\nAnalytics Cookies:\nHelp us understand how users interact with our form. These cookies track page views, form submissions, and user behavior. User consent is required.\n\nFunctional Cookies:\nRemember your preferences and choices to improve your experience. User consent is required.\n\nMarketing Cookies:\nUsed to track advertising performance and user interests. We do not use marketing cookies without your explicit opt-in consent.\n\n9.3 Third-Party Cookies\nThird-party service providers may place cookies on your device for:\n- Email tracking (open rates, clicks)\n- Analytics and performance monitoring\n- Security and fraud detection\n\n9.4 Cookie Control and Management\nYou can control cookies through your browser settings:\n- Delete existing cookies\n- Block new cookies from being set\n- Allow cookies from specific sites only\n- Disable cookies entirely\n\nHowever, disabling essential cookies may prevent our form from functioning properly. You can manage cookie preferences by:\n- Visiting your browser settings\n- Using browser extensions that manage cookies\n- Contacting us for personalized cookie settings\n\n9.5 Do Not Track Signals\nSome browsers include a \"Do Not Track\" feature. Currently, there is no industry standard for recognizing Do Not Track signals. We do not respond to Do Not Track browser signals, but you can control cookies through your browser settings.\n\n9.6 Similar Tracking Technologies\nIn addition to cookies, we may use:\n- Web beacons and pixels for tracking email opens and clicks\n- Local storage for session management\n- Web storage APIs for caching\n- Similar technologies for analytics and security\n\n================================================================================\n\n10. DATA SECURITY AND PROTECTION\n\n10.1 Technical Security Measures\nWe implement industry-standard technical safeguards to protect your personal information:\n\nEncryption in Transit:\nAll data transmitted between your device and our servers is encrypted using SSL/TLS technology. Look for \"https://\" and a lock icon in your browser address bar.\n\nEncryption at Rest:\nPersonal information stored on our servers is encrypted using advanced encryption standards (AES-256 or equivalent).\n\nAccess Controls:\nWe implement strict role-based access controls limiting employee and contractor access to only the minimum personal information necessary for their role.\n\nSecure Infrastructure:\nData is hosted on secure, monitored cloud servers with redundancy and failover protection. Our infrastructure providers comply with SOC 2, ISO 27001, and equivalent standards.\n\nFirewalls and Network Protection:\nOur systems are protected by firewalls, intrusion detection systems, and continuous network monitoring.\n\nRegular Security Audits:\nWe conduct periodic penetration testing, vulnerability assessments, and security audits. We address any identified weaknesses promptly.\n\n10.2 Organizational Security Measures\n\nEmployee Training:\nAll employees receive regular data protection, privacy, and security training. New hires complete mandatory privacy training before accessing personal information.\n\nConfidentiality Agreements:\nAll employees, contractors, and third-party service providers sign strict confidentiality and data protection agreements.\n\nAccess Logging:\nWe maintain comprehensive audit trails of all personal information access and use. Access logs are reviewed regularly for suspicious activity.\n\nData Minimization:\nWe collect only the minimum personal information necessary for stated purposes. We delete information when no longer needed.\n\nIncident Response:\nWe maintain an incident response plan to address security breaches or data loss events. We investigate incidents promptly and notify affected individuals as required by law.\n\n10.3 Important Security Disclaimer\n\nWHILE WE IMPLEMENT REASONABLE AND APPROPRIATE SECURITY MEASURES, NO SYSTEM OR INTERNET TRANSMISSION IS COMPLETELY SECURE. ABSOLUTE SECURITY CANNOT BE GUARANTEED.\n\nYou acknowledge and accept that:\n- Data transmission over the internet carries inherent security risks\n- Unauthorized access, disclosure, or modification of information may occur despite our efforts\n- We cannot guarantee that personal information will not be accessed, used, or disclosed by unauthorized persons\n- Your use of our Service indicates acceptance of these security risks\n\n================================================================================\n\n11. INTERNATIONAL DATA TRANSFERS\n\n11.1 Data Transfer Mechanisms\nIf we transfer your personal information outside your country of residence, we ensure appropriate safeguards are in place:\n\nStandard Contractual Clauses:\nWe use European Commission approved Standard Contractual Clauses (SCCs) for transfers out of the European Union.\n\nAdequacy Determinations:\nWe transfer data only to jurisdictions determined by relevant authorities to provide adequate data protection.\n\nYour Explicit Consent:\nWe obtain your explicit consent before transferring data to countries without adequate protection.\n\n11.2 Transfers Outside the EU/EEA\nPersonal information may be transferred to and processed in countries outside the European Union and EEA, including the United States. These jurisdictions may have different privacy laws than your home country.\n\nBy using our Service, you consent to such transfers. We ensure appropriate safeguards are in place to protect your information.\n\n11.3 For California Residents\nWe may transfer your personal information to service providers in other states or countries. We ensure these providers comply with CCPA requirements and applicable privacy laws.\n\n================================================================================\n\n12. THIRD-PARTY LINKS AND SERVICES\n\n12.1 Third-Party Websites\nOur Service may contain links to third-party websites, applications, and services that are not operated by us. This Privacy Policy does not apply to third-party websites.\n\nWe are not responsible for:\n- The privacy practices of third-party websites\n- The security of third-party sites\n- The content or accuracy of third-party services\n\n12.2 Before Visiting Third-Party Sites\nWhen you click links to third-party websites:\n- Review their privacy policy before providing information\n- Understand their data handling practices\n- Be aware that we have no control over their practices\n- We are not responsible for their privacy or security\n\n12.3 Social Media Links\nIf you access our Service through social media (Facebook, LinkedIn, Twitter, etc.), their terms and privacy policies apply to your social media account.\n\n================================================================================\n\n13. CALIFORNIA PRIVACY RIGHTS NOTICE\n\n13.1 CCPA/CPRA Notice at Collection\nAt the time of collection, California residents should be aware:\n\n- We collect personal information about you\n- We use this information to respond to your inquiry and provide our Service\n- We do not sell your information\n- You have rights under CCPA/CPRA including access, deletion, correction, and opt-out rights\n- Providing information is voluntary but necessary to respond to your inquiry\n\n13.2 California Shine the Light\nUnder California Civil Code Section 1798.83, California residents may request information about the disclosure of personal information to third parties for their direct marketing purposes.\n\nWe do not disclose personal information to third parties for their direct marketing purposes.\n\n13.3 California CPRA Opt-Out of Sale or Sharing\nUnder CCPA and CPRA, California residents have the right to opt out of the sale or sharing of personal information. We do not sell or share personal information, so no opt-out action is needed. However, you can submit an opt-out request by emailing us at [your-privacy@yourdomain.com].\n\n================================================================================\n\n14. VIRGINIA PRIVACY RIGHTS NOTICE\n\n14.1 CDPA Consumer Rights\nVirginia residents have the following consumer rights under the Virginia Consumer Data Protection Act (CDPA):\n\nRight to Confirm and Know:\nRight to confirm whether we process personal data and access that data.\n\nRight to Correction and Deletion:\nRight to correct or delete personal data.\n\nRight to Opt-Out:\nRight to opt out of targeted advertising or sale of personal data.\n\nRight to Appeal:\nRight to appeal our decision regarding your privacy rights request.\n\n14.2 Consumer Preferences Signals\nWe honor consumer preference signals sent through opt-out mechanisms, including browser-based signals and universal opt-out preference signals.\n\n================================================================================\n\n15. LIMIT TO DATA USE FOR SENSITIVE INFORMATION\n\nIf you provide sensitive personal information (including precise geolocation, health information, genetic data, or biometric data), we limit our use and disclosure of that information to:\n\n- Purposes you explicitly authorize\n- Purposes necessary to provide the Service you requested\n- Purposes permitted by applicable law\n- Fraud prevention and security\n- Legal compliance\n\nWe do not use sensitive information for targeted advertising, profiling, or other purposes outside the scope of your request.\n\n================================================================================\n\n16. PRIVACY POLICY CHANGES AND UPDATES\n\n16.1 Policy Modifications\nWe may update this Privacy Policy periodically to reflect:\n- Changes in our data handling practices\n- New features or services\n- Changes in applicable privacy laws\n- Other operational or business changes\n\n16.2 Notification of Changes\nWhen we make material changes to this Privacy Policy, we will:\n- Update the \"Last Updated\" date at the top\n- Notify you via email if you provided an email address\n- Post a prominent notice on our website or Service\n- Require your acceptance of the updated policy\n\n16.3 Continued Use Equals Acceptance\nYour continued use of our Service after changes become effective indicates your acceptance of the updated Privacy Policy. We encourage you to review this policy regularly.\n\n16.4 Version History\nCurrent Version: 1.0\nLast Updated: November 2025\nEffective Date: [INSERT DATE]\n\nEarlier versions are available upon request.\n\n================================================================================\n\n17. DATA PROTECTION IMPACT ASSESSMENT\n\nWe have conducted a Data Protection Impact Assessment (DPIA) in compliance with GDPR Article 35. Our assessment determined:\n\n- Data processing poses limited privacy risk to individuals\n- Appropriate technical and organizational safeguards are in place\n- Regular audits and updates are conducted\n- Individuals\' privacy rights are appropriately protected\n\nA summary of our DPIA is available upon request for regulatory compliance verification.\n\n================================================================================\n\n18. LIMIT OF LIABILITY AND DISCLAIMERS\n\n18.1 Service Provided As-Is\nTHE SERVICE AND ALL RELATED DATA HANDLING ARE PROVIDED ON AN \"AS-IS\" BASIS WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. WE DISCLAIM ALL WARRANTIES INCLUDING MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.\n\n18.2 Limitation of Liability\nTO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW:\n\nOur total liability for all claims arising from or related to this Privacy Policy, your use of the Service, or our data handling practices shall not exceed one hundred dollars (\$100 USD) or the total amount you have paid to us in the past 12 months, whichever is greater.\n\nWe are not liable for:\n- Indirect, incidental, special, consequential, or punitive damages\n- Loss of profits, revenue, data, or business opportunity\n- Loss of goodwill or reputation\n- Cost of substitute goods or services\n- Data loss or corruption regardless of cause\n- Unauthorized access despite our reasonable security measures\n- Delays or failures in processing your rights requests\n\nEven if we have been advised of the possibility of such damages.\n\n18.3 No Liability for Third Parties\nWe are not responsible for:\n- Third-party data processors\' actions or negligence\n- Unauthorized access by malicious third parties\n- User negligence or misuse of our Service\n- Loss caused by user failure to protect passwords or credentials\n\n18.4 Force Majeure\nWe are not liable for failures, delays, or disruptions caused by events beyond our reasonable control, including:\n- Acts of God or natural disasters\n- War, terrorism, or civil unrest\n- Pandemics or epidemics\n- Government actions or restrictions\n- Internet infrastructure failures\n- Power outages or utility failures\n- Strikes or labor actions\n\n================================================================================\n\n19. INDEMNIFICATION\n\nYou agree to indemnify and hold harmless the Company from any and all claims, damages, costs, and attorney\'s fees arising from:\n- Your submission of false, misleading, or unauthorized information through our Contact Us form\n- Your violation of this Privacy Policy or applicable laws\n- Your misuse of our Service\n- Infringement of intellectual property rights through your submissions\n- Your breach of any terms or conditions\n\nThis indemnification does not apply where we are solely responsible for damages.\n\n================================================================================\n\n20. DATA PROCESSORS AND SUBPROCESSORS\n\n20.1 List of Data Processors\nBelow is our current list of third-party data processors and subprocessors:\n\nEmail Service Provider: [Name]\nData Processing Agreement in place: Yes\nPurpose: Sending email responses\nSubprocessors: [List any subprocessors]\n\nCloud Backend: [Name, e.g., Supabase]\nData Processing Agreement in place: Yes\nPurpose: Data storage and infrastructure\nSubprocessors: [List any subprocessors]\n\nAnalytics Service: [Name, if applicable]\nData Processing Agreement in place: Yes\nPurpose: Usage analytics and performance monitoring\nSubprocessors: [List any subprocessors]\n\n20.2 Changes to Processors\nWe may change our data processors. We will notify you of material changes via email or prominent notice on our Service. Your continued use indicates acceptance of new processors.\n\n20.3 Processor Requirements\nAll processors are contractually required to:\n- Process data only on our documented instructions\n- Implement appropriate security safeguards equivalent to our standards\n- Not disclose data to unauthorized parties\n- Not use data for their own purposes\n- Comply with GDPR, CCPA, COPPA, and applicable privacy laws\n- Notify us immediately of any data breaches\n- Return or delete data upon contract termination\n\n================================================================================\n\n21. LAWFUL BASIS FOR PROCESSING\n\nWe process your personal data under the following lawful bases:\n\nContract Performance (GDPR Article 6(1)(b)):\nProcessing necessary to respond to your inquiry and fulfill your request.\n\nLegitimate Interests (GDPR Article 6(1)(f)):\nProcessing based on our legitimate business interests including security, fraud prevention, service improvement, and legal compliance. We have conducted a Legitimate Interest Assessment determining our interests do not override your privacy rights.\n\nYour Consent (GDPR Article 7):\nBy submitting the form, you provide explicit consent to processing.\n\nLegal Obligation (GDPR Article 6(1)(c)):\nProcessing where required by law, court order, or regulatory authority.\n\nVital Interests (GDPR Article 6(1)(d)):\nProcessing where necessary to protect vital interests of individuals or the public.\n\nPublic Interest (GDPR Article 6(1)(e)):\nProcessing where necessary for public interest or official authority functions.\n\n================================================================================\n\n22. CONTACT US REGARDING PRIVACY MATTERS\n\n22.1 Privacy Inquiries and Requests\nFor questions, concerns, requests to exercise your privacy rights, or to report privacy violations:\n\nEmail: [your-privacy@yourdomain.com]\nPhone: [Your Phone Number]\nMailing Address:\n[Your Company Name]\n[Your Company Address]\n[City, State/Province, Postal Code]\n[Country]\n\nExpected Response Time: Within 14 business days\n\n22.2 Data Protection Officer Contact\nIf you have appointed a Data Protection Officer:\nName: [DPO Name]\nEmail: [DPO Email]\nPhone: [DPO Phone]\n\n22.3 Regulatory Authority Complaints\nYou have the right to lodge a complaint with the applicable data protection authority:\n\nFor EU/EEA Residents:\nContact your local Data Protection Authority (see ico.org.uk for UK resources)\n\nFor California Residents:\nCalifornia Attorney General\nOffice of Privacy Protection\nWebsite: oag.ca.gov\n\nFor Virginia Residents:\nVirginia Attorney General\nOffice of the Attorney General\nWebsite: oag.state.va.us\n\nFor Other Jurisdictions:\nContact your applicable regulatory authority\n\n================================================================================\n\n23. SEVERABILITY AND INTERPRETATION\n\n23.1 Severability\nIf any provision of this Privacy Policy is found to be invalid, unenforceable, or illegal, that provision shall be modified to the minimum extent necessary to make it enforceable. If modification is not possible, the provision shall be severed. The remaining provisions shall remain in full force and effect.\n\n23.2 Interpretation\nIn interpreting this Privacy Policy:\n- Section headings are for convenience only and do not define rights\n- The word \"including\" means \"including without limitation\"\n- References to \"days\" mean calendar days unless specified as \"business days\"\n- These terms are legally binding and supersede previous agreements\n\n================================================================================\n\n24. GOVERNING LAW AND JURISDICTION\n\nThis Privacy Policy is governed by the laws of [Your Jurisdiction], without regard to its conflict of laws principles. Both parties consent to the exclusive jurisdiction of the courts located in [Your Court Location] for any disputes arising from this policy.\n\nIf you reside in the European Union, you may bring a claim in your country of residence. We comply with the laws of all jurisdictions where our Service is available.\n\n================================================================================\n\n25. ENTIRE AGREEMENT\n\nThis Privacy Policy, together with our Terms of Service, Acceptable Use Policy, and other published policies, constitutes the entire agreement between you and the Company regarding privacy and data handling. This policy supersedes all prior negotiations, representations, understandings, and agreements, whether written or oral.\n\n================================================================================\n\n26. ACKNOWLEDGMENT\n\nBy using our Service and submitting information through our Contact Us form, you acknowledge that:\n\n1. You have read this entire Privacy Policy\n2. You understand your privacy rights and our data handling practices\n3. You consent to the collection and processing of your information as described\n4. You agree to be bound by all terms and conditions\n5. You understand the limitation of liability and disclaimers\n\nIf you do not agree with this Privacy Policy, do not use our Service.\n\n================================================================================\n\nEND OF PRIVACY POLICY\n\nFor questions or to exercise your privacy rights, contact us at [your-privacy@yourdomain.com].',
      'ar': '',
    },
    '1l5gmn7o': {
      'en': 'Close',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'gadrx4e0': {
      'en': '',
      'ar': '',
    },
    'od767b2i': {
      'en': '',
      'ar': '',
    },
    'x1cg822u': {
      'en': '',
      'ar': '',
    },
    '1y8rii0b': {
      'en': '',
      'ar': '',
    },
    '3slq8e6w': {
      'en': '',
      'ar': '',
    },
    'wvzqa34b': {
      'en': '',
      'ar': '',
    },
    'mxc2vj9u': {
      'en': '',
      'ar': '',
    },
    '5d3bq5yb': {
      'en': '',
      'ar': '',
    },
    '47mpemb7': {
      'en': '',
      'ar': '',
    },
    'wizqkjgo': {
      'en': '',
      'ar': '',
    },
    'a6dvexbv': {
      'en': '',
      'ar': '',
    },
    'xr0idz6v': {
      'en': '',
      'ar': '',
    },
    'o1lyd2o4': {
      'en': '',
      'ar': '',
    },
    'hewgem6l': {
      'en': '',
      'ar': '',
    },
    'qamjoicl': {
      'en': '',
      'ar': '',
    },
    '1jn832hr': {
      'en': '',
      'ar': '',
    },
    'g2b47tjq': {
      'en': '',
      'ar': '',
    },
    'r0b0tk09': {
      'en': '',
      'ar': '',
    },
    'xpfq9js3': {
      'en': '',
      'ar': '',
    },
    'utgxri51': {
      'en': '',
      'ar': '',
    },
    'xgwdw5ki': {
      'en': '',
      'ar': '',
    },
    'elao6o6m': {
      'en': '',
      'ar': '',
    },
    'lah13p9u': {
      'en': '',
      'ar': '',
    },
    'kxjxcfw3': {
      'en': '',
      'ar': '',
    },
    'hb597916': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
