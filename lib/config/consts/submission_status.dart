abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class Initial extends FormSubmissionStatus {
  const Initial();
}

class Submitting extends FormSubmissionStatus {
  const Submitting();
}

class Success extends FormSubmissionStatus {
  final dynamic result;
  const Success({this.result});
}

class Failed extends FormSubmissionStatus {
  final Object exception;
  Failed(this.exception);
}
