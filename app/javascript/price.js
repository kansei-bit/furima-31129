function calculate_price() {
  const priceBox = document.getElementById("item-price");
  const feeBox = document.getElementById("add-tax-price");
  const profitBox = document.getElementById("profit");

  priceBox.addEventListener('input', () => {
    const priceField = document.getElementById("item-price");
    const price = priceField.value;
    const fee = Math.floor( price/10 );
    feeBox.innerHTML = fee;
    profitBox.innerHTML = price - fee;
  })
}

window.addEventListener('load', calculate_price);