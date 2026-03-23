## ETL Decisions
Refer to star_schema.png for the visual representation of the data warehouse design.

### Decision 1 — Mixed Date Formats
Problem: The dataset contained multiple date formats such as DD/MM/YYYY, DD-MM-YYYY, and YYYY-MM-DD.
Resolution: All dates were parsed and converted into a standard format (YYYY-MM-DD) before loading into dim_date.

---

### Decision 2 — Category Standardization
Problem: Product categories had inconsistent casing (e.g., "electronics", "ELECTRONICS", "Electronics").
Resolution: All categories were normalized into proper case (e.g., "Electronics", "Clothing", "Grocery").

---

### Decision 3 — Derived Metric Creation
Problem: The dataset did not contain total sales value.
Resolution: Created a new field total_amount using:
units_sold × unit_price, ensuring accurate analytical reporting.

---