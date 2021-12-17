function product() {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxPrice = `${Math.floor(inputValue * 0.1)}`;
    addTaxPrice.innerHTML = `${taxPrice}`;
    profit.innerHTML = `${Math.floor(inputValue - taxPrice)}`;
  });
};

window.addEventListener("load", product);