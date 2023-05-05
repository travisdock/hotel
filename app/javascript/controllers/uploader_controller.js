import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="uploader"
export default class extends Controller {
  addImage(event) {
    const photoInput = document.getElementById('photoInput');
    const previewContainer = document.getElementById('previewContainer');
    const selectedFiles = new Map();

    const files = event.target.files;

    previewContainer.innerHTML = '';

    for (const file of files) {
        selectedFiles.set(file.name, file);

        const img = document.createElement('img');
        img.src = URL.createObjectURL(file);
        img.classList.add('preview-image');

        const removeBtn = document.createElement('button');
        removeBtn.classList.add('remove-btn');
        removeBtn.textContent = 'X';

        const previewItem = document.createElement('div');
        previewItem.classList.add('preview-item');
        previewItem.appendChild(img);
        previewItem.appendChild(removeBtn);

        previewContainer.appendChild(previewItem);

        removeBtn.addEventListener('click', function () {
            URL.revokeObjectURL(img.src);
            previewItem.remove();
            selectedFiles.delete(file.name);
            // updateFileInput();
            const dataTransfer = new DataTransfer();
            for (const file of selectedFiles.values()) {
                dataTransfer.items.add(file);
            }

            photoInput.files = dataTransfer.files;
        });
    }
  }
}
