# Project Architecture

## 📁 Project Structure

```
ansible-devsecops-cissa/
├── .git/
│   └── Git version control data
├── .gitignore
├── .idea/
│   └── IDE configuration files
├── .serena/
│   └── Serena AI tool configuration
├── materiais/
│   ├── dia-01/
│   │   ├── demos/
│   │   │   └── README.md
│   │   ├── desafios/
│   │   │   ├── instrucoes.md
│   │   │   └── solucao-desafios-dia-01.md
│   │   └── README.md
│   ├── dia-02/
│   │   ├── demos/
│   │   │   ├── README.md
│   │   │   └── setup_nginx.yml
│   │   ├── desafios/
│   │   │   └── instrucoes.md
│   │   └── README.md
│   ├── dia-03/
│   │   ├── demos/
│   │   │   ├── README.md
│   │   │   └── app_config.yml
│   │   ├── desafios/
│   │   │   └── instrucoes.md
│   │   └── README.md
│   ├── ansible.txt
│   ├── hosts.ini
│   ├── links.txt
│   └── README.md
├── README.md
├── README_EN.md
└── ARCHITECTURE.md
```

### Directory Explanation

- **materiais/**: Main content directory containing training materials organized by day
  - **dia-01/** to **dia-03/**: Daily training modules
  - **demos/**: Demonstration playbooks and examples
  - **desafios/**: Challenge exercises and solutions
- **.serena/**: AI assistant configuration files
- **.idea/**: IDE-specific configuration

## 🎯 Architecture Principles

### Organization and Separation of Responsibilities
- **Modular Structure**: Content is organized by training days (dia-01, dia-02, dia-03), each containing demos and challenges
- **Clear Separation**: Demos (examples) are separated from challenges (exercises)
- **Type-Based Grouping**: Playbooks, configurations, and documentation are grouped by purpose

### Scalability
- **Day-Based Expansion**: New training days can be added by creating new dia-N directories
- **Consistent Pattern**: Each day follows the same directory structure (demos/, desafios/, README.md)
- **Content Reuse**: Common configurations like hosts.ini are placed at the root level

### Reusability
- **Template Consistency**: Each day directory follows the same pattern
- **Shared Resources**: Links, Ansible configurations, and hosts files are centralized
- **Reference Files**: links.txt and ansible.txt provide reusable reference material

### Maintainability
- **Documentation First**: Each directory has a README.md explaining its contents
- **Solution Tracking**: Challenge solutions are documented separately
- **Version Control**: Git-based workflow for tracking changes

## 📝 Conventions

### File and Folder Naming
- **Folders**: lowercase with hyphens (e.g., `dia-01`, `desafios`, `setup_nginx.yml`)
- **Playbooks**: lowercase with underscores (e.g., `setup_nginx.yml`, `app_config.yml`)
- **Markdown Files**: lowercase with hyphens (e.g., `instrucoes.md`, `solucao-desafios-dia-01.md`)
- **Configuration Files**: lowercase (e.g., `hosts.ini`, `ansible.txt`)

### Coding Conventions
- **YAML**: Standard Ansible YAML syntax
- **Playbook Structure**: Always include name, hosts, tasks, and handlers sections
- **Idempotency**: Playbooks should be idempotent (can be run multiple times safely)
- **Variable Naming**: snake_case for variables (e.g., `nginx_port`, `app_config`)

### Module and Component Structure
- **Playbooks**: Single-purpose, focused on one task
- **Roles**: Use roles for complex configurations
- **Tasks**: Modular and reusable across playbooks

### Best Practices
- **Clean Code**: Clear task names, commented sections for complex logic
- **DRY (Don't Repeat Yourself)**: Use includes, roles, and variables to avoid duplication
- **Documentation**: README files explain the purpose and usage of each directory

## 🛠️ Maintenance and Expansion

### Maintenance

#### Dependency Updates
- Review Ansible version compatibility periodically
- Update inventory files (hosts.ini) as infrastructure changes
- Keep reference materials (links.txt) updated with current resources

#### Bug Fixes and Quality Improvements
- Review challenge solutions for accuracy
- Update demos to reflect best practices
- Ensure all playbooks follow Ansible best practices

#### Code Cleanliness
- Maintain consistent naming conventions
- Add comments for complex automation logic
- Keep README files up to date

### Adding New Features

#### Adding a New Training Day
1. Create directory: `materiais/dia-N/`
2. Add subdirectories: `demos/`, `desafios/`
3. Create README.md with day objectives
4. Add demo playbooks in demos/
5. Create challenge instructions in desafios/

#### Adding a New Demo
1. Create YAML file in appropriate `demos/` directory
2. Add README.md explaining the demo (or update existing)
3. Test playbook for syntax correctness: `ansible-playbook --syntax-check file.yml`

#### Adding a New Challenge
1. Create `instrucoes.md` in appropriate `desafios/` directory
2. Create solution file with answers
3. Update main day README.md with challenge overview

---

**Last update**: 2026-03-30
**Project Version**: 1.0.0
**Maintainer**: Felipe Moreira
