Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4C3C7DE8;
	Wed,  7 Oct 2026 19:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402593; cv=none; b=j5OulI54XDspdT4jIaNz8KrQwyO5/jWK2kWgVnoFncB1QA0WmPBoIQknLJCMl27PTcXxdCzx0p5UuQyN9C7eFapJveCB35ceWyKSjKvIpA2vpGILNubjSib6x46PSLkHDrYZELYSsvaGAKajgeQIMU3E8Ty/Yn1FsKeB/4ZnfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402593; c=relaxed/simple;
	bh=K5aAt94XahRDrWzdmmTLDKCKmV4fxbMNIal9vFWVyXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9DsQ73EhFJLh1qEIY1B/mOhh2fmKlClmKgfBhtIGR+XZWU7CvPPUv+VVj7inszT2jHL9W/GLdiQx252kotuhrRNa5jKuukKTq+CXF0wGIIDCK7Hwuz9QZHZZ+emYDBpRzJsoUCRF4i5DkPYOHLOxQyXM6Ifthv3R7tKTr31h6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWRU/h1R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWRU/h1R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3167C1F00899;
	Wed,  7 Oct 2026 19:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402591;
	bh=xs9nec/uSO3vh45pzomqrOtdL1TJ8dbk73ENP3rLL8k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NWRU/h1RivdqbTpglYD0K9UPML+fdqES7SBpP1BzVuONv3qBFSGibLNw2VWU7qKpP
	 DbBVSKHbd/jxrvJXFc6m5M1bR+xRmud1ZD9KOQ4Bjbynn+31WE8g0SoXqG2HFCT6lO
	 MhCFM7cjqAqW06iFFqaIZudEtJhhOqz441WYauiVQOIJPfJuQXyymBM3IhwV1vUfp9
	 nVtIF8EKulsDrlBx4vogPgjQmyqFq80HnNaqId6JZ0GDS43nGbku3iGET9gx5X4xHe
	 e1hkpD1fINeRgA5EOZicAORA+qZPxnIzETdAKOLWqiJ7JPFgTDUAYynInCCKX6V6D0
	 ePBBWRP5Ga42A==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:32 -0400
Subject: [PATCH net-next v3 3/9] tls: Honor O_NONBLOCK in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-3-6d52d98389b3@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=cel@kernel.org;
 h=from:subject:message-id; bh=K5aAt94XahRDrWzdmmTLDKCKmV4fxbMNIal9vFWVyXM=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJZheMcL9PubfOwzmHbtH3szhwev4Y0Cmfys
 +6dFT09/Q2JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWQAKCRAzarMzb2Z/
 l0ebD/9hwUlHZ9oNsRtw0uc3kuF+hpoGM99Cw1aL2eq8dvdKHwZVMMOfKlQM+Kt/AIZK9hSQWdl
 svuar7mz/ZS2eb985PoIZzeHbWXOGNsb71KBHC5K9kfaHfJkWauS5/MtyxUycBOm8q4iePm04Ii
 rlXg6Pgs0TIPK3jLEXv2t+Wzz4e7IFQLxobFbL0tirGzZv4KM3/1hOH3ug+/Nrw3K6AN6x5Pxu1
 zVnN0Ty3H3UTQJ6CKi3ZxTWWjSucTjts/BPBMeiC54Lgnoy/RGU6LRwHlqaSP//eKiBRYXXzx3c
 WZ0qjWA9tq9MNJxfBT0AIkQD5XFD/RuKLLg6WP+KUtjQwqDfYe4X775rdtkZ7zLsrCS5q4YeE7o
 mgEx7H99nw30wbgwct3Iue+dtTE/5XpVvvYDn07wlBN/jyYGv1IAqFODaHrsvEW6iqFC1KdDnGo
 /tpUv6SqmhAvTliRRDbCgGdlyloIum7HO3b/5MZK/cjncCwgD/D6mcL0Xi5I3JpCWlMnjxjESzk
 o6q3H2QkQvo+GWR5phauUGs1MOVekDh6Y7g4UAIUh118bsn0l8VPZODmZqn+/sF1tFofwamomdJ
 fOtQ1dK8PhuB9/ozcye1OTXMw3DRDTNk0zLGzJLCsOrhCdz3573B7lBfLhX9q9CqFlmLZN3gzCe
 6MLQAw6MeDBauYQ==
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
index 32be5a8f80ed..6c21897b03ee 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2022,10 +2022,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
 
@@ -2039,8 +2043,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	} else {
 		struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      true, false);
+		err = tls_rx_rec_wait(sk, nonblock, true, false);
 		if (err <= 0)
 			goto splice_read_end;
 

-- 
2.55.0

