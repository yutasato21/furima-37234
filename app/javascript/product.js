function product() {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;
    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    taxPrice.innerHTML = `${Math.floor(inputValue * 0.1)}`;
    profit.innerHTML = `${Math.floor(inputValue * 0.9)}`;
  });
};

window.addEventListener("load", product);