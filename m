Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096559;
	b=kZlmS5f4C2WKG8nlMYnhTGR/rJM3GYvNyf2u6JE/NceVWa/NriopDrZPOHxh8KmjYqSb
	 jF0XAHJWfrc3JNoJgpXeiyk8ENj/mw5EPIHF0OiYqWTOWwq9juhawEG/ItSgWA0+IAnFa
	 or20pZ3nk7LrJJIWyTOboRpeuucA9F4YTphMJ5RJ+iKGqhT2gmyhyvvJVTfVwpVDGKKvG
	 6wNdSsC8kQmkEEDgfA0ok0GZNlL2yfx+BJqlh/owzYbGU3oYdjkKQkg+g5Cgbs4uxbYDM
	 EYWnhDmLE647F1CHsoS3FUvXIQ2/mOJ68KxtyDbTjFWK9LRSIxyAyZLh1I3OJqSbKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096559;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Ke3EWszLvsx+ZZ8LVnU5JSdnOIf2Smc8e3pfyBCTnMQ=;
	b=cwXfQUYWQ/opGuZcevdp1JXgFIcVljQQK3qS1b93h+YnkiYij8G8UuuxGeacxOr922Xe
	 AE0vCnQr2JuqCjSQfLknMShC/YgZ4wcVCgfNOAfpYYoZnoR+QzK8oRePoHzSEAaz1PfSi
	 o1eYQwpbdETVJVCHWJu/QyXV+PYfpjcVE53a66IFhfstxJT4w3u9k4wHtHvt3mhHMgEgJ
	 iJk1f4bTM2LSrI4vaBDNqUpMDwNzfrpnHmogT95GE0Y1ZPOllPihUGDIPgmIac9hH7dnx
	 1qUxgsW77G6iH1sNaxbPxtcGG6t0pBoohuQ21PdgDI0wPceIk4mhIdhxgpme7SlaKyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iOTfYVNM;
	arc=none smtp.remote-ip=95.215.58.111
Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F28606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F28606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iOTfYVNM
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0QrA37QX/tYLBaRrcfAU4GLVYO08vkDONNj7UJuckiU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096557; v=1; x=1795701357;
 b=iOTfYVNM2lkZRX2OlrBUPaolKTGcZSnwDprV4E4Pd5EdqZ5ORafCuBne8JR34U4ILiah69nl
 dF3+JFFH0+Y0SC+qrezJiHV/OP4mFeyZNXrLJHNO4Xn3+6gMQPrBs9tGivaQCoRLIMoVWE4Ic8i
 qi31EqBoBUvNauFQ8AfZF6zI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a3a3332d176058e0;
	Thu, 19 Nov 2026 13:55:57 +0000
X-Mizu-Trace-ID: a3a3332d176058e0
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 19 Nov 2026 21:55:18 +0800
Subject: [PATCH net-next v4 2/5] seg6: add RFC8986 flavor support for End.X
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
Message-Id: <20261119-srv6_flavors_endx-v4-2-284cdb484eee@kylinos.cn>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
In-Reply-To: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
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
index 65d552f87fa3..c827a745fe17 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -121,7 +121,8 @@ struct bpf_lwt_prog {
 
 #define SEG6_LOCAL_END_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
 					 SEG6_LOCAL_FLV8986_SUPP_OPS)
-#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID
+#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
+					 SEG6_LOCAL_FLV8986_SUPP_OPS)
 
 struct seg6_flavors_info {
 	/* Flavor operations */
@@ -884,7 +885,7 @@ static struct ipv6_sr_hdr *seg6_flv8986_get_srh(struct sk_buff *skb)
 }
 
 /* process the packet on the basis of the RFC8986 flavors set for the given
- * SRv6 End behavior instance.
+ * SRv6 End, End.X behavior instance.
  *
  * Returns with skb freed on failure. On success, the caller must complete
  * final processing and forward the packet.
@@ -986,12 +987,20 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
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

