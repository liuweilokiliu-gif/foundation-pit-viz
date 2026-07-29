-- Create beam_ext_data table for storing beam (对撑/角撑) extended data
-- Run this in Supabase SQL Editor

CREATE TABLE IF NOT EXISTS beam_ext_data (
  project_id TEXT NOT NULL DEFAULT 'meilin',
  beam_id TEXT NOT NULL,
  section_size TEXT,
  top_elev TEXT,
  start_date DATE,
  end_date DATE,
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (project_id, beam_id)
);

-- Enable Row Level Security
ALTER TABLE beam_ext_data ENABLE ROW LEVEL SECURITY;

-- Policy: anyone can read
CREATE POLICY "beam_ext_data_read" ON beam_ext_data FOR SELECT USING (true);

-- Policy: only authenticated users can write
CREATE POLICY "beam_ext_data_write" ON beam_ext_data FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "beam_ext_data_update" ON beam_ext_data FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "beam_ext_data_delete" ON beam_ext_data FOR DELETE TO authenticated USING (true);
