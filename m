From: sdf at google.com (Stanislav Fomichev)
Date: Wed,  7 Nov 2018 11:35:50 -0800
Subject: [PATCH bpf-next 0/2] bpftool: support loading flow dissector
Message-ID: <20181107193552.77894-1-sdf@google.com>

This patch series adds support for loading and attaching flow dissector
programs from the bpftool:

* first patch fixes flow dissector section name in the selftests (so
  libbpf auto-detection works)
* second patch adds actual support to the bpftool

See second patch for the description/details.

Stanislav Fomichev (2):
  selftests/bpf: rename flow dissector section to flow_dissector
  bpftool: support loading flow dissector

 .../bpftool/Documentation/bpftool-prog.rst    |  16 ++-
 tools/bpf/bpftool/common.c                    |  32 +++--
 tools/bpf/bpftool/main.h                      |   1 +
 tools/bpf/bpftool/prog.c                      | 135 +++++++++++++++---
 tools/testing/selftests/bpf/bpf_flow.c        |   2 +-
 .../selftests/bpf/test_flow_dissector.sh      |   2 +-
 6 files changed, 143 insertions(+), 45 deletions(-)

-- 
2.19.1.930.g4563a0d9d0-goog
