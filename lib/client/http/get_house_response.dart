class GetHouseResponse {
  String? aangebodenSinds;
  String? aangebodenSindsTekst;
  int? aantalBadkamers;
  int? aantalKamers;
  String? adres;
  String? bouwjaar;
  String? gewijzigdDatum;
  String? hoofdFoto;
  String? hoofdFotoSecure;
  List<Media>? media;
  int? perceelOppervlakte;
  String? plaats;
  String? postcode;
  String? publicatieDatum;
  String? schuurBerging;
  String? scrambledId;
  int? serviceKosten;
  int? soortAanbod;
  String? soortDak;
  String? soortGarage;
  String? soortParkeergelegenheid;
  int? soortPlaatsing;
  String? soortWoning;
  String? uRL;
  String? verwarming;
  String? volledigeOmschrijving;
  String? voorzieningen;
  double? wGS84X;
  double? wGS84Y;
  String? warmWater;
  int? woonOppervlakte;
  int? koopPrijs;
  String? shortURL;

  GetHouseResponse(
      {this.aangebodenSinds,
      this.aangebodenSindsTekst,
      this.aantalBadkamers,
      this.aantalKamers,
      this.adres,
      this.bouwjaar,
      this.gewijzigdDatum,
      this.hoofdFoto,
      this.hoofdFotoSecure,
      this.media,
      this.perceelOppervlakte,
      this.plaats,
      this.postcode,
      this.publicatieDatum,
      this.schuurBerging,
      this.scrambledId,
      this.serviceKosten,
      this.soortAanbod,
      this.soortDak,
      this.soortGarage,
      this.soortParkeergelegenheid,
      this.soortPlaatsing,
      this.soortWoning,
      this.uRL,
      this.verwarming,
      this.volledigeOmschrijving,
      this.voorzieningen,
      this.wGS84X,
      this.wGS84Y,
      this.warmWater,
      this.woonOppervlakte,
      this.koopPrijs,
      this.shortURL});

  GetHouseResponse.fromJson(Map<String, dynamic> json) {
    aangebodenSinds = json['AangebodenSinds'];
    aangebodenSindsTekst = json['AangebodenSindsTekst'];
    aantalBadkamers = json['AantalBadkamers'];
    aantalKamers = json['AantalKamers'];
    adres = json['Adres'];
    bouwjaar = json['Bouwjaar'];
    gewijzigdDatum = json['GewijzigdDatum'];
    hoofdFoto = json['HoofdFoto'];
    hoofdFotoSecure = json['HoofdFotoSecure'];
    if (json['Media'] != null) {
      media = <Media>[];
      json['Media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    perceelOppervlakte = json['PerceelOppervlakte'];
    plaats = json['Plaats'];
    postcode = json['Postcode'];
    publicatieDatum = json['PublicatieDatum'];
    schuurBerging = json['SchuurBerging'];
    scrambledId = json['ScrambledId'];
    serviceKosten = json['ServiceKosten'];
    soortAanbod = json['SoortAanbod'];
    soortDak = json['SoortDak'];
    soortGarage = json['SoortGarage'];
    soortParkeergelegenheid = json['SoortParkeergelegenheid'];
    soortPlaatsing = json['SoortPlaatsing'];
    soortWoning = json['SoortWoning'];
    uRL = json['URL'];
    verwarming = json['Verwarming'];
    volledigeOmschrijving = json['VolledigeOmschrijving'];
    voorzieningen = json['Voorzieningen'];
    wGS84X = json['WGS84_X'];
    wGS84Y = json['WGS84_Y'];
    warmWater = json['WarmWater'];
    woonOppervlakte = json['WoonOppervlakte'];
    koopPrijs = json['KoopPrijs'];
    shortURL = json['ShortURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AangebodenSinds'] = this.aangebodenSinds;
    data['AangebodenSindsTekst'] = this.aangebodenSindsTekst;
    data['AantalBadkamers'] = this.aantalBadkamers;
    data['AantalKamers'] = this.aantalKamers;
    data['Adres'] = this.adres;
    data['Bouwjaar'] = this.bouwjaar;
    data['GewijzigdDatum'] = this.gewijzigdDatum;
    data['HoofdFoto'] = this.hoofdFoto;
    data['HoofdFotoSecure'] = this.hoofdFotoSecure;
    if (this.media != null) {
      data['Media'] = this.media!.map((v) => v.toJson()).toList();
    }
    data['PerceelOppervlakte'] = this.perceelOppervlakte;
    data['Plaats'] = this.plaats;
    data['Postcode'] = this.postcode;
    data['PublicatieDatum'] = this.publicatieDatum;
    data['SchuurBerging'] = this.schuurBerging;
    data['ScrambledId'] = this.scrambledId;
    data['ServiceKosten'] = this.serviceKosten;
    data['SoortAanbod'] = this.soortAanbod;
    data['SoortDak'] = this.soortDak;
    data['SoortGarage'] = this.soortGarage;
    data['SoortParkeergelegenheid'] = this.soortParkeergelegenheid;
    data['SoortPlaatsing'] = this.soortPlaatsing;
    data['SoortWoning'] = this.soortWoning;
    data['URL'] = this.uRL;
    data['Verwarming'] = this.verwarming;
    data['VolledigeOmschrijving'] = this.volledigeOmschrijving;
    data['Voorzieningen'] = this.voorzieningen;
    data['WGS84_X'] = this.wGS84X;
    data['WGS84_Y'] = this.wGS84Y;
    data['WarmWater'] = this.warmWater;
    data['WoonOppervlakte'] = this.woonOppervlakte;
    data['KoopPrijs'] = this.koopPrijs;
    data['ShortURL'] = this.shortURL;
    return data;
  }
}

class Media {
  int? categorie;
  int? contentType;
  String? id;
  int? indexNumber;
  List<MediaItems>? mediaItems;
  int? soort;
  Null? metadata;
  Null? omschrijving;
  bool? registratieVerplicht;

  Media(
      {this.categorie,
      this.contentType,
      this.id,
      this.indexNumber,
      this.mediaItems,
      this.soort,
      this.metadata,
      this.omschrijving,
      this.registratieVerplicht});

  Media.fromJson(Map<String, dynamic> json) {
    categorie = json['Categorie'];
    contentType = json['ContentType'];
    id = json['Id'];
    indexNumber = json['IndexNumber'];
    if (json['MediaItems'] != null) {
      mediaItems = <MediaItems>[];
      json['MediaItems'].forEach((v) {
        mediaItems!.add(new MediaItems.fromJson(v));
      });
    }
    soort = json['Soort'];
    metadata = json['Metadata'];
    omschrijving = json['Omschrijving'];
    registratieVerplicht = json['RegistratieVerplicht'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Categorie'] = this.categorie;
    data['ContentType'] = this.contentType;
    data['Id'] = this.id;
    data['IndexNumber'] = this.indexNumber;
    if (this.mediaItems != null) {
      data['MediaItems'] = this.mediaItems!.map((v) => v.toJson()).toList();
    }
    data['Soort'] = this.soort;
    data['Metadata'] = this.metadata;
    data['Omschrijving'] = this.omschrijving;
    data['RegistratieVerplicht'] = this.registratieVerplicht;
    return data;
  }
}

class MediaItems {
  int? category;
  int? height;
  String? url;
  String? urlSecure;
  int? width;

  MediaItems(
      {this.category, this.height, this.url, this.urlSecure, this.width});

  MediaItems.fromJson(Map<String, dynamic> json) {
    category = json['Category'];
    height = json['Height'];
    url = json['Url'];
    urlSecure = json['UrlSecure'];
    width = json['Width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category'] = this.category;
    data['Height'] = this.height;
    data['Url'] = this.url;
    data['UrlSecure'] = this.urlSecure;
    data['Width'] = this.width;
    return data;
  }
}
