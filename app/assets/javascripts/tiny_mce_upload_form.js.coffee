class TinyMCEUploadForm
  constructor: (form_element) ->
    @form_element = form_element
    @initTinyMCE()

  initTinyMCE: () ->
    tinyMCE.init
      selector: 'textarea'
      plugins: 'paste'
      paste_data_images: true
      images_upload_handler: @imageUploadHandler
      height: 500
    $(@form_element).on 'submit', (e) ->
      submit = @submit
      e.preventDefault()
      tinymce.activeEditor.uploadImages (success) ->
        submit()
    $('textarea', @form_element).removeAttr 'required'
    $('textarea', @form_element).removeAttr 'aria-required'

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
  $.map $("[data-behavior='tinymce-upload']"), (form_element) ->
    new TinyMCEUploadForm(form_element)
