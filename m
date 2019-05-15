From: krzesimir@kinvolk.io (Krzesimir Nowak)
Date: Wed, 15 May 2019 15:47:25 +0200
Subject: [PATCH bpf v1 0/3] Test the 32bit narrow reads
Message-ID: <20190515134731.12611-1-krzesimir@kinvolk.io>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190515134725.stXjDjzbbpYuOWVzB3G_MgjMUTPCtyaMDmY3G6sNkRU@z>

These patches try to test the fix made in commit e2f7fc0ac695 ("bpf:
fix undefined behavior in narrow load handling"). The problem existed
in the generated BPF bytecode that was doing a 32bit narrow read of a
64bit field, so to test it the code would need to be executed.
Currently the only such field exists in BPF_PROG_TYPE_PERF_EVENT,
which is not supported by bpf_prog_test_run().

First commit adds the test, but since I can't run it, I'm not sure if
it is even valid (because endianness, for example). Second commit adds
a message to test_verifier when it couldn't run the program because of
lack permissions or program type being not supported. Third commit
fixes a possible problem with errno.

With these patches, I get the following output on my test:

/kernel/tools/testing/selftests/bpf$ sudo ./test_verifier 920 920
#920/p 32bit loads of a 64bit field (both least and most significant words) Did not run the program (not supported) OK
Summary: 1 PASSED, 0 SKIPPED, 0 FAILED

So it looks like I need to pick a different approach.

Krzesimir Nowak (3):
  selftests/bpf: Test correctness of narrow 32bit read on 64bit field
  selftests/bpf: Print a message when tester could not run a program
  selftests/bpf: Avoid a clobbering of errno

 tools/testing/selftests/bpf/test_verifier.c   | 19 +++++++++++++++----
 .../testing/selftests/bpf/verifier/var_off.c  | 15 +++++++++++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.20.1
