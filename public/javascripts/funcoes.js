/*
  
  FUNCOES

*/

/* EFEITO IMAGENS TOPO */
var eftAtual = 0;
var timerEfeitoLimpar = null;
var timerEfeitoSaida = null;
var timerTrocaUrl = null;
var timerEfeitoEntrada = null;
function efeitoCarrosTopo(arr) {

  setInterval(function() {
    
    if(eftAtual<(arr.url.length-1)) {
      eftAtual++;
    }
    else {
      eftAtual = 0;
    }

    
    var callbacks = $.Callbacks();
    var eftTmp = eftAtual == 0 ? arr.url.length-1 : eftAtual-1;

    //Limpar classes
    clearTimeout(timerEfeitoLimpar);
    timerEfeitoLimpar = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoLC);
      callbacks.fire('#img-01', arr.effect[eftTmp][0]);
      callbacks.fire('#img-02', arr.effect[eftTmp][1]);
      callbacks.fire('#img-03', arr.effect[eftTmp][2]);
      callbacks.remove(efeitoCarrosTopoLC);
    }, 1000);      

    //Efeito de saida
    clearTimeout(timerEfeitoSaida);
    timerEfeitoSaida = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoES);
      callbacks.fire('#img-01', 'animated fadeOut');
      callbacks.fire('#img-02', 'animated fadeOut');
      callbacks.fire('#img-03', 'animated fadeOut');
      callbacks.remove(efeitoCarrosTopoES);
    }, 2000);      

    //Troca de url
    clearTimeout(timerTrocaUrl);
    timerTrocaUrl = setTimeout(function() {
      callbacks.add(efeitoCarroTopoTU);
      callbacks.fire('#img-01', arr.url[eftAtual][0]);
      callbacks.fire('#img-02', arr.url[eftAtual][1]);
      callbacks.fire('#img-03', arr.url[eftAtual][2]);
      callbacks.remove(efeitoCarroTopoTU);
    }, 4500);      

    //Efeito de entrada
    clearTimeout(timerEfeitoEntrada);
    timerEfeitoEntrada = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoEE);
      callbacks.fire('#img-01', arr.effect[eftAtual][0]);
      callbacks.fire('#img-02', arr.effect[eftAtual][1]);
      callbacks.fire('#img-03', arr.effect[eftAtual][2]);
      callbacks.remove(efeitoCarrosTopoEE);
    }, 5000);      

  }, 8000);

}

/* EFEITO IMAGENS QUEM SOMOS */
var eftAtualQuemSomos = 0;
var timerEfeitoLimparQuemSomos = null;
var timerEfeitoSaidaQuemSomos = null;
var timerTrocaUrlQuemSomos = null;
var timerEfeitoEntradaQuemSomos = null;
function efeitoQuemSomos(arr) {

  setInterval(function() {
    
    if(eftAtualQuemSomos<(arr.url.length-1)) {
      eftAtualQuemSomos++;
    }
    else {
      eftAtualQuemSomos = 0;
    }

    var callbacks = $.Callbacks();
    var eftTmp = eftAtualQuemSomos == 0 ? arr.url.length-1 : eftAtualQuemSomos-1;

    //Limpar classes
    clearTimeout(timerEfeitoLimparQuemSomos);
    timerEfeitoLimparQuemSomos = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoLC);
      callbacks.fire('#img-quem-somos', arr.effect[eftTmp][0]);
      callbacks.remove(efeitoCarrosTopoLC);
    }, 500);      

    //Efeito de saida
    clearTimeout(timerEfeitoSaidaQuemSomos);
    timerEfeitoSaidaQuemSomos = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoES);
      callbacks.fire('#img-quem-somos', 'animated fadeOut');
      callbacks.remove(efeitoCarrosTopoES);
    }, 1000);      

    //Troca de url
    clearTimeout(timerTrocaUrlQuemSomos);
    timerTrocaUrlQuemSomos = setTimeout(function() {
      callbacks.add(efeitoCarroTopoTU);
      callbacks.fire('#img-quem-somos', arr.url[eftAtualQuemSomos][0]);
      callbacks.remove(efeitoCarroTopoTU);
    }, 2000);      

    //Efeito de entrada
    clearTimeout(timerEfeitoEntradaQuemSomos);
    timerEfeitoEntradaQuemSomos = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoEE);
      callbacks.fire('#img-quem-somos', arr.effect[eftAtualQuemSomos][0]);
      callbacks.remove(efeitoCarrosTopoEE);
    }, 2500);  

  }, 5000);

}

/* EFEITO IMAGENS NossaFrota */
var eftAtualNossaFrota = 0;
var timerEfeitoLimparNossaFrota = null;
var timerEfeitoSaidaNossaFrota = null;
var timerTrocaUrlNossaFrota = null;
var timerEfeitoEntradaNossaFrota = null;
function efeitoNossaFrota(arr) {
  setInterval(function() {
    
    if(eftAtualNossaFrota<(arr.url.length-1)) {
      eftAtualNossaFrota++;
    }
    else {
      eftAtualNossaFrota = 0;
    }

    var callbacks = $.Callbacks();
    var eftTmp = eftAtualNossaFrota == 0 ? arr.url.length-1 : eftAtualNossaFrota-1;

    //Limpar classes
    clearTimeout(timerEfeitoLimparNossaFrota);
    timerEfeitoLimparNossaFrota = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoLC);
      callbacks.fire('#img-frota', arr.effect[eftTmp][0]);
      callbacks.remove(efeitoCarrosTopoLC);
    }, 500);      

    //Efeito de saida
    clearTimeout(timerEfeitoSaidaNossaFrota);
    timerEfeitoSaidaNossaFrota = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoES);
      callbacks.fire('#img-frota', 'animated fadeOut');
      callbacks.remove(efeitoCarrosTopoES);
    }, 1000);      

    //Troca de url
    clearTimeout(timerTrocaUrlNossaFrota);
    timerTrocaUrlNossaFrota = setTimeout(function() {
      callbacks.add(efeitoCarroTopoTU);
      callbacks.fire('#img-frota', arr.url[eftAtualNossaFrota][0]);
      callbacks.remove(efeitoCarroTopoTU);
    }, 2000);      

    //Efeito de entrada
    clearTimeout(timerEfeitoEntradaNossaFrota);
    timerEfeitoEntradaNossaFrota = setTimeout(function() {
      callbacks.add(efeitoCarrosTopoEE);
      callbacks.fire('#img-frota', arr.effect[eftAtualQuemSomos][0]);
      callbacks.remove(efeitoCarrosTopoEE);
    }, 2500);  

  }, 5000);
}

function efeitoCarrosTopoLC(sltr, clss) {
  $(sltr).removeClass(clss);
}
function efeitoCarrosTopoES(sltr, clss) {
  $(sltr).addClass(clss);
}
function efeitoCarrosTopoEE(sltr, clss) {
  $(sltr).removeClass('animated fadeOut');
  $(sltr).addClass(clss);
}
function efeitoCarroTopoTU(sltr, url) {
  $(sltr).attr('src', url);
}

