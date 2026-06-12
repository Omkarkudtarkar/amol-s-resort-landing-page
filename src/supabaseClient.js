import { createClient } from '@supabase/supabase-js';

// Prefer environment variables for safety. Vite exposes env vars as import.meta.env
// Set these in a `.env` / `.env.local` file at project root:
// VITE_SUPABASE_URL=https://your-project.supabase.co
// VITE_SUPABASE_ANON_KEY=your-anon-key

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'https://mukltymgpootebrmqadv.supabase.co';
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im11a2x0eW1ncG9vdGVicm1xYWR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzIzNzg0MDgsImV4cCI6MjA4Nzk1NDQwOH0.hM1OOCMKLE8mYExIxxd_30CO4lEOBzWcRMib5ueZnL4';

export const supabase = createClient(supabaseUrl, supabaseAnonKey);