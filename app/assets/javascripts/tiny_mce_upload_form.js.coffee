input_selector = "[data-behavior='tinymce-upload-input']"
form_selector = "[data-behavior='tinymce-upload']"

class TinyMCEUploadForm
  constructor: (form_element) ->
    @form_element = form_element
    @initTinyMCE()

  initTinyMCE: () ->
    while tinymce.editors.length > 0
      tinymce.remove(tinymce.editors[0])
    tinyMCE.init
      selector: input_selector
      plugins: 'paste'
      paste_data_images: true
      images_upload_handler: @imageUploadHandler
      height: 500
    $(@form_element).on 'submit', (e) ->
      submit = @submit
      e.preventDefault()
      tinymce.activeEditor.uploadImages (success) ->
        submit()
    $(input_selector, @form_element).removeAttr 'required'
    $(input_selector, @form_element).removeAttr 'aria-required'

  imageUploadHandler: (blobInfo, success, failure) ->
    xhr = new XMLHttpRequest()
    xhr.withCredentials = true
    xhr.open 'POST', '/tinymce_uploads'

    xhr.onload = () ->
      if xhr.status != 200
        failure('HTTP Error: ' + xhr.status);
        return;
      json = JSON.parse xhr.responseText
      success(json.location);

    formData = new FormData()
    formData.append 'file', blobInfo.blob(), blobInfo.filename()
    formData.append $('meta[name=csrf-param]').attr('content'), $('meta[name=csrf-token]').attr('content')

    xhr.send(formData)

document.addEventListener "turbolinks:load", ->
  console.log 'change page'
  $.map $(form_selector), (form_element) ->
    new TinyMCEUploadForm(form_element)
