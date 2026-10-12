Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7864A1E14;
	Mon, 12 Oct 2026 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819009; cv=none; b=Hp3f94Mua69E54XDwrS3+tpJHadoU3qcV56UIILfrTd/QfFJrjEozUUPUHvbaWf0O19l5brtb3Sw6f09791RFnL+0267trnRYuNffAtPT80pfdu24ZKcA/QYa9cSkTs/BpWzvWMl41IwyrtZJ2eDLQ8TQxnohdaF2fFoACqt8Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819009; c=relaxed/simple;
	bh=Er3Y1FP5uB8Ih+FaUN/LA9/fNXosHCNZp/wK8QX3vDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ggqYNvOh4hGxxxpxv+Dl0q1dge85ZJk9MDbPqtvbYjHiXJH8vUVMbPa0Af8nY18/RpQy9p/PSLaxfshdL04CHaKxCOxVugeQ1c8y8sLrxCOzbCjK7Vyb/XaalKGPgupFi1NshfKdxHmSC2gznhKgreQD2pj1UK6Oe3B3dAfFv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjqlhI+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjqlhI+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1191F008A4;
	Mon, 12 Oct 2026 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819008;
	bh=vNDHYQ+Rx7PjTMKNE8A/DzyDGodn3uaudMRESuVJeO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SjqlhI+GugdPB240iG0ERw4ag6iax2a/+2MuccMm6Ocrh5jZnJQdAMreyZ6Mz+xfc
	 69W2nn9KlbdJmw+8WVLyE75ckkMsqjprsGly8th0+98yAa7S0bwuw+/7j7MeqX3+NC
	 LLk/SCv0kEIcKQZC+r5z8pznCUccYMjzVh/iTo6jf/NJgHNFRtMvnXTqYbJO02tDOd
	 hbUI+zkD8Se3lR4+PfP1aHsFWS7laWnUU5A/3BVnp71Avpadpw/ernNmG4OY3EmL8t
	 +Ta1iFnC2vqZ3NkU7QNl7Ul09/lzScomGOAf/UrO5xwyCIE93gEOkT1nD17NWqgNV8
	 Up35SNFlWIuOg==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:51 -0400
Subject: [PATCH net-next v4 3/9] tls: Honor O_NONBLOCK in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-3-8cea429565da@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=cel@kernel.org;
 h=from:subject:message-id; bh=Er3Y1FP5uB8Ih+FaUN/LA9/fNXosHCNZp/wK8QX3vDI=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6b/HZ04K2CBCIRQUZZWrDNg8oIn7I9ABwL
 WXEXEg3wWaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 l+7uEACzJDLezGoyTww8uR7RwiSUy2ac1oSHgRLH0OxSmG/bS8/VPt+xKnF2JISCz4TeccxGbJ1
 pR601A8+gf/Myb6EKJG4V1UYs80BftLJPGKE1Z66gxP08rMPW2WEQtJFplHwgKGb7KuKy8T7i3B
 2jeBrTFnuN2TSOX1020Y4KMjouFY4noSMMDd87R4Kk//OSyatGhj1LVLSNgDOGARCUPhq7hVQZo
 44MyD21NlJaWln2Mx68WgzxzFlr8Bkx3HJwvVucdnHtw5C64C12+YSue8nifERLZ1TI+Ufnk4JA
 1MlKwCaNMGm/JqrNDnxJlQtoQJRtzZwi3Spdre/iQWWVKouSYkMUBfXoYEuvJyaLrx4td7xJzPl
 0YNdqv9k2XtroPx8MMSil3CdkS7Yb0BiOaqdTX/KYU83aRnjAVb8/xkV0+NvFqfOXEwuInBxzEU
 1YTog+99TkB3uy1ke62wx9BdGpqaiVS+WLmw1zqKQKwFIo0xcJRt86YD23ogZqDI3odP8NqYoHn
 QZc+4Ve5pse3YcqpmylUgbPw8xsRkTxkF9m7xMbEMSGZEj2DiYCUDNWq6etdoC8+dldnKbCBwC9
 dxh7lFCihRqNv+GD+s+bOevBG0wkNHRL1N3xSC6mZEydMms9j4ClIKdFvjkDBoSl2ceTAZsDJpd
 g0IBlKhhJA4yCcA==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

tls_sw_splice_read() takes its blocking behavior from
SPLICE_F_NONBLOCK alone. When splicing from a socket to a pipe,
do_splice() sets that flag from the pipe's O_NONBLOCK, not the
socket's. On a nonblocking socket, a splice(2) call without
SPLICE_F_NONBLOCK therefore sleeps in tls_rx_rec_wait() until a
record arrives. tcp_splice_read() instead reads sock->file->f_flags
and returns -EAGAIN.

Polling first does not avoid the sleep once tls_sw_splice_read()
consumes zero-length records. tls_sw_sock_is_readable() reports
the socket readable while any record sits on rx_list, including a
zero-length record that delivers no bytes to the pipe. The
strparser announces a record before decryption, when the record's
plaintext length is unknown, so the readiness test cannot screen
such a record out. A splice that consumes the record and waits for
the next stalls every connection an event loop multiplexes.

An LLM audit of the TLS read paths found this defect. With empty
records consumed, the zero_len_splice selftest, run on a
nonblocking socket, reproduces the sleep.

Treat the socket's O_NONBLOCK as nonblocking too. A caller that
sets O_NONBLOCK on the socket and splices without SPLICE_F_NONBLOCK
now gets -EAGAIN where the splice blocked before. sendfile(2) from
a TLS socket changes the same way, because do_sendfile() leaves the
input file's O_NONBLOCK out of the splice flags. Both now behave as
they do on a plain TCP socket.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index f2062e141512..f5e329b75976 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2024,10 +2024,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct tls_msg *tlm;
 	struct sk_buff *skb;
 	ssize_t copied = 0;
+	bool nonblock;
 	int chunk;
 	int err;
 
-	err = tls_rx_reader_lock(sk, ctx, flags & SPLICE_F_NONBLOCK);
+	nonblock = (flags & SPLICE_F_NONBLOCK) ||
+		   (sock->file->f_flags & O_NONBLOCK);
+
+	err = tls_rx_reader_lock(sk, ctx, nonblock);
 	if (err < 0)
 		return err;
 
@@ -2041,8 +2045,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	} else {
 		struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      true, false);
+		err = tls_rx_rec_wait(sk, nonblock, true, false);
 		if (err <= 0)
 			goto splice_read_end;
 

-- 
2.55.0

