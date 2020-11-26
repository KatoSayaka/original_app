function input(){
  const submit = document.getElementById("submit");
  submit.addEventListener("click",(e)) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/measurements", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status !=200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
       return null;
      }
      const item = XHR.response.measurement;
      const formValue = document.getElementById("list")
      const formText = document.getElementById("value");
      const HTML = `
      <div class="measurement" data-id=${item.id}>
          <div class="post-date">
            投稿日時：${item.created_at}
          </div>
          <div class="post-content">
          ${item.value}
          </div>
        </div>`;
    form.insertAdjacentHTML("afterend", HTML);
    formText.value = "";
    };
    e.preventDefault();
 });
}
window.addEventListener("load", input);