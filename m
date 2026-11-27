Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801418;
	b=gR9sbyV35XNNRbPjCq5NSfLgFo1/Qgnu8d4avh2ktQiA7SAvGYlXC6osO3+6D9Uxwask
	 MzXPkAEZSOphd6wZqDm62w7qZhXBowrlvFGFOendPmPB+IMKy0H6xAfH+SEhrnYjARwG7
	 bhtTOQPYSVCy02GoBrAjxyH9kXs7CyNHqEH0tOVG9CdUwmr86Xsc8sH9Mcnu9q3N9OfKj
	 VZRFaFusPV8JJYu5zHKzL0+fdQtYPqXsOfa14kf1sJuBKj4s9j8jHAv7SzkPnbhtIX5/A
	 yG4KpXfsGG9uTR9/PmKgcsrLgBUVMevjN47j0ClC8dBravoQYBjSNLeBL6/P1rLlg8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yn4mQCUI5qr9PM3eIzwoaE+VdU0Efk/xEsMG5+tzYoM=;
	b=P/uwlZLCwVs4zK5WBuqJG93D9gebdrYKW5WLyG5yWhC5K99ajYdXDLEYRd953Tr7/Bpx
	 Zurw/hPdZZknTHntmAHUcGZ5edJUi9Dq0yEyd1StvPcPxy0HPJ567rAPXjphnPeYGvMMi
	 7q2YyFPb9N8qOFfvtqCTOdD6n7NqCwX0Mr6fFPA0uu/O7KvDKkshTZBQ9EyysLV/dakwi
	 OukSZyVjgGqSnfAiZPq1oIeW24gyw8d7fQuEOkc108XhPukKBzuBk3EzAVidaAh1L05bP
	 klU4TpQoZ7DxtBR0JpZFRiX/IPUB3WwCAyTOevDuvVfgdJeoxXYFGWVapBSqxyymcuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yD/vlBQ0";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F0606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 17:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6F0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yD/vlBQ0
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3866a784546so11489724eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801417; x=1796406217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yn4mQCUI5qr9PM3eIzwoaE+VdU0Efk/xEsMG5+tzYoM=;
        b=yD/vlBQ0bSHWfZ6ahtyvR/XJp8HHCa8YshGy//t0bcHFZ8MwYwZc6MluylDU2V7kxo
         hWgFJeBXIa0tYtW7F1uK9mykgeBnoZgFf4rvdxyuUUB6LLZ3Zdg4ArCltypWBbQEsB/G
         nx+xXTr/d9gPfHuu4BPZTxx6Aqykmw7eRNFCpRLz+e2rjN/C1LgTXyHr/imIBLYDH1kY
         vkLTmD/8oRpZgmFA1+BN5S84qjj0Y6vWi2A2/XUBwOycV2S2Au4+jgoVC1nYH2gEmR7Q
         i8GYB/xVgonm9ECR8hOaZF3vygjxG41ukFrrn018EK2Z0JTrvOol6IeMLTNLkQlyfftD
         MJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801417; x=1796406217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yn4mQCUI5qr9PM3eIzwoaE+VdU0Efk/xEsMG5+tzYoM=;
        b=fTP1BmOZK8KY72kMeB+StoitntEvu42IvVRx4TGPReQ57sJKhntn8WnHNbKtV6H/hZ
         KX/vcW44W8axSx3bLGpQO8+YGEUPdmwfne6DZiduUt8Xaa72NW0DNYlGO2r0CTfMOxL2
         yRo1eQLR7lQZZCl4OoMWrmwBZ73thsE0PPZHrMjP5eDskh1PcoVaF9lQR5CvHdEZOOuN
         fBKcA3Fh22w72Un+vi5Nrg3dJv0kwX1HzEJOCeBkqr7ARt99Sy9nshwO8X9YIOimp5HL
         AOE8KBMNXl6O6Px1rOAZX7lyzxWMV2J8RBOeWTIQq3M9NZswJc4t0w+4UfK6zNmSji4s
         TEmA==
X-Forwarded-Encrypted: i=1; AL+hErEOj1mDWB+AWGGC9onp9MoiTYaiFFDipFkuKGzG4xlvWRj+rNnlHLgx8Sef2b5TPZIewzZRJTUZWKaCP277jus=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qCf6KbIzhu8s6yhrHPb4olSG63Hm0eWrAYp4iUoF5RKFKvNxm
	hX/u49SYxWuyzI9WeMnuconv9lmnN3A8+Tan5wtNPNof+Ffzl1OdcWbs
X-Gm-Gg: AZFdTZfhzgZqK4wwd1FNTmGz+x357nGeyThF0HYzKZFLvRZCyyhGbsJ+eclMSFj6Bsw
	Q71uEbWUvKnydoRp53OE8tDSi14hlWLHczy4oWnx6+D4Gsz+VeR/ySgRK1KYMLzTgyQCMg4EAlB
	jIIrsAZhozHFC+sFpKoKZNVdflE0SxgCT41NxZSG/6AVZZfH+4JfZdFFrclJd1rOyqefVvtrz86
	GSntzVJULtdqYIQdE/mZw9aeY3Ugui6Z4fgYOoC71JJU6JN9CZI3sDy1h4A8uJP/pvmsO1XXHK9
	Md59NiA1VgvjpV+dWr6AxYOy8adCBp/cDH2n6iWFH8KajsxP3PB+jH9yl097w+OXFKuTd99io9k
	Fy7qHS3q9+Bh9rRdGz7qzGMzVrPp9VV50kO+TuPtLZ9ienKiOSczYQbdgjjb6+kPTmab51D1vkU
	rVfHFIaPMBJS4Se+pJndzfnlOjB3a20/1jP1nRm8j7rR7MRlcqgQ8P6zmjejydu0LoDbS9/of+A
	7SA1efuq6l+QXAf5yh8YrvLnQW3JJW/sbYWkmzoL07GoTJ35ZS6ecmNJFCcdpyAfXXOuaJXEAiv
	jrC5loQizntJ51aUpMGgxrr1uw9qTrBxxtCkM/l5D5IpcGnBVc1oMbu6hsxvyuOD03nyugQYlsZ
	wuArq
X-Received: by 2002:a05:7301:787:b0:386:c6f9:b56d with SMTP id 5a478bee46e88-386c6f9b68cmr10335129eec.16.1795801416638;
        Fri, 27 Nov 2026 09:43:36 -0800 (PST)
Received: from houminxi ([61.170.160.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm66064276eec.8.2026.11.27.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:43:35 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@kernel.org,
	horms@kernel.org,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kselftest@vger.kernel.org,
	matttbe@kernel.org,
	netdev-bot+sashiko@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	stable@vger.kernel.org,
	willemb@google.com
Subject: [PATCH net v7 1/3] net: openvswitch: read the datapath features once when sending an upcall
Date: Fri, 27 Nov 2026 12:43:13 -0500
Message-ID: <20261127173039.ovs-features-v7-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
References: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
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

queue_userspace_packet() decides from OVS_DP_F_UNALIGNED whether to copy
the packet with skb_zerocopy(), and pad_packet() reads the same field
again after the copy. A concurrent OVS_DP_CMD_SET can clear the bit
between the two reads, so the copy leaves a nonlinear skb and the padding
calls skb_put_zero() on it. skb_put() asserts that the skb is linear, so
the kernel oopses, and a host built with panic_on_oops goes down.

OVS_DP_CMD_SET needs CAP_NET_ADMIN, which a user namespace that owns a
network namespace provides, so the window is reachable without
privileges on the host.

Read the field once and pass that value to pad_packet().

Fixes: aea0bb4f8ee5 ("openvswitch: Pad OVS_PACKET_ATTR_PACKET if linear copy was performed")
Cc: stable@vger.kernel.org
Signed-off-by: Minxi Hou <houminxi@gmail.com>
---

v7: the comment now says which decision it guards. The code below it picks
hlen, the number of bytes skb_zerocopy() copies into the linear part, and
never chooses head room. Sashiko pointed that out.

 net/openvswitch/datapath.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index b2a0b09fd4a5..8124b298c75f 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -439,9 +439,9 @@ static size_t upcall_msg_size(const struct dp_upcall_info *upcall_info,
 	return size;
 }
 
-static void pad_packet(struct datapath *dp, struct sk_buff *skb)
+static void pad_packet(struct sk_buff *skb, u32 features)
 {
-	if (!(dp->user_features & OVS_DP_F_UNALIGNED)) {
+	if (!(features & OVS_DP_F_UNALIGNED)) {
 		size_t plen = NLA_ALIGN(skb->len) - skb->len;
 
 		if (plen > 0)
@@ -461,6 +461,7 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 	size_t msg_size;
 	size_t skb_len;
 	unsigned int hlen;
+	u32 features;
 	int err, dp_ifindex;
 	u64 hash;
 
@@ -494,11 +495,18 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 	    (err = skb_csum_hwoffload_help(skb, 0)))
 		goto out;
 
+	/* A concurrent change to the features can land between the linear copy
+	 * length (hlen) below and the padding after the copy, which would pad a
+	 * nonlinear skb and trip SKB_LINEAR_ASSERT. Read the field once and use
+	 * that value for both.
+	 */
+	features = READ_ONCE(dp->user_features);
+
 	/* Older versions of OVS user space enforce alignment of the last
 	 * Netlink attribute to NLA_ALIGNTO which would require extensive
 	 * padding logic. Only perform zerocopy if padding is not required.
 	 */
-	if (dp->user_features & OVS_DP_F_UNALIGNED)
+	if (features & OVS_DP_F_UNALIGNED)
 		hlen = min(skb_zerocopy_headlen(skb), cutlen);
 	else
 		hlen = skb_len;
@@ -598,7 +606,7 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 		goto out;
 
 	/* Pad OVS_PACKET_ATTR_PACKET if linear copy was performed */
-	pad_packet(dp, user_skb);
+	pad_packet(user_skb, features);
 
 	((struct nlmsghdr *) user_skb->data)->nlmsg_len = user_skb->len;
 
-- 
2.56.1

