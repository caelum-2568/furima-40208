window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price"); // 修正: 変数名を priceInput に変更
  priceInput.addEventListener('input', () => { // 修正: 'change' ではなく 'input' を使ってリアルタイムに変更を検知
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxPrice = inputValue * 0.1; // 修正: price ではなく inputValue を使う
    const saleProfit = inputValue - taxPrice;
    
    addTaxPrice.innerHTML = taxPrice;
    profit.innerHTML = saleProfit.toFixed(2); // 修正: 小数点以下の桁数を指定
  });
});
