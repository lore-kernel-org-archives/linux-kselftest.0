Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257346;
	b=ryjJQVsUkJ9viTaysII8APURJFvrXi7pPvlRmqDAQ7FGNXN9wc03iBOLdAWu39SZEKgu
	 BkPz7V+fQDD7BUnx7b1WONsOwdI3QcHaCmal+SOiAnesDaNGVAeL5vmBO5w2Z4fIu2GqH
	 jKLWhTm5KlwPX5Ne0qi2O/XNlJcLicyiAAs8CIPCI0oOYaKoui88snlGUQqFIt9k+sn2q
	 /fbopJiUmffsSZHiMfM0OT3jlaZNjyhay43nyHrFdLmLWzEtujtZtfx8qyLe1+NIL7Y4u
	 qZJ/oT+sFkPG4qHkjaCy8k5Je/Pgczp0YnYKF4CefaNrgN8M5JDLxnUT5iq+cmMWDYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257346;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L5hGurAKkqpLz3Gfdlsx327sieYg5Z9sWpnZsySfpsg=;
	b=vUKbaWDBrLBN7Zw+i0URK9ACEXbY0lpj6gdK9Fz7ChSaIzTlHeXCR5nJL+X0dTY6jyYD
	 AFJeLd1LGy/086ESnEucCSTfquIF4K9UK/Aw5RQcM7gKIjbuoIYQRS4CgLM8MHQpH3h7w
	 IIQ/dr4TxHBiFXYBAk0uVSScrUwF/KTYrRrqQsxz+0Aad9S29F29bGNdJHL2mmtPpmaBw
	 8eJe6VzUmJefqO6vCC1GmCGzg8XTcEJLPE1hl4Tq6mzbyz9O+u3jH20ZQ+/SuIAJAgjg6
	 gP4HLj+pML0U5iDFcjqvt6gFUkJDLc0RqqYH0BAFffULjcCJGsaBjNFO+qPixxzUnlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RJuf+wUK;
	arc=none smtp.remote-ip=91.218.175.19
Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC93606A335
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC93606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RJuf+wUK
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8LRbPdILLLhIs0nbG++RshFwNSImlc2aG5lW6OMeSRo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795257344; v=1; x=1795862144;
 b=RJuf+wUKrRtgLDPut++/uE64Egc4muDpvsFI+4l1PRY5aWt7dWohZAOPbtKRv0jd8vY5f2m9
 pLKLIFMyM8v2AIsNFcx/nCUG0r/20NnYQEsflxvMsfrqmG6fyRW7qcmgfeVTGTOq3saA2kLApUr
 C/0pZ7Svvs/KA1Tv4xjHXMhY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 826288e3b8d86c17;
	Sat, 21 Nov 2026 10:35:39 +0000
X-Mizu-Trace-ID: 826288e3b8d86c17
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	ast@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Michal Luczaj <mhal@rbox.co>,
	Mattia Meleleo <mattia.meleleo@coralogix.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 07/11] bpf, sockmap: Fix psock refcnt taken in sk_psock_backlog()
Date: Sat, 21 Nov 2026 18:30:08 +0800
Message-ID: <20261121103222.88209-8-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121103222.88209-1-jiayuan.chen@linux.dev>
References: <20261121103222.88209-1-jiayuan.chen@linux.dev>
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

sk_psock_backlog() runs for a given psock, but takes the reference with
sk_psock_get(psock->sk), which returns the psock that sk_user_data points
to now. That is the same psock only while psock->sk->psock == psock.

If sk is removed from the map and added back while the backlog runs, the
old psock is dropped and sk_user_data points to the new one. The backlog
of the old psock then takes a reference on the new psock and puts the old
one, whose refcnt is already 0. The old one hits a refcount underflow and
the new one leaks a reference. The SK_PSOCK_TX_ENABLED check before it
does not close this window.

Take the reference on the psock itself.

Fixes: 8259eb0e06d8 ("bpf, sockmap: Avoid using sk_socket after free when sending")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/core/skmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index 43dc128841e98..52469318fb577 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -704,7 +704,7 @@ static void sk_psock_backlog(struct work_struct *work)
 	 * before sk_socket freed. If refcnt increment fails, it indicates
 	 * sock_map_close() completed with sk_socket potentially already freed.
 	 */
-	if (!sk_psock_get(psock->sk))
+	if (!refcount_inc_not_zero(&psock->refcnt))
 		return;
 	mutex_lock(&psock->work_mutex);
 	while ((skb = skb_peek(&psock->ingress_skb))) {
-- 
2.43.0

