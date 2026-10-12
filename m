Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECC349EC46;
	Mon, 12 Oct 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819007; cv=none; b=Nt4XDqcyQG90S+sXOKzqoOZ4nMpOFc6241p/2pRFCkXH8bo8wkEvd2otNSGv06Pzkuhn7EHxr7hifzTZPzff/mvyhhL/3ZLD8lnYeOVjUdMRrTUVgwCjylKzba6hPjkl3xC8NON1J+rBFiqDRt7JsbO/H4fGmxOdNblhCaLNIqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819007; c=relaxed/simple;
	bh=haqYEYbfrMDbB5FcYvmphfBmUzUj3YDJPc86YJfKRFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJ6bpYVbT7pHGu3sqj5eOI/83vHHJ84yIeeYSeQ4F27MtawY5JQhnG5dJsP6Xv7li1Z3QLsiYOprfxCaYkny8zzJAwHC/ZS+NO2ziY9DHO31OAiOtg8CcCNGsX3gNwJ+UJnS5kcr+q9+10AA1AC6NA3zJhAdPIkSP0Vsot5zy1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKZeeFPU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKZeeFPU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20CE11F0089D;
	Mon, 12 Oct 2026 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819006;
	bh=P3/j6CKhHB0cB7KmFCtO0+1TcqN9LKc4O26/7vPO+Qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SKZeeFPUfcXbOZH45SXuIeKpUHa7u0tyFUrYCLag1bcdgLmSsVKWWqaheXJCgm+1+
	 R/7HPKiCMFTNvvqXk/QxaLC+MnrwiDEzgxEIZ3Fdc0zTuzP7NyaJ4xlpSf3aA23GBg
	 HIKMstuGgHD7NOn+JoOHIkDOe2Zz0TbAdoHOyq6pS8HnsZJ6xli0K3azxX1Kg7jClM
	 W4/r+hRkAl4WLLBXn4LHW4rYFlLIn0w8H5Qw7l3hOoy+HfhQf8R3zKpbB+2wTb3Hq1
	 okZ0fqNPoh1qqZKkTk4H9kai/mzlXa/L8cT5VmOCRDQOQhG5kBF9d6E5qUb6reCxA8
	 tFKr//2jhDhnQ==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:49 -0400
Subject: [PATCH net-next v4 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-1-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=2916; i=cel@kernel.org;
 h=from:subject:message-id; bh=haqYEYbfrMDbB5FcYvmphfBmUzUj3YDJPc86YJfKRFc=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6S/zQLQRhkzGgkIpDKcC7mQaAlW0006cto
 R+xMPhnN7GJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 lw6KD/9ujOrIGYZMBa9lu2Uj++yFLoiQ5fqh4wI3vHgIOzEGa6H7Dr9F0GQye1B89U5Zs/KLolm
 XaF0E4db5+KiBKkTaCoDGRqmuLSo05e+CewUo67pPjaw6lm5r/J0irLR5rx0DGnZWdHbX5r/Jqn
 +ITtLRtusFcgfYN3P5ASdVcWbBzDZnAXhc/5h29Ykyk8l8hlBu8k+ljjFH8Rhrc1/k3cjK2GtZl
 mUXCZaRf30aiF5cw+KM4AlQv6bCWeLNPBT6baFzGoRVh4ZPd4hFo6UaDYuRtkEvYNGdRu4J0Txq
 neLKwPHUtdFNUocAcxq+dFHXGtrlu49cd68gKaDRxa0tMzPgO86HS2iP8FsSH2Pww9K63gwWxhs
 tckO+y8TsFmbatMEIPz20NQEHizQJKfM4gIt5Aj25m5rEb0mYWeFRYJMgX9zmjIuAS5bUrWx2Md
 av29I77YuDiZ1+lOmvgcqkc+A1U0dErzlyLQzqw1hm3CzCYe6OHLR6NPuO6IhrFdO7seVU+akC7
 3qDY757dfRkxlFx8rOtrABC4DIe2w/loXGhGqtcfQX2d72aMkBpLpDiGVpYemlXVYjY4Qe+Om+o
 mdy3gN4PwVcEM2iMd5v2rgTeI1/Q3eLZwZKNB7ZXFWIvfGzHLd5nYlO1uDm1XhXQlzr1sg88k0K
 NZswQIuseVjqt7Q==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

A zero-length application_data record does not deliver a payload, so
tls_sw_read_sock() never runs the read_actor for one and nothing
decrements desc->count. A peer that streams such records keeps the
loop running, with the socket lock held, for as long as they arrive.
The caller cannot bound the run because read_sock() has not
returned.

An LLM audit of the TLS read paths found this defect. The defect has
not been reproduced.

Stop after TLS_RX_NODATA_LIMIT consecutive empty data records. Any
record that delivers bytes resets the count. Stopping with nothing
copied returns zero, which a read_sock consumer takes as no progress
rather than EOF. A record parsed during the call but not yet
delivered is announced by tls_rx_reader_release(), so the consumer
is called again for that record.

Fixes: 3be28e2c9cd0 ("net/tls: Consume empty data records in tls_sw_read_sock()")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 312e51270f29..a64244566af4 100644
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
@@ -2136,14 +2139,19 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
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
+			/* tls_rx_reader_release() announces a record left
+			 * parsed, so the consumer is called again for it.
+			 */
+			if (++nodata >= TLS_RX_NODATA_LIMIT)
+				break;
 			continue;
 		}
 
@@ -2154,6 +2162,7 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
 			goto read_sock_requeue;
 		}
 		copied += used;
+		nodata = 0;
 		if (used < rxm->full_len) {
 			rxm->offset += used;
 			rxm->full_len -= used;

-- 
2.55.0

