enum YouthBioUnitType {
  num("num", "floating point number"),
  bpm("bpm", "beats per minute"),
  mmHg("mmHg", "millimetres of mercury"),
  ms("ms", "milliseconds"),
  percent("%", "percent"),
  gdL("g/dL", "Grams per deciliter"),
  year("year", "year"),
  status("status", "plain text"),
  unknown("unknown", "unknown");

  final String unit;
  final String name;

  const YouthBioUnitType(this.unit, this.name);
}