From: andreyknvl@google.com (Andrey Konovalov)
Date: Mon, 18 Mar 2019 18:17:40 +0100
Subject: [PATCH v12 08/13] net,
 arm64: untag user pointers in tcp_zerocopy_receive
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
References: <cover.1552929301.git.andreyknvl@google.com>
Message-ID:
 <80e79c47dc7c5ee3572034a1d69bb724fbed2ecb.1552929301.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318171740.ajLaxJIQTibSlF4TbKT1ly2VTzNir6yioMtv_m_LxIw@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 net/ipv4/tcp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 6baa6dc1b13b..e76beb5ff1ff 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1749,7 +1749,7 @@ EXPORT_SYMBOL(tcp_mmap);
 static int tcp_zerocopy_receive(struct sock *sk,
 				struct tcp_zerocopy_receive *zc)
 {
-	unsigned long address = (unsigned long)zc->address;
+	unsigned long address;
 	const skb_frag_t *frags = NULL;
 	u32 length = 0, seq, offset;
 	struct vm_area_struct *vma;
@@ -1758,7 +1758,12 @@ static int tcp_zerocopy_receive(struct sock *sk,
 	int inq;
 	int ret;
 
-	if (address & (PAGE_SIZE - 1) || address != zc->address)
+	address = (unsigned long)untagged_addr(zc->address);
+
+	/* The second test in this if detects if the u64->unsigned long
+	 * conversion had any truncated bits.
+	 */
+	if (address & (PAGE_SIZE - 1) || address != untagged_addr(zc->address))
 		return -EINVAL;
 
 	if (sk->sk_state == TCP_LISTEN)
-- 
2.21.0.225.g810b269d1ac-goog
