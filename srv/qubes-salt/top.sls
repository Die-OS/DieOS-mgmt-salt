# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# 1) Intial Setup: sync any modules, etc
# --> qubesctl saltutil.sync_all
#
# 2) Initial Key Import:
# --> qubesctl state.sls salt.gnupg
#
# 3) Highstate will execute all states
# --> qubesctl state.highstate
#
# 4) Highstate test mode only.  Note note all states seem to conform to test
#    mode and may apply state anyway.  Needs more testing to confirm or not!
# --> qubesctl state.highstate test=True

base:
  # === Common ================================================================
  '*':
    # --- salt applications ---
    - salt
    - salt.gnupg
    - salt.minion_absent
    - salt.master_absent
    - salt.api_absent
    - salt.syndic_absent
    - salt.halite_absent

    # --- install user salt directories and sample locale states ---
    - salt-user

    # --- system configurations ---
    # users
    - gnupg

    # --- utilities ---
    - vim

  # === Dom0 ==================================================================
  'virtual:Qubes':
    - match: grain

    # --- salt applications ---

    # --- dom0 configurations ---
    - tests
    # whonix.gateway
