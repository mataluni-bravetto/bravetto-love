#!/bin/bash
# 🔍 DEEP RESEARCH: Vet a Partner
# This script creates a research request template

# Colors for pretty output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  🔍 DEEP RESEARCH: Vet a Partner${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  ${YELLOW}Who do you want to research?${NC}"
echo "  (Type a company name, person name, or organization)"
echo ""
read -p "  → " RESEARCH_TARGET

if [ -z "$RESEARCH_TARGET" ]; then
    echo ""
    echo -e "  ${YELLOW}No target entered. Returning to workspace.${NC}"
    echo ""
    exit 0
fi

# Clean the name for filename
CLEAN_NAME=$(echo "$RESEARCH_TARGET" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:]-')
DATE=$(date +%Y-%m-%d)
FILENAME="ops/research/${DATE}-${CLEAN_NAME}.md"

# Create research directory if it doesn't exist
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(dirname "$SCRIPT_DIR")"
mkdir -p "$WORKSPACE_DIR/ops/research"

# Create the research request file
cat > "$WORKSPACE_DIR/$FILENAME" << EOF
# 🔍 Research Dossier: ${RESEARCH_TARGET}

**Requested:** $(date '+%B %d, %Y')  
**Status:** 🟡 Awaiting Research  
**Requested By:** Love

---

## 📋 Research Request

**Target:** ${RESEARCH_TARGET}

**What I Need to Know:**
> *[Add your specific questions here — What do you want to find out?]*

- [ ] Values alignment with Bravètto
- [ ] Corporate contacts for partnerships/discounts
- [ ] Reputation and risk assessment
- [ ] Recent news or developments
- [ ] Other: _______________

---

## ✨ NEXT STEP

**To get this researched:**
1. Fill in your specific questions above
2. Save this file (Cmd+S or Ctrl+S)
3. Ask AbëONE in the chat: "Please research this dossier for me"
4. I'll fill in the sections below with findings

---

## 🎯 The Bottom Line

> *[AbëONE will summarize the key finding in one sentence here]*

---

## 📊 Research Findings

### Company/Person Overview
| Field | Finding |
|-------|---------|
| **Full Name** | *[TBD]* |
| **Type** | *[Company/Person/Org]* |
| **Industry** | *[TBD]* |
| **Size/Reach** | *[TBD]* |
| **Headquarters** | *[TBD]* |

### Values Alignment Assessment

| Bravètto Value | Alignment | Evidence |
|----------------|-----------|----------|
| **Sustainability** | 🟢/🟡/🔴 | *[Finding]* |
| **Connection** | 🟢/🟡/🔴 | *[Finding]* |
| **Scale** | 🟢/🟡/🔴 | *[Finding]* |
| **Integrity** | 🟢/🟡/🔴 | *[Finding]* |

**Overall Alignment Score:** ___/10

### Key Contacts

| Role | Name | Email/Phone | Notes |
|------|------|-------------|-------|
| *[Role]* | *[Name]* | *[Contact]* | *[How to approach]* |

### Recent News & Developments

- *[Finding 1]*
- *[Finding 2]*
- *[Finding 3]*

---

## 🛡️ Risk Assessment

| Risk Type | Level | Details |
|-----------|-------|---------|
| **Reputation Risk** | 🟢/🟡/🔴 | *[Finding]* |
| **Financial Risk** | 🟢/🟡/🔴 | *[Finding]* |
| **Values Conflict** | 🟢/🟡/🔴 | *[Finding]* |
| **Dependency Risk** | 🟢/🟡/🔴 | *[Finding]* |

---

## ✅ Recommended Action

> *[AbëONE's recommendation: Proceed / Proceed with Caution / Avoid]*

**Reasoning:**
> *[Why this recommendation]*

**Next Steps if Proceeding:**
1. *[Step 1]*
2. *[Step 2]*
3. *[Step 3]*

---

## 📚 Sources

*[AbëONE will list sources used for verification]*

---

*Research prepared by AbëONE × Chief of Staff*
EOF

echo ""
echo -e "${GREEN}  ✅ Research request created!${NC}"
echo ""
echo -e "  📁 File: ${YELLOW}${FILENAME}${NC}"
echo ""
echo -e "  ${BLUE}The file is now opening...${NC}"
echo -e "  Fill in your specific questions, then ask AbëONE in the chat to research it."
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Open the file
code "$WORKSPACE_DIR/$FILENAME"

