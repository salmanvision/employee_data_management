import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['firstNameInput', 'lastNameInput', 'email', 'emailError', 'phone', 'phoneError', 'saveButton']

  connect() {
    this.validateForm()
  }

  cancelForm(e) {
    e.preventDefault()
    const modal = document.getElementById('modal')
    modal.innerHTML = ""
    modal.removeAttribute("src")
    modal.removeAttribute("complete")
  }

  validateCharacters(event) {
    const input = event.target;
    const regex = /^[a-zA-Z]+$/;

    if (!regex.test(input.value)) {
      input.value = input.value.replace(/[^a-zA-Z]+/, '');
    }
    this.validateForm()
  }

  validateEmail(event) {
    const email = event.target.value
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

    if (emailRegex.test(email)) {
      this.emailTarget.classList.remove('border-red-500')
      this.emailErrorTarget.innerText = ''
    } else {
      this.emailTarget.classList.add('border-red-500')
      this.emailErrorTarget.innerText = 'Invalid email address'
    }
    this.validateForm()
  }

  formatPhone(event) {
    let phoneNumber = event.target.value.replace(/\D/g, '')
    if (phoneNumber.length === 10) {
      phoneNumber = phoneNumber.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3')
      this.phoneTarget.value = phoneNumber
      this.phoneTarget.classList.remove('border-red-500')
      this.phoneErrorTarget.innerText = ''
    } else {
      this.phoneTarget.classList.add('border-red-500')
      this.phoneErrorTarget.innerText = 'Invalid phone number'
    }
    this.validateForm()
  }

  validateForm() {
    const firstName = document.getElementById('personal_data_first_name').value
    const lastName = document.getElementById('personal_data_last_name').value
    const emailError = document.getElementById('emailError').textContent
    const phoneError = document.getElementById('phoneError').textContent
    const email = document.getElementById('personal_data_email').value
    const phone = document.getElementById('personal_data_phone').value
    const saveButton = document.getElementById('saveButton')

    const formIsValid = !(emailError || phoneError || !firstName || !lastName || !email || !phone)

    saveButton.classList.toggle('bg-green-600', formIsValid);
    saveButton.classList.toggle('cursor-pointer', formIsValid);
    saveButton.classList.toggle('bg-gray-400', !formIsValid);
    saveButton.disabled = !formIsValid;
  }
}
