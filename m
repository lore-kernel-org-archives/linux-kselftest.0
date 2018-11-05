From: lizhijian at cn.fujitsu.com (Li Zhijian)
Date: Mon,  5 Nov 2018 16:57:48 +0800
Subject: [PATCH v2] kselftests/bpf: use ping6 as the default ipv6 ping binary
 when it exists
Message-ID: <1541408268-11256-1-git-send-email-lizhijian@cn.fujitsu.com>

At commit deee2cae27d1 ("kselftests/bpf: use ping6 as the default ipv6 ping
binary if it exists"), it fixed similar issues for shell script, but it
missed a same issue in the C code.

Fixes: 371e4fcc9d96 ("selftests/bpf: cgroup local storage-based network counters")
CC: Philip Li <philip.li at intel.com>
Reported-by: kernel test robot <rong.a.chen at intel.com>
Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
---
V2: Fix coding style: remove '{}' and 80+ characters per line

Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
---
 tools/testing/selftests/bpf/test_netcnt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_netcnt.c b/tools/testing/selftests/bpf/test_netcnt.c
index 7887df6..44ed7f2 100644
--- a/tools/testing/selftests/bpf/test_netcnt.c
+++ b/tools/testing/selftests/bpf/test_netcnt.c
@@ -81,7 +81,10 @@ int main(int argc, char **argv)
 		goto err;
 	}
 
-	assert(system("ping localhost -6 -c 10000 -f -q > /dev/null") == 0);
+	if (system("which ping6 &>/dev/null") == 0)
+		assert(!system("ping6 localhost -c 10000 -f -q > /dev/null"));
+	else
+		assert(!system("ping -6 localhost -c 10000 -f -q > /dev/null"));
 
 	if (bpf_prog_query(cgroup_fd, BPF_CGROUP_INET_EGRESS, 0, NULL, NULL,
 			   &prog_cnt)) {
-- 
2.7.4
