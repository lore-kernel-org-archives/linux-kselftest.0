Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E203B4BA1E9;
	Thu,  1 Oct 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894510; cv=none; b=K/OSOPWcayyrLXsaxfBfMJ1VPdroq4FlSiuCCtUw2N7GrVB3jo2IKpr1w2vo1BRQxmDeJxpZL7KsG3KXbuV5amO7KymEMjjhit0zL4S07rUF5pTF7rQMkP0hfGqF86mMsd3klUCmWnv5rxHI6wzVaGhfj7RBr0WuaHaHZxGot78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894510; c=relaxed/simple;
	bh=7H+i1IBBv37EDR1jGl7HB7hEhxvULt+aOF0ipyelq+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWEIW/bbCCqobRaSSzmF+Tr0KobSycU6NRrle/yAnqcr8AVEqAQHppoHiWKTvytbonmrzzWJW+7yD0oDkiPfteJCEKbMn7z5AJhAobXGe40ApCqEqefkKq2YQkqDta7gNTF1+J45RwJ4p0ZzZq7zHFPTZz2t5pXUO4G//LL2sY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5CDoC86; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5CDoC86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA8A1F0089C;
	Thu,  1 Oct 2026 22:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894508;
	bh=+FqWjp6RRrAi/Z3GnGr+V/lUU6PiselP+B7QWaIqQ9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=l5CDoC86B12Pcqwj8lGvFpK+HVglQqVV2VoLD8kW3ko4kPhWO6C9rKxYoL346QWDS
	 uK6mAF1EO3ygUFjov9dab6Ox7YqNKMkFJjjXh/XOQb5goTYHFIx5erEG/q3IvN4TWf
	 dDQyCxuJNBhVZNjEWRYeyGAw+ICWtm6dP1BUDztsM8lo5a/akEIQby1lQO4TOm9boN
	 SmI7GvmD40C9PGEhptjrvYkL+bdBOyy06089beRwQYUGesBM5Fcb8yHGyXQRAfH5+u
	 7GPJTnv8hKzGBcZceljNihoNVJYfFaYw0zOkn8WT4s04OpROu62ZziSZnxmpmk0Iw7
	 NNlnDJChJAszg==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 01 Oct 2026 18:41:35 -0400
Subject: [PATCH net-next v2 3/8] tls: consume empty data records in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-tls-follow-on-v2-3-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=2618; i=cel@kernel.org;
 h=from:subject:message-id; bh=7H+i1IBBv37EDR1jGl7HB7hEhxvULt+aOF0ipyelq+g=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGp7/GGYjd3+mpmvAld8sWffFiUe7IDI/AgS
 H/QbZfkNmmJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hqQAKCRAzarMzb2Z/
 l4ubEACUNmpn8UjjVMC6dj35fNaCBcZD3YSQizWFri3Ujsfzu1t4jLB72O4hmeytJ3ETRcHb8m7
 WR4vDTrDJaKBx/0Nbh5JZXaaTBYbHRv1wi7m9f6+rQfdKHNXFfQj9QtCdVyInbqnr/7NJk7gPsh
 cdwiHa1aS4N473e1C4FJUWQxKmmBhXMTvFSN2iLmhyR8PsY/iv0TXmP0qNwEG/f2rcVyKSEGZSP
 0QQXrtytGXulTqwqDjAgMHgBHgxJAuh/3PB45v5ZjxgblbsAmMneN7pYEPHc0/EXb1cTt2L/EHt
 OCXSgH790c79BxUWa0LpKdOVBuT7IUFbrkXC4AvYEYMm6BsGLAS8ai7IKm0n8h3NKeSfuIB9NiP
 zJyyDovoVcwMYa2I8CRq0Y6oCAUDtMMyHk7ctMKP6eSsYMFzfXm/7KHAzb984I6g6yzYQyLXUrD
 cMOsWtcZgC5nzE/heS5gUBCjnmOdoW+U9cmzcd2JChDjockdUO83yMXhG3ZZ5oYyyUBaFtnoE7c
 QVy2CbWHfDPHQgEafDuJY8V9Gwfkz4PIZQOkV5ISkWeqzKzaxb8iQgFjdCS5bd8p6xp3vlZQlUY
 Ae+O2QfAmDSj+IWqZiMaxlV25e1ZdzrqFsEYuGXtwdOTdz4j2x3WjYieRqvg1nwj69L0oR9i1II
 0/AZIiMWCToT9VA==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record decrypts to full_len == 0,
so tls_sw_splice_read() splices zero bytes and returns zero. A zero
return from a splice read means EOF, and the caller tears down a
connection that is still live.

Consume the record and fetch the next one, as tls_sw_recvmsg()
does. Test for a pending signal before each retry, so a peer that
streams empty records cannot make the splicing task unkillable.

When an empty record precedes a close_notify, splice(2) now returns
-EINVAL from the control-record test instead of the false EOF it
returned before. A splice that reaches an alert record already
reports -EINVAL.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Reported-by: Sabrina Dubroca <sd@queasysnail.net>
Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index ee50b9028264..79a807e51bc7 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2018,6 +2018,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct sock *sk = sock->sk;
 	struct tls_msg *tlm;
 	struct sk_buff *skb;
+	bool released = true;
 	ssize_t copied = 0;
 	int chunk;
 	int err;
@@ -2031,13 +2032,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	if (err)
 		goto splice_read_end;
 
+retry:
 	if (!skb_queue_empty(&ctx->rx_list)) {
 		skb = __skb_dequeue(&ctx->rx_list);
 	} else {
 		struct tls_decrypt_arg darg;
 
 		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      true, false);
+				      released, false);
 		if (err <= 0)
 			goto splice_read_end;
 
@@ -2049,6 +2051,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 
 		tls_rx_rec_done(ctx);
 		skb = darg.skb;
+
+		/* The retry's wait runs with the socket lock still held. */
+		released = false;
 	}
 
 	rxm = strp_msg(skb);
@@ -2060,6 +2065,19 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 		goto splice_requeue;
 	}
 
+	/* Splicing zero bytes reads as EOF to the caller. */
+	if (rxm->full_len == 0) {
+		consume_skb(skb);
+		if (signal_pending(current)) {
+			long timeo;
+
+			timeo = sock_rcvtimeo(sk, flags & SPLICE_F_NONBLOCK);
+			err = sock_intr_errno(timeo);
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

