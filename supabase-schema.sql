-- Create the reviews table
CREATE TABLE IF NOT EXISTS reviews (
  id BIGSERIAL PRIMARY KEY,
  chili TEXT NOT NULL,
  chili_color TEXT NOT NULL,
  reviewer TEXT NOT NULL,
  ratings JSONB NOT NULL,
  profile_code TEXT NOT NULL,
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create an index on chili name for faster queries
CREATE INDEX IF NOT EXISTS idx_reviews_chili ON reviews(chili);

-- Create an index on created_at for sorting
CREATE INDEX IF NOT EXISTS idx_reviews_created_at ON reviews(created_at DESC);

-- Enable Row Level Security (RLS)
ALTER TABLE reviews ENABLE ROW LEVEL SECURITY;

-- Create a policy that allows anyone to read reviews
CREATE POLICY "Allow public read access" ON reviews
  FOR SELECT
  USING (true);

-- Create a policy that allows anyone to insert reviews
CREATE POLICY "Allow public insert access" ON reviews
  FOR INSERT
  WITH CHECK (true);

-- Optional: Create a policy to allow users to delete their own reviews
-- (You can enable this later if needed)
-- CREATE POLICY "Allow users to delete own reviews" ON reviews
--   FOR DELETE
--   USING (auth.uid() = user_id);

-- Made with Bob
