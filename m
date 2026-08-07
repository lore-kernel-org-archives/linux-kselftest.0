Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B8937C92B;
	Fri,  7 Aug 2026 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102658; cv=none; b=V0HnTree7ALkQhexs9tq7iEAM72QRYz9j7HfLd5g7oLSKRNvxzVHO0GdHhb0S+Sns8LseEVtuh0m8G2otaZKlpb/KEylTi6sjP93BA8BcAyfO/EgED/4rbiMdIRcR8d5Qmi7qOt+4l1qKAFNhwmcXivTL19mFT9JHXVnnMj+hEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102658; c=relaxed/simple;
	bh=oNBzqD9jsT2yunyygkm7+etc0sV7BqK7one/jTkqfi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+Mi7vTGYVTIcfcu9xsdUPQX6INu/t+79LF/KEJyb3CysR7EB0wz52I/Mx8SorEFQT2Z54CWEgWHs1yT765EMU2H+lfSx4X0eIWpsGAxf65Q+zvrOo7he8ocTDGiZ5uHGWC90ffmLPDjIhiKglYAhbnSQ43eUbZ85VQXwFSW2vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=xbftsFIg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mNnlgo5w; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="xbftsFIg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mNnlgo5w"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D90FE7A0120;
	Fri,  7 Aug 2026 07:37:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 07 Aug 2026 07:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786102653; x=
	1786189053; bh=j0pTWFpZyp+VvcRD0WxQqHE3ctvFSewhwoAIj25qxck=; b=x
	bftsFIgYkMSok8nICxfbAq1vmfsz4Z0KdfsegX/1uf08o1cQaXApfJ5J8j0OTmd5
	C3PiD41M+AzixMpV8qI9YmCiXzNyGUd0NdwDVL7izDqRe2IjfthjC+myekxxpZE6
	xZkLw3stIVqqyrw66g1jQ6DTxLsmsTQTN/relElWyUQaW6MG+570UBEiaIC/hSc8
	rUBIKuXZy3zBQkTNbhXwteZi+tD7y+ewMMG0PZK4knc6JQ1K8vMPqe0a+Cioh61s
	+zJyBW2lcVo2ZrJ/eaWhAZpOGVYQyB9u6Z95p7x8syxqVzm5V+cfoFWjqorKQWPo
	OwctHlJA+VDcceIGu6DvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786102653; x=1786189053; bh=j
	0pTWFpZyp+VvcRD0WxQqHE3ctvFSewhwoAIj25qxck=; b=mNnlgo5wXwMK2z/P+
	oeXSTUdjLJAgU/EBotX2PNmPJa0tc/1GpX1VDT6yzsXNIaddJn8xpQD+p/a9Apmy
	bwP/pyrqEVLDM9feG7wzBEyWazq0Qd8tozZOg6kDy7IG+LdD6k3Wv6HRYabHpmIm
	sF6eZBZ8mGE4Ch7U7/LaPZQO9qoqIS9uWN3Ea5A4a5NL0hjc1cym9Kulz2oq9xeN
	u4Fqe/FTcpOLleg+ds/3/c29oj3/ml/Vqfb1ka5nUSmFAAVzJOaJ+ouTwTdFb8v8
	L9/gDxGWDNnfQ9KD0PUSniknK3Is0dqAcxhqqdOenvof00yi/f0jXXquEvznI5Zq
	iA1Fw==
X-ME-Sender: <xms:fcN1ah0DD3AeiE6UvfCAF5QYfa6NkxzBXSClc8Fwutr-ln8PcCxAMQ>
    <xme:fcN1asCoFgbKkfBL7NmUuK0AonRB_Y-GoWY2nto0lczDEm4Fj11qLK8gwRypKmJlu
    wua5HNxR3m4T4Nv9ez3holE3ko4BdU3ce9guikiofGGgg02Fu5zgEqc>
X-ME-Received: <xmr:fcN1aqaZ_0xl3kOVF_fdRC9nvGDF5aJLkKuY6lHO-Cd5CNLmJWRZuR1bNF8>
X-ME-Proxy-Cause: dmFkZTFHgVqOo5hmjJljb3IAZGkXyyxzQaD6i5RNmNk424gVmZkPzr1NfNWN42YMHBLBJ7
    ouwgSkV7uP+O116AnyQ77X3VN5vAdqq1zvzV33EYJRHUa/cQ0OT9UF9tJbf4RJE1rh86et
    dgK/XsSmEjRvIZ4/DwnHkulf5IWkeizHGDAErUJF9mnMadsJqDG0SAHuOjgfipI02yAqvF
    a9Gp7D1P4aM7ojieUjy73reTq6pHjAlslJzhWF2Bayc7rzuN1loFnb3tH1A/9l8/u/BKz2
    kEn4hJCLyjrltgNf/ADveISAZdc/G8K4aY+0IiJqAeENTN6qSce54NhN3knOmRl67eS+Qh
    /GDhBAG3wst46ljWIEG6h6ptOpuEu5vMqJ7CiNfirp26y5hXcRosGEtwZNX9q+/Mx5m/Wm
    18OvmXPsEUykWNTvUXxAMk9ehrL5JG3kQbKJE6IMEikl2yq2a8p7fPSXxLgRyc+IBLe4eB
    sHARQUv0hKUKXc+Rk3Cw9iDyfk+gvnaNxGQ9Gr62oeu4PJGH5NWqcHovNLmY9RM7CkdLgE
    kG3sT4dCq8bDdk36o+UvVus9mH46NhTOVedbykvpE+hKqvsrqn8J3aRu6ncnXEqXGp8lcJ
    ktWemNxd0IqVDSIhQADkbPFZlfudXSNAeqIjWmB5lgnaRnE6RQ2TpJsIS97Q
X-ME-Proxy: <xmx:fcN1aoagw3eTixxg0QBAiiYqAY27j31s5J6RhHnYcDCHb0k6qvcamQ>
    <xmx:fcN1arkP1L5P7dumv8MtRLVYB3E3mfVG5bJj8GsshpqEZ2FyDjqzug>
    <xmx:fcN1aqT5P7LINDB4oPAggZF1ce63aCfsSkd400oN-CZChzn_0fgzEQ>
    <xmx:fcN1agXJpwqCB2tmpjpoCADfGvZxYU_yH-TLBLs0Ascy5Ykno2ZqqQ>
    <xmx:fcN1agJG3LL4hGGWwlQmIADcLl3it-c9hh7Z5TpPFE76Hq16j4O7rp3o>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:37:33 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	usama.anjum@arm.com,
	agordeev@linux.ibm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org
Subject: [PATCH v2 17/17] selftests/mm: zap whole PTE tables in the khugepaged race harness
Date: Fri,  7 Aug 2026 12:36:47 +0100
Message-ID: <20260807113647.3744609-18-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807113647.3744609-1-kirill@shutemov.name>
References: <20260807113647.3744609-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The harness's MADV_DONTNEED thread zaps 1 to 32 pages at a time, never a
whole PMD-aligned area.  Empty-table reclaim (CONFIG_PT_RECLAIM) only
engages when a zap spans a full table, so no soak ever ran it against a
collapse -- fuzzing had to find that class instead: the page table
vanishing between the engine's park and install passes.

Make the thread zap a whole PMD-aligned area once every 64 iterations, and
keep the fine-grained zaps as the common case.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index abd142db7cbe..1fbd20771a5a 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -121,8 +121,23 @@ static void *dontneed_fn(void *arg)
 		unsigned long page_idx = rand_page(&seed);
 		unsigned long nr = 1UL << (rand_r(&seed) % 6);	/* 1..32 pages */
 
-		madvise(region + page_idx * page_size, nr * page_size,
-			MADV_DONTNEED);
+		/*
+		 * Once in a while zap a whole PMD-aligned area: only a zap
+		 * spanning the full table triggers the empty-table reclaim
+		 * (CONFIG_PT_RECLAIM), which can free the table under a
+		 * collapse that is midway through it.  Sub-table zaps never
+		 * reach that path.
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

