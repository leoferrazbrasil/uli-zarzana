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
