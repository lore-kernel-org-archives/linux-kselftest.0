From: fklassen at appneta.com (Fred Klassen)
Date: Thu, 23 May 2019 14:06:50 -0700
Subject: [PATCH net 3/4] net/udpgso_bench_tx: fix sendmmsg on unconnected
 socket
In-Reply-To: <20190523210651.80902-1-fklassen@appneta.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
Message-ID: <20190523210651.80902-4-fklassen@appneta.com>

Fixes the following error if using both -m and -u options:

    # ./udpgso_bench -4um -D 172.16.120.189
    ./udpgso_bench: sendmmsg: Destination address required

Fixes: 3a687bef148d ("selftests: udp gso benchmark")
Signed-off-by: Fred Klassen <fklassen at appneta.com>
---
 tools/testing/selftests/net/udpgso_bench_tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/udpgso_bench_tx.c b/tools/testing/selftests/net/udpgso_bench_tx.c
index a900f016b9e7..56e0d890b066 100644
--- a/tools/testing/selftests/net/udpgso_bench_tx.c
+++ b/tools/testing/selftests/net/udpgso_bench_tx.c
@@ -378,6 +378,8 @@ static int send_udp_sendmmsg(int fd, char *data)
 
 		mmsgs[i].msg_hdr.msg_iov = iov + i;
 		mmsgs[i].msg_hdr.msg_iovlen = 1;
+		mmsgs[i].msg_hdr.msg_name = (void *)&cfg_dst_addr;
+		mmsgs[i].msg_hdr.msg_namelen = cfg_alen;
 		if (msg_controllen) {
 			mmsgs[i].msg_hdr.msg_control = control;
 			mmsgs[i].msg_hdr.msg_controllen = msg_controllen;
-- 
2.11.0
