Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346658;
	b=z3/hJo5SINUsbSlXn4dsYwNb9/C5c1lLcHy+F7xUmz3B6n4Y5SF/BeWhpWiTbTYLhErN
	 So1TDsahn5o+xVqfaG6ZK1dxVt2SWBJH9Zr750NCVm+vxHSE9ApzFlKlVafR8e10B/jk7
	 ItilOIouFsDufn+PXh0vpEegSpISAEJSCniP9ovpIIhFgc5ijZBdC1vhLi6P9uzMtOyjl
	 ii9Dv/L20YaL4Q5ekm5lctu76wsp2RYv+wIim2B+9ddSnD01w3lE0ukz+W92wuObqtrHS
	 lC1D1037PXDWQSwcDCDvJvfIkHborue0gxd0cpVmV8B30AHHIY+RncHDFb9uEAn5CDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346658;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=HmnyzYI4NC7FFEJlhvkQV3ziJo06MpzXwTxFzxPsWpg=;
	b=XOVwiPDDcM5p3+IXnlbsUOmrlHyCfsZ2+vUFjbj/GyklBh3Vb5MUSHVnIzTQw4wxlJAx
	 VWUc6FIJH3AOvp4dA8tqJkL+iEbUrZervtn+RdgGB8NvvrUcbJS5WxVJG8azZzM4VwpVb
	 9gLmazmgWXWT3iuUeu7Yy4CI1Qvhvp2Kmw97si9Mq9We+O5b6DC0td7tin93vHHKtRlH8
	 tCMsbQn+5Jbef0+2KNHFJfOkA7Kl0HdbDg4JDeqX1Wy7WZFt+XGbUseWpzEPVLWrvnMEg
	 /0lD5+fAH/plvHMJRp7EjP9EZ8Ir+s5lu+mRmPmSp1JRVjIZQBwCEDOHh1c9q67HC1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.com;
	spf=pass smtp.mailfrom=fastmail.com;
	dkim=pass header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=VZVHJDV6;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="xqNs3/9z";
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844FE60A2612
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 21:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 844FE60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=VZVHJDV6;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=xqNs3/9z
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id EDF771D0018A
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:37:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 10 Nov 2026 16:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1794346656;
	 x=1794433056; bh=HmnyzYI4NC7FFEJlhvkQV3ziJo06MpzXwTxFzxPsWpg=; b=
	VZVHJDV6sFaogEbrQ0R48VF4Lfjf5IZV3Juxu0ngsCzQF7PF1lVHcHN1UFaJy+RJ
	U0G/rhSRAsFkZS674956DHrVML5Eczv9uPDkVmLX5qWsEyi8GROFquuOeV26yMY0
	bsel24WouQaX+v7BSzN9CBIXm1frXB5fXm/+tS1FB9OP/m3DP3n9t98NzFzxe52S
	R2/+nlCAyCBRkYBMyDKL5QxKuPHC1cXD/xUULryyPOXv2AjdAC5An5IoVQBOh8aZ
	YplHjTlZdGne2k66cCCrAhbTIxypOVDhfTUg/QLcUS6rJoVwvWacHOIDr40T7o1X
	NV6MI0KISBU/U//40KNlcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794346656; x=
	1794433056; bh=HmnyzYI4NC7FFEJlhvkQV3ziJo06MpzXwTxFzxPsWpg=; b=x
	qNs3/9zSYlaONKaZq3VPU9UBqKoMiGAQAXQmI1apCu/2OiaY3E4ZBhuDDD8/4VKU
	9BzzSDoixrFKmQRkCGte0AcsKE4zbnR+lJuCGwRmbhSLXlYMI8RQrWWpQGr5R+9F
	2dpQDy0iL1YrJm0+xQw/cGnM6rCxfB4azfFZq5AfZYuyzKRLkghItFywHlKN7l1W
	LEG4Jng+LQb9hQRuN7ffEpSRuogkJTeScxTkBHcxGDfFpSUdrM5uylJui5OScESu
	ntmbm6RU1p6QGXibwycMFz0PvgnOnFncZpU2whPBRAPOdU6aVmKPUMBiGoJmHmCk
	1H/fnk7gLP7dbpPtVDv4g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794346656; d=fastmail.com;
	mf=PGp1YW5sdUBmYXN0bWFpbC5jb20+;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:PJEVhiA2djtkI4v3p7T/40xW7oB0lUgOjYjGCnCD6+OSeZp
	ho7vfofHIoWCE3Te5UMYCXy9XPWrMv/wAbx4Y3iaFsOGPwo6d+Bsh2XcPpwmmw6G
	KkNCr7rIsh3Y4Bb1tFg45S0Kmb3PxMJ2C7xa/cO5DWcdeMVHhiDlhpMFkDIkxUIK
	SIO461FiCAiVtWiA19Qi8IfmRZdwTHt6MVGnTt6ol5bYutrY3DH5v0vd4xs1cBm0
	q9XceRJG4jYQc57Opy4gw9lUtHwNSQmMWravpt6nzkv2o//a1O8TqFeMF4Pz7j+A
	81M/ibsaMft551myG4d9823wFhMdVGL6EaMTDyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:gW1DG81GwxOQdnOH24p38FLucUvQt83aQUTbPfczDuk=:f/GcBJZKLTIZ8eHBpQDVVCkyZSX10Wt04zDVixkF2Gc=;
X-ME-Sender: <xms:oI7zat70OulmdVU62ktlHyNt5GAMp9na03JkPFXOij1wAQKm364nsA>
    <xme:oI7zaumphyQuHsNRQl2vHzxG_lHzGXn6N6vcQ1AqeDKO7Rv4vYjWhV82mN66AQi-V
    EVnPqK-ZhgDTbkp6HgmEQSalY2LZvgP4tREo7hqe9TbUIG9W1tUB6z3>
X-ME-Received: <xmr:oI7zatH7reireYxj0kfoObXjzOGL3sS0AUa9gHXBm-HY054hJDijOT5JLcvIjr86Jure62LSFLjqa0NgAw8>
X-ME-Proxy-Cause: dmFkZTGNVXlGWE+7P2XXaL26F5AMGtpK2TycDVlf+xOjA+PYERZl6/BW+lbT0+wzTsbcnL
    kBAhJvg1txFwRjOcd7bw7X+tErVQLKyqfU9/T4BbMHT193EbxKvHyY8bAQ6ww6NmZWX2Gj
    S4oVvhJFMJ2BxkJuVf9ujSPSfv16nLGp7k9bwFNTR8UP/etY4ewbE2QpklWLWUkhZbd3tk
    i2NFMM50EyvyBj3i7bkefkHzaAGSTWPc9b/2WlAEfIPv9QAFyLDidETcJqU8/KdZSLuzWm
    YnikjaxRN8sYTqzmqmhrte8FXDDjJZwMnUc/kh6WLuGF7iefMNEW49vFlHrDG5ZIu0qxeh
    4kwaVDCtUT1CaM3RYhJmWG/D1XjLCRHErbsgfIdM39qycKFGQ2tTwPGC3ck7HTTMLF7k2V
    EV78uyTh1Ruu3uXN2sOf4yDSz3Y6/UyEMkdWt57IySF7aHGG7ssdvme2hlJjYtzgWoyNIf
    oahXqBzQNpUhN9aps/IGi+mlUvjkDz8XPyM53CxgiVJHZyWkporo+cZaph/QD8EieDNLN2
    BNp7OYWGZBLlnU/4Iq0oM2U8lyoh/5f3ueJvi/HyE8b0ZuUOCP+z6GcU69gPvV1/t20nl+
    hsPDQqN1Q49QpVe0kfdIxvQfZiooWqzReQ5tj1W2Xg4KDp/RhhoqGakArtSw
X-ME-Proxy: <xmx:oI7zanhFfvVE47gYQpin6yRvxCv8GOLdBbpPSSh-VsVKHesW9tab7g>
    <xmx:oI7zaijsNzOEAPT8OmP27I6BWr4ekVaXj5vHqp6HIMGvfe4WP3T3NA>
    <xmx:oI7zaim8-Q8B51V5ZonLAI2lBzpy8qsI56Y_-Lq4lCOP7Q3uwbDvQg>
    <xmx:oI7zauaGqRIyxXAPh84XhqrM7MBnZ3j5_lBF34tNolP6lKoI3vAiEg>
    <xmx:oI7zatTYQpmnW_O3FVAZwfwJH9iGtWym4YML80W7DP1HApoiV0GffpFl>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 16:37:36 -0500 (EST)
From: Juanlu Herrero <juanlu@fastmail.com>
Date: Tue, 10 Nov 2026 13:36:48 -0800
Subject: [PATCH 2/3] dma-debug: skip irrelevant buckets for partial syncs
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
Message-Id: <20261110-zcrx-dma-debug-registration-v1-2-48743ea61631@fastmail.com>
References: <20261110-zcrx-dma-debug-registration-v1-0-48743ea61631@fastmail.com>
In-Reply-To: <20261110-zcrx-dma-debug-registration-v1-0-48743ea61631@fastmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 Juanlu Herrero <juanlu@fastmail.com>
X-Mailer: b4 0.13.0

Partial syncs may start after a mapping's first hash bucket. Finding the
mapping then requires locking earlier buckets.

Keep a conservative size bound per bucket and skip those that cannot
span the sync range. Raise the bound on insertion and reset it when the
bucket empties. Stale larger bounds only add searches, so removal needs
no list rescan to update the bound.

This relies on ordered map publication before sync and unmapping after
sync. The bucket lock carries earlier bound updates through later
insertions even when the bound is unchanged.

Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
 kernel/dma/debug.c | 49 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 4cb5f86a7228a..8dad45d0a4360 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -90,6 +90,8 @@ typedef bool (*match_fn)(struct dma_debug_entry *, struct dma_debug_entry *);
 struct hash_bucket {
 	struct list_head list;
 	spinlock_t lock;
+	/* Upper bound on live mapping sizes; reset when the bucket empties. */
+	unsigned long max_entry_size;
 };
 
 /* Hash list to save the allocated dma addresses */
@@ -354,27 +356,49 @@ static struct dma_debug_entry *bucket_find_contain(struct hash_bucket **bucket,
 						   struct dma_debug_entry *ref,
 						   unsigned long *flags)
 {
-
 	struct dma_debug_entry *entry, index = *ref;
+	u64 min_offset = (index.dev_addr & ((1ULL << HASH_FN_SHIFT) - 1)) + 1;
 	int limit = min(HASH_SIZE, (index.dev_addr >> HASH_FN_SHIFT) + 1);
 
-	for (int i = 0; i < limit; i++) {
+	entry = __hash_bucket_find(*bucket, ref, containing_match);
+	if (entry)
+		return entry;
+	put_hash_bucket(*bucket, *flags);
+
+	for (int i = 1; i < limit; i++) {
+		unsigned long max_entry_size;
+
+		index.dev_addr -= (1 << HASH_FN_SHIFT);
+		*bucket = &dma_entry_hash[hash_fn(&index)];
+		/*
+		 * Writers serialize updates with the bucket lock. For any entry
+		 * that can validly match this sync, publishing the mapping is
+		 * ordered before the sync, including a cross-CPU handoff, and
+		 * unmapping is ordered after it. The bound only grows while the
+		 * bucket is nonempty, so it cannot become smaller than a live
+		 * entry. Removing an unrelated mapping may leave a larger bound,
+		 * which only causes an unnecessary search.
+		 */
+		max_entry_size = READ_ONCE((*bucket)->max_entry_size);
+		/* The mapping must span the distance back to this bucket. */
+		if (max_entry_size < ref->size ||
+		    max_entry_size - ref->size < min_offset)
+			goto next;
+
+		*bucket = get_hash_bucket(&index, flags);
 		entry = __hash_bucket_find(*bucket, ref, containing_match);
 
 		if (entry)
 			return entry;
 
-		/*
-		 * Nothing found, go back a hash bucket
-		 */
 		put_hash_bucket(*bucket, *flags);
-		index.dev_addr -= (1 << HASH_FN_SHIFT);
-		*bucket = get_hash_bucket(&index, flags);
+next:
+		min_offset += 1ULL << HASH_FN_SHIFT;
 	}
 
+	*bucket = get_hash_bucket(ref, flags);
 	return NULL;
 }
-
 /*
  * Add an entry to a hash bucket
  */
@@ -382,14 +406,19 @@ static void hash_bucket_add(struct hash_bucket *bucket,
 			    struct dma_debug_entry *entry)
 {
 	list_add_tail(&entry->list, &bucket->list);
+	if (entry->size > bucket->max_entry_size)
+		WRITE_ONCE(bucket->max_entry_size, entry->size);
 }
 
 /*
  * Remove entry from a hash bucket list
  */
-static void hash_bucket_del(struct dma_debug_entry *entry)
+static void hash_bucket_del(struct hash_bucket *bucket,
+			    struct dma_debug_entry *entry)
 {
 	list_del(&entry->list);
+	if (list_empty(&bucket->list))
+		WRITE_ONCE(bucket->max_entry_size, 0);
 }
 
 /*
@@ -1100,7 +1129,7 @@ static void check_unmap(struct dma_debug_entry *ref)
 	}
 #undef DMA_ATTR_UNMAP_VALID
 
-	hash_bucket_del(entry);
+	hash_bucket_del(bucket, entry);
 	put_hash_bucket(bucket, flags);
 
 	/*

-- 
2.53.0-Meta

