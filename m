Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F24A0134;
	Mon, 12 Oct 2026 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819011; cv=none; b=BHBunBxu/pwgV6aPHc6BLR3rHwsvWL9ZnLCF6fjRe0+lYhKx9PDEBoaF2zmOCYcGUC9sZwhl9ZCKdGa3zRvRANty1VW8ReYoFpgb+fDx4oFoqwRj8rWz+HZ4tbSGUMW72GhRbRCxPULE+/UVcDiAL0E9zzmhSQLTI8xvEH3NsOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819011; c=relaxed/simple;
	bh=+68IuAB65s/wg7Vm/FwEwFqF2x6NoRfr+8WLcCqIDSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mokf2wsVuM5uP66c5EcLdOM9dADu633kAq284pje26uQnuVn5L9T1whfP+GR+rDUY8HU23Mq1BtDvo9sdRg4+C6Km8faZ8BhQ3TI7+MItR6yXquT//SwHOhx2ShEufsfIlinmzuuJ010RqAya6ttiTTnvVJaQ0b7/AIssmtcs0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FewTbhGz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FewTbhGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC12B1F0089C;
	Mon, 12 Oct 2026 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819009;
	bh=tIyD7eRZPsaDbzyrY5+vr15/7CjGrqiXakj/WYCrd+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FewTbhGzypV5z2uOMK/LqmC9vn/Rg2u6kkVPIBSz9Z1Q5Nf/SMA8OaALwxsPRWUU+
	 LlnIA1nAqcoVmxCLTVqbm0Nt/l2LNRyNrfxmMBVWeGp7s+dNTLhyDpA8ek+tZQQUYd
	 QJZBLFkVvS5Hg7NOnM+cNsUOjsLGIiTiXpIFwe6RBQN3+/ivPyXlQ2IyUVClR/Zmcf
	 NT1Tf9m5hwafpmtXHUNo1fhRTq1vBr+eV68/6pIvd7EAUwxySkvRg5lZVBbFIvTn85
	 w4FBCBpQwYJS9PQXhEM9Ca2h9j1Ze/fUZmwuNHwnJ7nawJ0oyStPwE8yUkd3WExn77
	 8UHeuqbysiYfg==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:52 -0400
Subject: [PATCH net-next v4 4/9] tls: Consume empty data records in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-4-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=2730; i=cel@kernel.org;
 h=from:subject:message-id; bh=+68IuAB65s/wg7Vm/FwEwFqF2x6NoRfr+8WLcCqIDSo=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6Tum+X6jAOyKT7kKdDrFN3Q7a284PZMpKf
 12xr4TKXgGJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 l7W1EACFixjnHH3OiovtbAtHh1YXNol6DAblEW8v1UwTh3pX6tATk31OvbAFGn5YbWo1N+4yRnD
 WhRpvw4TudII0bpvDst6iuYiS71eXKoknXC6eoQcSDYXBHxclAEJERH5JCDfXdMbEhqnqs9E9l/
 uA/OLA8ak+xLKrMjw3ujSKLecMeXw4armTCjN7Zr68QfIKIk7XlYHUpYpbD29tI3fFE3o7jw9DO
 L7T2VyVjUtLimhBCBiR9QSufUucjWhfvcKUG4AJQEU/d7WgbhkoRJO4U6bvEkHPa43JfQK0yG4f
 GpmKIk8tO19sl23/hEDHP/8Rn5FJM+5dvqM68GweGFPfcllna2QqzeR0mlvnbuKDmHQcSB03OfZ
 RB1zRyPXW0OO7sgdOl9dpg/eBOjgx0UmzuxFLW7X+XnWu4dJOug4H6qppSF6Kz2oOxAe4cdFaHm
 D7iDOFUBKgCSkAYTMC4O9nK2+Ups3Lx1dZuPPxXjIA1rYR465jv5PcztTYq1OeFImiqWNXo6cFn
 7CKlNX/8Ihd/w3OautHQG6S7cy9uWImrC1LvbE/+TOwSotYaJIb9Y+9SDJQI/ZB5Q8HPH0CPioR
 v5efFmfQRa4HK5C6XL+OwvshV6RmUy/B1Qxfs+EH7LLyPqoDmW9tCDYaA99YokgAMoF4I+5wV0R
 C8e+P0m7c+S/kJQ==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record decrypts to full_len == 0,
so tls_sw_splice_read() splices zero bytes and returns zero. A zero
return from a splice read means EOF, and the caller tears down a
connection that is still live. The zero_len_splice selftest
reproduces the zero return.

Consume the record and fetch the next one, as tls_sw_recvmsg()
does. Test for a pending signal before each retry, so a peer that
streams empty records cannot make the splicing task unkillable. A
nonblocking splice gets -EAGAIN, as tls_sw_recvmsg() does.

When an empty record precedes a close_notify, splice(2) now returns
-EINVAL from the control-record test instead of a false EOF. A
splice that reaches an alert record already reports -EINVAL.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Reported-by: Sabrina Dubroca <sd@queasysnail.net>
Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index f5e329b75976..0fea14224cec 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2023,6 +2023,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct sock *sk = sock->sk;
 	struct tls_msg *tlm;
 	struct sk_buff *skb;
+	bool released = true;
 	ssize_t copied = 0;
 	bool nonblock;
 	int chunk;
@@ -2040,12 +2041,13 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	if (err)
 		goto splice_read_end;
 
+retry:
 	if (!skb_queue_empty(&ctx->rx_list)) {
 		skb = __skb_dequeue(&ctx->rx_list);
 	} else {
 		struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, nonblock, true, false);
+		err = tls_rx_rec_wait(sk, nonblock, released, false);
 		if (err <= 0)
 			goto splice_read_end;
 
@@ -2057,6 +2059,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 
 		tls_rx_rec_done(ctx);
 		skb = darg.skb;
+
+		/* The retry's wait runs with the socket lock still held. */
+		released = false;
 	}
 
 	rxm = strp_msg(skb);
@@ -2068,6 +2073,20 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 		goto splice_requeue;
 	}
 
+	/* Splicing zero bytes reads as EOF to the caller. */
+	if (rxm->full_len == 0) {
+		consume_skb(skb);
+		if (signal_pending(current)) {
+			long timeo = sock_rcvtimeo(sk, nonblock);
+
+			err = -EAGAIN;
+			if (timeo)
+				err = sock_intr_errno(timeo);
+			goto splice_read_end;
+		}
+		goto retry;
+	}
+
 	chunk = min_t(unsigned int, rxm->full_len, len);
 	copied = skb_splice_bits(skb, sk, rxm->offset, pipe, chunk, flags);
 	if (copied < 0)

-- 
2.55.0

