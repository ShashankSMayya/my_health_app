class GetMedicineParams {
  String query;

  GetMedicineParams({required this.query});

  toJson() {
    return {"query": query};
  }
}
