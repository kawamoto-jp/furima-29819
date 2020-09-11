window.addEventListener('load', function(){

  const calculation = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  
  calculation.addEventListener('input', function(){
    let price = calculation.value
    let fee = price / 10
    let c_profit = price - fee
    addTaxPrice.innerHTML = fee
    profit.innerHTML = c_profit
  })
})
