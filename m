Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247962D9ECA;
	Sat, 19 Sep 2026 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777537; cv=none; b=Ad/GZVDIWuna66Ued2JSIau2jDERA/UbZNXtVAALTmW0vjEJxHhpzYbOPR+9Uvw7oZ4gJ/30lmDT8RiRjPR0Q+VhD+tgFEVTUSqg0pfzicbicbAhf2JVzpxttr40oJK39+fcGhd2KqeAk1ivDdsAXgMlYpIMdLr8gtZZ8CHUvtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777537; c=relaxed/simple;
	bh=GHzb2sX1MYx0DA0jEequmqnv3k+ULP4AiYdtfrV97L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFPA9CMhDQezks+QynJTln/qPwwLcGMxQ9k/btrRMSvd05al0rYStXDBNhWB5V2OcZjdMYvdbfITELe5j7bFJxwZggnDjNEzPS6Lk7glBEcGJaG4/BbZXN5qttB+7YAPtazGNUN8PECi2N6ezNs1gjKW8fJpB+qCnHawCtQoaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=JTORV64X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NJfCtBuq; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="JTORV64X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NJfCtBuq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5DED1140016D;
	Fri, 18 Sep 2026 20:25:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 18 Sep 2026 20:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777533; x=
	1789863933; bh=ZsEX+0ruB8DSYOnav/6r+swke5RHnhh3EckcILtj0PU=; b=J
	TORV64XLJgBCCkzrwuTlkYSUGxEIV88/s4K2S3TWXPhU2afKbpCKqypA8RyMDPFp
	nz8AT2tEVVePtF4vM/HGihaX3p34vp92p/0duTObgRkjj4c04Qdud1xxd5ohpM9s
	STMw4LooBS2I0CLf/JL851GBDq+Ew3JGE82UTj0FTp5PUNtVWocrqfyOx+uiHL99
	B/BhoPC/8agF/W0oqwwfUc1p7Y8wVpEh9edve0kFXOI+p9oc1ZzlxXF5yDjJhgC3
	gE1Kkza/3ixLh4jENZCGWiqZaKUcCMNn9x4IDpJAQiMyxbmHMDgX+eAdcutanLuw
	ySqMmvKRshlH6kYgYjl4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777533; x=1789863933; bh=Z
	sEX+0ruB8DSYOnav/6r+swke5RHnhh3EckcILtj0PU=; b=NJfCtBuqPjxHtCUF5
	rA8X4eBVknkb76xvoX9WUnD0U4Eg2lvAB4IRZoueZM7VU6OBnXVJHtwYYGEsl+hb
	POz7J4FuQMVT6e24HbeyX0OMQsgyuIntNHkgsJJtuThv2mPIveojwc3/fBFjTt2W
	zbelc0ACznmSJ9n5/o8rjYYzN/C+P34PcUrnYAGgOaK8s3m0tkuiQiBjggsCj7UY
	WY0FkI6nhcHFN/abniVMd/12jlquIdpysPw/xhf0Eu5tXKUVzEffZaZagPQtSB9t
	0Kqmzynla3sQiOWFh88Xg2NIvFrPK+UQt11NrAg84JvFGAylij2HZI7Wy1SrOhpg
	dtzKw==
X-ME-Sender: <xms:fdataupXt6zh-RUzvxGdRRe410z8FJ99McFWrOeS80DjOmnZCPT6YQ>
    <xme:fdatalBDCaUF9Ojwbvkx7DdZs4P65qQDbqM82i9cqUm1nmF-z3paaNkHyKjNxqmOY
    4RRjp9TRbAjdzzlW-v7DPBwQI03q9dLNnpV-baQqAvu68Gow-NAdg>
X-ME-Received: <xmr:fdatalbh7y-SFuo3kvhxoQ5pu249NvqlhNYrMaz0Xue-zAoGHaSOwG3PGlA>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMEa
    MZHxhDKY0xlI1hrODY+2xppEEtaciMYpLIJfUlGrUvkY7nVYwYEAcgwwYVB4MdOWOT4+zn
    QUHtQxYd0JkjouR8IN9JCkskC6nPSkcQMYQkMbtjGp985VZy7s/Ivh8h/z80/05cYhrJQ7
    k6eEdO+Qy2SD34yH4g0yfwfXsVYLzRF2iPpq21uB1ysg1zgQz5RHJe09YtftMgtktqW/lb
    2bgEd7AJGhA6KOujiAqda3lcX/xvIxRZdBj0Q5EqwhmDShOybvaaLhAtwghRhD92V0/oBU
    9t+3f2lmkmcziW5z7jmynBsylzhDqK4ZLEO8wje6DgwOmRIn/Gev8cSaIs3g
X-ME-Proxy: <xmx:fdataltnPC6DWuaiLSMfP-LRjc9ZVJnTvWDnfDMOOP3iUBE6kj2r2w>
    <xmx:fdatav8sSXDY-z_bszdnlHVqIHf2VWbZslhxCYpqxNkneyGO9DEblQ>
    <xmx:fdatatWhuG65afOTqON21CS0Y2dOwsYB6i-XiEqD_N3DTVRv2h7UCA>
    <xmx:fdatarvvT5CNOvYqSc07fmW3yafSvKAu0NdF5X1__tOplppOtmwz3w>
    <xmx:fdatagyamm0m4TXYJsAvu_KSurLeEK-iBihloNz-a4V6vjpieHnivpEf>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:32 -0400 (EDT)
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
Subject: [PATCH v6 19/19] selftests/mm: zap whole PTE tables in the khugepaged race harness
Date: Sat, 19 Sep 2026 01:24:49 +0100
Message-ID: <20260919002451.496763-20-kirill@shutemov.name>
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
index 68046f0bf6d3..abb0678522cd 100644
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

