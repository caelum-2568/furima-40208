const post = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = parseFloat(priceInput.value); // 入力値を数値に変換
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxRate = 0.1;
    const taxPrice = inputValue * taxRate;
    const saleProfit = inputValue - taxPrice;
    
    addTaxPrice.textContent = taxPrice.toFixed(0); // 四捨五入
    profit.textContent = saleProfit.toFixed(0); // 四捨五入
  });
};

window.addEventListener("turbo:load", post);
window.addEventListener("turbo:render", post);