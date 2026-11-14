Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694539;
	b=KS2eQFpugWjC02RDpOTJoldCnwfmerJ4rxVy1NrLxJ3AvpejIH4cSm4QZELtVJWMCIws
	 hYFqoUqZee2q3bmG/jN/mkBR+m7VHVsPSwWgsB6ZNBNANWINN3ahf4MywlVPnQ5i2Mt+x
	 KjpZ0WPK8SSKTsdBWhAyQln+W3rISSFz/kBup6Fo2sJsXHIhSNHZjiYWJclMPd7SEELhg
	 4oScR/+qttA/oQFWkTw7kdmUfUzmnjnTEMSOfXJDZCDd4n6Uv9gK/lJ63qP+puYNhlujA
	 K8xGMhfrSvFYSoJ3StZI1Mt1sc+8W4Q/hT6RkOzg1nstPLIfoFKgPQjxlwRoyjemFKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
	b=LSgEOTpLbcDMxcvIekXbppxQX7xddOrDLQW0DcxrKkasLsgxj5VpXD22aR487kO36S+A
	 f4L2deBtMB8m4V+/U6gzlh4a+lKKvCmH2uX4X66fn85WvQJhEtgAiakkAYQ1FBWYmt9EZ
	 n0jdydGN2O8PYpyvgaSDDxYZMvpoPWIi7AT4KFCpKTIjk6s2+kMv2FT0RBMUl597bCY+q
	 3gScLxWQ/aPQdo9Ekti6xkbCUVq0HqrBVKdBnpoKaMiziofGLLYkIoEAFI+2iPqQM4sjN
	 ncUqo/T7/mMVaLCF2XRM/KGzjUGu/X09W7hRrXg8Q4kc/uxKRmjz3susVSwlu8POE/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/K1wA+c";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E57606A8AE
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 22:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E57606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/K1wA+c
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1693559f8f.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 14:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694537; x=1795299337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
        b=Z/K1wA+c9M8ZoVEMzAW/MJN2cc/MHNIHXgX7e6wrmviCoQnd9rkEueIEds04sClxQ6
         pNAosYQGXAollc5mcZGQ1Lc4Ej3/oOiMr0das1d+tu4z4uBDATVZcBXwugtg/Vnftjy4
         kAV6nyktK08YSlyJhMkeQPPszNU/ZZ3uClrQRV3+cfM3oPwnt5XqGKrbDaAf1SOmksIs
         nwtI2Wy5V/cH5IgbPIN3nnhZYLbRzm2x1h0eVqeWDriImmlu0RPHKCqH974ZMhBwKiW/
         i6POuGtxEKVv++durHl7+OB5+czet5fp1zIj4y9fZ1GkgQJM+0unAzycwtHGIfnbekgG
         GuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694537; x=1795299337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgxqa67AWNWEszM68EnFAp+PqjfBlLHB7oOFdRjr+ck=;
        b=COJb11db5VSmaSFV2ERRuFtMd7PqdcxFkvasj0OM4g/WZefHVFe5/S89bwbjNtrK2e
         La9UasllwSB8TQ5Ugr5bxG8hTZRzdaVsiZlRHmgB9HmQzNPJjN1iqf4sy8WQYmrkhGhu
         pz5X+RvqeECvt7PPNDn3Svmxp10xlC11MumqFDZCRUrRAvcPTXta6fiGdz57gUSGOr37
         oTpYI7Vp5bsaCA74B56B8NWwTSNYCdWO/1vNAta8WNEA23snoaEKp0LoapFsV5PHru4H
         FEzQO0dlUdDm49kkdTjO8R/e1OtrW7tXp9mzvr/cBnltsQl1fwD/Qa/iTmCQUftDMpWT
         sJ4Q==
X-Forwarded-Encrypted: i=1; AL+hErHvJTyYdcmNNFj4GpW2yy9cIzhe/5CU1fYGQH7oxiC6AodABdHubBgIev6TqDCDqfSrAu8DtihzlcGO5Mal6ps=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ozWd6tCUz2gIgFegaEftWAqJnrGOO3UHNbv6ZrRMjnsHN2ywB
	1z/GiGtEgOw20y3nGLAzLjl4lIzEIQQzs8L3967cXUVNjPtxouRAsFq4
X-Gm-Gg: AYBFou2lqdEgzRK8xZN4/AuhfpNpkQTo9/HBZzjMjWGntVHbsWu4fQqWgLM5tLjMUFZ
	xvi/V0TqtU7P7NxvAquwfoVFQsC+PJ0NIIZIUSdHf1z51Jw77AIJZjvyI3xfL93yZp5sRGfI1m7
	zM6IAysrpqXlHRPsQ9UuzhvFljJeMEe8eguS3Abfccohkal20Z1hr3WqAvof+AZP1AZA2QqkuxF
	UQSRFnqjHZyzX95aghBm8Dlym99ewZWYNhyp3an9IdGxLT0dDLwn6bOiDkViiSTBmK8mccFSitK
	kzFvq8DKkB80nMmEPzX6+IchNMRsq2aD86KOV6jaK8s63jZ8O1WFXzSZjhTS5j16s9oBokFcw3p
	MJNMnqyCDl9lXisJIoa9lXPmiqCkfRT+FiKNvsKjfZ86HkF7lDN7D8jj1D9/7y8ezXczmOPjWyJ
	6LNzEq8VqeKvNaOwb5gceYqu8Cq498wsnjjkU8w1/Mw4PqyZOi/00UMLK9eQIK6gTjHnbqk4MGt
	fhTIiXZJcCQJPA5uiZysvfBoDoFBjoNQenHyE9yP9jgyeREpFGKqNx/aBSBCyl8PW9G4bcOEE4p
	5S9fxXT/4uwqKj5J/E5Kmz4=
X-Received: by 2002:a05:6000:40dd:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-49c723fb6ebmr14182597f8f.38.1794694537395;
        Sat, 14 Nov 2026 14:15:37 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:37 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 2/8] vxlan: vnifilter: clamp the dumped VNI range to the request limit
Date: Sun, 15 Nov 2026 01:14:06 +0300
Message-ID: <20261114221412.255825-3-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_vnifilter_dump_dev() coalesces a contiguous run of VNIs sharing a
remote into one VXLAN_VNIFILTER_ENTRY, and packs as many entries into a
netlink message as the skb holds, with no bound on either. The patch
that follows, "vxlan: vnifilter: bound the number of VNIs one request
may touch", bounds a single request to VXLAN_VNI_FILTER_MSG_MAX VNIs
summed over its entries; without a matching bound on the dump, a device
holding more than that -- populated by several requests -- would dump a
run, or a message, that the input path then refuses on replay.

Introduce VXLAN_VNI_FILTER_MSG_MAX here and clamp the dump to it first, so
the series never passes through a commit where the kernel reports a range
its own input path rejects. Bound the two ways the dump can exceed the
limit:

  - end a coalesced run once it reaches the limit, in the merge condition,
    even when the next VNI is contiguous and shares the remote; and
  - carry a per-message VNI budget, ending the message once its entries
    would sum past the limit, the same way the loop already ends it when
    the skb is full.

cb->args[1] continues to count the VNI nodes already dumped and is
advanced only when a completed entry is written, so the budget break and
the skb-full break share one resume path; a run stays a gapless block,
so while the VNI set does not change between messages the dump never
drops a VNI and never emits one twice. A VNI added or deleted between
messages is flagged with NLM_F_DUMP_INTR, as before.

Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: the VXLAN_VNI_FILTER_MSG_MAX comment states what the dump does
instead of pointing at "a later patch", and the changelog names the cap
patch by subject (review of v4); the no-drop/no-repeat claim is scoped
to a VNI set that does not change between messages; one line wrapped to
80 columns. v4: moved before the input cap; now introduces
VXLAN_VNI_FILTER_MSG_MAX and adds a per-message VNI budget (v3 clamped
per entry only), so the dump never emits a message the input path
rejects.

 drivers/net/vxlan/vxlan_vnifilter.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 2b02f448c3e9..66a27198c65d 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -17,6 +17,11 @@
 
 #include "vxlan_private.h"
 
+/* The most VNIs one dumped entry, or one dumped message, carries: the dump ends
+ * a coalesced run, and a message, before either would exceed it.
+ */
+#define VXLAN_VNI_FILTER_MSG_MAX	4096
+
 static inline int vxlan_vni_cmp(struct rhashtable_compare_arg *arg,
 				const void *ptr)
 {
@@ -342,6 +347,7 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 	struct nlmsghdr *nlh;
 	int idx = 0, s_idx;
 	bool dump_stats;
+	u32 vnis = 0;
 	int err = 0;
 
 	if (cb->args[2] != dev->ifindex) {
@@ -388,15 +394,29 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 			continue;
 		}
 		if (!dump_stats && vnirange(vend, v) == 1 &&
+		    vnirange(vbegin, v) < VXLAN_VNI_FILTER_MSG_MAX &&
 		    vxlan_addr_equal(&v->remote_ip, &vend->remote_ip)) {
 			goto update_end;
 		} else {
+			u32 sz = vnirange(vbegin, vend) + 1;
+
+			/* End this message on its VNI budget the same way we
+			 * end it when the skb is full, so a dumped message
+			 * never sums to more VNIs than the input path accepts
+			 * in one request. Resume re-emits this run as the
+			 * first entry of the next message.
+			 */
+			if (vnis + sz > VXLAN_VNI_FILTER_MSG_MAX) {
+				err = -EMSGSIZE;
+				break;
+			}
 			if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend,
 							 dump_stats)) {
 				err = -EMSGSIZE;
 				break;
 			}
-			idx += vnirange(vbegin, vend) + 1;
+			vnis += sz;
+			idx += sz;
 			vbegin = v;
 		}
 update_end:
@@ -404,7 +424,11 @@ static int vxlan_vnifilter_dump_dev(const struct net_device *dev,
 	}
 
 	if (!err && vbegin) {
-		if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend, dump_stats))
+		if (vnis + vnirange(vbegin, vend) + 1 >
+		    VXLAN_VNI_FILTER_MSG_MAX)
+			err = -EMSGSIZE;
+		else if (!vxlan_fill_vni_filter_entry(skb, vbegin, vend,
+						      dump_stats))
 			err = -EMSGSIZE;
 	}
 
-- 
2.53.0

