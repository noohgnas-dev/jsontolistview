/// result : "success"
/// elapsedTime : "3.938512802124"
/// value : {"service":{"currentService":false,"serviceStates":{"roon":"inactive","squeezelite":"inactive","LMS":"inactive","mpd":"inactive","naa":"inactive","shairport":"inactive","librespot":"inactive"},"rippingStates":{"type":"","states":"not_ready"}},"installed":["shairport","squeezelite","mpd","naa","roonready","minimserver","bubbleupnp"]}

class SmsServices {
  String? result;
  String? elapsedTime;
  Value? value;

  SmsServices({this.result, this.elapsedTime, this.value});

  SmsServices.fromJson(dynamic json) {
    result = json['result'];
    elapsedTime = json['elapsedTime'];
    value = json['value'] != null ? Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['result'] = result;
    map['elapsedTime'] = elapsedTime;
    if (value != null) {
      map['value'] = value?.toJson();
    }
    return map;
  }
}

/// service : {"currentService":false,"serviceStates":{"roon":"inactive","squeezelite":"inactive","LMS":"inactive","mpd":"inactive","naa":"inactive","shairport":"inactive","librespot":"inactive"},"rippingStates":{"type":"","states":"not_ready"}}
/// installed : ["shairport","squeezelite","mpd","naa","roonready","minimserver","bubbleupnp"]

class Value {
  Service? service;
  List<String>? installed;

  Value({this.service, this.installed});

  Value.fromJson(dynamic json) {
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    installed =
        json['installed'] != null ? json['installed'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (service != null) {
      map['service'] = service?.toJson();
    }
    map['installed'] = installed;
    return map;
  }
}

/// currentService : false
/// serviceStates : {"roon":"inactive","squeezelite":"inactive","LMS":"inactive","mpd":"inactive","naa":"inactive","shairport":"inactive","librespot":"inactive"}
/// rippingStates : {"type":"","states":"not_ready"}

class Service {
  // bool? currentService;
  String? currentService;
  ServiceStates? serviceStates;
  RippingStates? rippingStates;

  Service({this.currentService, this.serviceStates, this.rippingStates});

  Service.fromJson(dynamic json) {
    if (json['currentService'] is bool) {
      print("bool");
      currentService = "false";
    } else {
      currentService = json['currentService'];
    }

    serviceStates = json['serviceStates'] != null
        ? ServiceStates.fromJson(json['serviceStates'])
        : null;
    rippingStates = json['rippingStates'] != null
        ? RippingStates.fromJson(json['rippingStates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['currentService'] = currentService;
    if (serviceStates != null) {
      map['serviceStates'] = serviceStates?.toJson();
    }
    if (rippingStates != null) {
      map['rippingStates'] = rippingStates?.toJson();
    }
    return map;
  }
}

/// type : ""
/// states : "not_ready"

class RippingStates {
  String? type;
  String? states;

  RippingStates({this.type, this.states});

  RippingStates.fromJson(dynamic json) {
    type = json['type'];
    states = json['states'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['type'] = type;
    map['states'] = states;
    return map;
  }
}

/// roon : "inactive"
/// squeezelite : "inactive"
/// LMS : "inactive"
/// mpd : "inactive"
/// naa : "inactive"
/// shairport : "inactive"
/// librespot : "inactive"

class ServiceStates {
  String? roon;
  String? squeezelite;
  String? lms;
  String? mpd;
  String? naa;
  String? shairport;
  String? librespot;

  ServiceStates(
      {this.roon,
      this.squeezelite,
      this.lms,
      this.mpd,
      this.naa,
      this.shairport,
      this.librespot});

  ServiceStates.fromJson(dynamic json) {
    roon = json['roon'];
    squeezelite = json['squeezelite'];
    lms = json['LMS'];
    mpd = json['mpd'];
    naa = json['naa'];
    shairport = json['shairport'];
    librespot = json['librespot'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['roon'] = roon;
    map['squeezelite'] = squeezelite;
    map['LMS'] = lms;
    map['mpd'] = mpd;
    map['naa'] = naa;
    map['shairport'] = shairport;
    map['librespot'] = librespot;
    return map;
  }
}
