Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793742210;
	b=E1t+SqbMkQQ7QZOcbddkLfWNIpwh94ZjZoX3/CT7Bw8iwhDTVVrNf5cF6tmdGd8RSH98
	 gd/jaf/+7Kg5wTQD0+d8k1IgrBkn6FdWPnFfUyANeu4JhqDB+C6B8z/7KGtsI7xAEkEn2
	 skE96u2q0DP4UW0HK6QGkJSIJNj5mP2pqdaHAix1lKzqJAnVrZ5tRdh4KyGCxcgFzwuLG
	 ZF7Pp+9D7Fqkzg2osO4Ph9YD2q9IPzsrYJ9jwb+kPL0FyWVR3d3CxCIVtBzL9RoB+athQ
	 yUUyxwR9UzUaVfsrgyWRsjNII7IvrrZkjrcr6IWRnqHjWeXzHrUHcQy1uaO8cDKmf9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742210;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=e1CCK7unGIRtnCbMWuI23FUplQt/eU5eAAIgHQYDe50=;
	b=Iu8WbJncRwUtrZzLYKPNzJuHelygv4/1FCTYxZk9q7AqiUZlqz3DKWm9ZGL5MGpdUbS5
	 Lmg/0lsggeVm7enLumVK3DYpVg4ycCriowYbT8ExCVchZDad1J+NwC4Bgr9MQMO6j8nfu
	 2PdCYq34gzdklJU0ug+Lr+b0tsh79aKs1F1/RHhBYNqYTiAVz7UfYmPjo7x1CpEOGxWIe
	 28A+WyXSXilE0mSMXKzsH2LzFibB4D3e2yIHPuIMd/Qlk6P1PKL0a2wZRVyRiyACdRySj
	 0taKt96uVGZiIotP6NET6KGFgXpLm6ZOa0R8fjvPsTW+z8wAQO/DnOi4h7LNWagZv8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bz//JEQ5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D43606D834;
	Tue,  3 Nov 2026 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bz//JEQ5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793742209;
	b=f9ysyGqqPgCRyRGsb+UQLWnVToOu23wi0zMM1xOucsFD+crI0w5krDVf9Ip3BayyCiBs
	 ajGnftj65P4TVAO7eW6l1N1+YLEf6pLCtfC3H6eNU9e6g6RMyA10XN9C3whiS9iVrxhMQ
	 MWYnxpp2GyJpMzQqYJn9xVAiT9MZMKtpfNq6fly0LYco7Ci58XqroZC42zu1+ryRw0LKC
	 Y8eexyKsQINisQLKx7Nw6pF9TJsvJjOGkcY5ss2HJt3j572Njg+E2FAAWv/tiiW1U1Tg+
	 blwmNmOUdvHI75HXfRpEkHuBme4omQ8WJ3TfJJdXWgsURjLuwM2bp6tEFYlJJBaGMMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793742209;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=e1CCK7unGIRtnCbMWuI23FUplQt/eU5eAAIgHQYDe50=;
	b=YT366nc4NIXbcoj8JE0ieUsnNX4QtJtEP+SiZwaTjEcDA++X/dqBkng638AUtDW9I+EN
	 mDSMRuY5eH/y1uVu0WKA7wBY9NsUlxzbQ1/b9S/qbb0jHiFUspOt8qYSq5FDV9/dJQPwO
	 OHRqXJtHw28wTYopwLckEWTqHUhRBXfR3XDG2COXBRskjualBL5W092rLdtpglVt7OPcy
	 tW2Q9kJYyi49U7CkEPJizRmZoHdSejbHtZekpgVK+DFQxWYeG0KE+V9WvQLasMHDbxNBR
	 1JsvV2Kr3CwFVhvxXLq2RTW3yx+mLi678gXlM3IEwgD9wVuTjMRYth4yIMtzJVntR8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E51ED1F00A25;
	Tue,  3 Nov 2026 21:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742209;
	bh=e1CCK7unGIRtnCbMWuI23FUplQt/eU5eAAIgHQYDe50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bz//JEQ5jdwJ3PmBFA9l3N8jSFuD3kkdN7fiYHhuXztVGAvwLyCEPs/NrMIJYA1qU
	 sHI68tBszshC7RqpKyDj7uTX0UA6KpH9IPTAuMhn9EZUfg+sqB9UyqxIp+FKI+fkS9
	 jTU14KktvsCV1Ug0DG/gL6Pbkm9kxHE4ZwIiTPIscGsFn0VX25jQQeLz7i9Xt92yvp
	 OYKGkz1KJIFarl1hEu5lFvkJ/FpOVjOQIBb1QQpVyO0EMDhqqQibmhX7UYso0iBEeU
	 VOwLhgvIFlrZx2aRhbO3g0AjxB9D2OBv8Qmd07e8p+ABB179Z/sViy35dkFpK9o+vO
	 UN9hMTMzzvY6A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7718A46B4B;
	Tue,  3 Nov 2026 21:43:27 +0000 (UTC)
From: Martin Belanger via B4 Relay <devnull+martin.nvme.dev.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 16:43:27 -0500
Subject: [PATCH net-next v5 3/6] tls: loop in tls_sw_splice_read() until it
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
Message-Id: <20261103-keyupdate-rfc-v5-3-de1ab90a88d5@gmail.com>
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
In-Reply-To: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793742206; l=1065;
 i=martin.nvme.dev@gmail.com; s=20261014; h=from:subject:message-id;
 bh=/WbOdXhJxwSkTgLlxCEfzCgk2vhZiq7sYxpEON0IUc8=;
 b=R9ZTOPQ1hNkNwqFmlciP3K0RbgwKbdFE1QYYA+v+aZEbFEWhm8e4ddCo+R8AhU1/5jpU78hro
 /ar8y6IeKiBBXKdX0PTjmeHkb/Eapyx/qaQJHjqpxTcYHn/GDPVavGe
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


