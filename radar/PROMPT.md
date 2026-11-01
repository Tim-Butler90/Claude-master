# Weekly trend radar: run instructions

Goal: find product niches that are growing but not yet saturated, and validate demand with real complaints.

Budget: at most 12 Firecrawl searches or scrapes in total. State the credits used in the report.

Steps
1. Read `radar/NICHES.md`.
2. For each watched niche, gather: search-volume or trend evidence, 3+ recent complaints or requests from Reddit/Hacker News/Indie Hackers, competitor count or saturation signal, and any price evidence.
3. Pull one wildcard signal: GitHub trending or Hugging Face trending for tools relevant to the niches.
4. Write `radar/reports/YYYY-MM-DD.md`: a table of niches (growth, competition, willingness-to-pay, verdict) and a "build this next" recommendation with the evidence.
5. Rules: cite the source URL for every number. Mark any claim you could not verify as unverified. Vendor listicles are not evidence of early demand.
6. Commit only `radar/reports/` to branch `radar/reports` and push it. Do not open a pull request. Do not change any other file.
