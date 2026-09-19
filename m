Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587C319CCF5;
	Sat, 19 Sep 2026 00:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777512; cv=none; b=cHEjccnArlEJCv7d7DDHmm9sPLlHzNz19c8JJRai4N00+LgoO8pBPRcTEC/wJi8XEpis0zCuHsZ1IGDdA5Xc+d9Pj2nCK9W/8v9rhBVGq9eVkYntqul9JFbb0qkViCsT0cR7StUvAHsP/uygE046CoBwHYeydAF7bbLMfD1UGiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777512; c=relaxed/simple;
	bh=tPUBhNQDaq/WkUUh616Zvkdkhdecru468dYEpcqn9aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yf2sY+GtDGxuFNFanAsmdNo9glAZtdHY7XJO8gdicPncaYryaFFt4NKi92Z6b5qKZ/AjWkvZnzmCYNpG0QfILmMpU/EcwBHAoJUjkTDsNhhM0QLhJgEmjfAb/jZnqTdwXPFtaD8WCX4Cn5mkP0QMbFslSuUAJZJXQ1EcM969Go8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=fpvhKEOs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p0fdNOtV; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="fpvhKEOs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p0fdNOtV"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 8DEA0EC020B;
	Fri, 18 Sep 2026 20:25:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 18 Sep 2026 20:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777510; x=
	1789863910; bh=b2EjQwNXVZ3kBO5GV05H9uox01LTGQvy8R6+J7n+hI4=; b=f
	pvhKEOsnferr1TcELH0ZjHcmCKDsp7M8cEp+bv8VH9TaXB4Q6Tj9YXYl1dszTn+7
	rxHRsHxJ8fNyPWLxwLum+AqjSh3tgoJrgTVzEIAykBkoVGaailLTL8ygdCXx/UZ7
	BN51HOu5z68vqOQkpwRaCR0j3hORXzfVbVWEPj0eupXkDpLy6NeouvFmLzqrbD0r
	hFtzLQwSfxyHYFptCfkkTOAmm6tKDUF0tPzH1kbIJflo5yuOzMds+U6yOp0+xSGU
	dLdOtF+ICdTZ6uV2QSBTH8i5IbCjwL+BSEoXeUDNDGngrlp7+/VJ9iFsXw3tHGB+
	GGjDuIj1IQBVnDXxx7e6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777510; x=1789863910; bh=b
	2EjQwNXVZ3kBO5GV05H9uox01LTGQvy8R6+J7n+hI4=; b=p0fdNOtVkteZenxx4
	RX5+fgb+XldF8DelrvXyps4ZtW4VieNLSFaGzQvs6PLCvkzMu77mx2PjWDDcsrTX
	zTIdHZm14LkhWgQDeXtAScOkJ8gmwKyTazcBxOIT7Z6k+522EbuKcoNDmmgzcxQ2
	nkvATOnpkaEQc8rJmfwMXbcdXWnYvLppXcND83MquDgU0N43HiT+PDoD0NdU3hwe
	a0cUihwsDoYmaeUnGEFJPh8L23idDawphD+TsrO2Xj3UdeQlCfv0RgJPFK3DtOsB
	pEUCFfqoiqdj4BYrfPwrADQkJTtEgqnFDz5lZH4D3CpeWDRxnD4+13f7o5A48oEW
	kmZIQ==
X-ME-Sender: <xms:ZtatalzCdBtIsRjWJz0c9LbPBF0xsMoAgljQ17-F_TOPXXbEqQTnkw>
    <xme:ZtatatoBavb4oNUryslmtNHmV73wWTx9Qt3A34eOkdnDafSfXBw-plFQ7fEgDgyZT
    IONsiQsIG4QIB-bQoaTa2tirB8UJXNwPckTLSaaouHBGO8XCgTMN0b4>
X-ME-Received: <xmr:Ztatahj-iBRp3UURbK4C203UHZlNlmhrHAif3BwDRV9pmuPJRsF4jaqli6w>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIME9
    uYZjolEHn+PrRoQ3gunGcY531LB4NKn1ulXhKnB5hZbu6jfSqL52hNw5Bm8YaKVHImFX6k
    rbx7VgDsl19eZrOCN4Cwjvh91Nb4WjXuHc7NwO7T5rJVZIe46Rh4+fKpySSYCzxgBSy4u6
    hkX2g1jivopcIqWvY9jGMPyiTIi+P8huS8YKqMencvrUzsfbh56N9KA4/STLlqbRNMS9O7
    GoFIdDj9oeN/IqIfInOTzomBVdLdnoyOgH5gDMC1pG74PfzGdZnyTT0fAO0UEfFGhUWMVO
    AjI46RulfUP6t4T5EQdNms9qaQ2CbM94ZQnCAjNGmWd3cMbGrifAEvJQeQVA
X-ME-Proxy: <xmx:ZtatavXxG9KT6CclOUyFTK41b1OPUMLWmJVm2vvwVQdPTWL4_84ADg>
    <xmx:ZtatapGM9V7QMmL6uYy9I5-6KfGnwxBHIASTYegJwII8I39dvyEokA>
    <xmx:Ztatav9-kqIEbmfgTUW8xyI3qxYe23ZqOks-jVKH0kavG-PcycFhFg>
    <xmx:Ztatap3Wfq_MAgA07qSw0pKCysWF8Sk4SM9wqhPS_20wKTY8591OXA>
    <xmx:Ztataqb32XYtxGAeLpEYe9bw6jJrpauFBoZjIuIN0h4CJ15oztq8Y9qH>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:25:09 -0400 (EDT)
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
Subject: [PATCH v6 06/19] selftests/mm: stop khugepaged during the MADV_COLLAPSE cases
Date: Sat, 19 Sep 2026 01:24:36 +0100
Message-ID: <20260919002451.496763-7-kirill@shutemov.name>
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

__madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
It clears the global controls only, which is no longer enough.  A per-order
control overrides them, and -s, which makes the cases fault in folios of
one order, leaves that order's control at "always".  khugepaged then
collapses the very range the case is working on, and the case fails on a
collapse that was interfered with rather than refused.

Clear the per-order controls too.  MADV_COLLAPSE does not consult them:
anon never did, and shmem stopped with "mm: shmem: ignore sysfs configs
for shmem forced collapse".

Fixes: b7f16963efe7 ("mm/khugepaged: run khugepaged for all orders")
Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 13a2a47ab110..e013eebc7136 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -538,8 +538,8 @@ static bool is_anon(struct mem_ops *ops)
 static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
 			       struct mem_ops *ops, bool expect)
 {
-	int ret;
 	struct thp_settings settings = *thp_current_settings();
+	int ret, i;
 
 	ksft_print_msg("%s...", msg);
 
@@ -555,6 +555,10 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
 	 */
 	settings.thp_enabled = THP_NEVER;
 	settings.shmem_enabled = SHMEM_NEVER;
+	for (i = 0; i < NR_ORDERS; i++) {
+		settings.hugepages[i].enabled = THP_NEVER;
+		settings.shmem_hugepages[i].enabled = SHMEM_NEVER;
+	}
 	thp_push_settings(&settings);
 
 	/* Clear VM_NOHUGEPAGE */
-- 
2.54.0

