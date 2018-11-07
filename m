From: sdf@google.com (Stanislav Fomichev)
Date: Wed,  7 Nov 2018 14:43:53 -0800
Subject: [PATCH v2 bpf-next 0/3] bpftool: support loading flow dissector
Message-ID: <20181107224356.73080-1-sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181107224353.bEqWCX3cD4S0xAs8dWov6t_00PLNujj0SlTyp0AAw0M@z>

v2 changes:
* addressed comments/style issues from Jakub Kicinski & Quentin Monnet
* removed logic that populates jump table
* added cleanup for partial failure in bpf_object__pin

This patch series adds support for loading and attaching flow dissector
programs from the bpftool:

* first patch fixes flow dissector section name in the selftests (so
  libbpf auto-detection works)
* second patch adds proper cleanup to bpf_object__pin which is now being
  used to attach all flow dissector progs/maps
* third patch adds actual support to the bpftool

See third patch for the description/details.

Stanislav Fomichev (3):
  selftests/bpf: rename flow dissector section to flow_dissector
  libbpf: cleanup after partial failure in bpf_object__pin
  bpftool: support loading flow dissector

 .../bpftool/Documentation/bpftool-prog.rst    | 26 +++--
 tools/bpf/bpftool/bash-completion/bpftool     |  2 +-
 tools/bpf/bpftool/common.c                    | 30 +++---
 tools/bpf/bpftool/main.h                      |  1 +
 tools/bpf/bpftool/prog.c                      | 94 ++++++++++++++-----
 tools/lib/bpf/libbpf.c                        | 58 ++++++++++--
 tools/testing/selftests/bpf/bpf_flow.c        |  2 +-
 .../selftests/bpf/test_flow_dissector.sh      |  2 +-
 8 files changed, 151 insertions(+), 64 deletions(-)

-- 
2.19.1.930.g4563a0d9d0-goog
