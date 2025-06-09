# 🚀 Prompts

A curated repository of **Cursor Rules** (.mdc files) and **Action Prompts** (.md files) designed to enhance AI agent behavior and automate application development workflows.

## 📋 Repository Structure

```
prompts/
├── .cursor/rules/           # Cursor IDE rule configurations
│   ├── deep-thought.mdc     # Deep analysis and thoughtful reasoning
│   └── precision-efficiency.mdc  # Concise, structured responses
├── action/                  # Action prompts for specific tasks
│   └── Rapid App Generator Prompt.md  # App generation automation
└── install-cursor-rules.sh  # Automated installer script
```

## 🧠 Cursor Rules (.mdc files)

### Deep Thought Protocol

**File**: `.cursor/rules/deep-thought.mdc`

A comprehensive reasoning framework that enables AI assistants to:

- Conduct exhaustive analysis before proceeding
- Generate multiple solution pathways and hypotheses
- Provide deeply-reasoned, authoritative responses
- Prioritize depth of insight over speed

**Key Features**:

- Unconstrained ideation process
- Comprehensive analysis methodology
- Structured thinking approach (Perceive → Think → Act)
- No computational shortcuts in reasoning

### Precision & Efficiency Protocol

**File**: `.cursor/rules/precision-efficiency.mdc`

An optimization-focused framework for AI assistants that emphasizes:

- Clarity and token economy
- Structured output formatting
- Constraint adherence
- Logical transparency

**Key Features**:

- Ambiguity deconstruction
- Structured response formats (tables, lists, hierarchies)
- Explicit reasoning chains
- Ruthless token efficiency

## ⚡ Action Prompts (.md files)

### Rapid App Generator

**File**: `action/Rapid App Generator Prompt.md`

A specialized prompt for generating command sequences that create production-ready applications with:

**Tech Stack**:

- 📦 **Package Manager**: npm
- 🔧 **Language**: TypeScript
- 🎨 **Styling**: Tailwind CSS
- 🌐 **Services**: SSH tunneling for remote development
- 🤖 **Automation**: All available MCP servers

**Features**:

- Zero-config solutions
- Automated testing and validation
- Service health checks
- Clear terminal output with progress indicators
- Instant development environment setup

## 🎯 Use Cases

### For Cursor IDE Users

1. Copy desired `.mdc` files to your project's `.cursor/rules/` directory
2. Restart Cursor IDE to apply the new rules
3. Experience enhanced AI behavior tailored to your workflow

### For AI Agent Development

- Use action prompts as templates for specific automation tasks
- Combine multiple rules for complex reasoning scenarios
- Adapt prompts for different tech stacks and requirements

### For Development Teams

- Standardize AI assistant behavior across projects
- Create consistent development workflows
- Automate repetitive setup and validation tasks

## 🚀 Getting Started

### 🎯 Quick Install (Recommended)

Run the installer script in any repository to automatically import cursor rules:

```bash
# Download and run the installer
curl -fsSL https://raw.githubusercontent.com/your-username/prompts/main/install-cursor-rules.sh | bash
```

Or if you have this repository locally:

```bash
# Navigate to any target repository
cd /path/to/your/project

# Run the installer from the prompts directory
/path/to/prompts/install-cursor-rules.sh
```

The installer will:

- ✅ Create `.cursor/rules/` directory if needed
- ✅ Copy all cursor rules (.mdc files)
- ✅ Update `.gitignore` to exclude cursor files
- ✅ Provide next steps and usage instructions

### 🛠️ Manual Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/prompts.git
   ```

2. **Copy rules to your project**:

   ```bash
   cp prompts/.cursor/rules/*.mdc your-project/.cursor/rules/
   ```

3. **Use action prompts**:
   - Copy prompt content from `action/` directory
   - Paste into your AI assistant interface
   - Modify parameters as needed for your use case

## 🔧 Customization

### Modifying Rules

- Edit `.mdc` files to adjust AI behavior
- Add project-specific constraints or preferences
- Combine elements from different protocols

### Creating New Prompts

- Follow the structured format in existing action prompts
- Include clear objectives, tech stack requirements, and validation steps
- Add visual and output formatting specifications

## 📚 Best Practices

1. **Rule Selection**: Choose rules based on your task complexity

   - Use **Deep Thought** for complex analysis and planning
   - Use **Precision & Efficiency** for quick, structured tasks

2. **Prompt Composition**: Layer multiple prompts for complex workflows
3. **Testing**: Validate rule effectiveness with sample tasks
4. **Documentation**: Keep track of which rules work best for different scenarios

## 🤝 Contributing

We welcome contributions! Please:

1. Fork the repository
2. Create a feature branch
3. Add your cursor rules or action prompts
4. Include documentation and use cases
5. Submit a pull request

## 📄 License

This project is open source. Feel free to use, modify, and distribute these prompts and rules for your AI agent workflows.

---

_Enhance your AI development experience with purpose-built prompts and intelligent cursor rules._
