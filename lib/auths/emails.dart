class EmailPasswordStore {
  // Declare a Map to store email-password pairs
  Map<String, String> emailPasswordMap = {
    'OmarAlSheleh@gmail.com': 'omar7777',
    'abdaboody795@gmail.com': 'abod&shosho2002',
    'Abobakr015@gmail.com': 'abobakr',
  };
  void addEmailPassword(String email, String password) {
    emailPasswordMap[email] = password;
  }

  // Method to check if an email-password pair exists and matches
  bool checkEmailPassword(String email, String password) {
    return emailPasswordMap[email] == password;
  }

  // Method to print all email-password pairs
  void printAll() {
    emailPasswordMap.forEach((email, password) {
      print('Email: $email, Password: $password');
    });
  }
}
