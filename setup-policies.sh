#!/usr/bin/env bash
set -euo pipefail
POLICY_DIR="/etc/firefox/policies"
mkdir -p "$POLICY_DIR"
cat << 'EOF' > "$POLICY_DIR/policies.json"
{
  "policies": {
    "ExtensionSettings": {
      "uBlock0@raymondhill.net": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
      },
      "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/video-downloadhelper/latest.xpi"
      },
      "vimium-c@gdh1995.cn": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi"
      },
      "adaptive-tab-bar-colour@easonwong.de": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/adaptive-tab-bar-colour/latest.xpi"
      },
      "{446900e4-71c2-419f-a6a7-df9c091e268b}": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi"
      },
      "sponsorBlocker@ajay.app": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi"
      },
      "juraj.masiar@gmail.com_ScrollAnywhere": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/scroll_anywhere/latest.xpi"
      },
      "gdpr@cavi.au.dk": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi"
      },
      "{74145f27-f039-47ce-a470-a662b129930a}": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi"
      },
      "jid1-BoFifL9Vbdl2zQ@jetpack": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi"
      },
      "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}": {
        "installation_mode": "force_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi"
      }
    }
  }
}
EOF
echo "Firefox policies updated successfully."
