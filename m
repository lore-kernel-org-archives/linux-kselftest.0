Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25544C33C4;
	Thu,  1 Oct 2026 22:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894511; cv=none; b=TbPAn5P2A1va+1M4aOyR1wTnL277uOr3Yh2GX4lKudNrOGBqxks9VXTZHn7Ynry6N+bTNfrr5JDMNtTgKCaSOFItSj7+f95md4Qb7zeAlVqZcM/R8WHuAwG4ZbtVeg19Gw5Lu2FoWAahFeYu8wHBw6GoIpaxog9hzkioEfaMMsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894511; c=relaxed/simple;
	bh=WlMA9aB2QvSFu6mGVai0HFp78cJoiTHFvqpxuRC/03U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNT2FjZO4bjlV/6Q2ESWA3Qm2WH9NgmvZnhRJzPwzCxCxgoVYzJg6bZJBjjVORZ89/CpFU4hAzhPyq1+wYGgtP7XzQkay6AOzUjJUCklYi91JeAiQ9U2TGJa6lTlsktzihaicN7OemCvtBpHqCn/hkiRqe9T2+tMsvLyLf2a6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/8yaP2r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/8yaP2r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F032D1F000FF;
	Thu,  1 Oct 2026 22:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894509;
	bh=1SdJwdLSshbmQWsPfGtd7MI+gVKzd/hTHPzRHj3x7fQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=X/8yaP2rKl4fhK19Yndc1sE9n4XRUgGhKI7tLTDRdVRQus5rzxsJtHijWJRPVFdoZ
	 GSIcjZxSFDSORLL/7JgrUT+/0piFwYaIfoXxV9QVlU98GkMZpT4PU7FyrukqaDBuQB
	 1aiVhHTearFD64+FdKnQtuyX7OSNshKp//Hwe3X8RN5poSOrqMb7k7Pqn42F/rf1Uo
	 ObBMkmqaM+RRZrLlQXNIsyrjd6NxvWJWK2DEYkRehQ7tn7Na4e5xsTZPuRTSKglix6
	 8BM5oVZzZMb8N+Yz2lo3ApNithzI1vJaM/R4nNrkr8uLGz7IP+0L1r+7rciYG5ap0x
	 +CO7bbcz7pRQQ==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 01 Oct 2026 18:41:36 -0400
Subject: [PATCH net-next v2 4/8] tls: honor O_NONBLOCK in
 tls_sw_splice_read()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-tls-follow-on-v2-4-2dd1947bb642@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2781; i=cel@kernel.org;
 h=from:subject:message-id; bh=WlMA9aB2QvSFu6mGVai0HFp78cJoiTHFvqpxuRC/03U=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGpSIt4qkj3JAPu42i2OyE+xDkYp8lHgN7IY
 an5Uq1SlHiJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hqQAKCRAzarMzb2Z/
 lzoaD/99+t7qmPyJdhf22t/8LG8VS9+eLkYFkIDsnr6cGvXj3PSrXvY97jggvkdn8raTwbB94K+
 Uy8hA0dl8T0op1NcjePwJ915fEYyvqP/sCdJV1OkPL9vCcHTrVxwpDfBMB6l75+LNRoZJAysKBa
 OJEpOThnRcln/PRx+kB9hGvwbZKtpLO0ydsjBi2dDIENdOH83BtSWXAWc8fih/wV0j2nKau210a
 y/nM5TCnIdTfjG6ABdgdb83W8hkClxQhxiHmmOJsfx4qJepq5WgVnI/iSUHc8RwRYA3d6BzkEWU
 0Zwd2NWHnBdc/5hx8nqWUR6fL/pqdfeETva2l923aknRaQzHOrQdhMHci5JqCXCLTXYFPT2BNwf
 kL9cVL1QVe7g2UPUwYpSEIej6+Y1HLVK4cBLl/HsduiKAbSSY8ePhk4tAOluD0BwQ3iVUNOdsQT
 kFsGYbe0OjN+4ZCCPqrivM9vi/EpQOk2k9liAd/uh3/LXS3OQOR8EpRs9XmrDRLZcQUzp99+ESf
 fk6eUyh8aa5NsUkrxZ4mRfE6wP5po+53vHB3udYnqHJrSGw08usL1OFCNEl5WI8yo5gJQDIhX9a
 nrMKQaW/5U8glnihqw4rfGA2EvV15zK8pksu+gXtsB+mX7MLVqKQA5HpNNofFmQbvcatYIjh+az
 PVJa6+C3oFHuyfg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

tls_sw_splice_read() takes its blocking behavior from
SPLICE_F_NONBLOCK alone. When splicing from a socket to a pipe,
do_splice() sets that flag from the pipe's O_NONBLOCK, not the
socket's. On a nonblocking socket, a splice(2) call without
SPLICE_F_NONBLOCK therefore sleeps in tls_rx_rec_wait() until a
record arrives. tcp_splice_read() instead reads sock->file->f_flags
and returns -EAGAIN.

Poll makes the sleep reachable. tls_sw_sock_is_readable() reports
the socket readable while any record sits on rx_list, including a
zero-length record that delivers no bytes to the pipe. The
strparser announces a record before decryption, when its plaintext
length is unknown, so the readiness test cannot screen such a
record out. The splice consumes it and waits for the next, and an
event loop that polls and then splices stalls every connection it
multiplexes.

Treat the socket's O_NONBLOCK as nonblocking too. A caller that
sets O_NONBLOCK and splices without SPLICE_F_NONBLOCK, taking that
flag to govern only the pipe, now gets -EAGAIN where it blocked
before. sendfile(2) from a TLS socket changes the same way, because
do_sendfile() leaves the input file's O_NONBLOCK out of the splice
flags. Both now behave as they do on a plain TCP socket.

Fixes: c46234ebb4d1 ("tls: RX path for ktls")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 79a807e51bc7..6ca1e9f4e504 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2020,10 +2020,14 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
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
 
@@ -2038,8 +2042,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	} else {
 		struct tls_decrypt_arg darg;
 
-		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
-				      released, false);
+		err = tls_rx_rec_wait(sk, nonblock, released, false);
 		if (err <= 0)
 			goto splice_read_end;
 
@@ -2069,10 +2072,7 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	if (rxm->full_len == 0) {
 		consume_skb(skb);
 		if (signal_pending(current)) {
-			long timeo;
-
-			timeo = sock_rcvtimeo(sk, flags & SPLICE_F_NONBLOCK);
-			err = sock_intr_errno(timeo);
+			err = sock_intr_errno(sock_rcvtimeo(sk, nonblock));
 			goto splice_read_end;
 		}
 		goto retry;

-- 
2.55.0

