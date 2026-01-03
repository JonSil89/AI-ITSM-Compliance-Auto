[![AI ITSM Full Stack CI](https://github.com/JonSil89/AI-ITSM-Compliance-Auto/actions/workflows/compliance-check.yml/badge.svg)](https://github.com/JonSil89/AI-ITSM-Compliance-Auto/actions/workflows/compliance-check.yml)
[![Compliance & Policy Guard](https://github.com/JonSil89/AI-ITSM-Compliance-Auto/actions/workflows/policy-guard.yml/badge.svg)](https://github.com/JonSil89/AI-ITSM-Compliance-Auto/actions/workflows/policy-guard.yml)


# AI-Powered-ITSM-Documentation-Building-automated-compliance-workflows-using-ClickUp-AI.
Workflows and AI

#### Architecture Overview
## Business Impact
- **Efficiency**: Automates manual compliance checks, saving up to 40 hours/month of manual documentation review.
- **Risk Mitigation**: Ensures all ITSM processes are cross-referenced against ISO-27001 standards.
- **Scalability**: Decoupled architecture allows for easy integration with existing ClickUp or Jira workflows.
The system follows a modular RAG (Retrieval-Augmented Generation) pattern designed for high-compliance environments:

```mermaid
graph TD
    A[Raw ITSM Docs / ClickUp API] --> B[ingest_to_vector_db.py]
    B --> C[embeddings_generator.py]
    C --> D[(Vector Database / FAISS)]
    D --> E[query_engine.py]
    E --> F[Compliance-Aware AI Output]
    
    subgraph Validation Layer
    G[proof-html.yml] -.-> F
    H[auto-assign.yml] -.-> B
    end
```
---

## DevSecOps Orchestration
The repository includes an `orchestrate.sh` script to simulate automated quality gates. This script ensures that the AI-powered documentation and infrastructure components are aligned with high-compliance standards (ISO/MDR) before deployment.

**Run the orchestration:**
`./orchestrate.sh`

---

```mermaid
graph TD
    subgraph Data_Ingestion
    A[Raw ITSM Docs / ClickUp API] --> B[ingest_to_vector_db.py]
    end

    subgraph AI_Intelligence_Layer
    B --> C[embeddings_generator.py]
    C --> D[(Vector Database / FAISS)]
    D --> E[RankLSTM Engine]
    E --> F[Contextual Ranking Refinement]
    end
    
    subgraph Operational_Output
    F --> G[Compliance-Aware AI Output]
    F --> H[Live AI-Dashboard]
    end

    subgraph Validation_Layer
    I[proof-html.yml] -.-> H
    J[auto-assign.yml] -.-> B
    end
```
