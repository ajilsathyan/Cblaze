class ProfileModel {
  String? status;
  int? code;
  Data? data;

  ProfileModel({this.status, this.code, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? code;
  String? firstName;
  String? lastName;
  String? userName;
  String? motherTongue;
  String? dob;
  String? doj;
  String? gender;
  String? email;
  String? phone;
  String? bloodGroup;
  String? religion;
  String? caste;
  String? subcaste;
  String? maritalStatus;
  int? maritalStatusId;
  String? jobType;
  String? nationality;
  String? salarytype;
  String? designation;
  String? qualification;
  String? experiences;
  String? whatsappNo;
  String? landLineNo;
  String? photo;
  PermanentAddress? permanentAddress;
  ResidentialAddress? residentialAddress;

  Data(
      {this.code,
      this.firstName,
      this.lastName,
      this.userName,
      this.motherTongue,
      this.dob,
      this.doj,
      this.gender,
      this.email,
      this.phone,
      this.bloodGroup,
      this.religion,
      this.caste,
      this.subcaste,
      this.maritalStatus,
      this.maritalStatusId,
      this.jobType,
      this.nationality,
      this.salarytype,
      this.designation,
      this.qualification,
      this.experiences,
      this.whatsappNo,
      this.landLineNo,
      this.photo,
      this.permanentAddress,
      this.residentialAddress});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    motherTongue = json['mother_tongue'];
    dob = json['dob'];
    doj = json['doj'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    bloodGroup = json['blood_group'];
    religion = json['religion'];
    caste = json['caste'];
    subcaste = json['subcaste'];
    maritalStatus = json['marital_status'];
    maritalStatusId = json['marital_status_id'];
    jobType = json['job_type'];
    nationality = json['nationality'];
    salarytype = json['salarytype'];
    designation = json['designation'];
    qualification = json['qualification'];
    experiences = json['experiences'];
    whatsappNo = json['whatsapp_no'];
    landLineNo = json['land_line_no'];
    photo = json['photo'];
    permanentAddress = json['permanent_address'] != null
        ? new PermanentAddress.fromJson(json['permanent_address'])
        : null;
    residentialAddress = json['residential_address'] != null
        ? new ResidentialAddress.fromJson(json['residential_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['mother_tongue'] = this.motherTongue;
    data['dob'] = this.dob;
    data['doj'] = this.doj;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['blood_group'] = this.bloodGroup;
    data['religion'] = this.religion;
    data['caste'] = this.caste;
    data['subcaste'] = this.subcaste;
    data['marital_status'] = this.maritalStatus;
    data['marital_status_id'] = this.maritalStatusId;
    data['job_type'] = this.jobType;
    data['nationality'] = this.nationality;
    data['salarytype'] = this.salarytype;
    data['designation'] = this.designation;
    data['qualification'] = this.qualification;
    data['experiences'] = this.experiences;
    data['whatsapp_no'] = this.whatsappNo;
    data['land_line_no'] = this.landLineNo;
    data['photo'] = this.photo;
    if (this.permanentAddress != null) {
      data['permanent_address'] = this.permanentAddress!.toJson();
    }
    if (this.residentialAddress != null) {
      data['residential_address'] = this.residentialAddress!.toJson();
    }
    return data;
  }
}

class PermanentAddress {
  String? address;
  String? city;
  String? country;
  String? state;
  int? countryId;
  int? stateId;

  PermanentAddress(
      {this.address,
      this.city,
      this.country,
      this.state,
      this.countryId,
      this.stateId});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    countryId = json['country_id'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    return data;
  }
}

class ResidentialAddress {
  String? address;
  String? city;
  String? country;
  String? state;
  int? countryId;
  int? stateId;
  String? pinCode;

  ResidentialAddress(
      {this.address,
      this.city,
      this.country,
      this.state,
      this.countryId,
      this.stateId,
      this.pinCode});

  ResidentialAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    pinCode = json['pin_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['pin_code'] = this.pinCode;
    return data;
  }
}
