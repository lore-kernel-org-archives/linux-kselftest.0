Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B16836C5BB;
	Thu,  1 Oct 2026 22:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894508; cv=none; b=QWrcDNit4CFdAZy5cqIZ7dpr9dhjkjl3p4Suiq49NARgTsR/oBKPTRq8JUlBYpT16C2CKKBG+thWlIF+penWnT7Sx/dr7KB+JWl4VXjwkHzeij1FfVDhx0NLz1KVcfz57x4REq6FElaSD3uKeSMeWTdn0buFKbkLMEoDNata3wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894508; c=relaxed/simple;
	bh=cevk8M4MPTkFAFrfcWVc7AoiDvEfACIscnkiKkqwD00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+eYgaV9oaF423aYLr+W5vh8zb94uBSltLch8cbMVGMd5nSPmxcsWAZQ7lOP5rwo/8A+FDJm6ynN/2B5Hcoa6jf2arfsrkePKzLP9iXFde7lZosDi1K03pYGDGTAQUfRYYU72Dqcb0oBE5xPbmnmXJn53vUQI18nklVNm7Lr6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJ4VO761; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJ4VO761"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96171F00898;
	Thu,  1 Oct 2026 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894507;
	bh=OguTfB5mhNX/ur2Z7K/uNeBQ/MMkX6ZqjxUOaCzewJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oJ4VO761q9txLdgNFK6VllO+UAkM4e7Uttqs2TPJtXm2Dmr2nwbFk2FQf53Zy3y8q
	 5gcb6qk36yOj9im8SPJAPj/e7MQABF2FJF1q6o46bNNsWLwHCL0GnQZXmk9d+/Xn0r
	 AjrRQY4uUfEefsNX5zMzaCUfzUGxEUQ5Bk9GzZIfzq3RbTrwcuQ2jLrfIHWgbC9ka+
	 /l2ZyTzld3E2KgeigUJDAxR6FXOUcuY1MZZAOzB3vV94WReP6yraBerhtC9io70mOj
	 HD4r9nL+sE234S9oKJ/anNqixyj210qwJ0XRncZVVXo2IzO4KkwrkYL2FQPjy6tHnX
	 MKs/uaPX8IAWw==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 01 Oct 2026 18:41:33 -0400
Subject: [PATCH net-next v2 1/8] tls: bound consecutive no-data records in
 tls_sw_read_sock()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-tls-follow-on-v2-1-2dd1947bb642@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849; i=cel@kernel.org;
 h=from:subject:message-id; bh=cevk8M4MPTkFAFrfcWVc7AoiDvEfACIscnkiKkqwD00=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGpTlk/KvioW+K6aBt3Yte69vmIAOFrVKj49
 9L5XTcXWFuJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hqQAKCRAzarMzb2Z/
 l8bID/4zTt40ac1/hxRAdMCUKW45R+o0FeNi+tqe+mI5eUjbmCEZJ0CHivW16xHV1q3lv0YrUU+
 7pVDurRPvFN6LZ/YTaKvKjZ0icq9mZJeXBMKBEqxuTs3brpJuj2PeB5izb8WKwimckY2tAVvAV0
 8KDyinHrx2gGUTQ6JDsH5yl1XUOsjteDbOfKf1+qfnNPepqd6qXrMh6wnil1gKve3o8XoKyb8Fn
 DvGiyQmr5dsZg2YU7XBJoVMoPNCuuB1Bi30Mb/ZN6JtTuFgEKZkhPSmfYOCcakv0OETkpBywzEn
 bPSJhoOkptOdYY0OJJpaPDdGQrNZQ8QYBoqds8FpMbOs7zxYyOax21NXj2OBNiH+1l3ASpbl3xy
 5/PeJMJE9QZ6oZHCfWJSMxnSelemr2EqV5gvw4udpzn1Hqh7LXrTeQyDXOpNadHK6nuzzu11frn
 uLbgUB/9FTuhn+UD/Mi/cYaGVUqaamePguGPlxUXOTx632b1lya2WGYgPW3lJD4FA6pC8ZZHy1x
 edCre9n/hxil2B5PGr/rRxkjwu3fj/EnNdRgXlPgYM3LiSQoBvdie6GwoSyQ9z+IAAkDp1Ky2+u
 OpDpRAHYKM/cvojULgdSSUehwBp86smArl1MxjrGogNZSrGpcFrR7YmQ9HYQ9SadmsWKpp7zSco
 4BygNJ/fEYeuycQ==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record delivers no payload, so
tls_sw_read_sock() never runs the read_actor for one and nothing
decrements desc->count. A peer that streams such records keeps the
loop running, with the socket lock held, for as long as they arrive.
The caller cannot bound the run because read_sock() has not
returned.

Stop after TLS_RX_NODATA_LIMIT consecutive records that deliver no
bytes. Any record that delivers bytes resets the count. Stopping
with nothing copied returns zero, which a read_sock consumer takes
as no progress rather than EOF. Records left queued raise no
further sk_data_ready(), so call the socket's callback before
returning.

Fixes: 3be28e2c9cd0 ("net/tls: Consume empty data records in tls_sw_read_sock()")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index d1ad31986cf2..c78471c53f2f 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2070,6 +2070,8 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	goto splice_read_end;
 }
 
+#define TLS_RX_NODATA_LIMIT	16
+
 int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 		     sk_read_actor_t read_actor)
 {
@@ -2078,6 +2080,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 	struct tls_prot_info *prot = &tls_ctx->prot_info;
 	struct strp_msg *rxm = NULL;
 	struct sk_buff *skb = NULL;
+	unsigned int nodata = 0;
 	struct sk_psock *psock;
 	size_t flushed_at = 0;
 	bool released = true;
@@ -2136,14 +2139,22 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			goto read_sock_requeue;
 		}
 
-		/* An empty data record (legal in TLS 1.3) gives a zero
-		 * read_actor return, indistinguishable from the consumer
-		 * stalling; the used <= 0 path would requeue it at the
-		 * head of rx_list and block all later records. Consume it
-		 * here instead.
+		/* An empty data record gives a zero read_actor return,
+		 * indistinguishable from the consumer stalling; the
+		 * used <= 0 path would requeue it at the head of rx_list
+		 * and block all later records. Consume it here instead.
 		 */
 		if (rxm->full_len == 0) {
+			err = 0;
 			consume_skb(skb);
+			if (++nodata >= TLS_RX_NODATA_LIMIT) {
+				/* tls_rx_reader_release() calls
+				 * saved_data_ready(), not the callback a
+				 * consumer installs after the handshake.
+				 */
+				sk->sk_data_ready(sk);
+				break;
+			}
 			continue;
 		}
 
@@ -2154,6 +2165,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			goto read_sock_requeue;
 		}
 		copied += used;
+		nodata = 0;
 		if (used < rxm->full_len) {
 			rxm->offset += used;
 			rxm->full_len -= used;

-- 
2.55.0

