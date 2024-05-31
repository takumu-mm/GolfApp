import { Controller } from "@hotwired/stimulus"
import { Autocomplete } from "stimulus-autocomplete"

export default class extends Autocomplete {
  connect() {
    super.connect()
    this.resultsTarget.addEventListener("click", this.selectAutocomplete.bind(this))
  }

  selectAutocomplete(event) {
    const target = event.target.closest(".autocomplete-result")
    if (!target) return

    const autocompleteLabel = target.getAttribute("data-autocomplete-label")
    const autocompleteValue = target.getAttribute("data-autocomplete-value")

    this.inputTarget.value = autocompleteLabel
    this.hiddenTarget.value = autocompleteValue
    this.resultsTarget.style.display = 'none'
  }
}