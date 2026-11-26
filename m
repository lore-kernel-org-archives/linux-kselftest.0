Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674469;
	b=aY6g3T4Oki7TzdXKl4T4He2k2NCgE6Zk+YFmqyd8DTHhzdyP1iVJ2jyJUgPZZkgzL9OF
	 JtviieGVwA0npEqmil1HLXhjoJa/hf2JdXPBumIYtSGF5mnjKUwknTYUcwFibPGje/IJU
	 Y6D0itrADkVCnsGY1mZDqAd5yQRFmekj+iPqDU7BvJp6EQaSpw9KPfQWhDeWl1a+FLsnf
	 VLp/TxGEolusrh/ITSTwKgPbxzu/oE9t+yBR3Xj/6pBHD7iz+antAz8gnJubl29YaGFDe
	 mR3o4SyCbcpIKwog3tMrMeczsB7Bt/dTMLDSszjsXpMKuB15kK+W+zctLj8qp2mXA6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674469;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=LH9JzrmW4RjzXu1Kko7F3YJmREJ7Gsj9omJECIoSc3k=;
	b=BYX0zwpOZOQvFG2iB8LK65Yv+ikTlbZDvJ0JG/QZEct+bqwsz2+Zxj+XyNTXHGE7fXV0
	 AlWY95egIMxHtqpLBBdN7inRvcs9f8pkkYI6ag9s8H01tx+AX6+XVTZLHbgoTjYuCI3n+
	 QZY7cMY9mPc951owBr0CPbB0Vj3h7ITtxuo24hx+VyUeyrlVrEiJlk679qyt74/5j9iKZ
	 6ubVUBWYcQK4nz36uxPuY3Y3dK3dp5RJspaGoB+hIMOn6o+JUYEsFGdpGQo9tCWWiFeZj
	 9XtAnzL7NBvyzWOBOcmUBt/t8FxRVne1bNfekdavLJkxNtRN+nR9sHdUlUGhoYmP3dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZMZw1ZTr;
	arc=none smtp.remote-ip=91.218.175.24
Received: from mta0.migadu.com (out-24.mta0.migadu.com [91.218.175.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A91B606A329
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 06:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A91B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZMZw1ZTr
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y6LYYqQ95aOcNmPkhXlhNVYcp9TvyJk5v12vFfQtoeQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795674466; v=1; x=1796279266;
 b=ZMZw1ZTrh1shKPEjr3PEQfzUjj8JFPQqW+6wK9QOMjdpAisubk1VBpNLZkvh5L+9br1q+BOL
 R+vRDiYQiArqEsZskrCNELZizKK6lPsNak6ENRhiBYGWRmtwPsrvxe2eMRX4+Q/feIWMt1AQD8q
 dycbQJJBWnmwfKzJcIK9VZ5g=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 0758fd16dc76def4;
	Thu, 26 Nov 2026 06:27:46 +0000
X-Mizu-Trace-ID: 0758fd16dc76def4
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 26 Nov 2026 14:27:23 +0800
Subject: [PATCH net-next v5 1/5] seg6: split final End process out of
 flavor processing
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
Message-Id: <20261126-srv6_flavors_endx-v5-1-4d8232eec404@kylinos.cn>
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

Move the final End forwarding step out of end_flv8986_core() and return
success to the caller instead.

Currently end_flv8986_core() performs both RFC8986 flavor processing and
final End forwarding by calling input_action_end_finish(). That couples
flavor handling with the End-specific forwarding path, which makes it
unable to reuse the same flavor logic for other End variants.

Split the two steps so input_action_end() does:
  1) end_flv8986_core() for flavor processing
  2) input_action_end_finish() for final forwarding

This keeps end_flv8986_core() focused on RFC8986/PSP flavor semantics
and makes it easier to plug the same flavor core into End.X/T later.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 net/ipv6/seg6_local.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index cd93b72a0b22..fc651a83e4b7 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -940,6 +940,9 @@ static struct ipv6_sr_hdr *seg6_flv8986_get_srh(struct sk_buff *skb)
 
 /* process the packet on the basis of the RFC8986 flavors set for the given
  * SRv6 End behavior instance.
+ *
+ * Returns with skb freed on failure. On success, the caller must complete
+ * final processing and forward the packet.
  */
 static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
@@ -1000,7 +1003,7 @@ static int end_flv8986_core(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 		goto drop;
 	}
 
-	return input_action_end_finish(skb, slwt);
+	return 0;
 
 drop:
 	kfree_skb_reason(skb, reason);
@@ -1012,6 +1015,7 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 {
 	const struct seg6_flavors_info *finfo = &slwt->flv_info;
 	__u32 fops = finfo->flv_ops;
+	int ret;
 
 	if (!fops)
 		return input_action_end_core(skb, slwt);
@@ -1025,7 +1029,11 @@ static int input_action_end(struct sk_buff *skb, struct seg6_local_lwt *slwt)
 	 * information extracted from the packet, e.g. presence/absence of SRH,
 	 * Segment Left = 0, etc.
 	 */
-	return end_flv8986_core(skb, slwt);
+	ret = end_flv8986_core(skb, slwt);
+	if (ret)
+		return ret;
+
+	return input_action_end_finish(skb, slwt);
 }
 
 /* regular endpoint, and forward to specified nexthop */

-- 
2.56.0

