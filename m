Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608A27AC4D;
	Sat, 19 Sep 2026 00:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777501; cv=none; b=Dx7JlUOtSGSTpSZ52m3U8mwpqRZq1XzC7ZNrJ2gzJDoP9eKEMiuAGYlYMor44sS9moCgDpaFNfDJ943JLlBbsanzuctEttoSXfEwbNwqGN9+287IBDJZ0OqAuUDVZKF1CSpDkARB7TW/vO7EXFDIPGxuqh8IWQ+N66Z0MVRCbzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777501; c=relaxed/simple;
	bh=oihi97UF0W+Euvg2yKxo3S7vW1lBLqlVXCLDLPb/rGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l01LIV53UaHXgz5Ey+XtZcd/0lj8+9EQ5iTvkNZBPHcYilcYw+dJEoSARHhWSBCxR4RCFpHEFpon7UlWblemDk/8uVO5vu/LbxPoi2wNSLYiAqLCW2TZ5VSvr4MlzEvDcvYGdiunNfH9GL/a6er2aqgV3L5zeml+RCpjyzOpahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=lZfXBWcc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IHTDTava; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="lZfXBWcc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IHTDTava"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 97EBDEC0232;
	Fri, 18 Sep 2026 20:24:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 18 Sep 2026 20:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789777498; x=
	1789863898; bh=fo76vmrg4cxg21gPYqwdjCzZp7TsVtRf/8vWWUFNPFg=; b=l
	ZfXBWccAMPvC2qPAVaDlQt61nq4HN5Mi+I1M7G/Z2tn6MtTbiFgBMQHYHR4G9s30
	CtOOINuX5S7jlro7UluFW4YKuJ9d8cYKyAmpVuA210EZJtzuQR7lVwj+/vTcdgJM
	KR1ZZ7RZtBWenbuH31MqD3KdR21ueuxa607ewZHy4CYFfjXzN+qLivxZ/QViAVVn
	p4Paq4bRz7m8HvIiCPucvHZokWkkdnqe/h5tA5AQHRIPYAiqmDV46r+s6IomGu7n
	LyiQrJYJWWm8QXi/wQEvhPMeJiYljifHqVqZMbrOceBU2JeMJPpQrOL6sci//YS2
	DlwfU4AWrK4V41eFjYpKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789777498; x=1789863898; bh=f
	o76vmrg4cxg21gPYqwdjCzZp7TsVtRf/8vWWUFNPFg=; b=IHTDTavaN5BPAZjn1
	nb+tf234GGchB6TRqEPGjvis35+hOPoUM+4LWLkdoowMOz/jO+k0inhVLYK+gNAA
	VAw933NoRZRtDaBp2T523sVEXRl1UXexl5kSiZ3fUHopmJ4t3tj5KDE0tmuMReqV
	rYTRDnsaN7bl5YRf8QX++g61Gcvf9muh4JGdVFlArC7HlptqSeox25nV2WDRONnL
	tZ0cWkEoADbEHkSHh6q5jx3Twc4pPFk6XfIn+IGe3O3DXliC/aSkYmvWDH7WJ6lD
	yDsqoSZdP3wim9Su1ISNuEMT/grXnOzFsqnH1ktqkowJO7ReQE5MYQ2B9tpGT2YA
	tSQ8Q==
X-ME-Sender: <xms:WtatatVLcZb_hp68bSouFJZzNXp4zjXUFd5I6MX2_mfxVRrXkANLBA>
    <xme:Wtatavf_fqGUHfc_gyBsg0XjX-RKUAtGUCRZVhTpNewPGZYkgMOqBZik9RpH2FVYb
    vxUTlaAKEAsFIB0l-A2IB6VZmg0_rsZ6PvDmNwJwqD5wS3t73jIsGYG>
X-ME-Received: <xmr:WtataugXHfj5jwK0oZcOehVZ-j8qwX7YY0NRkI9lcPCmVf2OgaFueD8gtZk>
X-ME-Proxy-Cause: dmFkZTFyC+XeKYnZ766rqTYe4SsoatN0doBd7ADemiperjFlmE10ggdkgYpZeWmNOU4aBc
    lm02WEvCO2QGG+A0SGXMzCjVWjDSVCQ5WJ/xmSMbLZJLqVjt5aEnrGd0hUbHPJ/ejcqjFa
    xrmYY/YNxh9EpvRrTjNMqslNp6oZ1XKAjj0b9YUD/U+Umt4HJhNRFStrIx7jR3Gf+CAD8k
    /TwEvtSve0+WgA7utVqBt9LeXDUSIUkf7dn/1M9JWIyORT8Kp2cNKrwYutOzK/Z35sBm5S
    qWNICJAq9yYROUOkEgx1cQSYtjkPP2DMZwKGXS3JxTiE+xMdBmJUepOSBHs3/DvnVTIMLH
    oHJ9HNYzZnkDKS1K8Ngn6glJpoAJiwfFQtmosaAwPr6HHW/c5Fs/OG20UCk7mR1J+pkJlt
    RJvl2gFpnHl+J/iUvVWt0Fwg1nnmp9OaBTY0l/8mmUua7WuweLrx8GwjSYkt4okpW3tY9b
    BobACyLC13eAvQ+mg5RgfIzwrZSti6H6tBBjbY4ZQW6YVQ3l51oFC8HYKSs1DoGQ1TmQEJ
    ACZM5pYsUyMyLiJm0afVVT/drw7VcjvG+rTG+u33CLRAqrZcWc/nOhkDgTh1CKBGJbX7fn
    91pfQ0e8zUkmgSxWeGxapdWCLKbWjVD/eBmS87HwLAmUIe6GxE+zUZQqxMyQ
X-ME-Proxy: <xmx:WtataggHj0uP_6TybkYXdxuTxyPsf53B4O0Quh53UoBON-9xdma0bg>
    <xmx:WtataqqNplvjuPgQuQrqjH_6dIx9QVzK--GorgmUjCnQ2x4l4svtYA>
    <xmx:Wtatamy32lEPJdAQ6YjwzgQnHs5uAE-B5ihkjWc14B7mcCqo85dMCA>
    <xmx:Wtatapx4ctLTNTpegUqdpuiEktBaGroOnRCoR0Daf94lCA97NoKN5Q>
    <xmx:WtatanpvIbw3Y1zyGvGxPN7WtLdsRQVbALwIUoIH2mDrrpzTx5yvuLGu>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Sep 2026 20:24:57 -0400 (EDT)
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
Subject: [PATCH v6 01/19] selftests/mm: raise the khugepaged test-case cap
Date: Sat, 19 Sep 2026 01:24:31 +0100
Message-ID: <20260919002451.496763-2-kirill@shutemov.name>
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
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 525108cace54..c44bc18f7536 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1290,7 +1290,7 @@ struct test_case {
 	test_fn fn;
 };
 
-#define MAX_TEST_CASES 64
+#define MAX_TEST_CASES 256
 static struct test_case test_cases[MAX_TEST_CASES];
 static int nr_test_cases;
 
-- 
2.54.0

