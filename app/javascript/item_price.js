window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = parseFloat(priceInput.value); // 入力値を数値に変換
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxRate = 0.1;
    const taxPrice = inputValue * taxRate;
    const saleProfit = inputValue - taxPrice;
    
    addTaxPrice.innerHTML = taxPrice.toFixed(0); // 切り捨て
    profit.innerHTML = saleProfit.toFixed(0); // 切り捨て
  });
});
