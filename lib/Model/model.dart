class Sinistres {
  String dateSinistre;
  String heureSinistre;
  final String lieuSinistre;
  final String blesse;
  final String degats;

  Sinistres({
    required this.dateSinistre,
    required this.heureSinistre,
    required this.lieuSinistre,
    required this.blesse,
    required this.degats,
  });
  Map<String, dynamic> toMap() {
    return {
      'dateSinistre': dateSinistre,
      'heureSinistre': heureSinistre,
      'lieuSinistre': lieuSinistre,
      'blesse': blesse,
      'degats': degats,
    };
  }
}

class Geo {
  final String localise;
  Geo({required this.localise});
}

class Temoin {
  final String nomt;
  final String prenomt;
  final String adresset;
  final String telephonet;

  Temoin({
    required this.nomt,
    required this.prenomt,
    required this.adresset,
    required this.telephonet,
  });
}

class Blesse {
  final String nomb;
  final String prenomb;
  final String adresseb;
  final String telephoneb;
  final String professionb;
  final String situationb;
  final String casqueb;
  final String centreHospitalierb;
  final String natureGraviteb;
  Blesse(
      {required this.nomb,
      required this.prenomb,
      required this.adresseb,
      required this.telephoneb,
      required this.professionb,
      required this.situationb,
      required this.casqueb,
      required this.centreHospitalierb,
      required this.natureGraviteb});
}

class VehiculeA {
  final String marque;
  final String numero_immatriculation;
  final String pays_immatriculation;
  VehiculeA({
    required this.marque,
    required this.numero_immatriculation,
    required this.pays_immatriculation,
  });
}

class AssureA {
  final String nomA;
  final String prenomA;
  final String adresseA;
  final String code_postalA;
  final String telephoneA;
  final String emailA;
  AssureA({
    required this.nomA,
    required this.prenomA,
    required this.telephoneA,
    required this.adresseA,
    required this.code_postalA,
    required this.emailA,
  });
}

class AssuranceA {
  final String nomCA;
  final String numContrat;
  final String numCarteVerte;
  final String du;
  final String au;
  final String agence;
  final String nomAgence;
  final String adresseCA;
  final String paysCA;
  final String telephoneCA;
  final String emailCA;
  final String priseEncharge;
  AssuranceA({
    required this.nomCA,
    required this.numContrat,
    required this.numCarteVerte,
    required this.du,
    required this.au,
    required this.agence,
    required this.nomAgence,
    required this.adresseCA,
    required this.paysCA,
    required this.telephoneCA,
    required this.emailCA,
    required this.priseEncharge,
  });
}

class Circonstance {
  final String circonstance;
  Circonstance({
    required this.circonstance,
  });
}

class Choc {
  final String namePhoto;
  final String? imageUrl;
  Choc({
    required this.imageUrl,
    required this.namePhoto,
  });
}

class signatureA {
  final String nameSignature;
  final String? imageUrlSignature;
  signatureA({
    required this.imageUrlSignature,
    required this.nameSignature,
  });
}

class ObservationA {
  final String degatsapparent;
  final String observation;
  ObservationA({
    required this.observation,
    required this.degatsapparent,
  });
}

class Conducteur {
  final String nomC;
  final String prenomC;
  final String adresseC;
  final String dateNaissanceC;
  final String paysC;
  final String telephoneC;
  final String emailC;
  final String numPermis;
  final String categorie;
  final String finValidePermis;

  Conducteur({
    required this.nomC,
    required this.prenomC,
    required this.adresseC,
    required this.dateNaissanceC,
    required this.paysC,
    required this.telephoneC,
    required this.categorie,
    required this.emailC,
    required this.finValidePermis,
    required this.numPermis,
  });
}
