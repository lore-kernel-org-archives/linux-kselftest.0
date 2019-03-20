From: andreyknvl@google.com (Andrey Konovalov)
Date: Wed, 20 Mar 2019 15:51:23 +0100
Subject: [PATCH v13 09/20] net,
 arm64: untag user pointers in tcp_zerocopy_receive
In-Reply-To: <cover.1553093420.git.andreyknvl@google.com>
References: <cover.1553093420.git.andreyknvl@google.com>
Message-ID:
 <2280b62096ce1fa5c9e9429d18f08f82f4be1b0b.1553093421.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320145123.QBTI-9oMQWarY2cjSbizhk_OaHtQ5y8krsUXt1jwRzQ@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

tcp_zerocopy_receive() uses provided user pointers for vma lookups, which
can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 net/ipv4/tcp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 6baa6dc1b13b..855a1f68c1ea 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1761,6 +1761,8 @@ static int tcp_zerocopy_receive(struct sock *sk,
 	if (address & (PAGE_SIZE - 1) || address != zc->address)
 		return -EINVAL;
 
+	address = untagged_addr(address);
+
 	if (sk->sk_state == TCP_LISTEN)
 		return -ENOTCONN;
 
-- 
2.21.0.225.g810b269d1ac-goog
