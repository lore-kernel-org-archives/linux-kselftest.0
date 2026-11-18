Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795034162;
	b=TR+LpbtI2eW8D3gHtExBU1al6Y2uWM1UzkrFqulFemFhwVMZuYgbf7JIKfqJglIHzYUI
	 fy/F+LuVFoND61sFQrm9oHXROyS0BVieCe4Ffa9hffG/7/0V9Jxx2MIcvw7zgn9u07d1U
	 EP453ZVsyflTn1MDrX2HOW8ZY8MDuNby1lzb/1/llGoZO+Yj00TVoN9fDJdhcH3rW1m/S
	 bJMP7yVWEomJTSclvXX4oYYUsGb0xhOck6o7lhunrfzaWCQ8/Ec8PK5IqBl4Ryz/6DhT+
	 UxgB41ro/CFGt6W8P27CISJHwDsdC14vqfCXkptPkOfExfvYsL0eT114vvT0TxjvKSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034162;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6JJYFIxSy9ykIuVNFZ1n2iEd4U5ChnLums15iW/Qx9g=;
	b=fE8gzBNEerMrrDFpynkjjs12z5MA2BB2gnW2UApv0sQehh0EVWKm4nJJaHHRXtM+aDf7
	 WsuTrR/n2akErLRcidIDEPk6+WKqQfn4ddy+gjv91YO3R9AqpODqNpt3X3dlJW4LgrqTK
	 lMnh3ZZGQBsXw7grKqnWBKjuQoWVKPOG+MlC4sZMcEEvYr5qa4z+frdBcp0JSIqCRojY3
	 TPJceWBQ8S9s7gravP14PdoojPnL6xrFEhSHREMwq+z8/pyuc7oagediOWv7Eyx0lpt02
	 LEBygo2fC+GxpeTrC7lDCeYfNo/d9FtjnzYJxe1DdmCskpZkITGnFwmW0szm91YNblQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkyRgyTW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B6606A33D;
	Wed, 18 Nov 2026 20:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkyRgyTW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795034161;
	b=RdnxpQEA7ncmK7YciOaxj6ZRRHYx8xu7b+Tv2KpB4BgssxPerfQ4d2sD1OP1xNGvylN1
	 Q0vzLB+ObUEBfybzP6/1CUZymGNIMp80cSkIs7yHxGvFG0Owyg9caPICjNHYiNcUedR5D
	 xk/1YOK+jhSzYsDRX0FYr3tNZ027FOhMj+nwyyZXi4wuEEfRNx5gvwPkZdz1uXXwWtOty
	 zjd4aHmZ0BI6kDwCAq2RMfaY7U8e+YwdmhDF7wscd7kwWM9dBLDGl7koMKwHS/KzapEVr
	 THpeBkeD0vkK2tg/zLUirikYeY0/eQrPKKkHKSIQB3P8wFNCuNvf7bzdZAd4tAyJv1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795034161;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6JJYFIxSy9ykIuVNFZ1n2iEd4U5ChnLums15iW/Qx9g=;
	b=LBw8G25RMPwNNKJwKx4hNFiTNbJQtLXBnnN8DncyW7L3anCH+yAu07sdhrv0MnJPH1+r
	 etvoXG4usgI2Db6U1sohL/m8SgSp1b2ipJLN5JN7o7zpasj3mTgwI9iGkSuNAseZyXhFT
	 hrLW/NdAJ9c2YYwmvrR3B+BnzvUiROTEAk1xk391LCH0vLBAkadq/v1kMa+6mscLB42x/
	 PKoNcdvoBw1e5g7GHrI2WOqRt2Pg+uTSimIfpUbud0aG7XeTqFzJBBYpyTenFAe6j/Oij
	 ZczeU3F1d1GD9lBj8xV0rlfkLnV/6LybR+OymZaozbGR4RRs5KqzTqEOaMjsgCeJlPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB6C71F000C4;
	Wed, 18 Nov 2026 20:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795034161;
	bh=6JJYFIxSy9ykIuVNFZ1n2iEd4U5ChnLums15iW/Qx9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TkyRgyTWy6a2lio16wgo4LelhaEuyesPp+r5tAzjOCaWEiZieILJBt87VPCoKEEWG
	 IbIspeLr8E/cvBQCeePmeZnx8S3Rov7PN78WW0nUEyNFyX/K/oqrYx+woO52HlMZAq
	 BIPHAS68T0B+Y1Vt3Q23nS49MulPaXnCIKA3YUgMTC2kv+T2pkpiBz3NGt1JvPOytj
	 LEFsWHMXd2A9MOnmnCDOp0xVdaGmQHg5T+uOsjrX381U+2d3t1jr6ygD5TtxzsCEiB
	 DP+v0YzTh5zvRiawJDu3dwjzyAW4NGYxcZ5AM0bwARV5/y/fOTAZAdYiYHnF+xS6N/
	 L5r6uIjq8yK4A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 276DE4AF72;
	Wed, 18 Nov 2026 20:36:00 +0000 (UTC)
From: Felipe Pereira Stival via B4 Relay <devnull+v0idpwn.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 17:35:48 -0300
Subject: [PATCH net 1/2] tls: don't hide a queued KeyUpdate from poll()
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
Message-Id: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
In-Reply-To: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Felipe Pereira Stival <v0idpwn@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795034159; l=3018;
 i=v0idpwn@gmail.com; s=20261118; h=from:subject:message-id;
 bh=7HlESlzQZS7RmVDTTCbJYyzyo4RKoYEAiP36cchvvKI=;
 b=SrEL++XkAo7j61m/Hg6DrjlA4Mry1VKzzWNswqTICF+Xh2U3SVj0VSaAnnx3TfO2tl2kYPhSG
 SaemNdRlA/nAihIp/kTJsZSth+i2NoGKASn3kmHEGONS0D+9e3RpP/s
X-Developer-Key: i=v0idpwn@gmail.com; a=ed25519;
 pk=dy+Py1JexopmEarZT58aUO9PMt7zs+cB62CS+N7NWTw=
X-Endpoint-Received: by B4 Relay for v0idpwn@gmail.com/20261118 with
 auth_id=1562
X-Original-From: Felipe Pereira Stival <v0idpwn@gmail.com>
Reply-To: v0idpwn@gmail.com
Content-Transfer-Encoding: 7bit

From: Felipe Pereira Stival <v0idpwn@gmail.com>

When application data and a KeyUpdate are both queued, the recv() for
the data can also decrypt the KeyUpdate. That makes a rekey pending,
and the KeyUpdate is left on rx_list because its record type differs.
tls_sk_poll() reports no read events while a rekey is pending, so the
socket doesn't poll readable although a recvmsg() would return the
KeyUpdate. A reader that waits for a read event before each recv()
never reads it, never provides the new key and receives nothing more.

Report read events for records on rx_list while a rekey is pending,
since they are already decrypted. Keep ignoring the records still in
the strparser, so once the KeyUpdate has been read there are no read
events until the new key is provided, as before. Update the
documentation to say so.

Found with a level-triggered epoll reader that does one recv() per
read event. Without this patch it gets the data and then no read event
for the KeyUpdate; with it, the KeyUpdate is reported and the rekey
completes.

Fixes: 47069594e67e ("tls: implement rekey for TLS1.3")
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Felipe Pereira Stival <v0idpwn@gmail.com>
---
 Documentation/networking/tls.rst | 7 ++++---
 net/tls/tls_main.c               | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/tls.rst b/Documentation/networking/tls.rst
index 980c442d716..e07c1a001b2 100644
--- a/Documentation/networking/tls.rst
+++ b/Documentation/networking/tls.rst
@@ -215,9 +215,10 @@ To prevent attempting to decrypt incoming records using the wrong key,
 decryption will be paused when a KeyUpdate message is received by the
 kernel, until the new key has been provided using the TLS_RX socket
 option. Any read occurring after the KeyUpdate has been read and
-before the new key is provided will fail with EKEYEXPIRED. poll() will
-not report any read events from the socket until the new key is
-provided. There is no pausing on the transmit side.
+before the new key is provided will fail with EKEYEXPIRED. Once the
+KeyUpdate has been read, poll() will not report any read events from
+the socket until the new key is provided. There is no pausing on the
+transmit side.
 
 Userspace should make sure that the crypto_info provided has been set
 properly. In particular, the kernel will not check for key/nonce
diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
index b8d5a843f76..4c4c2801ae0 100644
--- a/net/tls/tls_main.c
+++ b/net/tls/tls_main.c
@@ -414,9 +414,9 @@ static __poll_t tls_sk_poll(struct file *file, struct socket *sock,
 	tls_ctx = tls_get_ctx(sk);
 	ctx = tls_sw_ctx_rx(tls_ctx);
 
-	if ((skb_queue_empty_lockless(&ctx->rx_list) &&
-	     !tls_strp_msg_ready(ctx)) ||
-	    READ_ONCE(ctx->key_update_pending))
+	if (skb_queue_empty_lockless(&ctx->rx_list) &&
+	    (!tls_strp_msg_ready(ctx) ||
+	     READ_ONCE(ctx->key_update_pending)))
 		mask &= ~(EPOLLIN | EPOLLRDNORM);
 
 	return mask;

-- 
2.56.0


