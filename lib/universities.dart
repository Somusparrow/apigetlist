class universites {
  Null? stateProvince;
  String? country;
  List<String>? domains;
  List<String>? webPages;
  String? alphaTwoCode;
  String? name;

  universites(
      {this.stateProvince,
        this.country,
        this.domains,
        this.webPages,
        this.alphaTwoCode,
        this.name});

  universites.fromJson(Map<String, dynamic> json) {
    stateProvince = json['state-province'];
    country = json['country'];
    domains = json['domains'].cast<String>();
    webPages = json['web_pages'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state-province'] = this.stateProvince;
    data['country'] = this.country;
    data['domains'] = this.domains;
    data['web_pages'] = this.webPages;
    data['alpha_two_code'] = this.alphaTwoCode;
    data['name'] = this.name;
    return data;
  }
}