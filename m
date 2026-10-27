Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065938;
	b=uPPoz28DF6ck7bwb2gFu0xgcGNmRzrrDUaKuFe1kdMt/sK/LSFKRKjqWz1YqhzD/qXcm
	 P9cES4PivXZ864mYl5AH38z6VDUVbs9VdObvLaldpKPjNl91C/7TGDN5TIcT59wsz9IGP
	 sW+lACT+9K6HX25JRA2NQWWO0eRv43HUcDpTnUBuimoNdsgtBKs8Yte/pfdadvdcybxbH
	 umls5w2zz7tAsURLztEBS3YiSu4eRkU/eCkjcX0vxJfgf3VJgWfzTCFP8vbRmd5xoxCaA
	 qSPjcgNSdsqXwE4CI3EI1qoS21O+V3qvxouGIOVEevNB9lEhUam0zbwjhag3qXmKn9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065938;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8Xz/O4SoFdzeWrW3v+OQB6Ik0lhhudsEz7WYi/c75v4=;
	b=T4fPMySBGuQ22XAKxsmldEPGVkKw9RwW0ETGmxgL1uLAcDAhZLyxuL2kktZPHqylrZDb
	 gJ6YDByKVEwDFwMze5ggDiK0r4NaORr12y7IEJqK7ojuFfeLMlVnzbutpBNQsILzFLdgB
	 2JvrwY7+5G+sUXUztLzi8xq2MMydm9rpYw+QLRZw0RoHwlweuy8IXHKCBKDg0TzjRopw/
	 3X7WpLJ+g8VEDXv5R+CHhQUsxW8PaYfcO8wlH0LONJeF5+6VQhgJ79L5k2QPYID9XqGr8
	 CH3IWjBARq9GVQKie8VCGH173t2tMcD7COKGaxM70fVNGiVPRdyk+azS8Hemx2dpqeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vx0MbS5w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619A9606A31D;
	Tue, 27 Oct 2026 01:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vx0MbS5w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1CA1F031E3;
	Tue, 27 Oct 2026 01:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793065938;
	bh=8Xz/O4SoFdzeWrW3v+OQB6Ik0lhhudsEz7WYi/c75v4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vx0MbS5wREwM8lfqmytYlNyB1CbyV/HFXVYS1KFqhu+c+wKLGPMO+CaYvkx4LPdhV
	 vkb21x4m4D7Lp9lq1d5AXJPhtLCnZ5iwamYEb9RamQnkqW+Y7g7aJ4KynKsCAX3TpL
	 tLv/DJ5K+Lsc6kvkPSh/JDxSARWq0nBG7xbmcBGoETMh1ba19apl0rMgobRh/tj8HU
	 CBKh6P5RSbDnEbsjyh9rvwTjkvT7Jybpx2Cnl1TUnnCVZE0u69lTIcHsRfVwe5Xg3e
	 d2YUmUisnUZrEyNJxBXj/5hzSl5xOQqUuxWcHlA+rV95oiiIRH3edXq+8FVoKS25Jk
	 EDoB512loCExw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 1/2] tls: Honor O_NONBLOCK in tls_sw_splice_read()
Date: Mon, 26 Oct 2026 18:52:14 -0700
Message-ID: <20261027015215.605919-2-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027015215.605919-1-kuba@kernel.org>
References: <20261027015215.605919-1-kuba@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <cel@kernel.org>

tls_sw_splice_read() takes its blocking behavior from
SPLICE_F_NONBLOCK alone. When splicing from a socket to a pipe,
do_splice() sets that flag from the pipe's O_NONBLOCK, not the
socket's. On a nonblocking socket, a splice(2) call without
SPLICE_F_NONBLOCK therefore sleeps in tls_rx_rec_wait() until a
record arrives. tcp_splice_read() instead reads sock->file->f_flags
and returns -EAGAIN.

Polling first does not avoid the sleep once tls_sw_splice_read()
consumes zero-length records, as it does after a later patch in this
series. tls_sw_sock_is_readable() reports the socket readable while
any record sits on rx_list, including a zero-length record that
delivers no bytes to the pipe. For TLS 1.3 the strparser announces a
record before decryption, when its plaintext length is still unknown,
so the readiness test cannot screen such a record out. A splice that
consumes the record and waits for the next stalls every connection
an event loop multiplexes.

An LLM audit of the TLS read paths found this defect.

Treat the socket's O_NONBLOCK as nonblocking too. A caller that
sets O_NONBLOCK on the socket and splices without SPLICE_F_NONBLOCK
now gets -EAGAIN where the splice blocked before. sendfile(2) from
a TLS socket changes the same way, because do_sendfile() leaves the
input file's O_NONBLOCK out of the splice flags. Both now behave as
they do on a plain TCP socket.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Signed-off-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/tls/tls_sw.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 312e51270f29..771e02bff519 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2007,10 +2007,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct tls_msg *tlm;
 	struct sk_buff *skb;
 	ssize_t copied = 0;
+	bool nonblock;
 	int chunk;
 	int err;
 
-	err = tls_rx_reader_lock(sk, ctx, flags & SPLICE_F_NONBLOCK);
+	nonblock = flags & SPLICE_F_NONBLOCK ||
+		   sock->file->f_flags & O_NONBLOCK;
+
+	err = tls_rx_reader_lock(sk, ctx, nonblock);
 	if (err < 0)
 		return err;
 
@@ -2024,8 +2028,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	} else {
 		struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      true, false);
+		err = tls_rx_rec_wait(sk, nonblock, true, false);
 		if (err <= 0)
 			goto splice_read_end;
 
-- 
2.56.0

