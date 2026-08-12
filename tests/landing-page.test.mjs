import test from 'node:test';
import assert from 'node:assert/strict';
import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const {
  DEMO_EVENT_DATE,
  getCountdownParts,
  getDemoConfirmation,
} = require('../web/assets/landing-page.js');

test('usa a data demonstrativa aprovada', () => {
  assert.equal(DEMO_EVENT_DATE, '2026-09-24T19:30:00-03:00');
});

test('calcula dias, horas, minutos e segundos restantes', () => {
  const result = getCountdownParts(
    new Date('2026-09-24T19:30:00-03:00'),
    new Date('2026-09-23T18:29:30-03:00'),
  );
  assert.deepEqual(result, { expired: false, days: 1, hours: 1, minutes: 0, seconds: 30 });
});

test('encerra o contador sem reiniciar a data', () => {
  const result = getCountdownParts(
    new Date('2026-09-24T19:30:00-03:00'),
    new Date('2026-09-24T19:30:01-03:00'),
  );
  assert.deepEqual(result, { expired: true, days: 0, hours: 0, minutes: 0, seconds: 0 });
});

test('confirma explicitamente que nenhum dado foi armazenado', () => {
  assert.equal(
    getDemoConfirmation(),
    'Inscrição demonstrativa concluída. Nenhum dado foi enviado ou armazenado.',
  );
});
