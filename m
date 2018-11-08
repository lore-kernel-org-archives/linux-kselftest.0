From: sdf@google.com (Stanislav Fomichev)
Date: Wed,  7 Nov 2018 21:39:53 -0800
Subject: [PATCH v3 bpf-next 0/4] bpftool: support loading flow dissector
Message-ID: <20181108053957.205681-1-sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108053953.ZY6G52c2xfRm7MV7ScAOBQx5EG2F1I6zJibnW00viYQ@z>

v3 changes:
* (maybe) better cleanup for partial failure in bpf_object__pin
* added special case in bpf_program__pin for programs with single
  instances

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
* third patch adds special case in bpf_program__pin for programs with
  single instances (we don't create <prog>/0 pin anymore, just <prog>)
* forth patch adds actual support to the bpftool

See forth patch for the description/details.

Stanislav Fomichev (4):
  selftests/bpf: rename flow dissector section to flow_dissector
  libbpf: cleanup after partial failure in bpf_object__pin
  libbpf: bpf_program__pin: add special case for instances.nr == 1
  bpftool: support loading flow dissector

 .../bpftool/Documentation/bpftool-prog.rst    |  36 ++-
 tools/bpf/bpftool/bash-completion/bpftool     |   6 +-
 tools/bpf/bpftool/common.c                    |  30 +-
 tools/bpf/bpftool/main.h                      |   1 +
 tools/bpf/bpftool/prog.c                      | 112 ++++++--
 tools/lib/bpf/libbpf.c                        | 258 ++++++++++++++++--
 tools/lib/bpf/libbpf.h                        |  11 +
 tools/testing/selftests/bpf/bpf_flow.c        |   2 +-
 .../selftests/bpf/test_flow_dissector.sh      |   2 +-
 9 files changed, 368 insertions(+), 90 deletions(-)

-- 
2.19.1.930.g4563a0d9d0-goog
