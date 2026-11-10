## 📌 Project Background

Apex Digital Wallet (established in 2021) is a fast-growing fintech platform operating within the Nigerian financial services sector, processing millions of retail transfers, bill payments, and merchant settlements daily across multiple digital channels, primarily Mobile App, USSD, and Web. As transaction volumes scale, the organization faces increasing exposure to financial fraud, highlighted by an estimated ₦257M in unfiltered fraud losses across 1,200 fraudulent transactions. 

Previously, risk operations relied on a rigid, static threshold rule (flagging any single transaction exceeding ₦150,000). While simple, this static approach creates significant operational drag, generating 30.47% false positives and flooding analysts with dead end manual reviews while failing to adapt to evolving fraud vectors. This project evaluates and implements a proactive, dynamic Z-Score anomaly detection model ($Z > 3.0$) to optimize risk-tiering, reduce manual review noise, and intercept high-risk anomalies before settlement.

Insights and recommendations are provided on the following key areas:
* **Channel Risk Concentration:** Identifying where fraud exposure concentrates across digital channels (Mobile App vs. USSD).
* **Baseline vs. Anomaly Separation:** Evaluating how statistical Z-Score filtering isolates outliers compared to legacy flat thresholds.
* **Model Precision & Operational Efficiency:** Quantifying the reduction in false positives (from 30.47% to 25.8%) and the surge in precision (reaching 74.2%).
* **Risk-Tiering Implementation:** Actionable recommendations for automated settlement holds and resource allocation.

 The SQL queries used to calculate and inspect transaction anomalies for this analysis can be found here [SQL - Fraud Detection & Z-Score Analysis](https://github.com/Teti-olut/Fraud_Detection_Project_2/blob/main/Fraud_detection_rules.sql).  
 

An interactive dashboard used to report and explore risk trends can be found here [Download Power BI Dashboard File](https://github.com/Teti-olut/Fraud_Detection_Project_2/blob/main/Fraud%20detection%20dashboard.pbix).

The PowerPoint presentation for this analysis can be found here: 
[Download Full Presentation Deck](https://github.com/Teti-olut/Fraud_Detection_Project_2/blob/main/Fraud%20Detection%20Executive%20Summary%20(2).pptx)

## Data Structure & Initial Checks

The Apex Digital Wallet table schema  as seen below consists of one table.

![Transactions Table Schema](Images\Schema_picture.png)

## Executive Summary

### Overview of Findings
Transitioning Apex Digital Wallet from a legacy static rule limit (>₦150,000) to a dynamic Z-Score ($Z > 3.0$) anomaly detection model significantly reduces operational noise by cutting false positives by 22.5%, while successfully preserving high-risk fraud capture. The optimized two-tier risk-tiering framework prevents wasted manual reviews on 68 legitimate transactions per 50,000 logs, directly lowering compliance overhead and safeguarding capital. 

![Executive Summary Dashboard Snapshot](Images\Dashboard_picture.png)

## Insights Deep Dive

### Category 1: Precision Rate Comparison

*   **Baseline Static Performance:** The legacy static rule model (>₦150k) achieves a baseline precision rate of 69.53%, resulting in 302 wasted manual reviews out of 991 flagged transactions.
*   **Z-Score Model Improvement:** The dynamic Z-Score model ($Z > 3.0$) elevates overall precision to 74.20%, marking a solid 4.6% performance gain over rigid static thresholds.
*   **Wasted Review Reduction:** By filtering out 68 fewer false alarms than the legacy system, the Z-Score framework successfully minimizes analyst fatigue while preserving high-confidence threat detection.
*   **Operational Impact:** Higher precision ensures compliance teams spend more time investigating actual fraud vectors rather than sorting through noise.

![Precision Rate Comparison](Images\Precision_graph.png)

### Category 2: False Positive Rate Comparison

*   **Legacy Noise Burden:** The rigid static threshold model generates a false positive rate of 0.30% (or ~30.47% noise ratio), triggering unnecessary friction for legitimate customers.
*   **Z-Score Efficiency Gain:** The dynamic Z-Score model contracts the false positive rate down to 0.26%, successfully lowering operational false positives by roughly 4% compared to legacy rules.
*   **Adaptive Boundary Isolation:** By leveraging standard deviation boundaries instead of a static monetary cutoff, the model isolates true transaction outliers without penalizing normal user spending patterns.
*   **Queue Optimization:** Dropping total false positives from 302 down to 234 significantly streamlines operational queues for risk management personnel.

![False Positive Rate Comparison](images/False_Positive_Rtae_Picture.png)

## Recommendations

Based on the insights and findings above, we would recommend the Risk Management and Fraud Operations team to consider the following:

*   **Observation:** The legacy static rule (>₦150,000) generated 302 false positives out of 991 flagged transactions, creating unnecessary manual review drag. 

**Recommendation:** Fully transition production monitoring from rigid static monetary thresholds to the dynamic Z-Score model ($Z > 3.0$) to immediately eliminate 68 wasted manual reviews and raise overall precision to 74.20%.
*   **Observation:** The false positive rate contracts from 0.30% under legacy rules down to 0.26% under the statistical anomaly framework. 

**Recommendation:** Institutionalize standard-deviation-based outlier detection across core transaction streams to continuously adapt baseline spending behaviors without penalizing legitimate users.
*   **Observation:** Card payments exhibit a disproportionately high susceptibility to fraud, registering an elevated incident rate of 11.18%. 

**Recommendation:** Implement mandatory multi-factor authentication (MFA) step-ups for all high-value or high-risk card transactions exceeding normal customer behavioral deviations.
*   **Observation:** Web and ATM channels show elevated fraud exposure rates of 4.86% and 4.40% respectively compared to mobile and POS channels. 

**Recommendation:** Deploy targeted session monitoring and velocity checks specifically on Web login gateways and ATM cash-out endpoints to intercept unauthorized access early.
*   **Observation:** Operational queues are frequently bogged down by redundant manual inspections of low-risk alerts. 

**Recommendation:** Establish a two-tier automated routing protocol that isolates high-risk anomalies ($Z > 3.0$) into an expedited senior compliance queue while auto-clearing low-variance transactions.

## Assumptions and Caveats

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

*   **Assumption 1:** Transaction records spanning the 2025 calendar year contained no missing timestamp or monetary values, allowing direct aggregation across the 50,000-record dataset without requiring time-series imputation.
*   **Assumption 2:** The binary fraud flag (`is_fraud`) was restricted strictly to post-model evaluation and validation, assuming historical labels provided by compliance accurately reflect true fraudulent activity without leakage into model training inputs.
*   **Assumption 3:** Because the Z-Score calculation relies exclusively on transaction amounts (`amount_ngn`) relative to individual customer spending baselines, accounts with sparse historical activity were evaluated using available rolling standard deviation bounds.
*   **Assumption 4:** Transaction channels and types (such as Mobile App, USSD, and Web) were treated as mutually exclusive categorical dimensions for exposure mapping, assuming uniform data recording across all delivery gateways throughout the monitoring period.
*   **Assumption 5:** The threshold of $Z > 3.0$ was assumed as the optimal statistical cutoff for anomaly detection, balancing operational review capacity against the imperative to capture high-value fraud skews.