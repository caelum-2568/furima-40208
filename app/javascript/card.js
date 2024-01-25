let isPayjpInitialized = false;

const pay = () => {
  if (!isPayjpInitialized) {
    const publicKey = gon.public_key;
    const payjp = Payjp(publicKey); // PAY.JPテスト公開鍵
    const elements = payjp.elements();
    const numberElement = elements.create('cardNumber');
    const expiryElement = elements.create('cardExpiry');
    const cvcElement = elements.create('cardCvc');

    numberElement.mount('#number-form');
    expiryElement.mount('#expiry-form');
    cvcElement.mount('#cvc-form');

    const form = document.getElementById('charge-form');
    if (form) {
      form.addEventListener("submit", (e) => {
        e.preventDefault();
        payjp.createToken(numberElement).then(function (response) {
          if (!response.error) {
            const token = response.id;
            const renderDom = document.getElementById("charge-form");
            const tokenObj = `<input value=${token} type="hidden" name='token'>`;
            renderDom.insertAdjacentHTML("beforeend", tokenObj);
            form.submit();
          }
        });
      });
    }

    isPayjpInitialized = true;
  }
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
