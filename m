Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9383F44FF;
	Tue, 19 May 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182190; cv=none; b=iWaT/KMNCOC8IhwFmcHUCPKmf1FfysKU6a8xUkz4DedGn7xnDPe62gOJJieTNmtVxicm96kRa4Qw1DFuMVs1P9ruTR5WwhPBDSDe1YgqU9ozFLHe/UfYhSC3M3/P5EVsNFgB+PjadgQMRlPuGo+bpu15XOfV3pySG1L4WCkzhmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182190; c=relaxed/simple;
	bh=FoBE0nSiaVzk2xaASMId03qAuSJIPVnnw0Bgr2KhKWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kd8Bho0nvXGu2hsCtNp2qZtpem80AQgEnHLckbFcyMPUefm7iDGXVYikXfKzLUtfMNsAe+CSIFpFL0U46+RS0Vpz4WGpx8tKT1MyNQuCAiszhs78IJXzav7gwgCB0h6ogrk6cZ8h+n7jfh67Edjo6cudbq4KrKbIORdcx7bYBIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 657c10b4536311f1aa26b74ffac11d73-20260519
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
X-CID-O-INFO: VERSION:1.3.12,REQID:4252f72c-b1ac-4e28-b87e-78c2d2341d81,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:4252f72c-b1ac-4e28-b87e-78c2d2341d81,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:4dc14c1a2be4675df48136712318458a,BulkI
	D:2605181845419VVZWHTH,BulkQuantity:2,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|841|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,F
	ile:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 657c10b4536311f1aa26b74ffac11d73-20260519
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1493652913; Tue, 19 May 2026 17:16:19 +0800
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
Date: Tue, 19 May 2026 17:16:26 +0800
Message-Id: <20260519091626.371028-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <agrrp5fRWWuMSoYB@lucifer>
References: <agrrp5fRWWuMSoYB@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo, 
Thanks for the review comments.

> Hmm you're sending this separete from the other MAP_FAILED checks, and not
> referencing that in any way? (original patch at [0]).
> 
> Please just send this as a 2 patch series _with a cover letter_ and both patches
> in-reply-to the cover letter.
> 
> Also make sure to propagate tags correctly.
> 
> [0]:https://lore.kernel.org/all/20260513095609.789935-1-lihongfu@kylinos.cn/

The first patch has already been merged into the mm-new branch:
https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-new&id=ffe64def0071989cff47b5525d38f5e558c637c3

For this reason, I split this one out separately to avoid confusion.

> On Mon, May 18, 2026 at 04:21:20PM +0800, Hongfu Li wrote:
> > Several mmap() calls lack error checks and would crash on failure.
> > Add the missing checks. Also replace bare (void *)-1 with the
> 
> Well you're assert()'ing so you're causing a crash on failure anyway?
> 
> I'd just say that you are adding missing checks against the mmap() return value,
> as well as improving readability and consistency by replacing (void *)-1 with
> MAP_FAILED in instances where that was used rather than MAP_FAILED.

Thanks for pointing this out, I will correct it in v2.

> > diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > index 302fef54049c..4637809192f9 100644
> > --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> > @@ -317,6 +317,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
> >  	/* Set up alternate signal stack that will use the default MPK */
> >  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
> >  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > +	assert(sigstack.ss_sp != MAP_FAILED);
> 
> Why not pkey_assert()?
> 
> >  	sigstack.ss_flags = 0;
> >  	sigstack.ss_size = STACK_SIZE;
> >
> > @@ -490,6 +491,7 @@ static void test_pkru_sigreturn(void)
> >  	/* Set up alternate signal stack that will use the default MPK */
> >  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
> >  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > +	assert(sigstack.ss_sp != MAP_FAILED);
> 
> Why not pkey_assert()?

protection_keys.c executes numerous tests in loops across multiple iterations, 
so the test_nr and iteration_nr printed by pkey_assert help easily locate the 
exact failed test case and iteration.
In contrast, pkey_sighandler_tests.c consists of only a few standalone test 
functions invoked once each, so plain assert providing file and line information
should suffice to locate failures.

> > @@ -1775,7 +1776,7 @@ int main(void)
> >  		printf("running PKEY tests for unsupported CPU/OS\n");
> >
> >  		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> > -		assert(ptr != (void *)-1);
> > +		assert(ptr != MAP_FAILED);
> 
> Probably best to convert to pkey_assert() at the same time?

This is a pre-test initialization path that runs before the test
loop, so test_nr and iteration_nr (used in pkey_assert for diagnostic
output) are not yet set up at this point.  
Would using plain assert() here be more appropriate?

Best regards,
Hongfu
