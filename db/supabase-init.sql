-- Supabase initialization SQL for ResortFinder

-- 0. Enable pgcrypto for gen_random_uuid
create extension if not exists "pgcrypto";

-- 1. Create the RESORTS table
create table if not exists resorts (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  name text,
  type text default 'budget', -- 'budget', 'premium', 'bamboo'
  description text,
  location text,
  price_sharing text,
  price_couple text,
  price text,
  check_in_time text,
  check_out_time text,
  distance_dandeli text,
  water_activity_distance text,
  activities_included text,
  water_activities_included text,
  paid_activities text,
  images text[], -- array of image URLs
  details jsonb default '{"pricing": "", "meals": "", "activities": ""}'::jsonb
);

-- 2. Create the REVIEWS table
create table if not exists reviews (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  resort_id uuid references resorts(id) on delete cascade not null,
  user_name text,
  text text,
  rating integer default 5,
  date date
);

-- 3. Enable Row Level Security (RLS) and policies
alter table resorts enable row level security;
create policy if not exists "Public can view resorts" on resorts for select using (true);
create policy if not exists "Authenticated users can insert resorts" on resorts for insert with check (auth.role() = 'authenticated');
create policy if not exists "Authenticated users can update resorts" on resorts for update using (auth.role() = 'authenticated');
create policy if not exists "Authenticated users can delete resorts" on resorts for delete using (auth.role() = 'authenticated');

alter table reviews enable row level security;
create policy if not exists "Public can view reviews" on reviews for select using (true);
create policy if not exists "Authenticated users can insert reviews" on reviews for insert with check (auth.role() = 'authenticated');
create policy if not exists "Authenticated users can delete reviews" on reviews for delete using (auth.role() = 'authenticated');

-- End of init SQL
