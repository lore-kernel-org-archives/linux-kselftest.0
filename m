From: anders.roxell@linaro.org (Anders Roxell)
Date: Wed, 25 Apr 2018 23:32:06 +0200
Subject: [PATCH v2] selftests: net: add in_netns.sh TEST_GEN_PROGS_EXTENDED
In-Reply-To: <20180425.132513.1786379382285267245.davem@davemloft.net>
References: <20180425.132513.1786379382285267245.davem@davemloft.net>
Message-ID: <20180425213206.7531-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180425213206.e0Z3JxgpNozQn7lIn05VVwXersvYHyRoMgIhz3fRjh0@z>

Script in_netns.sh is a utility function and not its own test so it
shouldn't be part of the TEST_PROGS. The in_netns.sh get used by
run_afpackettests.
To install in_netns.sh without being added to the main run_kselftest.sh
script use the TEST_GEN_PROGS_EXTENDED variable.

Fixes: 5ff9c1a3dd92 ("selftests: net: add in_netns.sh to TEST_PROGS")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---

respin against the 'net' tree.

 tools/testing/selftests/net/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 8f1e13d2e547..daf5effec3f0 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -5,7 +5,8 @@ CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g
 CFLAGS += -I../../../../usr/include/
 
 TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh netdevice.sh rtnetlink.sh
-TEST_PROGS += fib_tests.sh fib-onlink-tests.sh in_netns.sh pmtu.sh
+TEST_PROGS += fib_tests.sh fib-onlink-tests.sh pmtu.sh
+TEST_GEN_PROGS_EXTENDED := in_netns.sh
 TEST_GEN_FILES =  socket
 TEST_GEN_FILES += psock_fanout psock_tpacket msg_zerocopy
 TEST_GEN_PROGS = reuseport_bpf reuseport_bpf_cpu reuseport_bpf_numa
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
