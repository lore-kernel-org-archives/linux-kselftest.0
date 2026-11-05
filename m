Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793896241;
	b=WZ7wi+Y7Zbd2C+CkHKb6AnmDZ96/DDhFRHb2kVNM1p58cx94UoBsrORMbR5oLXnwPlXe
	 Gv5BR+89H5y2BPKsWV7Oo3OWbMGFKRW+XaFtfLENxKjh9fUtMaJOgCycFi303P/+YiJts
	 V9u4CiU1nozPVc4p6Y0tW7IYTYW7ZmvEk91y/3T4gA+bmUf7qT9Av5yRw+iN2p2UvCCGA
	 MAW14jXMd07gdaLE3NxyOhEIOWJC5XfwMLpPLBEae5VG7hpY4tCMLl0YU4q4nhMTIJn9E
	 XSo/E92Wj+WQVg/cODIkx/xJrpYNwSz/5rBIjvyJo8SDgtVT8/WNCC+IqrDd4zCGu2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896241;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=uHeW0L5fyg8Btj14m4d28bKJ0EVxCTJiTa5I2SS1ptY=;
	b=WU1ebxOySI+N1aoQklN+AHe7bDd00sjwr4aNK0U7LCH87kySJGkbMB0dtBMNuNyspER1
	 ETJYQUGYnSdwTm7TdfSovr39k22G0Qiq+Bz+LUUBuTRqvFQwQsuOB8hVdcUgBjZoc79nZ
	 MqcgcuhAcIA33JlcBogYYtWiaTNuLttrV3wVjbVvf3ij9+8heNmHb8C7YjBPnRao4hpQF
	 qyXU5suwQ3H1J9rYoQ0HUGThv8JXx0dCu0Y1ZYsTzuYHCmeUQZZDvzuNSOvMq03Ws4qrQ
	 ZXJgOTp21Cdw4daqZg1WSE+Ql3oll1QVZ/m27CVFmjMpAq+r2BMGwZWBG8q6awPFOgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bXG4R/+J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93401606A335;
	Thu,  5 Nov 2026 16:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bXG4R/+J
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793896241;
	b=KoLUwHmMTCF1R/Douvc9ZEF51HUHREaOuTLskhy3D6/p0pnAamAAp/GX/txyL/B1Z3py
	 cEx6+ftIDiHZR/4inn5252U8+EquEPdTsQZnavzMeq3Nmt/rNZxtudOIgHkv2y1Jp7RP9
	 Wlf5Dt5GZwTjJmlTRm8PRL7WPxzIYq0s8xRrWZdvtD7OH4BFZuKXpEFKA3R+NxA17BkjB
	 Tr8RYWyvisH9t8MVNbKe/RxgNhgbxRKsbMk1J7kpVxNSPABnhmu7a4iKTxHjYmtdTNQqu
	 MRlvyaguB4/PrjBfJ2WH5GE2t9ZM9TKHZe2SzyG13dO94aaM+cJGlumQInHozNUXW4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793896241;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=uHeW0L5fyg8Btj14m4d28bKJ0EVxCTJiTa5I2SS1ptY=;
	b=O9HM2O3wuQ5Zed2zWm3mzwQMSDth6Eo9Bhobyca6Nmm83EixU7tu/kZY+5drYRqvegKA
	 sbaidaQsxdLcoYcqT+7ASvmhxk7gGejq0JHHLKOUZLZTaj2Bs0Sf7RC7aeo++yfXJEe5v
	 /eIwQD49UmP0p55fXBACL8MCVCgdccZZV6rkDfso1pzNg2FYqkf9U75j8n+m3BW7tbQIo
	 /Sli7Sm3eOfmZB52gP5GNegjlHn95pxJ/Pm7fyhpONnG5pK+w8YoeIoTMkoLMKbt2/2sA
	 30mdOdGcZep+ZdTPPvtMApR0RIpiXH/mcVPadRRgYFdRn+ftfHgWupcqd6Y45jrazPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0532F1F00A02;
	Thu,  5 Nov 2026 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896241;
	bh=uHeW0L5fyg8Btj14m4d28bKJ0EVxCTJiTa5I2SS1ptY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bXG4R/+JqmAjTVr6r4iG+IpBmjAj7c/3gdabgTv7223FXmMCuvm/jx2V3q/lqRhcA
	 wyT80NDFw2A65hGn1kXOwiJ3SxqWQLMABp60S+sHchKw+lKJ+gr+mUy6TdKjgD4Xe6
	 IDGKFBBMRpcDLZqjQeJDf7AKzsUtX0NZSLH/lektl27MHcwq+F5CaZdvmRDBVysKOg
	 dDAGwAt+vmg/lDuGCuxpZJVCXbg2uHaCfnIYWdz9H/sbze2BY18hl5003PRlGS8kuX
	 yYDTUDNPTpzr6ZZ9esOVU6UX4QDd79YhJCyFcWyQ0MGnHZmuAXa98ID5WI2eBjom36
	 0z+b7u+FQFLVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 88CFF47328;
	Thu,  5 Nov 2026 16:30:39 +0000 (UTC)
From: Martin Belanger via B4 Relay <devnull+martin.nvme.dev.gmail.com@kernel.org>
Date: Thu, 05 Nov 2026 11:30:39 -0500
Subject: [PATCH net-next v6 3/6] tls: loop in tls_sw_splice_read() until it
 has a record
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
Message-Id: <20261105-keyupdate-rfc-v6-3-99b695f9eb4f@gmail.com>
References: <20261105-keyupdate-rfc-v6-0-99b695f9eb4f@gmail.com>
In-Reply-To: <20261105-keyupdate-rfc-v6-0-99b695f9eb4f@gmail.com>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>, 
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Martin Belanger <martin.nvme.dev@gmail.com>, 
 Martin Belanger <martin.belanger@dell.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793896238; l=1113;
 i=martin.nvme.dev@gmail.com; s=20261014; h=from:subject:message-id;
 bh=4C9Djt7aw5YpZqtOVbGgX+iA/6jCePYUHtfq0NJMnQc=;
 b=PUpT2o6XdjPzvShA6vVJWrZJeFssowmSFYNxIaJU+36VTv3EDdUhyKVVAOwGi2GHxA9geOAOb
 1Q5+oi1I8AaAMbR7m67cNCDQkXhNk5BAcAOSP9ddLnk7QFgx0XlRKnP
X-Developer-Key: i=martin.nvme.dev@gmail.com; a=ed25519;
 pk=4K+XXetGK35w2LzRRddd/bbHawZU222BN+YZRuSpN+k=
X-Endpoint-Received: by B4 Relay for martin.nvme.dev@gmail.com/20261014
 with auth_id=1176
X-Original-From: Martin Belanger <martin.nvme.dev@gmail.com>
Reply-To: martin.nvme.dev@gmail.com

From: Martin Belanger <martin.belanger@dell.com>

tls_sw_splice_read() passes one record to the pipe. It takes the
record from rx_list or decrypts the next record from the socket.

The next patch lets the kernel consume a KeyUpdate record. splice()
then has no record to pass on and must decrypt the next one. Make the
decrypt step a loop that runs until splice() has a record.

No functional change: the loop sets skb on its first pass.

Signed-off-by: Martin Belanger <martin.belanger@dell.com>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
---
 net/tls/tls_sw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 771e02bff519..7f7a2f70b02a 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2023,9 +2023,8 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	if (err)
 		goto splice_read_end;
 
-	if (!skb_queue_empty(&ctx->rx_list)) {
-		skb = __skb_dequeue(&ctx->rx_list);
-	} else {
+	skb = __skb_dequeue(&ctx->rx_list);
+	while (!skb) {
 		struct tls_decrypt_arg darg;
 
 		err = tls_rx_rec_wait(sk, nonblock, true, false);

-- 
2.53.0


