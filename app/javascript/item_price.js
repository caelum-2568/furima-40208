const post = () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener('input', () => {
      const inputValue = parseFloat(priceInput.value) || 0; // 入力値が無効な場合は0を使用
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");

      if (addTaxPrice && profit) {
        const taxRate = 0.1;
        const taxPrice = inputValue * taxRate;
        const saleProfit = inputValue - taxPrice;
        
        addTaxPrice.textContent = Math.floor(taxPrice); // 切り捨て
        profit.textContent = Math.floor(saleProfit); // 切り捨て
      }
    });
  }
};

window.addEventListener("turbo:load", post);
window.addEventListener("turbo:render", post);
