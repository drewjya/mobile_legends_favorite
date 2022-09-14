final specialty = [
  {"specially_name": "Initiator"},
  {"specially_name": "Push"},
  {"specially_name": "Regen"},
  {"specially_name": "Charge"},
  {"specially_name": "Damage"},
  {"specially_name": "Crowd Control"},
  {"specially_name": "Poke"},
  {"specially_name": "Reap"},
  {"specially_name": "Burst Damage"},
  {"specially_name": "Burst"},
  {"specially_name": "Cost"}
];

enum SpecialityHero {
  initiator("Initiator"),
  push("Push"),
  regen("Regen"),
  charge("Charge"),
  damage("Damage"),
  crowdControl("Crowd Control"),
  poke("Poke"),
  reap("Reap"),
  burstDamage("Burst Damage"),
  burst("Burst"),
  cost("Cost");

  final String data;
  const SpecialityHero(this.data);
}
