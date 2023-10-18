class LinkApi {
  static const String baseUrl = "http://api.workiom.site";

  //auth
  static const String GetCurrentLoginInformations =
      "$baseUrl/api/services/app/Session/GetCurrentLoginInformations";
  static const String GetEditionsForSelect =
      "$baseUrl/api/services/app/TenantRegistration/GetEditionsForSelect";
  static const String GetPasswordComplexitySetting =
      "$baseUrl/api/services/app/Profile/GetPasswordComplexitySetting";
  static const String IsTenantAvailable =
      "$baseUrl/api/services/app/Account/IsTenantAvailable";
  static const String RegisterTenant =
      "$baseUrl/api/services/app/TenantRegistration/RegisterTenant";
  static const String Authenticate = "$baseUrl/api/TokenAuth/Authenticate";
}
