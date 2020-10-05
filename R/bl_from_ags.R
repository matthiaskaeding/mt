#' Get bl from amtlicher Gemeindeschluessel
#'
#'
#' @param ags Amtlicher Gemeindeschluessel, with leading zero. Only first 2 chars relevant
#' @keywords ags
#' @export
#' @examples
#' bl_from_ags('03254021')

bl_from_ags <- function(ags){

  s = substr(ags, 1L, 2L)

  data.table::fcase(
    s == '01', "Schleswig-Holstein",
    s == '02', "Hamburg",
    s == '03', "Niedersachsen",
    s == '04', "Bremen",
    s == '05', "Nordrhein-Westfalen",
    s == '06', "Hessen",
    s == '07', "Rheinland-Pfalz",
    s == '08', "Baden-Württemberg",
    s == '09', "Bayern",
    s == '10', "Saarland",
    s == '11', "Berlin",
    s == '12', "Brandenburg",
    s == '13', "Mecklenburg-Vorpommern",
    s == '14', "Sachsen",
    s == '15', "Sachsen-Anhalt",
    s == '16', "Thüringen"
    )

}
