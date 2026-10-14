Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E26569F0C;
	Wed, 14 Oct 2026 18:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002535; cv=none; b=kwCixVfsV2YQ9trFg/GNAb5+hDkdso/vD29tBgkbLuS5WYutfBiGasGq/0l+qdjxm66PE58F50BRaQto9Q7kdjw/K3IDmPMGnkU0etolosjpRi/iKS1eO/qPS12sPkITce9glcO9pQ9KrNlS3dBTgx1eXoy2KYEIWKI6uiCTk0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002535; c=relaxed/simple;
	bh=ketGKsdFWu4Q1Q65Kf3sm197rTXG+gW4AytMu+guGSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjCC9ejOHbJnJpSrYaQpe5US+IkZa2WxZz1lwyaDTkP+055eIYQOBuPg47GteemLCj4kOkqv/wCV7gfimWlaB8tDSuNhHy648/K1VAEe400KwAfV/tN5/1aelWUzcRX+NXQ8mw8M3DrRf+LZWjYzroXAhw7sVaODnaKkhRF41lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbNQ6wgD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbNQ6wgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A9F1F000C8;
	Wed, 14 Oct 2026 18:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002531;
	bh=B3rYr3QyA3/i1NQM52SiZ36Fo24qwztAQdfqTSw1J74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cbNQ6wgDKxPYYImRODJUQ7DjQTCtsJts7Ik+B5sx819i/QgI26vQJzYshL/0hDyWQ
	 1x9mIOwVZEg4LyCjVIjZ9W9Ke6y22vCwi8/bsDQi5D3ZFiRmC93qVC3rCQ4SCqcBWH
	 Lex0WidD1+3qOgn7c1fKG99bp0Wyh/Eei2OnWEBgrv/G49UScaWzRUxLhrVqIAOMB1
	 OP91VRWkJ3mwGn4RCudnOVVK7xsiRkt/QR5i/ESXzCZpJrRx15KuITUNOdeMXI5sKQ
	 ESDIIihoSeawa5hKCUKC8ygGTz6brnLSMxMZ6aRdLaIpoZKC0v3qTRHYM0/rSHgAq9
	 +Z2WQ3H2mqLJQ==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:33 -0400
Subject: [PATCH net-next v5 03/10] tls: Honor O_NONBLOCK in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-3-e76c301d4f05@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2568; i=cel@kernel.org;
 h=from:subject:message-id; bh=ketGKsdFWu4Q1Q65Kf3sm197rTXG+gW4AytMu+guGSg=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8ndNE3ttnoBCr6pNwJPsPo1eYyezYBS004fQ
 VgthRljdmKJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 l12nD/0VzEQSRRM2+E7K1L0iKArFNeoeAIuPOzMoBvuileqf/0pi1uitkY6ZraMbHEYaZoHNPYJ
 6kjrCbgda2L0Akqep/jwgw2FKFNjXUyz8pEqyU1iTFZ/et8pimBpkkWmyMIHOm2lOJugL6v/QVp
 Z+uJQ/Ms2TWMYwh6Ty1CrM2q7Jl21G2RNqLmO3AGOxpwVuSIrOvLq5lJNvR7pF5OigiRq/0Rc+H
 MsHTuspTi32fz4NoB0BkFwwxuMpUsQ4sEDbFp2oueu4Qic0fgaXyMKdsKzhiWSX/wkJCgu7UmU+
 jlfihLoYlhQlKUX/wxWDBCnMBZ9xDMtL3N83X2Y/Vh+6zUId5c9Ky4VaRdxtaRyTEcbhINPyfNN
 Nke39248mLa40I+P54FWRrwIoAbRnSsrngjhmvAqyUOzHy0zHGAlK+RR+MQd8zzlqcgHREdQXw4
 cUZJHlbm5dY1IAZhzcDUoSVsTzzRoRuC41mv27N6wR1nRuKsOgojjdOiXbYV7xuCt+1HLd+0YF0
 GCAYPt5+2jckeF+REl9a4TuEPzrOkbqzIGtpI9+8YGFKYiWmuZBEeuXYY9Fp/DVM9X9SMolnmQT
 o6999JDfFS4fy1Xd/tOfv7DAt6PqHyOUQ0tCbs5n65mLGC6d0dGjzdftsWsKev6i66J7j+ayuUy
 AgCGwpcgFFuW/xA==
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
index ac4da28ed9c8..cb5a2b29bced 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2026,10 +2026,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
 
@@ -2043,8 +2047,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	} else {
 		struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      true, false);
+		err = tls_rx_rec_wait(sk, nonblock, true, false);
 		if (err <= 0)
 			goto splice_read_end;
 

-- 
2.55.0

