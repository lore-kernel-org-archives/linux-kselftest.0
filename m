From: dan.carpenter at oracle.com (Dan Carpenter)
Date: Wed, 9 Jan 2019 13:50:07 +0300
Subject: [PATCH net] selftests/txtimestamp: Fix an equals vs assign bug
Message-ID: <20190109105007.GA14518@kadam>

This should be == instead of =.

Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
Signed-off-by: Dan Carpenter <dan.carpenter at oracle.com>
---
 tools/testing/selftests/networking/timestamping/txtimestamp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/networking/timestamping/txtimestamp.c b/tools/testing/selftests/networking/timestamping/txtimestamp.c
index 2e563d17cf0c..d1bbafb16f47 100644
--- a/tools/testing/selftests/networking/timestamping/txtimestamp.c
+++ b/tools/testing/selftests/networking/timestamping/txtimestamp.c
@@ -240,7 +240,7 @@ static void __recv_errmsg_cmsg(struct msghdr *msg, int payload_len)
 			    cm->cmsg_type == IP_RECVERR) ||
 			   (cm->cmsg_level == SOL_IPV6 &&
 			    cm->cmsg_type == IPV6_RECVERR) ||
-			   (cm->cmsg_level = SOL_PACKET &&
+			   (cm->cmsg_level == SOL_PACKET &&
 			    cm->cmsg_type == PACKET_TX_TIMESTAMP)) {
 			serr = (void *) CMSG_DATA(cm);
 			if (serr->ee_errno != ENOMSG ||
-- 
2.17.1
