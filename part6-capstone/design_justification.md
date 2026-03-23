## Storage Systems

In this architecture, multiple storage systems are used, each optimized for a specific purpose to ensure scalability, performance, and flexibility.

### OLTP Database
For transactional operations such as patient registration, appointments, and medical records, an OLTP (Online Transaction Processing) database is used. This system ensures high consistency, ACID compliance, and supports frequent real-time read/write operations.

### Data Warehouse
For historical and analytical processing, a data warehouse is used. It stores structured and cleaned data derived from hospital systems and ICU logs. This enables efficient aggregation queries required for monthly reporting, such as bed occupancy rates and department-wise costs.

### Data Lake
A data lake is used to store raw and semi-structured data from multiple sources, including historical patient data, logs, and streaming ICU vitals. This provides flexibility for future processing and supports machine learning pipelines without enforcing a strict schema upfront.

### Vector Database
For AI-powered semantic querying, a vector database is used. Patient histories are converted into embeddings and stored as vectors. This enables similarity-based search and natural language querying by doctors, such as retrieving relevant past medical events.

## OLTP vs OLAP Boundary

### OLTP Layer
The OLTP system handles real-time transactional operations such as patient admissions, updates to medical records, and appointment scheduling. It is optimized for fast inserts and updates with strict consistency requirements.

### ETL Boundary
The boundary between OLTP and OLAP occurs at the data ingestion and ETL pipeline. Data from the OLTP system is periodically extracted, transformed, and loaded into the data warehouse and data lake.

### OLAP Layer
The OLAP system begins at the data warehouse and analytical layers, where data is used for reporting, business intelligence, and machine learning. These systems are optimized for complex queries, aggregations, and historical analysis rather than real-time updates.

Streaming ICU vitals bypass traditional OLTP storage and are directly ingested into a streaming pipeline before being stored in the data lake and processed for real-time analytics.

## Trade-offs

### Consistency vs Scalability
One key trade-off in this design is data consistency versus scalability. Using multiple storage systems (OLTP database, data warehouse, data lake, and vector database) improves scalability and performance but introduces challenges in maintaining consistency across systems.

Since data is replicated and transformed through pipelines, there is a risk of data latency or mismatch between systems. For example, the data warehouse may not reflect real-time updates immediately.

### Mitigation Strategies
This trade-off can be mitigated by implementing reliable ETL pipelines with proper scheduling and monitoring, using Change Data Capture (CDC) for near real-time synchronization, and enforcing data validation checks. Additionally, streaming systems can be used for critical real-time data such as ICU vitals to reduce latency.