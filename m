Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765C38AC90;
	Thu, 28 May 2026 08:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958648; cv=none; b=WXyXErgt8TqLzY+ni6SnjHAc0sFJdk4F/qIMh6W5U+FxU+5FwMIWpyTxB6Zxlixn0EWVJuwdoVt/sRFj4G2iAFMF1qxLiMzYWSHZGdzpXP5fTwwD/TIeNT22bWQuMoXYoEhJbbHH6ezIljsKLaA+hvvu+SRmCMarcvaWaR8rlvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958648; c=relaxed/simple;
	bh=9GiwRVnmbgEtUPEJtjyjTYBFb1KbLHuT/B74L8VrEZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1iq7+5JKB6rtsq1/xD9evh5t8MFKJNoXPu4zp/UWHExcnBgd8KBNzjLkTBZhp7E68xYoUVJjca/esN/D61Y/MQJv92Pnu2mHUKfUuOHh4ozlSFaHpfpE/0PlGCuaEYUlCoHzGu5ZY+ckPugSeQYnD5SbSUwD487s7jV5kCXHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3bdfc95a5a7311f1aa26b74ffac11d73-20260528
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:df20b873-9c04-479a-a4a1-04fc1ba33759,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:df20b873-9c04-479a-a4a1-04fc1ba33759,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:57a1a66449976c9d5c924b021e3adc41,BulkI
	D:260527193702VLU0MBA7,BulkQuantity:1,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|817|841|850|865|898,TC:nil,Content:-10|-8|-5|14|50,EDM:-3,IP:-
	2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3bdfc95a5a7311f1aa26b74ffac11d73-20260528
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 742640666; Thu, 28 May 2026 16:57:19 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: rppt@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH v3 2/2] selftests/mm: add missing mmap() return checks in pkey tests
Date: Thu, 28 May 2026 16:57:46 +0800
Message-Id: <20260528085746.2076957-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ahbXTqLLLcYmeTp2@kernel.org>
References: <ahbXTqLLLcYmeTp2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > @@ -1693,7 +1694,10 @@ int main(void)
> >  		printf("running PKEY tests for unsupported CPU/OS\n");
> >  
> >  		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> > -		assert(ptr != (void *)-1);
> > +		if (ptr == MAP_FAILED) {
> > +			perror("mmap");
> > +			return EXIT_FAILURE;
> > +		}
> 
> Just stick to pkey_assert() everywhere, it already prints errno and exits.

This is a pre-test initialization path that runs before the test loop,
so test_nr and iteration_nr are not yet set up for pkey_assert().

Should we just use their initial values here directly?
 
> >  		test_mprotect_pkey_on_unsupported_cpu(ptr, 1);
> >  		exit(0);
> >  	}
> > @@ -1706,5 +1710,5 @@ int main(void)
> >  		run_tests_once();
> >  
> >  	printf("done (all tests OK)\n");
> > -	return 0;
> > +	return EXIT_SUCCESS;
> 
> Completely unrelated and not needed.
> 
> And you may want to base your work on mm-unstable to get up to date version
> of protection_keys tests.

Sure, I will base my changes on top of the latest mm-unstable branch.

Best regards,
Hongfu
