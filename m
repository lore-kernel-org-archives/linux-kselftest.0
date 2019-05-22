From: sashal at kernel.org (Sasha Levin)
Date: Wed, 22 May 2019 15:15:15 -0400
Subject: [PATCH AUTOSEL 5.1 015/375] selftests/bpf: set RLIMIT_MEMLOCK
 properly for test_libbpf_open.c
In-Reply-To: <20190522192115.22666-1-sashal@kernel.org>
References: <20190522192115.22666-1-sashal@kernel.org>
Message-ID: <20190522192115.22666-15-sashal@kernel.org>

From: Yonghong Song <yhs at fb.com>

[ Upstream commit 6cea33701eb024bc6c920ab83940ee22afd29139 ]

Test test_libbpf.sh failed on my development server with failure
  -bash-4.4$ sudo ./test_libbpf.sh
  [0] libbpf: Error in bpf_object__probe_name():Operation not permitted(1).
      Couldn't load basic 'r0 = 0' BPF program.
  test_libbpf: failed at file test_l4lb.o
  selftests: test_libbpf [FAILED]
  -bash-4.4$

The reason is because my machine has 64KB locked memory by default which
is not enough for this program to get locked memory.
Similar to other bpf selftests, let us increase RLIMIT_MEMLOCK
to infinity, which fixed the issue.

Signed-off-by: Yonghong Song <yhs at fb.com>
Signed-off-by: Alexei Starovoitov <ast at kernel.org>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/test_libbpf_open.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_libbpf_open.c b/tools/testing/selftests/bpf/test_libbpf_open.c
index 65cbd30704b5a..9e9db202d218a 100644
--- a/tools/testing/selftests/bpf/test_libbpf_open.c
+++ b/tools/testing/selftests/bpf/test_libbpf_open.c
@@ -11,6 +11,8 @@ static const char *__doc__ =
 #include <bpf/libbpf.h>
 #include <getopt.h>
 
+#include "bpf_rlimit.h"
+
 static const struct option long_options[] = {
 	{"help",	no_argument,		NULL, 'h' },
 	{"debug",	no_argument,		NULL, 'D' },
-- 
2.20.1
