//
//  CountriesRespounce.swift
//  Geographic-atlas
//
//  Created by Kirill Dev on 12.05.2023.
//

import Foundation

// MARK: - Countries Respounce
struct CountriesRespounce: Codable {
  let countries: [Country]
}

// MARK: - Country
struct Country: Codable {
  let name: Name?
  let population: Int?
  let area: Double?
  let currencies: Currencies?
  let region: Region?
  let capital: [String]?
  let timezones: [String]?
  let flag: String?
  let flags: Flags?
  let capitalInfo: CapitalInfo?
  let subregion: String?
}

// MARK: - Currencies
struct Currencies: Codable {
  let eur, afn: Aed?
  let sdg: BAM?
  let bgn, usd, pln, nzd: Aed?
  let tzs, mop, xof, czk: Aed?
  let ugx, ttd, dzd, uah: Aed?
  let mru, gel, ang, nad: Aed?
  let zar, mkd, mur, aud: Aed?
  let kid, xaf, qar, kyd: Aed?
  let bwp, egp, ils, jod: Aed?
  let vnd, gbp, jep, gyd: Aed?
  let tvd, pgk, bsd, cve: Aed?
  let omr, ves, bob, cad: Aed?
  let nok, kgs, amd, cdf: Aed?
  let chf, szl, dkk, fok: Aed?
  let ngn, mwk, stn, fkp: Aed?
  let gtq, bbd, ghs, nio: Aed?
  let imp, aoa, dop, all: Aed?
  let lyd, kwd, bhd, tmt: Aed?
  let lrd, rub, php, xcd: Aed?
  let ron, inr, mmk, bzd: Aed?
  let mnt, sar, huf, ars: Aed?
  let xpf, yer, sek, shp: Aed?
  let brl, ssp, thb, currenciesTRY: Aed?
  let bmd, bdt, sgd, mdl: Aed?
  let kes, uyu, byn, lbp: Aed?
  let btn, myr, kzt, tnd: Aed?
  let gmd, syp, gnf, mzn: Aed?
  let wst, twd, kpw, djf: Aed?
  let srd, rwf, krw, jmd: Aed?
  let mvr, pyg, idr, mga: Aed?
  let iqd, hnl, mad, hkd: Aed?
  let lkr, htg, cuc, cup: Aed?
  let tjs, ckd, cop, uzs: Aed?
  let gip, pen, pkr, clp: Aed?
  let zmw, scr, crc, kmf: Aed?
  let isk, jpy, fjd: Aed?
  let bam: BAM?
  let mxn, khr, irr, rsd: Aed?
  let aed, azn, vuv, ern: Aed?
  let npr, pab, ggp, sbd: Aed?
  let zwl, awg, bnd, lak: Aed?
  let top, lsl, sos, sll: Aed?
  let bif, etb, cny: Aed?
}

// MARK: - Aed
struct Aed: Codable {
  let name, symbol: String?
}

// MARK: - BAM
struct BAM: Codable {
  let name: String?
}

// MARK: - Name
struct Name: Codable {
  let common: String?
}

// MARK: - Translation
struct Translation: Codable {
  let official, common: String?
}

// MARK: - Flags
struct Flags: Codable {
  let png: String?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
  let latlng: [Double]?
}

// MARK: - Region
enum Region: Codable {
  case africa
  case americas
  case antarctic
  case asia
  case europe
  case oceania
}
