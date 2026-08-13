import { demoLeads, demoTasks, FUNNEL_STATES, getTodayMetrics } from '../lib/demo-data.mjs';

const metricLabels = [
  ['newLeads', 'Novos leads hoje', 'entradas desde 00:00'],
  ['qualifying', 'Leads em qualificação', 'estado atual'],
  ['offers', 'Ofertas apresentadas hoje', 'registros no dia'],
  ['won', 'Ganhos hoje', 'conversões confirmadas'],
  ['lost', 'Perdidos hoje', 'encerramentos no dia'],
  ['pendingTasks', 'Tarefas pendentes hoje', 'prazo até o fim do dia'],
];

export default function HomePage() {
  const metrics = getTodayMetrics(demoLeads, demoTasks, new Date('2026-08-13T15:00:00-03:00'));
  const pipeline = FUNNEL_STATES.map((state: { key: string; label: string }) => ({ ...state, count: demoLeads.filter((lead: { state: string }) => lead.state === state.key).length }));

  return (
    <main className="crm-page">
      <header className="crm-header">
        <div><span className="eyebrow">OPERAÇÃO COMERCIAL · HOJE</span><h1>Visão Geral</h1><p className="lede">Uma leitura clara do que está acontecendo na operação comercial da Uli.</p></div>
        <span className="prototype-badge">Protótipo com dados fictícios</span>
      </header>
      <section className="metric-grid" aria-label="Indicadores de hoje">
        {metricLabels.map(([key, label, detail]) => <article className="metric-card" key={key}><small>{label}</small><strong>{metrics[key as keyof typeof metrics]}</strong><em>{detail}</em></article>)}
      </section>
      <section className="content-grid">
        <article className="panel"><span className="eyebrow">MOVIMENTAÇÃO</span><h2>Visão do pipeline</h2><div className="pipeline-bars">{pipeline.map((item: { key: string; count: number; label: string }) => <div className="pipeline-bar" key={item.key}><b>{item.count}</b><i style={{ height: `${Math.max(28, item.count * 54)}px` }} /><span>{item.label}</span></div>)}</div></article>
        <article className="panel"><span className="eyebrow">ATENÇÃO</span><h2>Tarefas de hoje</h2><ul className="task-list">{demoTasks.slice(0, 3).map((task: { id: string }, index: number) => <li key={task.id}><span className="task-check" />{['Retomar conversa com Bruno Vieira', 'Enviar material da Aula Estratégica', 'Confirmar entrada na comunidade'][index]}</li>)}</ul></article>
      </section>
      <p className="principle">“Diagnóstico antes de recomendação.” O CRM organiza a decisão comercial sem perder a leitura humana de cada relacionamento.</p>
    </main>
  );
}
