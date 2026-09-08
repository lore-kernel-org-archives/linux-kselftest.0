Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BC377EDF;
	Tue,  8 Sep 2026 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871876; cv=none; b=SrHUU9HnIUHd5R35eug395Ag+h3t+IBowsXHh8YWJhrCz9Mvyw0oF13xKnQLaWBm/onxKy8/u9eGk7ZzPB3j695BfbxjNs76EyFlnq8yedBX1c/gLgULkJ6j4pwWv5cu0rj9ocGacpSmJw75tfTDT+ut00vRO2EiYpmKjYe1haA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871876; c=relaxed/simple;
	bh=2N5jyXQALvT6no1K5xyLE0WpHhffQTgA5guabPSVfUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oC8RhRH+qcD5kv9F5NDpOY8IxtLbXFgGYhOVxySZvgjr/f5sQz2scavSTK/hQD1gXM1+mxcsdTJlPoAm2k+u6jEaPQaalO1WT8t3b9hFkO67W36rcgHohFsq6+TaCizRKI37R4In7NLFG6sQC6RO2M5WLs9kXzdGpW2eSmbOpZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=XilEwzkr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oY79WO9f; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="XilEwzkr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oY79WO9f"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 721171400094;
	Tue,  8 Sep 2026 08:51:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 08 Sep 2026 08:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788871873; x=
	1788958273; bh=/2nWSyfEPgqLKOnGOcfwH34Ldvg/Kp9mnGqErks5ETo=; b=X
	ilEwzkrENEYRRFEyV+yAMTVlvO5TJcVt3cA7Dcgm+5cdJ7QH1KYpP8D3YSinGoJG
	7lvBxkmqAIBBaQeUxmZUvbe0fICSpxy+d3QaNl+LjvWk1tFgkA3Ugy5z5oZKPzN+
	eu22wtnRyk5raXQCNmpvMUEq2gXXhTGLYZx/kMr78vW3Nsq8eNvkQV6vnN1iNl90
	vqdOq9XF4csvyhqOha0q6UaXt39Y7G5QNoC8bXLEq6WOn8gz7hsZR4SpsqpiqJTG
	ZMmTdGg3uZ7Z5ejmvOFsxr4ZOX1w/U00etABfWs08R16yyxDCP6VbdTfHZommU8b
	g+6yVhwkUuDOcLKJGc4+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788871873; x=1788958273; bh=/
	2nWSyfEPgqLKOnGOcfwH34Ldvg/Kp9mnGqErks5ETo=; b=oY79WO9fYBxdhDPXM
	lqRGhDi+Eb6yrjOT7un9vCsorGIgOWBhWxNlaBkoYg1J5V1t1XIDXCh1sgylApz+
	TwMhy/3eC4+aaqOZSbzof9z9id4hCBm3ALZhRzFgbGJjbrsB9HDubf5VDVXuclFp
	jDjn1sgtVZvpgVNpSTH6ESwF7FX85duFLII97Xw57S5rMV/I3ubtCJRY9W86dTL+
	InTmDyiRPqCyYOTGzXi5I3VhpDqSDlNi1p1wK/RZz8Is0qyvRVe9KgOqJhpttKaY
	JccXz2IRXPKMkzHwesW9a1nygc8b4eR0QfMYVqjDYf6IFcdNcdkFCZ6W7W4LQd0U
	THpGA==
X-ME-Sender: <xms:wQSgapWSw8DrwLpRzH1zNuU5rwq_h8sfrTqoQhs12WShupKlPvGB2A>
    <xme:wQSgah_gl4q6zkQM2VgWbC_v8gM3V708tXt0jsC490SxpFrNMqs_23Rcq1Htfrklr
    kgRxAK0D0oD6nYiAbewKFnzSt-aW5IHanRe-ZTTsIrBIYGrauhwQtew>
X-ME-Received: <xmr:wQSganmfXh8acn4sSNAZM7p4zQD00nMEeEeJX7f0OZ9GFddolUiETJ8PR40>
X-ME-Proxy-Cause: dmFkZTFCT83ts3xpHDuUgDdlzQtELcoAknrXBpsFepmdcEBLccwduWOOVyAuau0VlYvm49
    objBvbnGefvuHsKXiB+MOl7qErn3M4/Q7Z72R+asBFni+WG6jRYqPjjJBv1F7ovmfnEZp3
    uEJcbLADGcdxsWcYxdWct2wwV9KQaoOTpGWM7Il7/oKOILrVOp7MvqHbWAXdA0mgRBniUZ
    2M+Su4Zoe9zFbzekNirjNltohahTSfzaLbYZTkGXD/hRQ+ajqkABo2HdEn2GJrc7g0w4Iu
    PhTUexE0AKZ4j2dsA7W9i19VnbZvZZgTTujH64lpg2nDW6KlKK63jDlRsrLETwVfJ8WCO+
    yqPrlGo5qSZVhvzFOYFDGlQGrBJXzBqOW0CtEletXHyDAFOEoq/L4autahk7kMXlbsrpZ1
    3YAvhSI0WXx9ywTvFb05cwzMsIl4IRUM9UEv/dq3Y46Xi1E/H0f9T1c1V9L8gScb78+3yf
    BuduosL+mHDfRlXi0kEOESFJsqKsWW/6ztI20LWRcOJENWpgXFYTnlSPe/2pFE3zhrqZRW
    I8Py5/kG+hpBYvnEkU9HxyIHSmeTPaGK0WXoHxN7RDIZD5Ko7Z4jP762+iNwb1yC9hdU++
    t2qTrkDVR9PqYCTILPaNI2uFh0Ky5fg5SpypVF+t77k1iAB5J+aUM7MfDslg
X-ME-Proxy: <xmx:wQSgakLOekEpv3AfLFoXmk-aR3swZHqDGD2B5ds9bEd-CIWegb85kw>
    <xmx:wQSgalqHQuGfEet1D3CBXkqKH4jQWrgL4Kz0_St50Uc86KpHvX9CPA>
    <xmx:wQSgapTc9cW4mN7ZkAezdCiFW1Dk2QCAfMoltccbUKHLK5aI9Gdrlg>
    <xmx:wQSgag6NPYJWfYV8EFllnbhw20ykLAo38RkKA8bEmz6UGJd_xKjOLg>
    <xmx:wQSgamKfgJW3t0KLSnUDT0DZL1kiVgYaLRLhizYrR6r5vtBP4SxG6fkw>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 08:51:12 -0400 (EDT)
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
Subject: [PATCH v5 01/19] selftests/mm: raise the khugepaged test-case cap
Date: Tue,  8 Sep 2026 13:50:47 +0100
Message-ID: <20260908125105.1510704-2-kirill@shutemov.name>
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

TEST() ends the run with "MAX_TEST_CASES is too small" when the table
fills, and the table holds 64.  A full invocation already registers 63, so
the next case added anywhere aborts the whole suite before a single test
runs.

Raise the cap to 256.  The table is a static array of small structs, so the
room costs nothing worth counting.

Assisted-by: LLM
Acked-by: Usama Arif <usama.arif@linux.dev>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index f82673f5f6b4..e57016bd96fb 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1285,7 +1285,7 @@ struct test_case {
 	test_fn fn;
 };
 
-#define MAX_TEST_CASES 64
+#define MAX_TEST_CASES 256
 static struct test_case test_cases[MAX_TEST_CASES];
 static int nr_test_cases;
 
-- 
2.54.0

