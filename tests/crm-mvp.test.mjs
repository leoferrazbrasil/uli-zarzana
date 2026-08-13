import assert from 'node:assert/strict';
import test from 'node:test';
import crmApp from '../web/crm/assets/crm-app.js';

const {
  getTodayMetrics,
  filterLeads,
  nextStateFromEvent,
  getScreenForHash,
} = crmApp;

const leads = [
  { id: 'L-001', name: 'Ana Martins', state: 'novo', createdAt: '2026-08-13T09:00:00-03:00', source: 'landing_page' },
  { id: 'L-002', name: 'Bruno Vieira', state: 'qualificando', createdAt: '2026-08-12T09:00:00-03:00', source: 'whatsapp' },
  { id: 'L-003', name: 'Carla Mendes', state: 'oferta', createdAt: '2026-08-13T10:00:00-03:00', source: 'landing_page', offerAt: '2026-08-13T10:30:00-03:00' },
  { id: 'L-004', name: 'Diego Costa', state: 'ganho', createdAt: '2026-08-13T08:00:00-03:00', source: 'cadastro_manual', conversionAt: '2026-08-13T11:00:00-03:00' },
  { id: 'L-005', name: 'Elisa Rocha', state: 'perdido', createdAt: '2026-08-13T07:00:00-03:00', source: 'instagram', lostAt: '2026-08-13T12:00:00-03:00' },
];

test('calcula os seis indicadores básicos do dia', () => {
  const metrics = getTodayMetrics(leads, [{ dueAt: '2026-08-13T14:00:00-03:00', done: false }], new Date('2026-08-13T15:00:00-03:00'));
  assert.deepEqual(metrics, { newLeads: 4, qualifying: 1, offers: 1, won: 1, lost: 1, pendingTasks: 1 });
});

test('filtra leads por texto e estado sem alterar a fonte', () => {
  const result = filterLeads(leads, { query: 'ana', state: 'todos' });
  assert.equal(result.length, 1);
  assert.equal(result[0].id, 'L-001');
  assert.equal(leads.length, 5);
});

test('aplica transições determinísticas e ignora interação inválida', () => {
  assert.equal(nextStateFromEvent('novo', { type: 'interaction', valid: false }), 'novo');
  assert.equal(nextStateFromEvent('novo', { type: 'interaction', valid: true }), 'qualificando');
  assert.equal(nextStateFromEvent('qualificando', { type: 'offer' }), 'oferta');
  assert.equal(nextStateFromEvent('oferta', { type: 'community_conversion' }), 'ganho');
  assert.equal(nextStateFromEvent('oferta', { type: 'lost' }), 'perdido');
});

test('resolve telas principais por hash e abre visao geral por padrao', () => {
  assert.equal(getScreenForHash(''), 'overview');
  assert.equal(getScreenForHash('#pipeline'), 'pipeline');
  assert.equal(getScreenForHash('#leads/L-001'), 'lead-detail');
  assert.equal(getScreenForHash('#configuracoes'), 'settings');
});
