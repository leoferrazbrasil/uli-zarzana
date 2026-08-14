'use client';

import { createSupabaseBrowserClient } from '../lib/supabase/browser';

export function SignOutButton() {
  async function signOut() {
    const supabase = createSupabaseBrowserClient();
    await supabase.auth.signOut();
    window.location.assign('/login');
  }

  return <button className="sign-out" type="button" onClick={signOut}>Sair</button>;
}
