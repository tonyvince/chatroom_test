import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Access the current user ID from the body tag
    console.log("connected to div");
    const currentUserId = Number(document.body.dataset.applicationUserIdValue);
    console.log(currentUserId);

    // Assuming 'box' is the element you want to apply styles to, you need to ensure it's defined.
    // If 'box' is the controller element itself, use 'this.element' to reference it.
    const box = this.element;

    const messageUserId = parseInt(box.dataset.chatUserIdValue);
    console.log(messageUserId);
    if (messageUserId === currentUserId) {
      box.classList.remove('bg-green-500');
      box.classList.add('bg-blue-300');
      box.parentElement.classList.add('justify-end');
    }
  }
}

