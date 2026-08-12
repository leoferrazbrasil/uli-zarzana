const instagramCoverCopy = [
  { context: 'capacidade que vira', title: '<strong>autoridade.</strong>', subtitle: 'para o próximo passo' },
  { context: 'decisões maiores pedem', title: '<strong>presença.</strong>', subtitle: 'na liderança' },
  { context: 'o que você construiu', title: '<strong>percebido.</strong>', subtitle: 'com consistência' },
  { context: 'o próximo passo pede', title: '<strong>direção.</strong>', subtitle: 'sem perder identidade' }
];

document.querySelectorAll('.instagram-cover-card').forEach((card, index) => {
  const copy = instagramCoverCopy[index];
  if (!copy) return;
  card.querySelector('.instagram-cover-card__context').textContent = copy.context;
  card.querySelector('h4').innerHTML = copy.title;
  card.querySelector('p').textContent = copy.subtitle;
  card.querySelector('.instagram-cover-card__footer')?.remove();
});

document.querySelectorAll('.mockup-presentation__copy').forEach((copy) => {
  copy.insertAdjacentHTML('beforeend', `
    <div class="presentation-method" aria-label="Método de transformação">
      <div class="presentation-method__intro">
        <small>método de transformação</small>
        <p>Da identidade ao resultado, uma leitura prática para transformar capacidade em autoridade, influência e crescimento sustentável.</p>
      </div>
      <ol class="presentation-method__steps">
        <li class="presentation-method__step"><span>01</span><strong>Identidade</strong><p>Reconhecer capacidade, contexto e travas.</p></li>
        <li class="presentation-method__step"><span>02</span><strong>Clareza</strong><p>Enxergar o que precisa ser reposicionado.</p></li>
        <li class="presentation-method__step"><span>03</span><strong>Decisão</strong><p>Escolher o próximo movimento.</p></li>
        <li class="presentation-method__step"><span>04</span><strong>Execução</strong><p>Transformar intenção em ação consistente.</p></li>
        <li class="presentation-method__step"><span>05</span><strong>Resultado</strong><p>Converter capacidade em reconhecimento.</p></li>
      </ol>
      <div class="presentation-method__closing"><span>direção aplicada</span><strong>Transformar capacidade em autoridade, influência e crescimento sustentável.</strong></div>
    </div>
  `);
});

document.querySelectorAll('.mockup-mentoria__copy').forEach((copy) => {
  copy.insertAdjacentHTML('beforeend', `
    <div class="mentoria-framework" aria-label="Cinco dimensões da mentoria">
      <div class="mentoria-framework__intro">
        <small>cinco dimensões</small>
        <p>Uma metodologia comum para carreira e negócios, aplicada à trajetória de profissionais e empresários experientes.</p>
      </div>
      <ol class="mentoria-framework__dimensions">
        <li class="mentoria-framework__dimension"><span>SER</span><strong>Identidade</strong><p>Posicionamento.</p></li>
        <li class="mentoria-framework__dimension"><span>PENSAR</span><strong>Direção</strong><p>Julgamento.</p></li>
        <li class="mentoria-framework__dimension"><span>FALAR</span><strong>Influência</strong><p>Comunicação.</p></li>
        <li class="mentoria-framework__dimension"><span>AGIR</span><strong>Execução</strong><p>Evidências.</p></li>
        <li class="mentoria-framework__dimension"><span>RECEBER</span><strong>Reconhecimento</strong><p>Oportunidades e retorno.</p></li>
      </ol>
      <div class="mentoria-framework__closing"><span>aplicação</span><strong>Da trajetória à próxima posição.</strong></div>
    </div>
  `);
});
