Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166ED282F3A;
	Sat, 19 Sep 2026 00:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777507; cv=none; b=rPWprj+6kgaTEmjC1MatuuAj5jUOHbUTLSnyGXbx8EWyzaPW4tthdIf8gXDdud20cdfj/vilQmvLCp0LiNWGfsmXLOE9YyC1Z9XT6L879r8vvCAgRGiSDrK5FDL50SfmWn7AvP+bw6+X+ptDe9eBgAbcJO8lvNh5wbFCaNojCwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777507; c=relaxed/simple;
	bh=FGJJxjxAXxiWCjd6HdT7/p3aXTUUliCrodLMid3aH30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcykUJp/OaW21B2V4hGRozlM+YCdlgJwCQCNROVEUtZXkiLiPMxr1Pnygsw3YLVFjpuF+bruiUS0mLtpfix+Xa9PzdkWOh2gn95EgmjMIijX3V92AFnqgsuybYCtLaGzsFtDra5KBpdaoAEb/Xw/M6lG5adaJjmI8196xufLdw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=WD69CBLt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UNIpvzQ8; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="WD69CBLt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UNIpvzQ8"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 334BB140016D;
	Fri, 18 Sep 2026 20:25:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 18 Sep 2026 20:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777504; x=
	1789863904; bh=bpxeXbnbOj0UDoqQAf9nzaCtUzuS3tS0/UkkxEQ26AA=; b=W
	D69CBLtOWCM4S7EgMjV+POR/cncBs71Ol5PFqjoveP+zL0lLDfATApzdjzXErQTv
	pCCdYMTcEHkLDfqG8SusK6XpnC1BJ7+mXi1dmAAd96P00qRHylj/ZdqRBS5fUoCy
	9Z5kqcx1AcyXW5stzXt+O2DmT6F94UJ7IqMO8XJUCASiqfhc+itLaboOlENSqnX9
	kLgNZPq/yx5S6L/DQg+MIKnCKkxnltu64Zov2nD/4kE3S0ZNu3uUMMQ868XaTCyf
	Rb3IUx8wo4T2hLwUYFJFDnyzU5z5snYMiGarp9+Vv5J0sGTZxbtLXSHGorLSTaVM
	c30x70h+MJO5GGGPT/kcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777504; x=1789863904; bh=b
	pxeXbnbOj0UDoqQAf9nzaCtUzuS3tS0/UkkxEQ26AA=; b=UNIpvzQ8QvAF4nnvz
	n1f2aIKArJF208zrbfoFonPfqId8ELG8wNOjh9WKlkkuj9F085SzDnoO3ifiGPIY
	bwifGzSRFqQ2ZEA5mMn1oXCC8DwXnJ8/sbttkKG1Uuq/vueaXecxsfFWWI69pTDy
	Ds4hTBcw5jIVzwLHGRHwa4rrtmf107xj1NlGNauP0SJjOTvRymlrAyGQewy9ucM+
	MeGzFr5k3U4ft26q6vbuuwKiINxAtcmRgSdoqSOyRzMlTtFkJ4yHfWGs1/uYVsj2
	tEWuGkLlYEGpsHG9m9433p6qqq3UoTN16wnDPtKSv+OvWDwuaOQxYNRsnRlIkVoH
	lE0sQ==
X-ME-Sender: <xms:X9atajhmjDDBJWTpivZAiP0HnBwEguADxUtN1_KvVkRNN_mOElnWww>
    <xme:X9ataoZuggW1TVOOIJgxv5C3dCx0yYGpH89WPRYvP7zsnruIY5ceGaCFvpFwmd0eM
    wZYy1Yc7pdG3cqUAyy4Ux0nmSI8Kg_HwlLzeKMZ6d9URcszsYH85fp1>
X-ME-Received: <xmr:X9atalTLIcpAQ3L4_br_jCzCt3Dhan5HYiJxT1wOO9Gt16p1pdMZpuV_aU0>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMIe
    80jfhDgdcpW6UhorbgwxywTZCRoFQkugBsnXE60iKAHu6CWCEz+3/Sut+Y/Bb3aLG2bIoj
    WvUoU6rTcFqk0WIqlh8qHR2eG0EAGRtxYfIf/ek2w0O0USb7kaH5nMk3XesCrpUjr+rmNq
    JER5ODHTHu47swWt67U0UUEtu2enEF/aDTyo0trZQsguHJup2ecb9W8gzFHwiuRqlva4ul
    y8yQ+jewxXn4ORXu1KYoK8ziKwYC8cKxWzwRpdy5Z6hYsegvHTXOX9XV3tTiZr3hu6b8hJ
    guYj9GBQmINoPf5hK2Mr+zb+PMNCOYxJAP0JUj8zJDLtAk0zRIBEQSMGykFQ
X-ME-Proxy: <xmx:X9ataoE836cUG5yAuFnhslm-yKgrX--c-EGvvIMJIW1yFYuwDs29yg>
    <xmx:X9atai0SJvnnNfrWUEhB-S1rvoc3v2CHRsKKmkMx6-P2SDBQMrh3fw>
    <xmx:X9atamuKFVUQqcEaU0ZKhs1rdZbECqwOaJ-XP5RqMkq4NhDZzopcZA>
    <xmx:X9atapm7HZ0BYdVN2RobGDJKMk99-zq1Tc9AB__U9KZX-s0fzaocsw>
    <xmx:YNatajK8edntNF98ieZbbtcv4zw1NZDp3B-YEOPSDQ0ZPPuk8JluZd6u>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:03 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	"Nico Pache (Red Hat)" <nico.pache@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	kernel-team@meta.com
Subject: [PATCH v6 03/19] selftests/mm: scale khugepaged's collapse wait with the PMD size
Date: Sat, 19 Sep 2026 01:24:33 +0100
Message-ID: <20260919002451.496763-4-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919002451.496763-1-kirill@shutemov.name>
References: <20260919002451.496763-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

wait_for_scan() gives every case the same three seconds, whatever the huge
page costs to build.  collapse_full() asks for four of them: 8M at a 2M
PMD, but 2G at a 512M PMD -- arm64 with 64K base pages.  Three seconds is
thin at that size, and the case has reported a failure for a collapse that
was still going.

The timeout is a ceiling on a poll loop, not a sleep: the loop stops as
soon as ops->check_huge() sees the collapse, or as soon as full_scans has
advanced by two.  Raising it costs a passing case nothing.  Across 80 runs
of collapse_full() on arm64 with 64K pages the wait was half a second in
73 of them, with a tail to two seconds.

Keep three seconds as the floor and add a second per 128M collapsed.  A 2M
PMD is unchanged, so x86-64 is too; a 512M PMD gets 19 seconds.

On arm64 with 64K pages a passing ./khugepaged all:anon takes 49 seconds
under TCG before and after this change.

Assisted-by: LLM
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 8a6d708026b7..189cc4fee18f 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -561,8 +561,11 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		int nr_hpages, int collap_order, struct mem_ops *ops)
 {
 	unsigned long hpage_size = page_size << collap_order;
-	int full_scans;
-	int timeout = 6; /* 3 seconds */
+	unsigned long bytes = (unsigned long)nr_hpages * hpage_size;
+	int timeout, full_scans;
+
+	/* Half-second ticks: three seconds floor, plus a second per 128M */
+	timeout = 6 + 2 * (bytes / (128UL << 20));
 
 	/* Sanity check */
 	if (!ops->check_huge(p, len, 0, hpage_size))
-- 
2.54.0

