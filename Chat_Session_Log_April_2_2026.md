# Mike Cvetanovich Portfolio — Chat Session Log
## Date: April 2, 2026

---

## Session Overview
This chat session covered a full audit and series of improvements to Mike Cvetanovich's Power Platform Developer portfolio hosted at **https://mikecvetanovich.github.io** (also accessible via **cvetanovich.com**).

---

## 1. Domain Redirect Fix (cvetanovich.com)

### Problem
- `www.cvetanovich.com` redirected to GitHub Pages but `cvetanovich.com` (bare domain) did not.

### Solution
- Navigated to cPanel Zone Editor — confirmed A record for `cvetanovich.com` points to `104.236.12.153`
- Updated `default.html` in cPanel with meta refresh redirect to `https://mikecvetanovich.github.io`
- Created `index.html` in `public_html` with same redirect
- Created `.htaccess` with server-side 301 redirect (most reliable):
```
RewriteEngine On
RewriteRule ^(.*)$ https://mikecvetanovich.github.io/$1 [R=301,L]
```
- **Note:** `.htaccess` files are hidden by default in cPanel File Manager — must enable "Show Hidden Files (dotfiles)" in Settings.

### Result
Both `cvetanovich.com` and `www.cvetanovich.com` now redirect to GitHub Pages.

---

## 2. Image Carousel Feature

### What Was Added
- Any `.detail-screenshots` section with 2+ images automatically converts to a carousel when the modal opens
- Left/right arrow buttons (‹ ›) to navigate
- Dot indicators (clickable to jump)
- Counter showing "2 / 5" style position
- Smooth sliding animation
- Click any image to open full-size in lightbox
- Sections with only 1 image stay as-is
- Wraps around (last → first)

### CSS Classes Added
- `.carousel`, `.carousel-track`, `.carousel-btn`, `.carousel-btn-prev`, `.carousel-btn-next`
- `.carousel-counter`, `.carousel-dots`, `.carousel-dot`, `.carousel-dot.active`

### JavaScript
- Carousel is built dynamically in `openModal()` — replaces `.detail-screenshots` containers with carousel DOM elements
- Uses `translateX` transform for slide animation

---

## 3. Lightbox Navigation Upgrade

### What Was Added
When clicking an image from any carousel to enlarge it:
- **Left/right arrow buttons** (‹ ›) to navigate through all images in that carousel set
- **Keyboard support** — ArrowLeft/ArrowRight to navigate, Escape closes lightbox first (then modal)
- **Counter** showing position (e.g., "3 / 8")
- **Close button** (✕) in top-right corner
- Single images open without navigation — arrows only appear when there's a set

### HTML Structure
```html
<div class="lightbox" id="lightbox" onclick="if(event.target===this)closeLightbox()">
  <button class="lb-btn lb-prev" onclick="event.stopPropagation();lbNav(-1)">&#8249;</button>
  <img id="lightbox-img" src="" alt="Expanded view">
  <button class="lb-btn lb-next" onclick="event.stopPropagation();lbNav(1)">&#8250;</button>
  <div class="lb-counter" id="lb-counter"></div>
  <button class="lb-close" onclick="closeLightbox()">&#10005;</button>
</div>
```

### Key Functions
- `openLightbox(src, imageSet)` — opens lightbox, optionally with navigation set
- `lbNav(dir)` — navigates within lightbox
- `closeLightbox()` — closes and resets

---

## 4. RA Program Event Tracker — Full Overhaul

### Changes Made
- **Card face** → `TOP Test Program Event APP .png`
- **Flow screenshot** separated into its own "Approval Flow" section (was mixed into app screenshots)
- **App Screenshots carousel**: TOP, P1, P2, P3 (flow image removed)
- **Workflow description** written from uploaded 12-page PDF showing:
  - RA CompID → StarRez API → SR/RLC approval chain → Planner tasks → Outlook To-Do → email notifications
- **PDF links** fixed:
  - `Overview Explanation of RA Program Event App Workflow using GRAPH API calls.pdf` (note: filename spelling was corrected from "Explaination" to "Explanation")
  - `Explaination of the HRL ResLife Program Event Tracker Workflow.pdf` (second PDF added)
- **Tags updated**: added Graph API, Planner, SharePoint
- **Description rewritten** with full workflow detail
- **Video demo** preserved

---

## 5. RA Room Inspection App — Full Overhaul

### Changes Made
- **Card face** → `01_select_housing_area.png` (first walkthrough screenshot)
- **App Walkthrough carousel**: 8 screenshots (01-08) from `RA Room Inspection App Screenshots/`
- **Power BI Report carousel** path fixed to: `RA Room Inspections/RA Insp Teams SharePoint Tables and Power BI/P1...P2...P3...`
- **Data & Integration carousel** path fixed with SP prefixes: `SP1 SharePoint Results in Teams View.png`, `SP2 SharePoint RA Room Inspection Table.png`, `SP3 Sample Photo Room Inspection.png`
- **Mobile Menu Screenshots PDF link removed** (per user request)
- **App Overview + Power BI Report Highlights PDFs** kept

---

## 6. Access Control & Mailroom — Separated into Two Cards

### Building Access Control System (new card)
- **Card thumbnail**: Key Card Report
- **Description**: Batch → sqlcl → Oracle SQL → CSV/HTML automation pipeline
- **Code sample**: `offline_door_report.bat` Oracle SQL query
- **PDF documentation**: Alarms Log Table Relationships, Access Control Request Process

### Mailroom Staff Arrival Tracker (new card)
- **Card thumbnail**: Mailroom Staff Arrivals.png (P1)
- **Dashboard carousel**: Staff Arrivals overview, single user selected, Data Model
- **Code sample**: Oracle SQL access history query with time-window filtering

---

## 7. ECS Federal Cards — Enhanced with Detail Sections

All four bare ECS cards were upgraded:

### Azure Key Vault for Power Platform GCC
- Added Problem/Approach sections
- Mentions Entra ID, OAuth 2.0, environment variables, dev/test/prod

### Premium License Optimization
- Added CoE Toolkit audit workflow detail
- App Pass vs. per-user analysis
- Cost impact deliverables

### Power BI Content Lifecycle Management
- Added challenge/solution
- Deployment pipelines, dataset certification, sensitivity labels, refresh monitoring

### SOPs, Knowledge Base & Records Management
- Added SOP template detail, Confluence structure
- NARA/GRS compliance for federal records

---

## 8. Card Descriptions — Microsoft Best Practice Language

Updated descriptions across all cards to use stronger Microsoft-aligned terminology:
- "connected to SQL database", "providing stakeholders with"
- "data-driven resource allocation"
- "connected to StarRez", "live visibility"
- "CoE oversight", "security audits"
- "orphaned-site identification"

---

## 9. Hero Bio — Rewrites

### Version 1 (removed)
"Full-stack Power Platform developer..."

### Version 2 (removed)
"Power Platform developer building enterprise Canvas Apps..."

### Final Version (current)
"Microsoft Power Platform engineer with 10+ years of platform experience, specializing in GCC (Gov) environments for federal contracts. Proven expertise in Power Apps, Power Automate, Power BI, Dataverse, and governance architecture, including DLP policies, ALM processes, environment strategy, and compliance automation. Skilled at translating complex operational needs into automated reporting solutions, actionable dashboards, and sustainable platform governance. Adept at bridging technical execution with stakeholder communication across IT, leadership, and cross-functional teams."

### Layout Change
- `hero-inner` max-width: 800px → 1000px
- `hero-bio` max-width: 500px → 700px
- Text now fills wider, last line aligns with elephant image

---

## 10. Org Nav Cards — Added Then Removed

### Added
Two clickable cards at top of Portfolio section linking to UVA and ECS.

### Removed (per user feedback)
"They don't do much" — visitors scroll and see both org blocks immediately. The nav cards were visual noise.

### CSS Cleanup
All `.org-nav`, `.org-nav-link`, `.org-nav-role` styles and responsive rules removed.

---

## 11. Professional Development — Replaces Old Certs

### Old (removed)
Two small cert cards: "Microsoft Data Science Orientation" and "LinkedIn Learning Certifications"

### New (current)
Single centered card under "Professional Development" header:
- **Certification Path**: PL-400 (Developer) and PL-600 (Solution Architect)
- **Microsoft Learn Profile**: Direct link button
- **Completed Training**: EdX, LinkedIn Learning, self-study areas contextualized
- **Areas of Focus**: Solution architecture, ALM, Dataverse, custom connectors, GCC compliance

### CSS
- `.profdev-grid { max-width: 520px; margin: 0 auto; }` — centers single card
- `.section-label-spaced { margin-top: 3rem; }` — spacing above header

---

## 12. Resume Path Fix

### Issue
Resume link pointed to `Mike_Cvetanovich_Resume_3252026.pdf` at root, but file moved to `Resume/` subfolder.

### Fix
Changed href to `Resume/Mike_Cvetanovich_Resume_3252026.pdf`

---

## 13. Footer Updates
- Copyright: ©2025 → ©2025–2026
- Microsoft Learn link added to footer

---

## 14. VS Code Warnings Fixed (from earlier session)
- `min-height: auto` → `min-height: 0` (Firefox compat)
- Inline styles on PDF link → `.pdf-link` and `.pdf-link-wrap` CSS classes
- Inline styles on video → `.video-wrap` and `.video-player` CSS classes

---

## 15. Usage Limits Discussion

### Key Findings
- Peak hours: 8am–2pm ET on weekdays — limits are tighter
- Off-peak (evenings, weekends) gives more capacity
- Long conversations burn tokens faster due to context reprocessing
- **Tips**: Start new conversations for new tasks, batch requests, work off-peak
- **Upgrade options**: Pro ($20/mo), Max 5x ($100/mo), Max 20x ($200/mo), Extra Usage pay-as-you-go

---

## File Paths Reference

### Portfolio Root
`C:\Users\skyro\OneDrive\Desktop\Mike Cvetanovich Dev Portfolio\`

### Key Files
| File | Path |
|------|------|
| Main HTML | `index.html` |
| Elephant Image | `ElephantSunSet.jpg` |
| Resume | `Resume/Mike_Cvetanovich_Resume_3252026.pdf` |
| Power FX Carousel | `University of Virginia/HRL Facilities Management/FM INSP APP/Power FX/powerfx-carousel.html` |

### UVA Project Folders
| Project | Path |
|---------|------|
| FM Inspection App | `University of Virginia/HRL Facilities Management/FM INSP APP/` |
| FM Reports | `University of Virginia/HRL Facilities Management/FM Reports/` |
| Student Move-In | `University of Virginia/HRL Assignments/` |
| RA Program Events | `University of Virginia/HRL Resident Life/RA Program Events/` |
| RA Room Inspections | `University of Virginia/HRL Resident Life/RA Room Inspections/` |
| Access Control | `University of Virginia/HRL Access Control/` |
| Mailroom | `University of Virginia/HRL Mailroom/` |

### ECS Project Folder
`ECS/`

### UVA Create cPanel
- URL: `https://cpanel.uvacreate.virginia.edu`
- Account: `cvetanov`
- Public HTML: `/home/cvetanov/public_html`

### GitHub
- Repo: `MikeCvetanovich/MikeCvetanovich.github.io`
- Live site: `https://mikecvetanovich.github.io`

---

## Git Commands Used
```powershell
git add -A                    # Stage all changes (additions, modifications, deletions)
git commit -m "message"       # Commit with message
git push                      # Push to GitHub Pages
git commit --amend -m "new"   # Edit most recent commit message
git push --force              # Force push after amend (careful on shared repos)
```

---

## Pending / Future Considerations
- Power FX carousel had a bug inserting `="syn-function">` in front of code lines — reported fixed in another chat
- New `VoltageAnalysis.PNG` exists in `HRL Access Control/Power BI Screenshots/` — not yet added to any card
- Google Analytics (GA4) was added in another chat session with comprehensive event tracking
- `InspAppTour.mp4` video exists but is not currently linked in the FM Inspection App card
