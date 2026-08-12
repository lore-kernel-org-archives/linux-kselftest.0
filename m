Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06B844C645;
	Wed, 12 Aug 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540994; cv=none; b=hUr6bSLkZy2EHnFeXbDqnXpQsFZSIG4KCl0XurxnYrWqwac9L3l58X7ZEkfGQJaUdgL9+0+t67NzFDJ9YV2KY1mPVMPdd/4/bG/c91de1KnZ2eRrxU2Hf9qqMPkSS2tlOncbrmX2GtikgOIpXheEfFJmOlmfuYas2avyOEZH0ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540994; c=relaxed/simple;
	bh=DPU3hl4iFCHFuBCJbEFx058WI14nmACSIi1wqqVRxh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrWSiusldy9Fi3lTrlBH0SXJr+q6pIMxOYaxqUWSipbb6aIH/2TKuIQ6Rqx2ZURAEiPBX40c2npx7HxnlNSC/obu1Az0iiTHE9u+juyuGf2tVRqWuNu24DwBrXrfSCiPmJhoNpfwhnrbqphLjkZia2/MtLich+vu7Fr6CoMlZKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=w6sy2mRP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WS/CpC5r; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="w6sy2mRP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WS/CpC5r"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2C4E37A00F7;
	Wed, 12 Aug 2026 09:23:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 12 Aug 2026 09:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786540990; x=
	1786627390; bh=dFVegsV3dbue/WpZaO1ywLiWC7Si3PJqV3I+1pYiJpM=; b=w
	6sy2mRPTMtYuyXT7SOYVmXl5NjLm5GBxukeObUH6rzKetbsBFV7ASdEGTVRAj3HI
	pxOaZD7F7GXV71xARLgxnUQM2FF+CvAJLyi9Mls8EgceOTDHfn+RQSfyZtVXArgO
	XrXZIHwlTb5L/VMrtPR81C8kpz9PJ4N4LR47yH//mqd4ovCWDGNAMtrfpP6e6zpb
	LI4ubGbq1dU3tlAkmT5afEWWZKcnqVU4PFR1nRt/lxhykKhAa3+jFPjGYqRwMEEV
	XDyv+RCUiZX6YJh6EjnQBwKesj+UIZwrPJ+zsSOfv+AlNQlQjEnJZn36rs+w2b3N
	4xLpCzLg11Rx/GwWonfwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786540990; x=1786627390; bh=d
	FVegsV3dbue/WpZaO1ywLiWC7Si3PJqV3I+1pYiJpM=; b=WS/CpC5rJP+IE6ydp
	+eyJ09FCWELGS4/g2Iuwq7Hsz7G5mNhaG07e25lecZMwxPjjglJUT7r7w8ehrVS6
	lwWN/W9LyMoEk1j+xtxLmQFLZhc4Isy0PkRmFDbtORFGwohG25GmEH9MvqK1q0zQ
	ryllkbLOyc82gx391TeChv3ZApqhb0Kk7RoH0/Vf+mi4ygCI+hXfLPSdcQvohItW
	vNqF//RSpAKgTcizY6SMGUpYjnJjChg31+cjGtKBkJvC9VtbsjkovwbEw3HkzMnC
	jV/HW5iwmgzsdD9/l4E6Kbbd5znTM0RpAdBlfVD4HPRy9Q7PGa3O84cdEjbDi62f
	xBitA==
X-ME-Sender: <xms:vXN8apnSALtgaJ2M19GqF1OmW4j1l1ELCmMXfJbHKqiJJehJbyut3A>
    <xme:vXN8aoxoxf3IUexRVlrDFt-RroSuejROTiBCAtUuhCArllJTRBwmw0c4huYELTjuQ
    GtBtUFmYdDI5LDQLkZ-_1BIurq4dYcG5HiWX8W1SBRJ4RRFc_S-R4o>
X-ME-Received: <xmr:vXN8aoKLyHrTTVOHN0yUV8nrejv1-P1FB9_bHXLMeDuyZjm6b3QbWg8Ef9U>
X-ME-Proxy-Cause: dmFkZTEWZPjKBYDoSh3uCuJ0ogiZvSuDj1RAgMuSmimalRft9LCPvZxyrluChLfTbkjo2r
    KkCK8Ttm4mqxi+W2/UjRoyI4gRuaMCGjIyoE2sYafZhhTXl0iIGCKEOr9/WVtZfHPc/pjz
    XsLpzK8U2Xu6F30SrJOujIlp1bmlomKUtpU/iiXSkRy6wwaI7NV8wAm1PQ0lHgRG0nCRKX
    WKIh8TtevEly/nhHwG2deu/klJhGkXN7h/CDYOOyqjOIkeF7MAFsC6fZtQDVeVkgzM4xU1
    Py5NrFUehZdXXi5LHUYxqNjNVNbuxWN2P2YJW6J2IL8s+zlVHHPN2YdKOlFVuMcbnWK9RR
    he9rwe5OluvMSoZqJuhbcBqFRkamYKpUstN2ZIOi0PqxW8vU9FKgLKQmDf6VUCnKAQqAKK
    LKfSV1JqAWZZI35Umt11vo+D0VQpW5CMHQewiZHIhNYSwL0WunauJZTW72Si2RCbBxCrI2
    BLsRPDosTNNtjZRTQiK/cLEA+xKIOWLPVccONblN75rB4vSsls/CzPnovVsLJhOpzFiS/B
    UqomOZqCJ0Lu+0+wAtFKYPFd/4sE+/tKt8gMwGA7v8pgFrE+DhcglpAgXlu9z1idk3YvNd
    nA5AZbt8QYP3wW1iBN//oI/dRAJZiIvYp94BPDbFE28g4ZnWdjWyEuJzas9Q
X-ME-Proxy: <xmx:vXN8ajJDbj5Dg7MPxH8jl5L02Ug5tZ3-maMzl92ZwZ6PbImVmBUzhw>
    <xmx:vXN8avXaMcIosaBbB6dvEqVy-n5jTLnZ5gEhhExuHJj-Ic6HsA0-tw>
    <xmx:vXN8ajBqF8k9tzP_Sl4B3zsSgMAOAzUzr4HvFYItkhmneaHy3d1TFQ>
    <xmx:vXN8aqF8kHwcyBjecZXmZplhVFYAgpKP20Bi6qO6KYlGZRXWHFqJsw>
    <xmx:vnN8aoHuAJ885FkU3iXHcbSG5gVGLzqtQ4d3O-OWtK-hg-dg1IEomGkh>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:09 -0400 (EDT)
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
Subject: [PATCH v3 01/18] selftests/mm: raise the khugepaged test-case cap
Date: Wed, 12 Aug 2026 14:22:47 +0100
Message-ID: <20260812132304.199287-2-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812132304.199287-1-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

TEST() ends the run with "MAX_TEST_CASES is too small" when the table
fills, and the table holds 64.  A full invocation -- every context crossed
with every memory type, which needs a directory for the file and shmem ones
-- already registers 63, so the next case added anywhere aborts the whole
suite before a single test runs.

Raise it to 256.  The table is a static array of small structs, so the room
costs nothing worth counting, and the cases added after this have somewhere
to go.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 0d6c71ed2fae..018b0698229c 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1324,7 +1324,7 @@ struct test_case {
 	test_fn fn;
 };
 
-#define MAX_TEST_CASES 64
+#define MAX_TEST_CASES 256
 static struct test_case test_cases[MAX_TEST_CASES];
 static int nr_test_cases;
 
-- 
2.54.0

