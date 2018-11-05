From: lizhijian at cn.fujitsu.com (Li Zhijian)
Date: Mon,  5 Nov 2018 16:13:49 +0800
Subject: [PATCH] kselftests/bpf: use ping6 as the default ipv6 ping binary
 when it exists
Message-ID: <1541405629-5580-1-git-send-email-lizhijian@cn.fujitsu.com>

At commit deee2cae27 ("kselftests/bpf: use ping6 as the default ipv6 ping
binary if it exists"), it fixed similar issues for shell script, but it
missed a same issue in the C code.

Fixes: 371e4fcc9d96 ("selftests/bpf: cgroup local storage-based network counters")
CC: Philip Li <philip.li at intel.com>
Reported-by: kernel test robot <rong.a.chen at intel.com>
Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
---
 tools/testing/selftests/bpf/test_netcnt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_netcnt.c b/tools/testing/selftests/bpf/test_netcnt.c
index 7887df6..44889bc 100644
--- a/tools/testing/selftests/bpf/test_netcnt.c
+++ b/tools/testing/selftests/bpf/test_netcnt.c
@@ -81,7 +81,11 @@ int main(int argc, char **argv)
 		goto err;
 	}
 
-	assert(system("ping localhost -6 -c 10000 -f -q > /dev/null") == 0);
+	if (system("which ping6 &>/dev/null") == 0) {
+		assert(system("ping6 localhost -c 10000 -f -q > /dev/null") == 0);
+	} else {
+		assert(system("ping -6 localhost -c 10000 -f -q > /dev/null") == 0);
+	}
 
 	if (bpf_prog_query(cgroup_fd, BPF_CGROUP_INET_EGRESS, 0, NULL, NULL,
 			   &prog_cnt)) {
-- 
2.7.4
