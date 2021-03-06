function item_price (){
const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 1 / 10);
    const addTaxDomAfter = addTaxDom.innerHTML;
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(inputValue - addTaxDomAfter);
  });
};

window.addEventListener('load', item_price);
