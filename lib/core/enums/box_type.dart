enum BoxType { quotations, customers }

extension BoxName on BoxType {
  String get string {
    switch (this) {
      case BoxType.quotations:
        return 'quotations';
      case BoxType.customers:
        return 'customers';
    }
  }
}
