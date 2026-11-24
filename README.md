# Suspicious Detection in Transactions

A professional, standalone Java desktop banking application designed to detect, flag, and analyze suspicious transactions in real time using rule-based behavioral heuristics, velocity checks, and anomaly scoring.

Developed using **Core Java, Java Swing, and Java2D** for a responsive, modern banking dashboard experience without web frameworks or heavy external dependencies.

---

## 📌 Project Overview

In electronic payment systems and banking infrastructure, detecting anomalies rapidly is critical to preventing unauthorized and irregular activities. This project implements a deterministic **Rule-Based Suspicious Detection Engine** alongside a full-featured transaction ledger management suite.

### Key Highlights
- **100% Native Desktop Interface**: Built purely using Java Swing and Java2D with custom anti-aliased charts, rounded components, and a modern navy banking palette.
- **Persistent Local Storage**: Automatically saves and syncs all transactions to `data/transactions.csv` with automated seeding of realistic sample data on initial run.
- **Configurable Rule Engine**: Allows real-time modification of threshold limits, velocity windows, and historical customer deviation multipliers with one-click full-database re-scanning.
- **Interactive Risk Sandbox**: Test single transactions dynamically to view immediate risk scoring ($0-100$) and violated rule breakdown.
- **Executive Analytics & Reporting**: Real-time Donut & Bar charts, volume exposure metrics, geographic risk breakdown, and CSV report export.

---

## 🏗️ Architecture & Project Structure

```
Suspicious Detection in Transactions/
│
├── src/
│   ├── Main.java                          # Application entry point & lifecycle manager
│   │
│   ├── model/                             # Data and domain models
│   │   ├── Transaction.java               # Transaction entity with status & risk score
│   │   ├── User.java                      # Security analyst / user model
│   │   ├── SuspiciousRuleConfig.java      # Configurable heuristic parameters
│   │   └── SuspiciousAssessmentResult.java# Engine evaluation payload
│   │
│   ├── database/                          # Persistence layer
│   │   ├── TransactionRepository.java     # Thread-safe CSV reader/writer & sample seeder
│   │   └── UserRepository.java            # Thread-safe user account management
│   │
│   ├── service/                           # Business logic
│   │   ├── SuspiciousDetectionService.java# Core 5-rule heuristic engine & scoring
│   │   └── TransactionService.java        # Transaction lifecycle & event listeners
│   │
│   ├── ui/                                # Presentation layer (Java Swing)
│   │   ├── LoginFrame.java                # Attractive authentication gateway
│   │   ├── DashboardFrame.java            # Main window hosting CardLayout navigation
│   │   ├── DashboardPanel.java            # Executive KPI metrics, charts & recent table
│   │   ├── TransactionPanel.java          # Add, edit, delete, search, filter table
│   │   ├── TransactionDialog.java         # Modal dialog for add/edit with live audit
│   │   ├── SuspiciousDetectionPanel.java  # Rule configuration & test sandbox
│   │   ├── TransactionHistoryPanel.java   # Archive with multi-criteria filters
│   │   ├── RegisterDialog.java            # User self-registration modal
│   │   └── ReportsPanel.java              # Analytics, charts, geo-risk & CSV export
│   │
│   ├── components/                        # Reusable Swing widgets
│   │   ├── Sidebar.java                   # Navigation bar with active indicators
│   │   ├── SummaryCard.java               # Modern KPI metric cards
│   │   └── ChartPanel.java                # Java2D Donut & Bar chart engine
│   │
│   └── utils/                             # Utilities & styling
│       ├── UIUtils.java                   # Color palette, custom borders & table renderers
│       └── CSVExporter.java               # JFileChooser CSV report exporter
│
├── data/
│   ├── transactions.csv                   # Persistent CSV storage (auto-created)
│   └── users.csv                          # Persistent user account storage
│
├── bin/                                   # Compiled .class files (git ignored)
├── run.bat                                # Windows 1-click build and execution script
├── .gitignore
└── README.md
```

---

## 🛡️ Suspicious Detection Engine Heuristics

The engine evaluates each transaction against 5 primary behavioral heuristic rules:

1. **Configurable High Amount Threshold**: Flags transactions exceeding the configured dollar limit (default: `$10,000.00`). Adds proportional risk score based on excess ratio.
2. **Velocity Spike Check**: Detects multiple transactions from the same customer within a short configurable time window (default: $\ge 3$ transactions in $\le 15$ minutes).
3. **Customer Spending Deviation Anomaly**: Compares the current transaction against the customer's historical average spending. Flags if the amount exceeds the historical baseline by the configured multiplier (default: $\ge 3.0\times$ average for amounts $> \$1,000$).
4. **Duplicate / Replay Pattern Check**: Identifies identical payment amounts processed by the same customer within 10 minutes (detects skimming and replay anomalies).
5. **Off-Hours / High-Risk Timing**: Identifies abnormal high-value withdrawals executed between 01:00 AM and 05:00 AM.

> **Disclaimer**: This is an educational rule-based suspicious transaction detection system designed for academic evaluation, simulating heuristics and anomaly detection without requiring external commercial cloud services.

---

## 🚀 How to Compile and Run

### Prerequisites
- **JDK 11 or higher** (JDK 17 recommended; already installed).
- Visual Studio Code or Windows Command Prompt / PowerShell.

---

### Option 1: Quick Run using `run.bat` (Recommended)
Simply double-click `run.bat` or run in terminal:
```cmd
.\run.bat
```
This automatically creates the `bin` directory, compiles all source code with UTF-8 encoding, and launches the application.

---

### Option 2: Manual Terminal Commands in VS Code

1. Open a terminal in the project root directory (`Ctrl + ~` in VS Code).
2. Compile all packages:
   ```cmd
   javac -encoding UTF-8 -d bin -sourcepath src src/model/*.java src/database/*.java src/service/*.java src/utils/*.java src/components/*.java src/ui/*.java src/Main.java
   ```
3. Run the compiled application:
   ```cmd
   java -cp bin Main
   ```

---

## 🔑 Multi-User Support & Self-Registration

The application supports multiple security roles and persistent user account registration:

| Username | Password | Role | Description |
| :--- | :--- | :--- | :--- |
| `admin` | `admin123` | Administrator | Chief Security Officer |
| `analyst` | `password` | Risk Analyst | Suspicious Operations Officer |
| `faculty` | `demo2026` | Auditor | Project Evaluator / Faculty |

### Registering New Users
Users can click **`+ Register New User Account`** directly on the login screen to create a new profile with their **Full Name**, **Personal Email**, **Username**, **Role**, and **Password**. Newly registered users are saved to `data/users.csv` and can log in immediately using either their username or personal email. The logged-in user's name and role appear automatically on the sidebar user card.

---

## 🎯 Demonstration Guide for Faculty Evaluation

1. **Login**: Enter `admin` / `admin123` or your registered email to access the dashboard.
2. **Dashboard Overview**: Inspect the real-time summary cards (Total Volume, Legitimate, Suspicious, Suspicious Rate) and the live Java2D Donut and Bar charts.
3. **Add Transaction**:
   - Click `+ New Transaction` or navigate to `Transactions` -> `+ Add Transaction`.
   - Test a normal amount (e.g., $150 at New York) $\rightarrow$ Marked **LEGITIMATE**.
   - Test an abnormal amount (e.g., $25,000 at Zurich) $\rightarrow$ Instantly flagged **SUSPICIOUS** with risk score $\ge 85$.
4. **Rule Configuration Sandbox**:
   - Go to `Suspicious Detection`.
   - Adjust the **Amount Threshold** (e.g., lower from $10,000 to $2,000) and click **Re-evaluate All Data**.
   - Notice how all transactions across the database and dashboard update instantly!
   - Use the **Interactive Risk Evaluation Sandbox** to test arbitrary scenarios live.
5. **Audit History & Search**:
   - Go to `Transaction History`.
   - Filter by date range (e.g., "Last 24 Hours"), enter minimum amount bounds, or search by customer name.
   - Double-click any row to view its complete Security Transaction Archive report.
6. **Export Reports**:
   - Go to `Reports` and click **Export Full Report to CSV**. Choose a destination to save the file.
