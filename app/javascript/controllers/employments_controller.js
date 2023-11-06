import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.submitForm()
    const inputFields = document.querySelectorAll('input[data-controller^="employments"]')
    inputFields.forEach(inputField => {
      inputField.addEventListener('input', () => {
        this.submitForm();
      });
    });
  }

  submitForm() {
    const employerName = document.getElementById('employerName').value;
    const startDate = document.getElementById('employment_date_started').value;
    const endDate = document.getElementById('employment_date_ended').value;

    const saveButton = document.getElementById('saveButton');

    const formIsValid = employerName !== '' && startDate !== '' && endDate !== '';

    saveButton.classList.toggle('bg-green-600', formIsValid);
    saveButton.classList.toggle('cursor-pointer', formIsValid);
    saveButton.classList.toggle('bg-gray-400', !formIsValid);
    saveButton.disabled = !formIsValid;
  }
}
