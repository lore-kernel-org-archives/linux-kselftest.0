From: andreyknvl at google.com (Andrey Konovalov)
Date: Fri, 22 Feb 2019 13:53:20 +0100
Subject: [PATCH v10 08/12] net,
 arm64: untag user pointers in tcp_zerocopy_receive
In-Reply-To: <cover.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
Message-ID: <ebc80132c8ebf6016821ddffbb7e461bd2484824.1550839937.git.andreyknvl@google.com>

tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 net/ipv4/tcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index cf3c5095c10e..80f3c1fb9809 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1756,6 +1756,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
 	int inq;
 	int ret;
 
+	address = untagged_addr(address);
+
 	if (address & (PAGE_SIZE - 1) || address != zc->address)
 		return -EINVAL;
 
-- 
2.21.0.rc0.258.g878e2cd30e-goog
