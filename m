Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE82D2E285C;
	Wed, 20 May 2026 04:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779250609; cv=none; b=JLVlPCh/IsZv7jJa7OVBFOltgi0S1Siqnh57tJTdqDYdhMRmM/JpB9tDHsrOAXskekXI9fYKKcIlRKKXNMPORjh9maSMAklWMB9d95px/pPnUF6fbFEPduB3FRsPj1uS152GxJzB4ObNtab4JWdeCF9NiVAWUCfguF/kz7sMPvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779250609; c=relaxed/simple;
	bh=3q2swpQutXOvHLosAM/vVg0m34sksWu1sTEz43YbwAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TrKzEkXj0d10oOzZys1TIxi4ry2tv+XBoyZCkvR84/72Ln//xI5BfBa1qdHZVAlzGrR/JWFChUtikNXAdsH2HYf3zTGl8Wvlr6gRRsRT5XxVtlh0vUu1XTPthTQElQas27lWFvLuwf9Z2y5BLI2QF8UqAkB+8HCptyj7UiMZOGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b2d68494540211f1aa26b74ffac11d73-20260520
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI, GTI_FG_IT
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:80552c14-c673-486f-b9f5-1666631c09a2,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:80552c14-c673-486f-b9f5-1666631c09a2,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:10efe0c6901569e13e43ff5ec646dd9f,BulkI
	D:2605181845419VVZWHTH,BulkQuantity:6,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|841|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,F
	ile:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b2d68494540211f1aa26b74ffac11d73-20260520
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(183.242.174.22)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1743845547; Wed, 20 May 2026 12:16:39 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH] selftests/mm: add missing mmap() return checks in pkey tests
Date: Wed, 20 May 2026 12:16:27 +0800
Message-Id: <20260520041627.912766-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <agwvkyXSlZ-Suz7j@lucifer>
References: <agwvkyXSlZ-Suz7j@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo,
Thanks for the review comments.

> > > Hmm you're sending this separete from the other MAP_FAILED checks, and not
> > > referencing that in any way? (original patch at [0]).
> > >
> > > Please just send this as a 2 patch series _with a cover letter_ and both patches
> > > in-reply-to the cover letter.
> > >
> > > Also make sure to propagate tags correctly.
> > >
> > > [0]:https://lore.kernel.org/all/20260513095609.789935-1-lihongfu@kylinos.cn/
> >
> > The first patch has already been merged into the mm-new branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-new&id=ffe64def0071989cff47b5525d38f5e558c637c3
> >
> > For this reason, I split this one out separately to avoid confusion.
> 
> Hmm ok so you sent a v2 that was rejected [1], you were given feedback for a
> respin but the v1 has been taken + not updated?... That's really not how the
> process is supposed to work :/
> 
> Bit of a mess, Andrew - maybe best to keep the v1 then, and Hongfu - you can
> respin this as requested?
> 
> [1]: https://lore.kernel.org/all/20260513095609.789935-1-lihongfu@kylinos.cn/

Sorry for the messy patch arrangement before, I'll respin this patch strictly
following your requirements.

> >
> > > On Mon, May 18, 2026 at 04:21:20PM +0800, Hongfu Li wrote:
> > > > Several mmap() calls lack error checks and would crash on failure.
> > > > Add the missing checks. Also replace bare (void *)-1 with the
> > >
> > > Well you're assert()'ing so you're causing a crash on failure anyway?
> > >
> > > I'd just say that you are adding missing checks against the mmap() return value,
> > > as well as improving readability and consistency by replacing (void *)-1 with
> > > MAP_FAILED in instances where that was used rather than MAP_FAILED.
> >
> > Thanks for pointing this out, I will correct it in v2.
> >
> > > > diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > > > index 302fef54049c..4637809192f9 100644
> > > > --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > > > +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > > > @@ -317,6 +317,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
> > > >  	/* Set up alternate signal stack that will use the default MPK */
> > > >  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
> > > >  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > > > +	assert(sigstack.ss_sp != MAP_FAILED);
> > >
> > > Why not pkey_assert()?
> > >
> > > >  	sigstack.ss_flags = 0;
> > > >  	sigstack.ss_size = STACK_SIZE;
> > > >
> > > > @@ -490,6 +491,7 @@ static void test_pkru_sigreturn(void)
> > > >  	/* Set up alternate signal stack that will use the default MPK */
> > > >  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
> > > >  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > > > +	assert(sigstack.ss_sp != MAP_FAILED);
> > >
> > > Why not pkey_assert()?
> >
> > protection_keys.c executes numerous tests in loops across multiple iterations,
> > so the test_nr and iteration_nr printed by pkey_assert help easily locate the
> > exact failed test case and iteration.
> > In contrast, pkey_sighandler_tests.c consists of only a few standalone test
> > functions invoked once each, so plain assert providing file and line information
> > should suffice to locate failures.
> 
> Why would we not want more information here? This argument doesn't hold any
> water, please use pkey_assert().

Sure, I will use pkey_assert() and adjust it in the next revision.

> > (BTW This reads like an AI generated sentence. We're fine with you using AI to
> > assist with English for instance, but please make sure it's your own thoughts!)
 
 Sorry for that! I only use AI to polish my English expressions, and all the ideas
 are totally my own.
 
> >
> > > > @@ -1775,7 +1776,7 @@ int main(void)
> > > >  		printf("running PKEY tests for unsupported CPU/OS\n");
> > > >
> > > >  		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> > > > -		assert(ptr != (void *)-1);
> > > > +		assert(ptr != MAP_FAILED);
> > >
> > > Probably best to convert to pkey_assert() at the same time?
> >
> > This is a pre-test initialization path that runs before the test
> > loop, so test_nr and iteration_nr (used in pkey_assert for diagnostic
> > output) are not yet set up at this point.
> > Would using plain assert() here be more appropriate?
> 
> OK that's gross, please just replace it with a test failure kmsg_xxx() whatever
> it is, and a return EXIT_FAILURE; or something since you're in main().

Got it. I will remove the assert here completely, add standard error reporting
and return EXIT_FAILURE directly on failure.

Thanks again for your patient guidance and rigorous review!

Best regards,
Hongfu
