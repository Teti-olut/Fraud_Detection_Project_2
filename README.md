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
[Download Full Presentation Deck](https://github.com/Teti-olut/Fraud_Detection_Project_2/blob/main/Fraud%20Detection%20Executive%20Summary%202.pptx)