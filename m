Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428937;
	b=PEKhjb/p+pBf23hjq2zmUbeSthdxx08Z4XotQ/iZsWehOVi7bYzQBj3AIt+MGCmXPqLl
	 clnr2pJJ5WKVpc9P/ZpGRHMLkBIiHhZf6Ae8H53vgLJWqBjC2kvXZ74A6vz3MiHvFeSP/
	 FqYdZk+TcC2KHvoZ6kremd5np+HPivaJdNJY7O2fiJhqmR/SNfe6fqwbsLDplobMECNrP
	 kFMn02S+Y/X0H9bwAbH4XptOhuemM2e/rYIEwYC8/NVNyw49Fa15Ycl1GSva3PuUa4/yo
	 muXFAhTtHz9AmFkuavr8uyH48pi0xH3Ov7tKPdRsRmXOxrkD+TLI86HCZJvL908tzGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428937;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=c/naGXmmAy++3Pj/JteHdgOya7xRKSfqWyPoDeS/FLw=;
	b=BDQc/iDlt7XcmyCmRHJS7umWVVaGt2IUq+u54lm1bzdku5bHO0ALI0FHcmVySqEVAyI8
	 viOgdTgcBOPtcn1bKHg4791OdOh9vS00Gr6HuWzzhj8pNigJfHWkaUo7lo3xh6FdLFYXA
	 eIzpRUkrR/5JjMxVhuA77C10rnZdNl5F4pddAwtWnOwW5LdBxrAu2vCBxCMtaPnaNazgF
	 qiQ4nXZC9NdNOqm8Ynh1s/mC0fzhsyoYCBF0ZkviQ4d9FnE8epl2o/9Bu+VqgHt+5Tmht
	 TY3A8gpF132l8HtY7JV6aeA9wghtQefmafeoiwbz7pRV/xMnzDczOGQasUGgHD82bQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMuT42gA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE430606A31E;
	Mon, 19 Oct 2026 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMuT42gA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0011F000C9;
	Mon, 19 Oct 2026 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428936;
	bh=c/naGXmmAy++3Pj/JteHdgOya7xRKSfqWyPoDeS/FLw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JMuT42gAj3wCrIBPe6U/935jDlLmf9CLrHC4o3xo2wvRYHsDKLEpRIfdwnZfLX7sK
	 TXeZs3KzHsSKDOba25wX+nJVI7Zk2WBAZnZZ0Pcs0pRL3LFsHKOiWTqyzqvgTVrWqs
	 zEgpo3Cex893hSkVEo4f+oZMj7tpP1rIt1sulfhklfNTpAKgfh2hgZltsvc6z9pqWp
	 imR92QAKs2qLqjzmdCTxf1dUkSiRpP2ak3+CBdCNgygHXFtFPbY0YVckcp4/E2D3kS
	 0Xt7ahkFs/6OViBiZKiIsCKqcoynY2ZWI/+P5ODYqNj89g9dOsduEBS8W6Rpa65TLv
	 2/Y/Eh4JLBsNg==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:20 -0400
Subject: [PATCH net-next v6 4/9] tls: Consume empty data records in
 tls_sw_splice_read()
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-tls-follow-on-v6-4-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=2664; i=cel@kernel.org;
 h=from:subject:message-id; bh=268FvGb5VLsLYpGjjPvigZsfxrJ348XikoOq2+pehsg=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuBptpk8q89FWaVQw84bxoG8BUA6ab2ePPjA
 nw/sns6zmWJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgQAKCRAzarMzb2Z/
 l6AjEACR+z5bjIuGgNwMFBRnxJoKd9oMNAw573yPFP8tHk0IAvIccCl7dwc99MqnFpJG11KQo/v
 Q7jUZlAfexPTr431DQZgWEWxtYi8PLxop2dgXBxuBEL5wq8i4c8LiCPNp2/sFJwSanL1MwLOwiC
 k+EFDNkqol1D/mpamqoU7HXNhChY5vlJjmpUTfNa1l9V7V7WJE87DvfNkW3MfA3neZCEXSPZk/a
 /Q0begFNsIuhnYHMwZHLiN5OClio8JGRctCEoN88M/4fw9Y6PAXtz52zGZcm0zl2U2LbKh+QmqE
 6w6WEBxIWfeUBA1JWu+rcT5PWusiNdAoqN9oay2EtipReW92Wfm5ocUAYZ3JnGbXnPPb/Ml+51P
 bNuV0sxZqCoCfa+R7/DhiLevvNofAEiCcAhXF1ghE3yyoVdxPPPxghavbpEEu81UXytTYqa0NhO
 9RTPldDb62n/DvwQONgwww9Ekajw6vEYahDDzP6pkzsFZxfOi4eJjeNhIRt64qiZ76zFbe5WZ+g
 DqyB8AE9MFeYzoF+q3hkQsa8Ez0YTYjZEPNGVE9CWh03q4AC6me7QYDE1ShVOjaMWdqZMY4AimF
 hv+e8UNAVmMpLqeGYbHAIOcRCD07zq76NLXF/8XjLSiwNLVl7FF9+6wrmzA+r7Wgpu5KhaQBTWG
 Xy6jp/LCg3Jo9BQ==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record decrypts to full_len == 0,
so tls_sw_splice_read() splices zero bytes and returns zero. A zero
return from a splice read means EOF, and the caller tears down a
connection that is still live.

Consume the record and fetch the next one, as tls_sw_recvmsg()
does. Test for a pending signal before each retry, so the splicing
task stays killable. A nonblocking splice gets -EAGAIN, as
tls_sw_recvmsg() does. After this change, tls_sw_splice_read() reads
empty records for as long as they arrive, until a signal is pending.

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
index d63b4c71780a..fe9c5c21dadc 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2027,6 +2027,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct sock *sk = sock->sk;
 	struct tls_msg *tlm;
 	struct sk_buff *skb;
+	bool released = true;
 	ssize_t copied = 0;
 	bool nonblock;
 	int chunk;
@@ -2044,12 +2045,13 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
 
@@ -2061,6 +2063,9 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 
 		tls_rx_rec_done(ctx);
 		skb = darg.skb;
+
+		/* The retry's wait runs with the socket lock still held. */
+		released = false;
 	}
 
 	rxm = strp_msg(skb);
@@ -2072,6 +2077,16 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 		goto splice_requeue;
 	}
 
+	/* Splicing zero bytes reads as EOF to the caller. */
+	if (rxm->full_len == 0) {
+		consume_skb(skb);
+		if (signal_pending(current)) {
+			err = tls_rx_signal_err(sk, nonblock);
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

