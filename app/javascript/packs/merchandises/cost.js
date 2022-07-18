window.costFunc = function costFunc() {
  const merchandisesPrice = document.getElementsByClassName("merchandise-price");
  const amountTotal = document.getElementsByClassName("amount-input");
  const merchandisesTotal = document.getElementsByClassName("merchandise-result");

  total = 0;

  for( let i = 0 ; i < merchandisesPrice.length ; i ++ ) {

    amount = document.getElementById(amountTotal[i].id);
    amountValue = amount.value;

    merchandisePrice = document.getElementById(merchandisesPrice[i].id);
    const merchandisePriceValue = merchandisePrice.innerHTML;

    const result = amountValue * merchandisePriceValue;

    const merchandiseTotal = document.getElementById(merchandisesTotal[i].id);

    merchandiseTotal.innerHTML = result;

    total = total + result;
    const totalArea = document.getElementById("total-area");
    totalArea.innerHTML = total;
  }
}