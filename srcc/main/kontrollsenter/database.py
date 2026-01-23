from enum import Enum
import os

SUPABASE_DB_PSW = os.environ.get("LAGSERIEN_DB_PSW")

SUPABASE = f"postgresql://postgres.fyltlipatnykwsfxdkyn:{SUPABASE_DB_PSW}@aws-0-eu-central-1.pooler.supabase.com:5432/postgres"
MEMORY = "sqlite:///:memory:"
LOKAL_FIL = "sqlite:///data/seriedata.db"

class Database(Enum):
    TOM = MEMORY
    TESTDATA = LOKAL_FIL
    PRODUKSJON = SUPABASE