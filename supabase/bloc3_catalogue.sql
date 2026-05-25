-- Table de collecte des catalogues de prompts du Bloc 3
-- À exécuter une seule fois dans Supabase Studio (SQL Editor).

create table public.bloc3_catalogue (
  id bigserial primary key,
  created_at timestamptz default now(),
  prenom text not null,
  prompt_resume text,
  cas_usage text,
  satisfaisant text,
  a_verifier text
);

create index on public.bloc3_catalogue (created_at desc);

-- RLS : insertion anonyme autorisée, lecture seulement via service_role
-- (visible dans Supabase Studio par le propriétaire du projet).
alter table public.bloc3_catalogue enable row level security;

create policy "Insert anonyme bloc3"
  on public.bloc3_catalogue
  for insert
  to anon
  with check (true);
