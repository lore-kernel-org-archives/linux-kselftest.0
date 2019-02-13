From: sashal at kernel.org (Sasha Levin)
Date: Tue, 12 Feb 2019 21:33:04 -0500
Subject: [PATCH AUTOSEL 4.20 073/105] selftests/bpf: install with_tunnels.sh
 for test_flow_dissector.sh
In-Reply-To: <20190213023336.19019-1-sashal@kernel.org>
References: <20190213023336.19019-1-sashal@kernel.org>
Message-ID: <20190213023336.19019-73-sashal@kernel.org>

From: Stanislav Fomichev <sdf at google.com>

[ Upstream commit 1be72f29bfb98be27a95309f18b4ab5249967b59 ]

test_flow_dissector.sh depends on both with_addr.sh and with_tunnels.sh
However, we install only with_addr.sh.

Add with_tunnels.sh to TEST_PROGS_EXTENDED to make sure it gets
installed as well.

Tested with: make TARGETS=bpf install INSTALL_PATH=$PWD/x

Fixes: ef4ab8447aa26 ("selftests: bpf: install script with_addr.sh")
Signed-off-by: Stanislav Fomichev <sdf at google.com>
Signed-off-by: Daniel Borkmann <daniel at iogearbox.net>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/bpf/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 74ece4f9fcce..d5e992f7c7dd 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -54,6 +54,7 @@ TEST_PROGS := test_kmod.sh \
 	test_xdp_vlan.sh
 
 TEST_PROGS_EXTENDED := with_addr.sh \
+	with_tunnels.sh \
 	tcp_client.py \
 	tcp_server.py
 
-- 
2.19.1
