Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428936;
	b=Cu6Y2s3JS9X8CINWqs2c9kBFwSuTXJh48alydsgmmuYhLzmNCfw5lafskaN4w4UtXWW+
	 FqoqQnlCOjW0+9luTlcsIsYsR/cNb+3BVEOKaWH8N9niU23fcNygJPu3kf47XLVaE3YFy
	 kKrfEFQyVEXD1pNhnPeT3gk8hMQCBUdVxNVxtJS4B8Q0+E4ZevCm7SrI8IWLbbUlLcv9C
	 n+yWkTQraMo0vOefu6Qcv4T0Ne6338RxHqaDT9othZ36ASELWBUvKSdZ9Bg8LYRJjctTa
	 w3uu+JgGNw0QiAP91Q7TVJSznyAxoWskwjcU5Vhzg3Px+XCqIUsaHhFrHyevWdAvHKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428936;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8WcH0xUQitCNUREwfrKCxPqhJ7RD3navbkSMCgNgdT4=;
	b=Ka4pUgQi0OFxtXAaLB3jRdNZ8Okyaf1Ctlr7gTaZgRXHdIWOcbLARfD7mha9Wo7K85FF
	 w6DJCzdHpfTrV3j2bsFA/1cdgX0a9lw6lvNV5nm3boLc1BZ2U07UABoUqSzWuCBjrVIDd
	 ExrAYWTIlfnUtEZbUYTBOBfAhzaRWTG+Gygo+peKYINxFzkXe2pht3t6XjNt+aRg6bX3y
	 ti6sWXfcrpRMLRwL8PwpCrCk/NGoFz/u9KUfEv29rAt4EuoFF/uVaSVu23nqs+807tD46
	 hG50E6Z4pKtsuZF3w/PtRSoKx93hEF449JUxnNJJQIYUaNOa6plrWEN9vd5pl34BqaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMs+50EM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC863606A329;
	Mon, 19 Oct 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMs+50EM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384F41F000CC;
	Mon, 19 Oct 2026 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428935;
	bh=8WcH0xUQitCNUREwfrKCxPqhJ7RD3navbkSMCgNgdT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UMs+50EMYtXGGHjmuxSdgBMqCeWH4g8ZgMdLGgwJuaYupGNc10U/CeXUk/7aJtwjO
	 9L98tFdyLj6+pTWnecNwcTUZ+wBBXKWdzcMDqDP/Zxs42n4S7VAyWFiA0Nv7/bm/y/
	 MBhQu13wuMxf/Lr6IwVOSbl84IkvVQJKLaH/tQ3VOrB3E6LOaqCYSuAHxixs2B8bYU
	 C1EW+46FVCyy6ZT2fukpPmidsegABbb/zJV/Yg+yBPy9lNewp3WW/gR2Xk8/m4DA+u
	 ArVwwW1VWrQd5GIaB6JG2roruTfVZpNYkjd2QI+YmoKAqJW2nCp8pqirnaKXq+1gA+
	 XvdOp1UDIe6YA==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:19 -0400
Subject: [PATCH net-next v6 3/9] tls: Honor O_NONBLOCK in
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
Message-Id: <20261019-tls-follow-on-v6-3-ab01c4ecca0c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2656; i=cel@kernel.org;
 h=from:subject:message-id; bh=xSVZY24ausBJRCNwk05ErlyewxlWyC264IZeNSsb/NE=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuAt0j9z6AcdOVJVRNjvI0CcxqjbrsaJY8EZ
 X77SILdeiiJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgAAKCRAzarMzb2Z/
 l96LD/4tKonx9b//hEvocD1IoLVdX7iTeLUZmRrBPT9+ayNgKdOOhF8EhTD0xU1jOy4xFK9DVz6
 3GzJfBxGCbKajc5jSODRWFh4a4Z1sKZlhXZIUHzbxMSzZlaSACKLdw4dBnlAx52Qq0Sk6B/wDcd
 NYUnv91C2HQqM3BFPL773uqcZamji9T+W5uDpNDXoxUhxWy86FzPDHjC3b6UHk8vKbCJOO5VUWo
 y4O0N95+4bvaQfdqXiG6TwBBRy4X/53A7o0mWMHFEHSkzSVWbhEKxe0rzH4P8iUvbOLDVHmfXn/
 4H3f/BC4D/a8qS9hupbcsDFXKbLnOpuF/K+YoY0fH0vrGacpmJtjWXacvRymsThFlGRBoUZOPqJ
 PhD+mu326TOa6DyKcPP5lmVRkWz10HZU8Uo0d+U46hFiq0sjUAeGIzfuQc9//i6wLwb7gysj2UT
 KGJdIb8RRznMqicypPgrOZzfmMxzNZ5FQY75K+LgjEfQg9Hb1CmvTemk4FJQ2RIWTSQQFCOoUzI
 lTFnNwJPeNLwJqzRpHFUg0S3m6bw1du+R6MyOPbyWcxmFSd9V0oA72lTS48nDN0vIfzu8kzdTKt
 LrIyT0smXZXKWMjk0ZWZLb5c5tfJaPqt3n5lJnSUT9Lyk150zEBMS8vI2ESYxZnonWfdhwCNecB
 hB0BBEQzpbWiPtw==
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
consumes zero-length records, as it does after the next patch in
this series. tls_sw_sock_is_readable() reports the socket readable
while any record sits on rx_list, including a zero-length record
that delivers no bytes to the pipe. The strparser announces a record
before decryption, when the record's plaintext length is unknown, so
the readiness test cannot screen such a record out. A splice that
consumes the record and waits for the next stalls every connection
an event loop multiplexes.

An LLM audit of the TLS read paths found this defect. With empty
records consumed, the zero_len_splice selftest that a later patch in
this series adds, run on a nonblocking socket, reproduces the sleep.

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
index e8a9f0c91e81..d63b4c71780a 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2028,10 +2028,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
 
@@ -2045,8 +2049,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	} else {
 		struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      true, false);
+		err = tls_rx_rec_wait(sk, nonblock, true, false);
 		if (err <= 0)
 			goto splice_read_end;
 

-- 
2.55.0

