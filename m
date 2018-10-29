From: lizhijian@cn.fujitsu.com (Li Zhijian)
Date: Mon, 29 Oct 2018 19:14:29 +0800
Subject: [PATCH] kselftests/bpf: use ping6 as the default ipv6 ping binary if
 it exists
Message-ID: <1540811669-24696-1-git-send-email-lizhijian@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181029111429.L8BsYorbnbkvIiX-oWcSSA-2OIVD_INa4dvuYO9lKu4@z>

ping binary on some distros doesn't support "ping -6" anymore.

Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
---
 tools/testing/selftests/bpf/test_skb_cgroup_id.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_skb_cgroup_id.sh b/tools/testing/selftests/bpf/test_skb_cgroup_id.sh
index 42544a9..a9bc6f8 100755
--- a/tools/testing/selftests/bpf/test_skb_cgroup_id.sh
+++ b/tools/testing/selftests/bpf/test_skb_cgroup_id.sh
@@ -10,7 +10,7 @@ wait_for_ip()
 	echo -n "Wait for testing link-local IP to become available "
 	for _i in $(seq ${MAX_PING_TRIES}); do
 		echo -n "."
-		if ping -6 -q -c 1 -W 1 ff02::1%${TEST_IF} >/dev/null 2>&1; then
+		if $PING6 -c 1 -W 1 ff02::1%${TEST_IF} >/dev/null 2>&1; then
 			echo " OK"
 			return
 		fi
@@ -58,5 +58,6 @@ BPF_PROG_OBJ="${DIR}/test_skb_cgroup_id_kern.o"
 BPF_PROG_SECTION="cgroup_id_logger"
 BPF_PROG_ID=0
 PROG="${DIR}/test_skb_cgroup_id_user"
+type ping6 >/dev/null 2>&1 && PING6="ping6" || PING6="ping -6"
 
 main
-- 
2.7.4
