#!/bin/bash
# 🗓️ CREATE NEW EVENT
# This script scaffolds a complete event folder

# Colors for pretty output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  🗓️ CREATE NEW EVENT${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${YELLOW}What's the name of your event?${NC}"
echo "  (e.g., 'SXSW 2026' or 'Q1 Team Retreat')"
echo ""
read -p "  → " EVENT_NAME

if [ -z "$EVENT_NAME" ]; then
    echo ""
    echo -e "  ${YELLOW}No event name entered. Returning to workspace.${NC}"
    echo ""
    exit 0
fi

# Clean the name for folder
CLEAN_NAME=$(echo "$EVENT_NAME" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]-')
DATE=$(date +%Y-%m-%d)

# Get workspace directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(dirname "$SCRIPT_DIR")"
EVENT_DIR="$WORKSPACE_DIR/ops/events/${CLEAN_NAME}"

# Create event folder
mkdir -p "$EVENT_DIR"

# Create OVERVIEW.md
cat > "$EVENT_DIR/OVERVIEW.md" << EOF
# 🗓️ ${EVENT_NAME}

**Created:** $(date '+%B %d, %Y')  
**Status:** 🟡 Planning  
**Owner:** Love

---

## 📋 Event Overview

| Field | Details |
|-------|---------|
| **Event Name** | ${EVENT_NAME} |
| **Date(s)** | *[Enter dates]* |
| **Location** | *[City, Venue]* |
| **Purpose** | *[Why we're doing this]* |
| **Expected Outcome** | *[What success looks like]* |
| **The Vibe** | *[How it should feel]* |

---

## 📁 Event Documents

| Document | Purpose |
|----------|---------|
| [📊 Budget](./BUDGET.md) | Track all costs and spending |
| [📅 Itinerary](./ITINERARY.md) | Day-by-day schedule |
| [👥 Guest List](./GUEST_LIST.md) | Who's attending and their details |

---

## ✅ Quick Checklist

- [ ] Dates finalized
- [ ] Budget approved
- [ ] Venue booked
- [ ] Attendees confirmed
- [ ] Travel arranged
- [ ] Materials prepared
- [ ] Calendar invites sent

---

## 📝 Notes

> *[Add any important notes or context here]*

---

*Event managed by Love × Powered by AbëONE*
EOF

# Create BUDGET.md
cat > "$EVENT_DIR/BUDGET.md" << EOF
# 📊 Budget: ${EVENT_NAME}

**Last Updated:** $(date '+%B %d, %Y')  
**Approved By:** *[Name]*  
**Total Budget:** \$*[Amount]*

---

## 💰 Budget Summary

| Category | Budgeted | Spent | Remaining | Status |
|----------|----------|-------|-----------|--------|
| Venue/Space | \$ | \$ | \$ | 🟢 |
| Travel | \$ | \$ | \$ | 🟢 |
| Lodging | \$ | \$ | \$ | 🟢 |
| Food & Beverage | \$ | \$ | \$ | 🟢 |
| Materials/Swag | \$ | \$ | \$ | 🟢 |
| Speakers/Entertainment | \$ | \$ | \$ | 🟢 |
| Technology/AV | \$ | \$ | \$ | 🟢 |
| Buffer (10%) | \$ | \$ | \$ | 🟢 |
| **TOTAL** | **\$** | **\$** | **\$** | |

**Status Legend:** 🟢 On Track | 🟡 Caution | 🔴 Over Budget

---

## 📋 Expense Details

### Venue/Space
| Item | Vendor | Amount | Paid? | Receipt |
|------|--------|--------|-------|---------|
| *[Item]* | *[Vendor]* | \$ | ☐ | *[Link]* |

### Travel
| Who | Type | Amount | Paid? | Confirmation # |
|-----|------|--------|-------|----------------|
| *[Name]* | Flight | \$ | ☐ | *[#]* |

### Lodging
| Who | Hotel | Nights | Amount | Confirmation # |
|-----|-------|--------|--------|----------------|
| *[Name]* | *[Hotel]* | *[#]* | \$ | *[#]* |

### Food & Beverage
| Item | Vendor | Amount | Paid? | Notes |
|------|--------|--------|-------|-------|
| *[Item]* | *[Vendor]* | \$ | ☐ | |

---

## 📝 Budget Notes

> *[Any special considerations, approvals needed, or context]*

---

[← Back to Event Overview](./OVERVIEW.md)
EOF

# Create ITINERARY.md
cat > "$EVENT_DIR/ITINERARY.md" << EOF
# 📅 Itinerary: ${EVENT_NAME}

**Event Dates:** *[Start Date]* — *[End Date]*  
**Location:** *[City, Venue]*  
**Time Zone:** *[Time Zone]*

---

## 🗓️ Schedule at a Glance

| Day | Date | Focus |
|-----|------|-------|
| Day 0 | *[Date]* | Arrival |
| Day 1 | *[Date]* | *[Theme]* |
| Day 2 | *[Date]* | *[Theme]* |
| Day 3 | *[Date]* | Departure |

---

## 📋 Detailed Schedule

### Day 0: Arrival — *[Date]*

| Time | Activity | Location | Lead | Notes |
|------|----------|----------|------|-------|
| Afternoon | Arrivals | *[Airport/Venue]* | | |
| 6:00 PM | Welcome Dinner | *[Restaurant]* | | |
| 9:00 PM | Free Time | | | |

### Day 1: *[Theme]* — *[Date]*

| Time | Activity | Location | Lead | Notes |
|------|----------|----------|------|-------|
| 7:30 AM | Breakfast | | | |
| 9:00 AM | *[Session]* | | | |
| 10:30 AM | Break | | | |
| 11:00 AM | *[Session]* | | | |
| 12:30 PM | Lunch | | | |
| 2:00 PM | *[Session]* | | | |
| 4:00 PM | Break | | | |
| 4:30 PM | *[Session]* | | | |
| 6:00 PM | Free Time | | | |
| 7:00 PM | Dinner | | | |

### Day 2: *[Theme]* — *[Date]*

| Time | Activity | Location | Lead | Notes |
|------|----------|----------|------|-------|
| 7:30 AM | Breakfast | | | |
| 9:00 AM | *[Session]* | | | |
| 12:00 PM | Lunch + Closing | | | |
| 2:00 PM | Departures | | | |

---

## 📍 Key Locations

| Place | Address | Contact | Notes |
|-------|---------|---------|-------|
| Main Venue | *[Address]* | *[Phone]* | |
| Hotel | *[Address]* | *[Phone]* | |
| Dinner Spot | *[Address]* | *[Phone]* | Reservation under: |

---

## 🚨 Emergency Contacts

| Role | Name | Phone |
|------|------|-------|
| Event Lead | Love | *[Phone]* |
| Venue Contact | *[Name]* | *[Phone]* |
| Local Emergency | 911 | |

---

[← Back to Event Overview](./OVERVIEW.md)
EOF

# Create GUEST_LIST.md
cat > "$EVENT_DIR/GUEST_LIST.md" << EOF
# 👥 Guest List: ${EVENT_NAME}

**Last Updated:** $(date '+%B %d, %Y')  
**Total Confirmed:** *[#]*  
**Total Pending:** *[#]*

---

## ✅ Confirmed Attendees

| Name | Role/Company | Status | Travel | Dietary | Notes |
|------|--------------|--------|--------|---------|-------|
| *[Name]* | *[Role]* | ✅ Confirmed | ✈️ Booked | *[Any]* | |
| *[Name]* | *[Role]* | ✅ Confirmed | ✈️ Booked | *[Any]* | |

---

## 🟡 Pending/Invited

| Name | Role/Company | Status | Follow-up Date | Notes |
|------|--------------|--------|----------------|-------|
| *[Name]* | *[Role]* | 🟡 Invited | *[Date]* | |
| *[Name]* | *[Role]* | 🟡 Awaiting | *[Date]* | |

---

## ❌ Declined/Unable

| Name | Role/Company | Reason | Notes |
|------|--------------|--------|-------|
| *[Name]* | *[Role]* | *[Reason]* | |

---

## 📊 Attendance Summary

| Category | Count |
|----------|-------|
| Total Invited | *[#]* |
| Confirmed | *[#]* |
| Pending | *[#]* |
| Declined | *[#]* |
| **Expected Attendance** | **[#]** |

---

## 🍽️ Dietary Requirements

| Requirement | Count | Who |
|-------------|-------|-----|
| Vegetarian | *[#]* | *[Names]* |
| Vegan | *[#]* | *[Names]* |
| Gluten-Free | *[#]* | *[Names]* |
| Allergies | *[#]* | *[Names + specifics]* |
| Other | *[#]* | *[Names + details]* |

---

## 🚗 Travel Coordination

| Name | Arrival | Departure | Needs Pickup? | Notes |
|------|---------|-----------|---------------|-------|
| *[Name]* | *[Date/Time]* | *[Date/Time]* | Yes/No | |

---

[← Back to Event Overview](./OVERVIEW.md)
EOF

echo ""
echo -e "${GREEN}  ✅ Event created successfully!${NC}"
echo ""
echo -e "  📁 Location: ${YELLOW}ops/events/${CLEAN_NAME}/${NC}"
echo ""
echo -e "  Created files:"
echo -e "    • 📋 OVERVIEW.md — The main event page"
echo -e "    • 📊 BUDGET.md — Track all costs"
echo -e "    • 📅 ITINERARY.md — Day-by-day schedule"
echo -e "    • 👥 GUEST_LIST.md — Attendee management"
echo ""
echo -e "  ${BLUE}Opening the event overview now...${NC}"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Open the overview file
code "$EVENT_DIR/OVERVIEW.md"

