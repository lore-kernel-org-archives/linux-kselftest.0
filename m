Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955861607A4;
	Mon, 27 Jul 2026 00:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112429; cv=none; b=t/lX3R3kFpD+PAxle5BfDr0mDwPwGLM7tmM+OqGaZgB1PUNRjJgpCVUNiWl111+xHhLhi8Yy8EuVISVivQL5zACqItRQ3i6Y04Dv2jJNlAjZ+4XNIrzjBJ1A7HqRHtZxKV1eX7krsFupkd+/aJrV3X5WSqN0pX/YdfDBm33qEEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112429; c=relaxed/simple;
	bh=MWpRgmcCAJZAnE1fTqGdCTQ1jwJZDG76DzqmrdvRpjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXORQ1z/121w+QUE/jeDXJPCssdNgoMO2EHkWTx8OcF/bASLN7B9mxRnU0qeU6Pcq6i0xrOvVD8G62skMSUQ9JxNJwIh4JlGlKx2+EagaGQcaX6jC5pEPkKwZSji8H1Vl7IoA0qD/iH+vYvaGep03C1k0YxQkLOA1JM0Iv8WZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exBZ3CYm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exBZ3CYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683BD1F00A3A;
	Mon, 27 Jul 2026 00:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112428;
	bh=C6BHGSyECHQ3MLsNoY+FtvJR7KBpWQtT76Yt7WE8wCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=exBZ3CYm0rU+zBiP0UOBNuppTXeaSJfZJ4HZnLBhUB8V6O/uAj7Ytd1c5VgtcpCMb
	 wG1KGgB4eZBiZ186bqQETvig/uxRXzSzmjNxvSWtoYs4KwZhpgq21LUu+K9lWESWs2
	 tFKnTy9QEyGSEn3CnrIZH/OLWW2XBkQd+T5OeDs+t/52dcggEe3z1KrmicyekqJDX/
	 tEPgECA8vM9saeMmfNXnwMgKeEkIVEst3j74IrLuQWcWS6b8OJN5+lZpOLf0QvHJ73
	 JZffc7X827LNsCIobbJqgnB0Ju6utdpQer1J+CgFmlo8zBj6+ND7Am2xD5S1EofHrz
	 Ar8dJyK5wZIQQ==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:29 -0400
Subject: [PATCH net 1/9] net/tls: Bound time spent on no-data records in
 tls_sw_read_sock()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Chuck Lever <cel@kernel.org>, Dave Watson <davejwatson@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=3301; i=cel@kernel.org;
 h=from:subject:message-id; bh=MWpRgmcCAJZAnE1fTqGdCTQ1jwJZDG76DzqmrdvRpjU=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdpIc3owEjlQldWGQnbQRec8s7zTcpfs+NWA
 KpSHTTjStSJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanaQAKCRAzarMzb2Z/
 l/VkEACUxnPhT98qF8D8AbdIV6apcyXSdyfP0xnzMJVyQcXcY6b8aulkU/nNkbk1Fhbb4b60Tv2
 6M3DGdUCcm81zKXe9grjvlksaEW7fdanFL83/pNfiilmAFUyYk3sV/vjcbsGYrIp9UZsgScWUjp
 Z1yaeb6cP/UTc+vmUVik4gjxUslmQ4omBlCsbJksSgesg5wS4ZchI7TyMXOKhlH8G05J3XUHFDy
 HTXPBehnz6GMSXwS5QB88bxDJ1ECp9Rgi/IeHaxQClirbjR/ffNr1vnSskLebY4fgzhPUdBD3G+
 F9jr7MpKgGjtmc/d7UPtYkO0542BS2FufpAdYv+d/wiGf4aXfstYch9xlXIhXbSuQaqMaLQP+Jh
 qJB21vb6C7l1PYjy6zrQ05ye3tU9/3ZskkrFKccJQd7gkmJqprgMnwlWHmT17iaRIyJcJ0xB8A1
 4UgSyZsXFnTqaMdZjKh2685/QSF/uni357aICnRwNQspRzxn0xCZtKLlNKwTsZOjL5kXg0cpBns
 AtXS28CFR44C4Pgh0BpWiPyF0WrBBRdBVVALJgRvRA+/aAU5lO8YTBsID88GlGyvOZs7By6Wt1b
 mrlcUh2KMFR84Lb0bmrgFwYpBGcVL7ImMvc6RReo6RfD7xpdSMZb/0jWESpepONZ05U+6QHS6Xr
 Q4RdAK+U1d6qwdg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

An empty TLS 1.3 data record delivers no payload, so it leaves
tls_sw_read_sock() in its loop without advancing the caller's read
descriptor. A peer that streams such records keeps the receive loop
running, and the socket lock held, for as long as they arrive.

Bound a run of such records, as net_rx_action() bounds a softirq
poll. The first record that delivers no bytes arms a deadline
TLS_RX_NODATA_NS ahead; any record that delivers bytes disarms it,
so a normal stream never trips it. Breaking out with nothing copied
returns zero, which a read_sock consumer reads as "no progress"
rather than EOF, so the connection stays up. Records left queued
draw no fresh sk_data_ready() of their own, so fire the socket's
current callback before returning.

Only tls_sw_read_sock() needs this bound. Its consumers drive the
receive loop from kernel context and hold the socket lock across
the whole call, so the deadline supplies the return boundary a
system call would otherwise provide. tls_sw_splice_read() and
tls_sw_recvmsg() return to userspace and drop the lock, so a flood
there costs the caller only its own scheduler time.

Fixes: 3be28e2c9cd0 ("net/tls: Consume empty data records in tls_sw_read_sock()")
Suggested-by: Sabrina Dubroca <sd@queasysnail.net>
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index d4afc90fd796..d45c945a3d1d 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -37,6 +37,7 @@
 
 #include <linux/bug.h>
 #include <linux/sched/signal.h>
+#include <linux/timekeeping.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/splice.h>
@@ -2049,6 +2050,11 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	goto splice_read_end;
 }
 
+/* Bound the time that consecutive empty ingress data records keep
+ * the socket lock held without releasing it.
+ */
+#define TLS_RX_NODATA_NS NSEC_PER_MSEC
+
 int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 		     sk_read_actor_t read_actor)
 {
@@ -2057,6 +2063,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 	struct tls_prot_info *prot = &tls_ctx->prot_info;
 	struct strp_msg *rxm = NULL;
 	struct sk_buff *skb = NULL;
+	u64 nodata_deadline = 0;
 	struct sk_psock *psock;
 	size_t flushed_at = 0;
 	bool released = true;
@@ -2122,7 +2129,19 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 		 * here instead.
 		 */
 		if (rxm->full_len == 0) {
+			err = 0;
 			consume_skb(skb);
+			if (!nodata_deadline) {
+				nodata_deadline = ktime_get_ns() +
+						  TLS_RX_NODATA_NS;
+			} else if (ktime_get_ns() >= nodata_deadline) {
+				/* Queued records raise no new sk_data_ready(),
+				 * and tls_rx_reader_release() announces only to
+				 * saved_data_ready(), not the consumer's own.
+				 */
+				sk->sk_data_ready(sk);
+				break;
+			}
 			continue;
 		}
 
@@ -2133,6 +2152,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			goto read_sock_requeue;
 		}
 		copied += used;
+		nodata_deadline = 0;
 		if (used < rxm->full_len) {
 			rxm->offset += used;
 			rxm->full_len -= used;

-- 
2.54.0

