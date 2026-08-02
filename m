Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05434DB74;
	Sun,  2 Aug 2026 19:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785700410; cv=none; b=jSas9dcEGpSbCJWX5bGJbU6NgaEyj3d7a6+k4r8Q81r0laupGltQUNrNgVllyCVE5C944/1B232yB8UdEaFkp51/gDsCq6/+RE+7a8GzRQS/ZHQ0RSyj/xY/05GA7u0CeaUJ5z2FU3dz4aYDdQMaSCPqtzHKvxbpVabWU/TPIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785700410; c=relaxed/simple;
	bh=TdqOYszDCN/y4qNxCAGzohdTUPV2FSK1kiUwmYTHmsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EdtB2W4377ai5Rl1wMCOtiwsnRsQRgYovGFDfanP/BXgbDFFXFl/0+Zwwx32hSxnHK3AMcIQTvR7RH51dKV6h205xZvNEtiL6Uj3roDHJWZNJcOk2JLBUn/feC139pVHsX7o3wsE4FzCWcZ5HQCP38A4DLyOG94sVPGSbHG5k+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Pwt1XfR9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IIyIrBG7; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Pwt1XfR9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IIyIrBG7"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DEB671400051;
	Sun,  2 Aug 2026 15:53:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 02 Aug 2026 15:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1785700407; x=1785786807; bh=a2Jw/mn+UfsKcDTO+dGnQEf7SQYHheMb
	TSYp9dOdyHA=; b=Pwt1XfR927N4rs7e9ppzMF0mFPF2QC616AAkWDcjo0sXt7if
	eKQZhjKtcPkPgiG69y9DcADkO3G9/XQR9R0VP8+asAV7NASoH0mtJAGWcYfP/R7n
	beOQc+1Uy0063uWVRWqSTgCitYzQoY691uQoLlFHvzDqdJebW2aJ2ei7Rhi4N17u
	dUTEEZrdOZWz0yPW/zO5UbSTvYVcupLCZwbOzq89jz0j9K/YkuNRbBznkqOQMCX+
	a5X3pZFlalVUcbRyvQyyZlELIgg/3K/iKVqqlPQExqItOY+z9Quyp4xKXcCGZpF5
	1WTQPY55OflfiMKGeBbxo2SPj9tak+qmqmBGng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785700407; x=
	1785786807; bh=a2Jw/mn+UfsKcDTO+dGnQEf7SQYHheMbTSYp9dOdyHA=; b=I
	IyIrBG7CPap1NwdJClTpvaxTmQKXxZxFUysfUkBFxrKXhz4QmgmhuW+Puo7b9rO9
	tFfZPSK9DNXc01kkdI6h9ls1YkcxSj4tAc03YPqci8BQ5egrHIz4xXh7+2cJcREj
	wrrnL3ztiRGSHasUvo3gU1qVykspwb41YIICfxEmTsiXhGpvqIQzQeujIHc6MbC2
	Ya2HFFs/TO8omJqOLZCZK7+FS+5SFL/oGQAE/5ZbMLjaP6CinPl18Sb5aCGZpT3K
	Ke4Si89gt3rsvUTV0l7Ci63mKZ9CmIxfjSi37r3EVVPxYIlnTyWsMtCl4bFbj/f0
	EJ2Q5u48bSdHI680JjfXg==
X-ME-Sender: <xms:N6BvahUhGeuYZ0711oAZ_Gzhs-uUg478G-UNtU64eAXrkg60Uam7cg>
    <xme:N6BvasGbgw0X2LSS5tz1m5FXeNKL8sTvvCU0H0rh4vimvQ663BUpcxLqIJMbLS-Y0
    6iLVwOjjnKZuldgaAncga8g-vKRomQQ77yu6lIv8x5JhnvnxDMJSDo>
X-ME-Received: <xmr:N6BvaqVUCjk-ppRiuoTfg1iDjrg2FDD2SrUSXR8_n-JL2aF69v8OJHGRQ3M>
X-ME-Proxy-Cause: dmFkZTF0jcSSKFGDg2KrIu5c43P4SsiipwcvDQBe+CHxos2n8PFgvSXAdv5YVW583HVAOz
    W5evq6qe09LpHqloXNM1K7VWF721j2bpam5IryqVMcYz9qouNwbpBEKv3Y5gifbeJAqW/Q
    YZQrbB51yLEk86mWZaGZ1Drq0Xy949i11wvFP7mkSWE3f4+XiyFqs+bTi+V6AVpUjNMMFr
    yeY2fCKzWlrX4GavSe/JRyGqxABGArlOuRBA0IP4mMA1yNK8fSDYGTdjzDrtr8AjwNqVIi
    3BcHDiClTVSc/WD5f6J8XCsMYF+6dE+0Mr4gWnl6eMmh6FUU5GqCPEjsceh07AxGuRDdh+
    EfRV12s7ikyQpMRWBYerSeFU2WBXxwmZE2LSsp5hy0hwP/rtpbErwtxuMvwEAS95+EE44V
    wr/cr8b/Uj/n7txdJMzlDjK2GRMySkFpK+xQTR6kTq9FyioT1d0lGAzRCmwklzvYIFPHue
    b/sz8gYxpIjRubmuFCDvAt3N5F676Rjh6sI5Q1NCHcULkgi970rianfQBc4MP7/ZcNd0as
    ZiYLbRwIgFAwoUdb+2NjIHD1mIkQXuYKVl7Hr0jZj6jOVzy/N1jN24aUOJuJjOLsxIVqMq
    Oz4v4aokkX+9Og1Ez1qdRHcAVRF97BiFz3KosqyvJRDcMOSxgWigX64K07sA
X-ME-Proxy: <xmx:N6BvanAP-8paNO_ewjpIydZkMjYcfBsBbXQoQHvRaR_VTSdI5i0lPA>
    <xmx:N6Bvaj12wix-oBeOaW8Ma_MGMDW1wIYp0ylPkCBIZsyFBupY_3QYww>
    <xmx:N6BvavR8e8GmcI_M1336EuK7BJRpb26NtSgJFO2clNPUpggV4GPf8A>
    <xmx:N6BvaobkfhT0quS9diYMdO6c38L88t8D8X2FiTwTKVVWU_gM8g0oLg>
    <xmx:N6BvaiwLgSwxHSaZf4y4mbUXY4VCcuRQx0mRiinuZEsY0dNXo5dF5pZu>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 15:53:27 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nico Pache <nico.pache@linux.dev>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 14/16] selftests/mm: zap whole PTE tables in the khugepaged race harness
Date: Sun,  2 Aug 2026 20:52:46 +0100
Message-ID: <20260802195254.1937477-15-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802195254.1937477-1-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The race harness's MADV_DONTNEED thread zaps 1..32 pages at a time —
never a whole PMD-aligned area, so the empty-table reclaim
(CONFIG_PT_RECLAIM), which only engages when a zap spans the full
table, never ran against a collapse in any soak. Fuzzing had to find
the resulting class instead: the table vanishing between the
engine's park and install passes.

Make the thread zap a whole PMD-aligned area once every 64
iterations, keeping the fine-grained zaps as the common case.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index 304c72b4ee3c..2aa45c9e8a77 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -124,8 +124,23 @@ static void *dontneed_fn(void *arg)
 		unsigned long page_idx = rand_page(&seed);
 		unsigned long nr = 1UL << (rand_r(&seed) % 6);	/* 1..32 pages */
 
-		madvise(region + page_idx * page_size, nr * page_size,
-			MADV_DONTNEED);
+		/*
+		 * Once in a while zap a whole PMD-aligned area: only a
+		 * zap spanning the full table triggers the empty-table
+		 * reclaim (CONFIG_PT_RECLAIM), which can free a table
+		 * out from under a parked collapse — sub-table zaps
+		 * never reach that path.
+		 */
+		if (!(rand_r(&seed) % 64)) {
+			unsigned long area = page_idx /
+					(hpage_pmd_size / page_size);
+
+			madvise(region + area * hpage_pmd_size,
+				hpage_pmd_size, MADV_DONTNEED);
+		} else {
+			madvise(region + page_idx * page_size,
+				nr * page_size, MADV_DONTNEED);
+		}
 		usleep(rand_r(&seed) % 500);
 	}
 	return NULL;
-- 
2.54.0

