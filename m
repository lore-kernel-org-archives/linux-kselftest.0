Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307F569F28;
	Wed, 14 Oct 2026 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002535; cv=none; b=CVhXWwOPgWrJS2mqWdG4JQLCcUDx60Y4MOHmYePVd+29DV8tm3I+FLvxSik4n9rou3uQDQ0xym95h7f35xFSsV9EoQQ87EPrtN0R2YO1nNXPnCLTHNkop4IgN62N+krpK3V4/J7oRDfn1RP72Q+1CJLwuklh9bovC8soxcgY9Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002535; c=relaxed/simple;
	bh=YOb378VDjnHCR6YTNXcPAiKEXo19+EZzD3vXdOphyI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDAUzw8nmC40MCuUxYxxcSOYw1Egfg77Ibd4Tfe88KTBWZkQjQfP/7WlXImeqz8h7xrCymNQpSYWTQ+XfFAM7VcHlLsCSD37uct198Cj9AHrgEJqQgo+4RAiRt4661uNsDa268hPHQzMr1t83v1cZ+wJLcPJwlhjm5hsSOOu5s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAtbcqHq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAtbcqHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9231F000C4;
	Wed, 14 Oct 2026 18:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002532;
	bh=jLhtQ49r9FVBcB+whX0MBUhUVDfuAmmMWrT4sxib+eE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cAtbcqHqxSFFyp4NVDYaCHgI3QzwKKMZQ1EdrjmpAI3HsXa8PoURShx5RzYWf2iEK
	 GdywdWkwOdRvuOXanit46ILde0s8hYK/E9jlq9J0XjonFW9PTkpyXF1P5MSFHphH2k
	 dwNDB5mrgwRbo+iVrmpWOq+IQSeOfMXF1QpGXuAqPKiIaBklqaOLjZlf2HQdRQES2O
	 gYUrazkTuh+Yl9V0MNF0dkUHRrXPewZU31mxLbEzrmX8OeOXWZ5izeXS26OU2rKFjs
	 6ZbdRGFgtTgQRiG5/mWrh8CXf16y5TiW+FSO2TjxQMNrhP/EwZaZtNg6ag05aVcnJc
	 swLMo6enTAAuw==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:34 -0400
Subject: [PATCH net-next v5 04/10] tls: Consume empty data records in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-4-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=3157; i=cel@kernel.org;
 h=from:subject:message-id; bh=YOb378VDjnHCR6YTNXcPAiKEXo19+EZzD3vXdOphyI0=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8nd356Z/qjbCWRf0blJgrRkADZVki6Po81bF
 XJtH5ssmc2JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 lwaZD/4tyyIhVeOLPtIvNuV6DupDEYO76GDfW8Grz2WHPMg1A+CcuWAqq/PIOWdvlwZDeOvmmAR
 jH6CZAG35OBl184GxaojwuuxBlDjbt107EGxhUwuWSQGn4CMN4xGiz0A3JiR/UxZTBYofa+PuhR
 Xn+IV8BUNh//0eTo/Wc8sv4KwR+Poj7xbe8E/xPG749rh+pXoihUNgjKxqsCEi85KULPaSARsT3
 SJTX+dKtSv1k0mosW43apy844mX778jlVh7fjjSyMXPT4yGaYu2P8kh6sSgK7EQAUc7u0H2uoUy
 3saf/tUKyNZSnhUbwlpS7DaZ+zhmJibeaq+6N7w6MuWWSiNj4CCtuLwtUI1SKi0CgdCcbJdwtC8
 7LBNvsFZITvdBTfopq0zT7EZIpv2Hwpru6TYIpfkta0Ch0yIKr7FIg0qXnPFJYU1zINslFW2jCP
 dDm0vmWLTnj7IDIM2QhHoIQIA3HwC4SJVCmfImjPBp3zFay1xYLZKJauqqyhl8aWfejFh7F6DMW
 5dK+Yfdj/D6fxm/Pl2Pg1JhzwdlZQwLGV/MAjHCXwurrHD1ZDvvKqVhx6pPuhvVePusw3hIx4Xx
 e4Zjug8P8QKMCGVD+Qu3oaioggoYcjC56ZL9yn/gqEKtvQgtff87rxm6UUt6PPVAikBwI9hF71w
 BHmEZT+HKEaLWRw==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record decrypts to full_len == 0,
so tls_sw_splice_read() splices zero bytes and returns zero. A zero
return from a splice read means EOF, and the caller tears down a
connection that is still live.

Consume the record and fetch the next one, as tls_sw_recvmsg()
does. Each fetch restarts SO_RCVTIMEO under the socket lock, so a
stream of empty records could hold a blocking splice and the lock
for as long as the stream lasts. Stop after TLS_RX_NODATA_LIMIT
consecutive empty records and return -EAGAIN. The cap stands in for
the timeout the retry defeats, so a blocking splice with no timeout
set reports -EAGAIN too, as a timed-out receive would. Test for a
pending signal before each retry as well, so the splicing task
stays killable. A nonblocking splice gets -EAGAIN, as
tls_sw_recvmsg() does.

When an empty record precedes a close_notify, splice(2) now returns
-EINVAL from the control-record test instead of a false EOF. A
splice that reaches an alert record already reports -EINVAL.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Reported-by: Sabrina Dubroca <sd@queasysnail.net>
Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index cb5a2b29bced..53a4af9eeeef 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2025,7 +2025,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct sock *sk = sock->sk;
 	struct tls_msg *tlm;
 	struct sk_buff *skb;
+	bool released = true;
 	ssize_t copied = 0;
+	int nodata = 0;
 	bool nonblock;
 	int chunk;
 	int err;
@@ -2042,12 +2044,13 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
 
@@ -2059,6 +2062,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 
 		tls_rx_rec_done(ctx);
 		skb = darg.skb;
+
+		/* The retry's wait runs with the socket lock still held. */
+		released = false;
 	}
 
 	rxm = strp_msg(skb);
@@ -2070,6 +2076,24 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 		goto splice_requeue;
 	}
 
+	/* Splicing zero bytes reads as EOF to the caller. */
+	if (rxm->full_len == 0) {
+		consume_skb(skb);
+		if (++nodata >= TLS_RX_NODATA_LIMIT) {
+			err = -EAGAIN;
+			goto splice_read_end;
+		}
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

