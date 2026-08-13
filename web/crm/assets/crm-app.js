(function (root, factory) {
  if (typeof module === 'object' && module.exports) module.exports = factory();
  else root.CrmApp = factory();
}(typeof self !== 'undefined' ? self : this, function () {
  const STATES = [
    { key: 'novo', label: 'Novo' },
    { key: 'qualificando', label: 'Qualificando' },
    { key: 'oferta', label: 'Oferta' },
    { key: 'ganho', label: 'Ganho' },
    { key: 'perdido', label: 'Perdido' },
  ];

  const leads = [
    { id: 'L-001', name: 'Ana Martins', email: 'ana.martins@exemplo.com', phone: '(11) 99821-4401', state: 'novo', source: 'landing_page', createdAt: '2026-08-13T09:00:00-03:00', updatedAt: '2026-08-13T09:00:00-03:00', owner: 'Uli Zarzana', ownerInitials: 'UZ', lastMovement: 'Entrou pela landing page' },
    { id: 'L-002', name: 'Bruno Vieira', email: 'bruno.vieira@exemplo.com', phone: '(21) 99714-8820', state: 'qualificando', source: 'whatsapp', createdAt: '2026-08-12T09:00:00-03:00', updatedAt: '2026-08-13T10:20:00-03:00', owner: 'Marina Costa', ownerInitials: 'MC', lastMovement: 'Respondeu à primeira mensagem' },
    { id: 'L-003', name: 'Carla Mendes', email: 'carla.mendes@exemplo.com', phone: '(31) 99102-3004', state: 'oferta', source: 'landing_page', createdAt: '2026-08-13T10:00:00-03:00', updatedAt: '2026-08-13T10:30:00-03:00', offerAt: '2026-08-13T10:30:00-03:00', owner: 'Uli Zarzana', ownerInitials: 'UZ', lastMovement: 'Aula Estratégica apresentada' },
    { id: 'L-004', name: 'Diego Costa', email: 'diego.costa@exemplo.com', phone: '(41) 99630-1188', state: 'ganho', source: 'cadastro_manual', createdAt: '2026-08-13T08:00:00-03:00', updatedAt: '2026-08-13T11:00:00-03:00', conversionAt: '2026-08-13T11:00:00-03:00', owner: 'Rafael Lima', ownerInitials: 'RL', lastMovement: 'Entrou na comunidade Vida Extraordinária' },
    { id: 'L-005', name: 'Elisa Rocha', email: 'elisa.rocha@exemplo.com', phone: '(51) 99902-7710', state: 'perdido', source: 'instagram', createdAt: '2026-08-13T07:00:00-03:00', updatedAt: '2026-08-13T12:00:00-03:00', lostAt: '2026-08-13T12:00:00-03:00', owner: 'Marina Costa', ownerInitials: 'MC', lastMovement: 'Sem continuidade registrada' },
    { id: 'L-006', name: 'Felipe Andrade', email: 'felipe.andrade@exemplo.com', phone: '(19) 99200-5531', state: 'qualificando', source: 'landing_page', createdAt: '2026-08-12T14:00:00-03:00', updatedAt: '2026-08-13T08:40:00-03:00', owner: 'Uli Zarzana', ownerInitials: 'UZ', lastMovement: 'Primeira interação válida' },
    { id: 'L-007', name: 'Gabriela Nunes', email: 'gabriela.nunes@exemplo.com', phone: '(85) 99810-2003', state: 'novo', source: 'instagram', createdAt: '2026-08-13T13:00:00-03:00', updatedAt: '2026-08-13T13:00:00-03:00', owner: 'Uli Zarzana', ownerInitials: 'UZ', lastMovement: 'Cadastro recebido' },
    { id: 'L-008', name: 'Henrique Souza', email: 'henrique.souza@exemplo.com', phone: '(62) 99320-4410', state: 'oferta', source: 'whatsapp', createdAt: '2026-08-11T11:00:00-03:00', updatedAt: '2026-08-13T09:40:00-03:00', offerAt: '2026-08-13T09:40:00-03:00', owner: 'Rafael Lima', ownerInitials: 'RL', lastMovement: 'Mentoria apresentada' },
  ];
  const tasks = [
    { id: 'T-001', title: 'Retomar conversa com Bruno Vieira', detail: 'Qualificando · WhatsApp', dueAt: '2026-08-13T14:00:00-03:00', done: false },
    { id: 'T-002', title: 'Enviar material da Aula Estratégica', detail: 'Oferta · Carla Mendes', dueAt: '2026-08-13T16:30:00-03:00', done: false },
    { id: 'T-003', title: 'Confirmar entrada na comunidade', detail: 'Oferta · Henrique Souza', dueAt: '2026-08-13T18:00:00-03:00', done: false },
    { id: 'T-004', title: 'Atualizar registro de Ana Martins', detail: 'Novo · Landing page', dueAt: '2026-08-12T15:00:00-03:00', done: true },
  ];
  const offers = [
    { name: 'Aula Estratégica', lead: 'Carla Mendes', date: '13 ago · 10:30', owner: 'Uli Zarzana', state: 'Em decisão' },
    { name: 'Mentoria Uli Zarzana', lead: 'Henrique Souza', date: '13 ago · 09:40', owner: 'Rafael Lima', state: 'Em decisão' },
    { name: 'Aula Estratégica', lead: 'Mariana Alves', date: '12 ago · 16:20', owner: 'Marina Costa', state: 'Ganho' },
  ];
  const activity = [
    { text: 'Carla Mendes recebeu a oferta Aula Estratégica.', time: 'Hoje, 10:30 · Uli Zarzana' },
    { text: 'Diego Costa entrou na comunidade Vida Extraordinária.', time: 'Hoje, 11:00 · Rafael Lima' },
    { text: 'Felipe Andrade respondeu à primeira mensagem.', time: 'Hoje, 08:40 · Uli Zarzana' },
  ];

  function dayKey(date) { return new Intl.DateTimeFormat('en-CA', { timeZone: 'America/Sao_Paulo' }).format(date); }
  function getTodayMetrics(items, taskItems, now = new Date()) {
    const today = dayKey(now);
    const countDay = (key) => items.filter((item) => item[key] && dayKey(new Date(item[key])) === today).length;
    return {
      newLeads: countDay('createdAt'),
      qualifying: items.filter((item) => item.state === 'qualificando').length,
      offers: countDay('offerAt'),
      won: countDay('conversionAt'),
      lost: countDay('lostAt'),
      pendingTasks: taskItems.filter((task) => !task.done && dayKey(new Date(task.dueAt)) === today).length,
    };
  }
  function filterLeads(items, { query = '', state = 'todos', source = 'todas' } = {}) {
    const needle = query.trim().toLowerCase();
    return items.filter((lead) => {
      const matchesText = !needle || [lead.name, lead.email, lead.phone].filter(Boolean).some((value) => value.toLowerCase().includes(needle));
      return matchesText && (state === 'todos' || lead.state === state) && (source === 'todas' || lead.source === source);
    });
  }
  function nextStateFromEvent(current, event) {
    if (event.type === 'interaction' && event.valid) return current === 'novo' ? 'qualificando' : current;
    if (event.type === 'offer') return 'oferta';
    if (event.type === 'community_conversion') return 'ganho';
    if (event.type === 'lost') return 'perdido';
    return current;
  }
  function getScreenForHash(hash) {
    if (hash.startsWith('#leads/')) return 'lead-detail';
    const map = { '#pipeline': 'pipeline', '#leads': 'leads', '#tarefas': 'tasks', '#ofertas': 'offers', '#relatorios': 'reports', '#configuracoes': 'settings', '#visao-geral': 'overview', '': 'overview' };
    return map[hash] || 'overview';
  }
  function labelForState(state) { return STATES.find((item) => item.key === state)?.label || state; }
  function labelForSource(source) { return ({ landing_page: 'Landing page', whatsapp: 'WhatsApp', instagram: 'Instagram', cadastro_manual: 'Cadastro manual', importacao: 'Importação' })[source] || source; }
  function formatTime(value) { return new Intl.DateTimeFormat('pt-BR', { hour: '2-digit', minute: '2-digit' }).format(new Date(value)); }
  function initials(name) { return name.split(' ').map((part) => part[0]).slice(0, 2).join('').toUpperCase(); }

  function metricCard(icon, tone, label, value, detail) { return `<article class="metric-card"><span class="metric-icon metric-icon--${tone}">${icon}</span><small>${label}</small><strong>${value}</strong><em>${detail}</em></article>`; }
  function renderOverview() {
    const metrics = getTodayMetrics(leads, tasks, new Date('2026-08-13T15:00:00-03:00'));
    document.querySelector('#metric-grid').innerHTML = [
      metricCard('＋', 'ink', 'Novos leads hoje', metrics.newLeads, 'entradas desde 00:00'),
      metricCard('◎', 'terracotta', 'Leads em qualificação', metrics.qualifying, 'estado atual'),
      metricCard('◇', 'champagne', 'Ofertas apresentadas hoje', metrics.offers, 'registros no dia'),
      metricCard('↗', 'ink', 'Ganhos hoje', metrics.won, 'conversões confirmadas'),
      metricCard('×', 'terracotta', 'Perdidos hoje', metrics.lost, 'encerramentos no dia'),
      metricCard('✓', 'champagne', 'Tarefas pendentes hoje', metrics.pendingTasks, 'prazo até o fim do dia'),
    ].join('');
    const counts = STATES.map((state) => ({ ...state, count: leads.filter((lead) => lead.state === state.key).length }));
    const max = Math.max(...counts.map((item) => item.count));
    document.querySelector('#overview-pipeline').innerHTML = counts.map((item) => `<div class="pipeline-bar"><div class="pipeline-bar__column" style="--bar-height:${Math.max(22, item.count / max * 125)}px"><b class="pipeline-bar__count">${item.count}</b></div><span class="pipeline-bar__label">${item.label}</span></div>`).join('');
    document.querySelector('#overview-tasks').innerHTML = tasks.slice(0, 3).map(renderTask).join('');
    document.querySelector('#overview-activity').innerHTML = activity.map((item) => `<div class="activity-item"><i class="activity-dot"></i><div><p>${item.text}</p><small>${item.time}</small></div></div>`).join('');
  }
  function renderTask(task) { return `<div class="task-item"><button class="task-check ${task.done ? 'is-done' : ''}" type="button" aria-label="${task.done ? 'Tarefa concluída' : 'Concluir tarefa'}" data-task-id="${task.id}">${task.done ? '✓' : ''}</button><div class="task-item__body"><strong>${task.title}</strong><small>${task.detail}</small></div><span class="task-item__date">${formatTime(task.dueAt)}</span></div>`; }
  function renderPipeline() {
    document.querySelector('#pipeline-board').innerHTML = STATES.map((state) => `<article class="kanban-column"><div class="kanban-column__head"><h2>${state.label}</h2><span class="kanban-column__count">${leads.filter((lead) => lead.state === state.key).length}</span></div><div class="kanban-column__body">${leads.filter((lead) => lead.state === state.key).map((lead) => `<a class="lead-card" href="#leads/${lead.id}"><strong>${lead.name}</strong><small>${lead.lastMovement}</small><div class="lead-card__foot"><span class="lead-card__source">${labelForSource(lead.source)}</span><span class="mini-avatar">${lead.ownerInitials}</span></div></a>`).join('')}</div></article>`).join('');
  }
  function renderLeads() {
    const result = filterLeads(leads, { query: document.querySelector('#lead-search')?.value || '', state: document.querySelector('#lead-state-filter')?.value || 'todos', source: document.querySelector('#lead-source-filter')?.value || 'todas' });
    document.querySelector('#lead-summary').textContent = `${result.length} de ${leads.length} leads exibidos`;
    document.querySelector('#leads-table').innerHTML = result.map((lead) => `<tr><td><div class="lead-cell"><span class="mini-avatar">${initials(lead.name)}</span><div><strong>${lead.name}</strong><small>${lead.email}</small></div></div></td><td><span class="source-label">${labelForSource(lead.source)}</span></td><td><span class="status-badge status-badge--${lead.state}">${labelForState(lead.state)}</span></td><td>${lead.owner}</td><td>${lead.lastMovement}</td><td><a class="row-action" href="#leads/${lead.id}">Abrir</a></td></tr>`).join('') || '<tr><td colspan="6">Nenhum lead encontrado.</td></tr>';
  }
  function renderLeadDetail(id) {
    const lead = leads.find((item) => item.id === id) || leads[0];
    document.querySelector('#lead-detail-content').innerHTML = `<div class="detail-heading"><div><span class="eyebrow">LEAD · ${lead.id}</span><h1 id="lead-detail-title">${lead.name}</h1><p>${labelForState(lead.state)} · ${labelForSource(lead.source)}</p></div><div><a class="button button--secondary" href="#leads">← Voltar para leads</a><button class="button button--primary" type="button" data-action="new-task">Criar tarefa</button></div></div><div class="detail-layout"><div><article class="panel detail-card"><h2>Dados do contato</h2><div class="detail-meta"><div><small>Nome completo</small><strong>${lead.name}</strong></div><div><small>Telefone</small><strong>${lead.phone}</strong></div><div><small>E-mail</small><strong>${lead.email}</strong></div><div><small>Origem</small><strong>${labelForSource(lead.source)}</strong></div></div></article><article class="panel detail-card"><h2>Histórico do relacionamento</h2><div class="timeline"><div class="timeline-item"><i></i><div><strong>Lead criado como Novo</strong><small>13 ago · ${formatTime(lead.createdAt)} · ${labelForSource(lead.source)}</small></div></div><div class="timeline-item"><i></i><div><strong>${lead.lastMovement}</strong><small>13 ago · ${formatTime(lead.updatedAt)} · ${lead.owner}</small></div></div></div></article></div><aside><article class="panel detail-card"><span class="eyebrow">ESTADO ATUAL</span><h2><span class="status-badge status-badge--${lead.state}">${labelForState(lead.state)}</span></h2><p class="detail-note">O estado é determinado pelo último evento válido registrado no histórico.</p></article><article class="panel detail-card"><span class="eyebrow">RESPONSÁVEL</span><h2>${lead.owner}</h2><p class="detail-note">Perfil Comercial</p><a class="text-link" href="#tarefas">Ver tarefas →</a></article></aside></div>`;
  }
  function renderTasks() { document.querySelector('#tasks-list').innerHTML = tasks.map(renderTask).join(''); }
  function renderOffers() { document.querySelector('#offers-table').innerHTML = offers.map((offer) => `<tr><td><strong>${offer.name}</strong></td><td>${offer.lead}</td><td>${offer.date}</td><td>${offer.owner}</td><td><span class="status-badge status-badge--oferta">${offer.state}</span></td></tr>`).join(''); }
  function renderReports() {
    const counts = STATES.map((state) => ({ ...state, count: leads.filter((lead) => lead.state === state.key).length }));
    const max = Math.max(...counts.map((item) => item.count));
    document.querySelector('#report-funnel').innerHTML = counts.map((item) => `<div class="report-line"><span>${item.label}</span><div class="report-line__bar"><i style="width:${item.count / max * 100}%"></i></div><span class="report-line__count">${item.count}</span></div>`).join('');
    const sources = [...new Set(leads.map((lead) => lead.source))].map((source) => ({ source, count: leads.filter((lead) => lead.source === source).length }));
    document.querySelector('#report-sources').innerHTML = sources.map((item) => `<div class="source-line"><span>${labelForSource(item.source)}</span><div class="source-line__bar"><i style="width:${item.count / leads.length * 100}%"></i></div><span class="source-line__count">${item.count}</span></div>`).join('');
  }
  function showToast(message) { const toast = document.querySelector('#toast'); toast.textContent = message; toast.classList.add('is-visible'); window.clearTimeout(showToast.timer); showToast.timer = window.setTimeout(() => toast.classList.remove('is-visible'), 2600); }
  function showScreen(screen) {
    document.querySelectorAll('[data-screen]').forEach((item) => item.classList.toggle('is-visible', item.dataset.screen === screen));
    const names = { overview: 'Visão Geral', pipeline: 'Pipeline', leads: 'Leads', 'lead-detail': 'Detalhe do lead', tasks: 'Tarefas', offers: 'Ofertas', reports: 'Relatórios', settings: 'Configurações' };
    document.querySelector('#breadcrumb-current').textContent = names[screen];
    document.querySelectorAll('[data-screen-link]').forEach((item) => item.classList.toggle('is-active', item.dataset.screenLink === screen || (screen === 'lead-detail' && item.dataset.screenLink === 'leads')));
    if (screen === 'overview') renderOverview();
    if (screen === 'pipeline') renderPipeline();
    if (screen === 'leads') renderLeads();
    if (screen === 'lead-detail') renderLeadDetail(location.hash.split('/')[1]);
    if (screen === 'tasks') renderTasks();
    if (screen === 'offers') renderOffers();
    if (screen === 'reports') renderReports();
    document.querySelector('#app-main').focus({ preventScroll: true });
    document.querySelector('.sidebar')?.classList.remove('is-open');
  }
  function boot() {
    document.querySelectorAll('[data-screen-link]').forEach((link) => link.addEventListener('click', () => window.setTimeout(() => showScreen(getScreenForHash(location.hash)), 0)));
    window.addEventListener('hashchange', () => showScreen(getScreenForHash(location.hash)));
    ['lead-search', 'lead-state-filter', 'lead-source-filter'].forEach((id) => document.querySelector(`#${id}`)?.addEventListener('input', renderLeads));
    document.querySelector('.mobile-menu')?.addEventListener('click', (event) => { const sidebar = document.querySelector('.sidebar'); const isOpen = sidebar.classList.toggle('is-open'); event.currentTarget.setAttribute('aria-expanded', String(isOpen)); });
    document.addEventListener('click', (event) => {
      const action = event.target.closest('[data-action]')?.dataset.action;
      if (action === 'new-lead') showToast('Cadastro de lead será aberto na próxima etapa do protótipo.');
      if (action === 'new-task') showToast('Tarefa criada em modo de demonstração.');
      if (action === 'new-offer') showToast('Registro de oferta disponível no próximo fluxo.');
      const taskButton = event.target.closest('[data-task-id]');
      if (taskButton) { const task = tasks.find((item) => item.id === taskButton.dataset.taskId); if (task) { task.done = !task.done; renderTasks(); renderOverview(); showToast(task.done ? 'Tarefa concluída.' : 'Tarefa reaberta.'); } }
    });
    showScreen(getScreenForHash(location.hash));
  }
  if (typeof document !== 'undefined') document.addEventListener('DOMContentLoaded', boot);
  return { getTodayMetrics, filterLeads, nextStateFromEvent, getScreenForHash };
}));
