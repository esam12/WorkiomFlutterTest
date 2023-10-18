class responseregistertenan {
  Result? result;
  String? targetUrl;
  bool? success;
  String? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  responseregistertenan(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  responseregistertenan.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    data['error'] = this.error;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class Result {
  int? state;
  int? tenantId;
  String? serverRootAddress;
  String? apiUrl;
  String? dnsUrl;

  Result(
      {this.state,
      this.tenantId,
      this.serverRootAddress,
      this.apiUrl,
      this.dnsUrl});

  Result.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    tenantId = json['tenantId'];
    serverRootAddress = json['serverRootAddress'];
    apiUrl = json['apiUrl'];
    dnsUrl = json['dnsUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['state'] = this.state;
    data['tenantId'] = this.tenantId;
    data['serverRootAddress'] = this.serverRootAddress;
    data['apiUrl'] = this.apiUrl;
    data['dnsUrl'] = this.dnsUrl;
    return data;
  }
}
