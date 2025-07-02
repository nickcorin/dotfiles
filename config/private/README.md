# Private Configuration

This directory contains private configurations that use 1Password CLI for secure secret management.

## Setup

1. Install 1Password CLI:
   ```bash
   brew install 1password-cli
   ```

2. Authenticate with 1Password:
   ```bash
   op signin
   ```

3. Store your secrets in 1Password with clear reference paths

## Structure

- `profiles/` - Environment-specific configurations (personal, work, etc.)
  - `personal.sh` - Personal profile (default)
  - `work.sh` - Work profile example

## Usage

### Default Profile
By default, the `personal` profile is loaded. Uncomment and customize the exports in `profiles/personal.sh`.

### Profile Management

**Set profile before starting shell:**
```bash
export DOTFILES_PROFILE=work
```

**Switch profiles interactively (with fzf):**
```bash
switch_profile
# Opens fzf selector with available profiles
```

**Switch to specific profile:**
```bash
switch_profile work
```

**Check current profile:**
```bash
current_profile
```

### Adding Secrets
Store secrets in 1Password and reference them in your profile:
```bash
# In profiles/personal.sh
export API_KEY=$(op read "op://Personal/Service Name/credential")
export GITHUB_TOKEN=$(op read "op://Personal/GitHub Token/credential")
```

### Creating New Profiles
1. Create a new file: `profiles/my-profile.sh`
2. Add your environment variables using 1Password references
3. Switch to it: `switch_profile my-profile`

## Available Profiles

- **personal** - Personal development and services
- **work** - Work-related APIs, VPN, and infrastructure

## Security

- ✅ No secrets stored in this repository
- ✅ All secrets fetched from 1Password at shell startup
- ✅ Graceful degradation when 1Password CLI unavailable
- ✅ Profile-based separation of contexts
- ✅ Interactive profile switching with fzf