Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674475;
	b=OmkoKR5S0i+hjQczHRcH2gxktpmgGNn8xk50Q6YMbyN4xEjqwNEkb83UXY7gsbs83rO6
	 AKVOu3lMBrmp82Gj4KJmGOUzxoB2/98GcDE4vQR8j/LZI7es7YIXkG84E4UjYthgx/hzo
	 9YIrmLlSmS4TFa2hKxHZ4S31fqNv1zKspz6SU1Ifr0IFu5RcssUaq16l+lmYzTb0tnifc
	 L/oZW/uhpV5XDag8hOJVEyFLoXjKKFAr8SpWSTD2Qlz9GVqO5O4o5Jr83pjCZPyQ6w84r
	 NOqpDkwskG+fRgwzYFDCOTh93jUshKwGoIVLr6/bep0mZAj9YrSQKwsdQLQfSmacEpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674475;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=kAif0q/6CgKdYC0zX+fdqIkGgsOa0bqu+AUJLWOQHqE=;
	b=SEqO3EPlxObHXJd7HsPoJqtG35ULULbgnW+tefibQa3gbiRxAsgWNxiNBbg+IqRy8q4e
	 VqzIL7OHzSu6+dCjjNIEl4AOXTRtqcFJq6SouY5CVbg+ugV+jyoAhnT5kgYWl4ZwOs7M6
	 GkwZHiEFSsVufq9KevS59rg8bteqEKv3zZdoA45tmqIQPlaFUDjcWLf/qhRE27xB2NRfC
	 1ws8DyI+wDF5g/f/4iVcJD5U2ZBAoz7U49OxuQwVo5hx9GUc944hyYOItI5+g3lJOg7ki
	 ffhFLVfmpKnL5DyrtWLfg5HGhqv5h+thzHS04dhbbIYPdvEiycCkPC1KaOLeYsPSLbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=idXYGkC8;
	arc=none smtp.remote-ip=91.218.175.29
Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F7A606A339
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 06:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F7A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=idXYGkC8
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=43GUnkQaaKH2LIoFuLD/g5YfhAyKSZZ4BS7eLLF7nnA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795674473; v=1; x=1796279273;
 b=idXYGkC8iox+ogjgKpFy3rLTtUf/KfiQlzajImKPg4g9dx4OGiliTBe9BO9mHrLFPK7wVUlD
 8vet8yThUkv78PD8NkfG2F7leRazDQcAi91cnA/SFdYBIh20PZrQx2Y/ZTY9iaWMiy+hlaHGhBe
 R6G0kO0hwz3q53Pg3MX1x7Ys=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id fcf668d7b8c6b4c4;
	Thu, 26 Nov 2026 06:27:53 +0000
X-Mizu-Trace-ID: fcf668d7b8c6b4c4
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 26 Nov 2026 14:27:24 +0800
Subject: [PATCH net-next v5 2/5] seg6: add RFC8986 flavor support for End.X
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
Message-Id: <20261126-srv6_flavors_endx-v5-2-4d8232eec404@kylinos.cn>
References: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
In-Reply-To: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

The End.X behavior only advertises NEXT-C-SID and falls back to plain
input_action_end_x_core() for anything else, so "End.X flavors psp" is
rejected at present. RFC 8986 defines PSP for End.X as well, and
end_flv8986_core() already implements the flavor dispatch used by End.

Add SEG6_LOCAL_FLV8986_SUPP_OPS to SEG6_LOCAL_END_X_FLV_SUPP_OPS and
process flavors in input_action_end_x() the same way input_action_end()
does. With no flavor configured the behavior is unchanged.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 net/ipv6/seg6_local.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index fc651a83e4b7..6830f7d5e066 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -122,7 +122,8 @@ struct bpf_lwt_prog {
 
 #define SEG6_LOCAL_END_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
 					 SEG6_LOCAL_FLV8986_SUPP_OPS)
-#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID
+#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
+					 SEG6_LOCAL_FLV8986_SUPP_OPS)
 
 struct seg6_flavors_info {
 	/* Flavor operations */
@@ -939,7 +940,7 @@ static struct ipv6_sr_hdr *seg6_flv8986_get_srh(struct sk_buff *skb)
 }
 
 /* process the packet on the basis of the RFC8986 flavors set for the given
- * SRv6 End behavior instance.
+ * SRv6 End, End.X behavior instance.
  *
  * Returns with skb freed on failure. On success, the caller must complete
  * final processing and forward the packet.
@@ -1041,12 +1042,20 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
 	const struct seg6_flavors_info *finfo = &slwt->flv_info;
 	__u32 fops = finfo->flv_ops;
+	int ret;
+
+	if (!fops)
+		return input_action_end_x_core(skb, slwt);
 
-	/* check for the presence of NEXT-C-SID since it applies first */
-	if (seg6_next_csid_enabled(fops))
+	/* NEXT-C-SID is evaluated first, when configured */
+	if (seg6_use_next_csid(skb, finfo))
 		return end_x_next_csid_core(skb, slwt);
 
-	return input_action_end_x_core(skb, slwt);
+	ret = end_flv8986_core(skb, slwt);
+	if (ret)
+		return ret;
+
+	return input_action_end_x_finish(skb, slwt);
 }
 
 static int input_action_end_t(struct sk_buff *skb, struct seg6_local_lwt *slwt)

-- 
2.56.0

