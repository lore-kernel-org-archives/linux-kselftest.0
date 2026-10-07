Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBA94E5358;
	Wed,  7 Oct 2026 19:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402593; cv=none; b=rCau+p0YV+GJ49rhbIcCrBb5QN9HXhPG3nej6nucM2m3tnPjDAvHdwI0EBGGMIgDRGIfUwk4v7gtQILVi5g0dBAN2xBZA7rv4j5QoCCfPhnqZ94/yu8/5BuH9TdypQ44zitFySIMsVo1raYgC+KBRLHC1dTPPTfM3NGfKHJm+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402593; c=relaxed/simple;
	bh=aa0jdBTgzTuFq4kxDYKXxaFCJX/qLj1O5qF72iBDUhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULhx2gq0NMkPqqMohOe9cnVOODlo1/2DlL+uZabOvv7C8FKfLipdZugCnzJAmzyMNjaaOLjnl/wFaOTJXbg6Q2xcemxybGgsH6bXWyEuvTuDuEL8IcQmxXaY4djCOOQ4sY/eAb2UTyzRiuWLqAefDF+Q82wPAQuAkq7sm5D/VtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHLlsM3R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHLlsM3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF791F000FF;
	Wed,  7 Oct 2026 19:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402592;
	bh=chOujoFC46mjH3bD6lz+8DRJnHv+/fsri7CRparTKGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fHLlsM3RQP+OunEsXGMp9dz8FjZEkfTvBS+RLfsZRcTzETo4b+fBXwm+nrzN22Mti
	 Y7eQcRbbO7GUVm9b5K+gEwS6HNXrKSJr8Eebgiu9sp0lt0z6AEqtAzIWdmQBW+3XnE
	 WKvWXAl1uuG+uKkYeWvpYSDRHt/VWEfHlkXJwauJQGyD+Bp79WjiPHsCXcStCX5tKZ
	 1ZpQrDEd+8/bxgt+AZAFGBR42sinYrr5JskcdS7YxnlFxBO4q8PVEba318a3UAXfD4
	 QOD6N/TgbKKv55MRRMXFXhODm0qtvU+EQuUE2kvgnyq2LbyXVjT2MFmWfrWl4/6UlP
	 hr6FXrXZDcDFg==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:33 -0400
Subject: [PATCH net-next v3 4/9] tls: Consume empty data records in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-4-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=2599; i=cel@kernel.org;
 h=from:subject:message-id; bh=aa0jdBTgzTuFq4kxDYKXxaFCJX/qLj1O5qF72iBDUhs=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJZWZX/5j0pLRxaLVKuW4f3GMrcTTcT8+Ia5
 QW5evX5Eh6JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWQAKCRAzarMzb2Z/
 l1dlEAClfEfmhytG6H6M7T0Ve1RRElDsJfZMXhyh5ZL8QVMRLBa/k/OYai9V1Kz+67JmTU9WktX
 lVHvNLCTxVu2BZgbKiMpe+6wOn+xCiDitfrdEb7cCK8vn0KJu3SVpTTJswujnOUD6elCug+qvzU
 nwlaZH7SoN6JWwXI6GOCo+XNVSaEfgQfuqUxB8BUasCasOYZwk9FtqE+nkykfN2jwdBuSBcqwGW
 EjKGPVaa2wX8wX3lpaJVXx0++A64nge7+XRhJtOI1CUcLLvhbLujGkVxGUfYxOto5WxIDbAc+op
 6DywEEBy+stc2y5Un9ZlRGbrnwJX/YTiD7vlHWuTJxL3Cv+1FWWBXYC6oWvW8hi0i6mvnDlYAtd
 cLNc+t8BbttPAvF5bTjAFU2n0Ulpp+HGJG2jmBpiHyDG6nchSJFc10992qkPl33he0sa4x2mRLa
 fNULvEr3MkXmd2FUz5qIhkV013q3s71ApSwUdGuonlaV4Wy/IxDaZ2M2YptIgUTK8lu1BlnLzE2
 zIHoxi3IWHXBw43Vdi4kO2qEdP9b/ABRADYpXCKdbkg4FSYWvsAOzMNX6lQ+ZSVkDm6TxSywxT7
 RDIBxvx3EDFdGuntag1adg+6xITnqbKcRogzqF7mXwvmyR4qMzguaV24NqFom6C3qwHR4A733Rq
 2THkF071N1yBc2w==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record decrypts to full_len == 0,
so tls_sw_splice_read() splices zero bytes and returns zero. A zero
return from a splice read means EOF, and the caller tears down a
connection that is still live. The zero_len_splice selftest
reproduces the zero return.

Consume the record and fetch the next one, as tls_sw_recvmsg()
does. Test for a pending signal before each retry, so a peer that
streams empty records cannot make the splicing task unkillable.

When an empty record precedes a close_notify, splice(2) now returns
-EINVAL from the control-record test instead of a false EOF. A
splice that reaches an alert record already reports -EINVAL.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Reported-by: Sabrina Dubroca <sd@queasysnail.net>
Closes: https://lore.kernel.org/netdev/akaoXcfamBp8_mYe@krikkit/
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 6c21897b03ee..ff82e2f4e9e5 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2021,6 +2021,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct sock *sk = sock->sk;
 	struct tls_msg *tlm;
 	struct sk_buff *skb;
+	bool released = true;
 	ssize_t copied = 0;
 	bool nonblock;
 	int chunk;
@@ -2038,12 +2039,13 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
 
@@ -2055,6 +2057,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 
 		tls_rx_rec_done(ctx);
 		skb = darg.skb;
+
+		/* The retry's wait runs with the socket lock still held. */
+		released = false;
 	}
 
 	rxm = strp_msg(skb);
@@ -2066,6 +2071,16 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 		goto splice_requeue;
 	}
 
+	/* Splicing zero bytes reads as EOF to the caller. */
+	if (rxm->full_len == 0) {
+		consume_skb(skb);
+		if (signal_pending(current)) {
+			err = sock_intr_errno(sock_rcvtimeo(sk, nonblock));
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

