Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9026237DAD7;
	Wed, 12 Aug 2026 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540999; cv=none; b=YBNarF5b3IRR+5D5BKUgrrXpQ9hhuorDLC11BXjWyNN0b9xl8hCHVjw3U1bGLde/1D5cBVVrvaLeFuEP7DSk8E1c+pApQIqnAoJxV5K21NLc9Dwxk7K2ctCwetImtP333lpjJviDF6E/2woGcKvz897D3GIuI4XXjG/rR+ypKjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540999; c=relaxed/simple;
	bh=tYHjq9AfOnS4weJ6c4sLCMMcu+sjNXqoJxifv8Shr/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOabeqLS+dcjmuDF5tvnwPUNlpsjRC/t1Z2sF5r9kVwHkSOk70WWJ9fYoXVKu78/rzs4l/lvMT5y77/H9MGi6PHFH9F9EVj8VjTt6JjVFXlhtul3VWFAeGSpC94F9JHPNtvt0uqH9uDqYyUo/N44fYK/cKADfCu3B987Di+8phI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=aiiosAOa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D1/ntZao; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="aiiosAOa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D1/ntZao"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 478457A010C;
	Wed, 12 Aug 2026 09:23:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 12 Aug 2026 09:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786540996; x=
	1786627396; bh=MJbY/SFy75qdRi7w5cKO1mRNu7cIMLlux0wZ8SdfTcU=; b=a
	iiosAOa4lnIcQmGxw3xyoXiABW5LfDKUemJ8PwlNXaysVYmy1zfqoZSnDyQN+oAi
	W2V4GVNkMjAzEeNPyAzVb9uUuKKR17KLN8zV6V1BQFPDxNgJHbT6CTM9JNUcjVUQ
	K9KWplKuoY2m3pfrchow+I9upXOXfVg6kF+uz7KcOXP0H8I7vXtHeCkuDv7SzANi
	XDZpXth0IYOL7GY+P6qXA+JOT1DhRWS/eOwQTMvvmftcZ8EILT6qmA0w/8Bl0Ocy
	geaZg01+6Re1R4DUHmsIfiyP8+ufAvQC8ZZVsG24mzocC7AUCCj5qk51PC6uUfbv
	b779JmXqIqHrSy1ahwO4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786540996; x=1786627396; bh=M
	JbY/SFy75qdRi7w5cKO1mRNu7cIMLlux0wZ8SdfTcU=; b=D1/ntZaoXHDqQY25H
	Y2A5uM4Zy9Mfrz6K86Xnut4YEMMtHDV+hRovrpBJ4d/KFoVQPNxBogKLXJ4VjOyq
	kSS7udh0fK23gd41EaTftHSIJH4ze6kCo+bM0uvF5ipVRJbQNzf1GVAD8/N2uYAY
	7s3diYhQOxDuUtfQfOx3mmGUHA7YzF6jG6JBKsSb4/66sGJiAOSMgpoSOEdXsFS2
	Vuw3td++xfIWBweXiSER/q7hQPcmLZANQKO+tVd+hW290a+pFBaFrwDVag8JAkXX
	LkZkt3REhbSYkDmacPPVHWa/6ywQoHn9s/7og6CX+VtA3+focCjMxxMta4+DR9NF
	d7TxA==
X-ME-Sender: <xms:xHN8al5HqtzrXenCExcQaRJGsVmdflJl0EUeK32V24EuXCekjMX_gg>
    <xme:xHN8auwWBIjsbK8NKkB5OUyz2JqC5f-C4gtaiSRkQ7oNGynwYrR2OC9effzTVIRL8
    fb4CTzKEKk6nCRGCncSL1lYcqX12Wggu_aIa6UBXs3ikPkgleb1xnw>
X-ME-Received: <xmr:xHN8alTbwdHHYdW4Ta23l8oCOFJg3ERmN5CfZsWzT5TfGuXWw1yUXn3sjKg>
X-ME-Proxy-Cause: dmFkZTFzqtrNoSTXX2MRzKyN6p8XXqdjDSX08KYyJpXp82eYC1ae2GegaTOhbDzreYT/K0
    OAsc1zsfjWszwuQXvOMxV3FM9x50+HqAsA48u5Kq52QtHo+TJJPCEG+EOeKn5Il8AepNuY
    amkSO7LHncjzMJKy/SPUs50UUrTlzGP0ayf7b+h/q5NreZMQSrrfXSzcd6tsdBCg4Hhmbc
    7COQKDHpqWJD3HpoJ7/Bw0J3tcRV9tZIkmRGQ4nZ/O76iTBc+eN6GYtayu9aLLTJal0DNN
    hI5LqlugC7KhSFwlZIIFqKKnJB7XY7vZnEBEdRJ8Mvpq9sE5OflKN5J+H3ujbniJsnhlY7
    qvofwkhupd3+ldjSFNE07ZJ6AiypvcrGoG9bilNX/w56U6sBddmljfwCtBGcGBcJl6c1dK
    6LGhiz6rnHZc9AbDCNDPCZw4HgoNvPHpE0+SgOAZ1eLVGqCVgR/KwLxiC3cdzJfUHp6670
    se8/8fH+r0wC8pjS6JwIkHpLmpsNqcTEYrpHAj6zHkZ6FflNj9aLmG9tSF58bwKbKVAHEn
    O4OccZKzkSFnPJsLnotJOSRo3IRFIx//B5JtVWZLhX8tnh7KHfgOYrELZm7LsxWFEfS9xX
    AygVIV0KsKuBFx18VKm0EeWgSNMTbkyUC553L7qTZtO5Ehb/HBGxlMszaI/w
X-ME-Proxy: <xmx:xHN8am8t0FLVG_BdWk65Qkbsq7_pyggID-TXmpOrVraFFMz3Q4pL5A>
    <xmx:xHN8aiIkEm9RCDTOSurTNvRvnq6rE7u7fRUh5sgxSdQx5M2zlTOT9w>
    <xmx:xHN8aqsUebIeo12iGyG07Gbh8BGn0wPq6AWj_Gm5K0H9hhSP97k5-A>
    <xmx:xHN8armdZXbHt6strlMo6jp9j0pV4wHyMujRXasXgU2l94sYBsinmQ>
    <xmx:xHN8aoB6Hdtl88aLLX-oZTgYLAbWhu5sUJOqqyIi5bOMupKdCKtTwxM->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:15 -0400 (EDT)
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
Subject: [PATCH v3 03/18] selftests/mm: scale khugepaged's collapse wait with the PMD size
Date: Wed, 12 Aug 2026 14:22:49 +0100
Message-ID: <20260812132304.199287-4-kirill@shutemov.name>
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

wait_for_scan() gives every case the same three seconds, whatever the huge
page costs to build.  collapse_full asks for four of them: 8M at a 2M PMD,
but 2G at a 512M PMD -- arm64 with 64K base pages.

Three seconds is thin at that size rather than generous.  Across 80 runs of
collapse_full on arm64 with 64K pages the wait was half a second in 73 of
them, with a tail to two seconds, and the case has timed out in a full
matrix run, reporting a failure for a collapse that was still going.

Keep three seconds as the floor and add a second per 128M to collapse.  A
2M PMD is unchanged.  A 512M PMD gets 19 seconds, which is headroom over
the observed tail rather than a measured requirement.  The budget bounds
how long a real failure takes to report, not how long a passing case
waits: wait_for_scan() returns as soon as the collapse turns up.

arm64/64K: khugepaged all:anon 21 pass/1 fail -> 22 pass/0 fail.  x86-64 is
unchanged.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 48eb74c255f6..a5ada78d90ee 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -583,8 +583,10 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		int nr_hpages, int collap_order, struct mem_ops *ops)
 {
 	unsigned long hpage_size = page_size << collap_order;
+	/* Three seconds as a floor, plus a second per 128M to collapse */
+	const unsigned long bytes = (unsigned long)nr_hpages * hpage_size;
+	int timeout = 6 + 2 * (bytes / (128UL << 20));
 	int full_scans;
-	int timeout = 6; /* 3 seconds */
 
 	/* Sanity check */
 	if (!ops->check_huge(p, len, 0, hpage_size))
-- 
2.54.0

