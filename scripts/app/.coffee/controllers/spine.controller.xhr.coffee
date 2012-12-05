Spine.Controller.include
  xhr: (para) ->
    url = para.url;
    data = para.data ? '';
    async = para.async ? true;
    header = para.header ? {};
    method = para.method ? 'GET';
    eventListener = para.eventListener ? {};
    uploadEventListener = para.uploadEventListener ? {};

    xhr = new XMLHttpRequest()
    xhr.addEventListener(ev, eventListener[ev]) for ev in eventListener
    xhr.upload.addEventListener(ev, uploadEventListener[ev]) for ev in uploadEventListener
    xhr.open(method, url, async);
    xhr.setRequestHeader(h, header[h]) for h in header
    xhr.send(data);
    xhr.responseText;