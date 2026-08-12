(function landingPageModule(globalScope) {
  'use strict';

  const DEMO_EVENT_DATE = '2026-09-24T19:30:00-03:00';

  function getCountdownParts(targetDate, now = new Date()) {
    const remaining = Math.max(0, targetDate.getTime() - now.getTime());
    const expired = remaining === 0;
    const totalSeconds = Math.floor(remaining / 1000);

    return {
      expired,
      days: Math.floor(totalSeconds / 86400),
      hours: Math.floor((totalSeconds % 86400) / 3600),
      minutes: Math.floor((totalSeconds % 3600) / 60),
      seconds: totalSeconds % 60,
    };
  }

  function getDemoConfirmation() {
    return 'Inscrição demonstrativa concluída. Nenhum dado foi enviado ou armazenado.';
  }

  function renderCountdown(documentRef) {
    const targetDate = new Date(DEMO_EVENT_DATE);
    const status = documentRef.querySelector('[data-countdown-status]');
    const fields = {
      days: documentRef.querySelector('[data-countdown="days"]'),
      hours: documentRef.querySelector('[data-countdown="hours"]'),
      minutes: documentRef.querySelector('[data-countdown="minutes"]'),
      seconds: documentRef.querySelector('[data-countdown="seconds"]'),
    };

    if (Object.values(fields).some((field) => !field)) return;

    let timerId;
    const update = () => {
      const parts = getCountdownParts(targetDate);

      Object.entries(fields).forEach(([key, field]) => {
        field.textContent = String(parts[key]).padStart(2, '0');
      });

      if (parts.expired) {
        if (status) status.textContent = 'Evento demonstrativo encerrado.';
        if (timerId) globalScope.clearInterval(timerId);
      }
    };

    update();
    if (targetDate.getTime() > Date.now()) {
      timerId = globalScope.setInterval(update, 1000);
    }
  }

  function initDemoForm(documentRef) {
    const form = documentRef.querySelector('#lead-form');
    const status = documentRef.querySelector('#form-status');
    if (!form || !status) return;

    form.addEventListener('submit', (event) => {
      event.preventDefault();
      status.textContent = '';

      if (!form.reportValidity()) return;

      form.reset();
      status.textContent = getDemoConfirmation();
      status.focus({ preventScroll: true });
    });
  }

  function initPrivacyDialog(documentRef) {
    const dialog = documentRef.querySelector('#privacy-dialog');
    if (!dialog) return;

    let trigger = null;

    documentRef.querySelectorAll('[data-open-privacy]').forEach((button) => {
      button.addEventListener('click', () => {
        trigger = button;
        dialog.showModal();
      });
    });

    documentRef.querySelectorAll('[data-close-privacy]').forEach((button) => {
      button.addEventListener('click', () => dialog.close());
    });

    dialog.addEventListener('click', (event) => {
      if (event.target === dialog) dialog.close();
    });

    dialog.addEventListener('close', () => {
      if (trigger) trigger.focus();
    });
  }

  function initAnchorFocus(documentRef) {
    const target = documentRef.querySelector('#lead-name');
    if (!target) return;

    documentRef.querySelectorAll('[data-focus-form]').forEach((link) => {
      link.addEventListener('click', () => {
        globalScope.setTimeout(() => target.focus({ preventScroll: true }), 450);
      });
    });
  }

  function initTestimonialScroller(documentRef) {
    const track = documentRef.querySelector('#testimonials-track');
    if (!track) return;

    documentRef.querySelectorAll('[data-scroll]').forEach((button) => {
      button.addEventListener('click', () => {
        const direction = button.dataset.scroll === 'previous' ? -1 : 1;
        track.scrollBy({ left: track.clientWidth * 0.8 * direction, behavior: 'smooth' });
      });
    });
  }

  function init(documentRef) {
    renderCountdown(documentRef);
    initDemoForm(documentRef);
    initPrivacyDialog(documentRef);
    initAnchorFocus(documentRef);
    initTestimonialScroller(documentRef);
  }

  if (typeof module !== 'undefined' && module.exports) {
    module.exports = { DEMO_EVENT_DATE, getCountdownParts, getDemoConfirmation };
  }

  if (globalScope.document) {
    if (globalScope.document.readyState === 'loading') {
      globalScope.document.addEventListener('DOMContentLoaded', () => init(globalScope.document));
    } else {
      init(globalScope.document);
    }
  }
}(typeof window !== 'undefined' ? window : globalThis));
