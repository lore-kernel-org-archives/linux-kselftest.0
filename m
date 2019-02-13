From: sashal@kernel.org (Sasha Levin)
Date: Tue, 12 Feb 2019 21:32:37 -0500
Subject: [PATCH AUTOSEL 4.20 046/105] selftests: bpf: install files
 tcp_(server|client)*.py
In-Reply-To: <20190213023336.19019-1-sashal@kernel.org>
References: <20190213023336.19019-1-sashal@kernel.org>
Message-ID: <20190213023336.19019-46-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190213023237.S9riq2mgvdTwm9xYHRvXZojT-jD62YX0nlKWzL8uh7k@z>

From: Anders Roxell <anders.roxell@linaro.org>

[ Upstream commit f98937c6bb73ae11717a15aec85c187d33ca5d34 ]

When test_tcpbpf_user runs it complains that it can't find files
tcp_server.py and tcp_client.py.

Rework so that tcp_server.py and tcp_client.py gets installed, added them
to the variable TEST_PROGS_EXTENDED.

Fixes: d6d4f60c3a09 ("bpf: add selftest for tcpbpf")
Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
Signed-off-by: Daniel Borkmann <daniel at iogearbox.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index ecd79b7fb107..74ece4f9fcce 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -53,7 +53,9 @@ TEST_PROGS := test_kmod.sh \
 	test_flow_dissector.sh \
 	test_xdp_vlan.sh
 
-TEST_PROGS_EXTENDED := with_addr.sh
+TEST_PROGS_EXTENDED := with_addr.sh \
+	tcp_client.py \
+	tcp_server.py
 
 # Compile but not part of 'make run_tests'
 TEST_GEN_PROGS_EXTENDED = test_libbpf_open test_sock_addr test_skb_cgroup_id_user \
-- 
2.19.1
