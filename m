Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55591D6195;
	Mon, 27 Jul 2026 00:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112434; cv=none; b=V86girl3d3FUsBS2bcRz2BQk7ghww9AGaYk5YTW/Lak7HrpVL7yVwYjX0VqS+/sHrV9EmzN8XqLO/nUaXvsNE3vwSE4K+OF8ou52grfDFX/UgQeU0YnaUSPfZ/Fy3mxGhSWlnOyKRBJUlP1iIHbhA99ODLY4Mjy3A6646Tpq//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112434; c=relaxed/simple;
	bh=wMbAL7q43ueBS57J97FptU/TDfCej7FJ94Xxi8gXlEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JCBdld09FHQ8O/n06BclgM0wRITWur60qLkgNCCZExrNWcreq4lg5zpVs7uUGbCXzaXnl0svkC+bHS65S9Zq7ghOq9JhGf6eLK5ObKNEHnlSUx4Ym7xVbz1H/qgvkCMBLD+1ACkSumOjoG4Z9TAgxyTfb7RiUvK9FZvmo+mATLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JilDT4S1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JilDT4S1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82B11F000E9;
	Mon, 27 Jul 2026 00:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112431;
	bh=94fWsyV2TpHqCktaOJQiujc6nsAOgy16dHhWvSuiVWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JilDT4S1Ua4fhe+WkAV6Ab8Nji5Lie7k7f7ihd7x1KUVdHaUVNbNGXsffXK1Kyhef
	 aRuhkujnOpvtaPlsMBqE4Xv3E6z0WQLw9rp2DcIbev/Np/mOhmK9CkhoPBR4VWqMdY
	 oW9J6ZI+6TBZoyIrqZN0lT5aYPPmFppwyoPAP52XigEgSAa1WsOELLm4xk9PXyNh0J
	 NnlGXGnWlsH57Na1b99DIJnp69waHrBhfLU/Ecy8oKn/MHwnR0DZ6p13CnvB58UdBE
	 oJtwQzQKU+xQBm5cummU7L78jxSCgAqZx5h3pPYs0ibSKqZ6OXIkuFy9iukhmfMcna
	 lQF8IM5rsJzog==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:32 -0400
Subject: [PATCH net 4/9] net/tls: Honor O_NONBLOCK in tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-4-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Chuck Lever <cel@kernel.org>, Dave Watson <davejwatson@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731; i=cel@kernel.org;
 h=from:subject:message-id; bh=wMbAL7q43ueBS57J97FptU/TDfCej7FJ94Xxi8gXlEc=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdp8NAfLxspbXj0plAgt64zi1AT5XDh8EE/4
 DpNalcwjDaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanaQAKCRAzarMzb2Z/
 lyUuEADCDQNVPY+cZyhtZPJRH7j/bqa/zX0vcUyIPpF4Vu3cW0PHpY23xJPD2mxCVVS6xe5gStg
 BaUVoUw+rgi6xnZv5aUiIInGtuU/uUcLWQ3KD/Z1+t+s5DKDLSOFiJBA1kCZ4oeE0w7wb50xRJf
 BL3a6M9R8eog/wZpv3vFCD0ER4F7AttF7IUTFWxmy+Z9FpbTnQY+DKWEVslD5cb/Eff1pmeylQF
 tIbMgLohHqysK0Nqic/kkQq+nBviwXyjRRJhsigivfid6xnDx0UhNueWJV9j7xP6BW3qJJiV+JW
 r7J6Z97mVbPLfn+PLIy9VJd72AjqOAMsv7uTCRiV5Xq3FIhJkxv4uuXk2axYGI8Hp1QNgOcNvu3
 jZ2yAV1qfCT7QYjhV8zBk4fMHKLaoqN6Ey6GXk2YX34C7qe1SxziXIpXi5ZSG9GGNjZG0BJUhl+
 iEztuvWDv1QRSDN8mlIO1luX1AfXgWHoU9swYz1NZ+u/GTfT5M87L4LUCoEzcYmd7uEWNiKuhoA
 eua0azIhoPYB/OodUMl7bLH7H4zkxR1nsA/3XYVmhovz0E5lQ8SNMws5xQHy1iyeTn61Oq5vsuB
 W9NzIOZK75uWRYuJnEvoRtxc8e0f0LevZ6ljVAw2Cl0RDWeqoMcAcq2MyRrgLXeWS+siOH79iLe
 UfXpXhCQpRhtRxw==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

tls_sw_splice_read() currently derives its blocking behavior from
SPLICE_F_NONBLOCK alone; the socket's own O_NONBLOCK is invisible
to it. A splice(2) call without SPLICE_F_NONBLOCK on a nonblocking
socket therefore sleeps in tls_rx_rec_wait() until a record
arrives, where tcp_splice_read() reads sock->file->f_flags and
returns -EAGAIN.

The sleep is reachable through poll. tls_sw_sock_is_readable()
reports a socket readable while any record sits on rx_list,
including a zero-length data record that delivers no bytes to the
pipe. The splice path consumes it and waits for the next one. The
readiness test cannot screen such a record out, since the strparser
announces a record before decryption, when the plaintext length is
not yet known. An event loop that polls, then splices, stalls on
that connection and starves every other one it multiplexes.

Note that a caller that sets O_NONBLOCK and then splices without
SPLICE_F_NONBLOCK, taking that flag to govern only the pipe, now
gets -EAGAIN where it previously blocked. sendfile(2) from a TLS
socket changes the same way, because do_sendfile() leaves the input
file's O_NONBLOCK out of the splice flags. Both then behave as they
do on a plain TCP socket.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 99e9a9aa995c..f85d8a639731 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2011,10 +2011,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	struct sk_buff *skb;
 	bool released = true;
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
 
@@ -2029,8 +2033,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	} else {
 		struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      released, false);
+		err = tls_rx_rec_wait(sk, nonblock, released, false);
 		if (err <= 0)
 			goto splice_read_end;
 
@@ -2063,7 +2066,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	 * while a record is parsed, so test for a signal here.
 	 */
 	if (tls_rx_empty_data_rec(rxm->full_len, tlm->control)) {
-		long timeo = sock_rcvtimeo(sk, flags & SPLICE_F_NONBLOCK);
+		long timeo = sock_rcvtimeo(sk, nonblock);
 
 		consume_skb(skb);
 		if (signal_pending(current)) {

-- 
2.54.0

