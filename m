Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD8A54855C;
	Tue,  8 Sep 2026 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871911; cv=none; b=NaWiABFDmzLktPbqrdSq4VGP4yxhZdW7Sp78KKih1tm4BcOyAqodF/ECgXWygH3+QmSbNVEE3xsL9CwCMgAz5eGNCyu5gv0t7P4sMMD2695Sa4PD57ZcPPk5go+W0AAROTZsTPxmQipYPM0WtIgVk4kydkuaX45DwYniUIrJI0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871911; c=relaxed/simple;
	bh=39Tc4T1jupVzAGe/wLAq9MZxJhYbNM++W9GWD2jQZB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lA2wypFjgapd+gzmyb7YPCxBTe788fjHFsJ/msYbWZIOI7dZuCD7WzG2E2Dvd3nDme+JXLRWAy8ZGOI4Lx3ZjKwymeH069h2Xw7d99PclAr9aQyMlKvyZUpgnU13cfNpM3/7WQ5HkaAIo2CwNbBH1y9Ey6RIxuZLvMpOXZWgMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=bQphX6R+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EHwFmNFF; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="bQphX6R+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EHwFmNFF"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4FF6E1400085;
	Tue,  8 Sep 2026 08:51:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 08 Sep 2026 08:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871908; x=
	1788958308; bh=QevT0gNhfb1/e5iwBM5FqG6u8eP9u0h4aKjgatgr0cQ=; b=b
	QphX6R+M0Nl+OyVvVdyGjVLXLG112HY5Fl1BjawRor878tYdDWUlossI0SWTjzud
	XtJtxcR03TgHGZuElnqr5kTmeEznm9csEzqtVzkp4TIR1YLJ1SgOzaPkycM5ZeZ7
	vqnHzEioqwJXmGIcNmAP+WtijNA3lQND/XNGePw6siV6Z1DbQBEltcl9IrjeEUT7
	xXxg8aEvx0TL7krBtd/X8mnoAynKOZrOzFeWy83o68SyYq/ypdUN8FQojM0l8STE
	KL93L9ogzWanCvCMGFTIqHSxeR7KcEw2VTfcadx6ASduSRyXETS/mtiHzB84mUB6
	TTyGyCXDKcPPEUSHLSYjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871908; x=1788958308; bh=Q
	evT0gNhfb1/e5iwBM5FqG6u8eP9u0h4aKjgatgr0cQ=; b=EHwFmNFFc/J5szbyr
	RwsXb0/sjKy1cgj3rGxFu8Q67pP8gJv0NyBl1AhEvNcfmUUiAABpPKhvYSRbw7vT
	8X5rZOO1fKTt9wDUvpD0nE4//SqfJ45Bsxtjk6nGJe/LEs7lK2Jv+KHxziBC4Rjn
	xTtwrzw8N1/gptNoNjJXon2kmgmUvWN90ZT6GyLKL1zhWqCXOtAU8mW8hbitfPUY
	YFq2DuX0IPtetir0fMysbCz232FHQgqTDplKUb1+0ykOnBsIyZLPmjgTQb4dv0F6
	UQNJWqs23tIAK+4dr/b6pXhxwkL0C9B/4veIc0yrx9893MaBG/kJuHPMCXbK66kh
	eKVqA==
X-ME-Sender: <xms:5ASganvwKO0KsBJ2NHIa8kCS53Nd4vp6wTa4BHHGti_u-dlQgCKwJw>
    <xme:5ASgag1_JYj4NiMDgFV2IFoJ3Zb_y8j0fsxzZxlYpYwxFIZK572aajLLRUAQOdUvx
    cexcumBBFFY8cEl5g3hvOs5FagIj9e_Uo0ioR6349QSHTIGqnm6C3Ih>
X-ME-Received: <xmr:5ASgas8e3TjI_p7q_N9S3l5kvCFKvK18-kpOd_N2VbLrPQGBWofELEPvIJo>
X-ME-Proxy-Cause: dmFkZTGRBbZq0PN6yNJcYWtVb23sO8hvfZDBWhDTIpZzW37zIX45AJS+7LON/4Xm/DsuP7
    98LWMNJ9EQApZevpiXRG4PtECFkYBq07HNHsbmmFqFvZsINLtRU27hF4Ez1zSV0tXKAKqs
    C6bKKyV7OM1sgQly7c8SX5vF/8ip2pY5lZQKXrVVPjM3l0q2o1FDhYukoyJ8Tn4JDDE8g4
    UFy6VPwfY2dP93OAetWkyJVBUK9bZ6BB4d8UPJ6t2OdyQWriXopGbxrEAGUlJNHM3pyOqc
    Zu1M4nLcOUMvR6qUcWJFuCnVGbGfObbOdENALiH6zrKToG6Pox9htLH3ZXrBYcmcnQ2gmV
    eLg2HMCEwaDQFvR7ao6VTgYGmzSfgxO+jmZweEamOLo17pvBTzTIP6vKjHGwRqfnOtMgSN
    GA7w5TbaTBipdGpzsw2y0cPuM27YNmA69kS36BwfG7mz28Po2qxCfKKwXn1vOqv9TQ3s6S
    cLEpNqa7wjaC6juDm3m9KDm1uN/OP74TUJAKKi+e6S2Ro1ho8fNmUd+ik7cPlgzAqD2bMz
    ST+La5nk6Bxgc0AcuxcCtLtHsQu0x0UP5aqhXZhV6gCnZ3nXgbcT/d5gaa9i2IuYxvBZ84
    nrSIkEkdAzC/kyYUIPPozN3LiSlcLcftIakPXmV+6+AFUiaZqEXCnWQ6SDxw
X-ME-Proxy: <xmx:5ASgauBJBrrP3AyCHqj-ztMzFeu46VZeKXSwoNFMg15A6zHFULotMg>
    <xmx:5ASgaqAdXn8x1U-6NXtOeM8ab-T0rFinRTcBw0wjIZ7g6SapKgNLvQ>
    <xmx:5ASgamK8Px2xAVS1UKHLUm8wbwh_CSVNpp8XfTVcINCZBC_KRlMUMA>
    <xmx:5ASgasTrrAFIA36FulaVT5inaRrdXtQk6zazZBW2F2IkuBhWWYbptg>
    <xmx:5ASgaojLykoUvw7Gog61D1v4z8QkYGSdALJHulII5Ff9P905UuudS_hL>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:47 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	rppt@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	usama.anjum@arm.com,
	usama.arif@linux.dev,
	baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev,
	ziy@nvidia.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	agordeev@linux.ibm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	kernel-team@meta.com,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v5 19/19] selftests/mm: zap whole PTE tables in the khugepaged race harness
Date: Tue,  8 Sep 2026 13:51:05 +0100
Message-ID: <20260908125105.1510704-20-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908125105.1510704-1-kirill@shutemov.name>
References: <20260908125105.1510704-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The harness's MADV_DONTNEED thread zaps 1 to 32 pages at a time, never a
whole PMD-aligned area, and only a zap that covers a full table frees the
table itself (CONFIG_PT_RECLAIM).

Make the thread zap a whole PMD-aligned area about one iteration in 64,
and keep the fine-grained zaps as the common case.  The new case frees
page tables, racing that against a collapse walking the same table.

Assisted-by: LLM
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index 1f4aa23834db..c3478b5123e2 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -118,8 +118,21 @@ static void *dontneed_fn(void *arg)
 		unsigned long page_idx = rand_page(&seed);
 		unsigned long nr = 1UL << (rand_r(&seed) % 6);	/* 1..32 pages */
 
-		madvise(region + page_idx * page_size,
-			room_from(page_idx, nr) * page_size, MADV_DONTNEED);
+		/*
+		 * Now and then zap a whole PMD-aligned area: only a zap that
+		 * covers the full table frees the table itself (CONFIG_PT_RECLAIM).
+		 */
+		if (!(rand_r(&seed) % 64)) {
+			unsigned long area = page_idx /
+					(hpage_pmd_size / page_size);
+
+			madvise(region + area * hpage_pmd_size,
+				hpage_pmd_size, MADV_DONTNEED);
+		} else {
+			madvise(region + page_idx * page_size,
+				room_from(page_idx, nr) * page_size,
+				MADV_DONTNEED);
+		}
 		usleep(rand_r(&seed) % 500);
 	}
 	return NULL;
-- 
2.54.0

