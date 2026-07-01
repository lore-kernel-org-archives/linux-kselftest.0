Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186A28CF6F;
	Wed,  1 Jul 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898481; cv=none; b=sS5uN76ugA8L8swJ4G5YyEEMiz7M+7W+RFXqlvMcB8vx+tFKA13ht8O7KtWZ2hZF3dpk1xRUkERbIKr9TgEPQ0pjrvgT52rFyShj+8KyKVj494EgN1ICW8qZK1JAxkuE4H5D1UPuwLLJnjDJqS8099HUU8OpuZ8x8Tu4qDELoY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898481; c=relaxed/simple;
	bh=xX13PiO7hguErc1lcGFMzAQXfSAUuh09N4sqpwUb+no=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CZD1LHojgo/FFkzktWlNOtKAu+tHsmjRsPX5iP3qO2gwzACX9isY1458NBu0etV6GsfOEDrzmLMjpueGithdgQTOaMjCaGWWL+AVSWQChTEE71mCFIJ/h169ap0MhfytvsQXDqnG6F6uttAWfrFYKtdgxrAZclKb5B7zKJ2rJZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1113b10a753011f1aa26b74ffac11d73-20260701
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, UD_TRUSTED, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:970d99d4-8253-4c56-8368-b9c69dd2b073,IP:10,
	URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:5,RULE:Release_Ham,ACTIO
	N:release,TS:40
X-CID-INFO: VERSION:1.3.12,REQID:970d99d4-8253-4c56-8368-b9c69dd2b073,IP:10,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:5,RULE:Release_Ham,ACTION:
	release,TS:40
X-CID-META: VersionHash:e7bac3a,CLOUDID:8b8402ad9c21dcc999cbdb798ff47165,BulkI
	D:260701015715N11G8GYR,BulkQuantity:4,Recheck:0,SF:10|64|66|78|80|81|82|83
	|102|127|136|841|850|865|898,TC:nil,Content:-10|0|15|50,EDM:-3,IP:-2,URL:1
	1|95|82|1,File:nil,RT:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FCD,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1113b10a753011f1aa26b74ffac11d73-20260701
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 52202154; Wed, 01 Jul 2026 17:34:33 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	hongfu.li@linux.dev,
	jhubbard@nvidia.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	kevin.brodsky@arm.com,
	liam@infradead.org,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	maddy@linux.ibm.com,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	usama.anjum@collabora.com,
	vbabka@kernel.org,
	yury.khrustalev@arm.com,
	zwisler@google.com
Subject: Re: [PATCH v8 0/5] selftests/mm: refactor pkey helpers and fix mmap error handling
Date: Wed,  1 Jul 2026 17:33:50 +0800
Message-Id: <20260701093350.324357-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260630222022.60d0951b90af8857971ad10c@linux-foundation.org>
References: <20260630222022.60d0951b90af8857971ad10c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

> > The main changes in this series are to refactor shared tracing and assertion
> > helpers into a common file, unify both pkey selftests on pkey_assert() and 
> > per-test tracing for consistent diagnostics, and add missing mmap() return 
> > checks with MAP_FAILED used throughout for readability and consistency.
> > 
> 
> Thanks, I'll get this into mm.git for testing.
> 
> AI review read the pthread_create() manpage and didn't like
> pkey_assert().  Please take a look?
> 
> 	https://sashiko.dev/#/patchset/20260630073235.3802271-1-lihongfu@kylinos.cn

Thanks for your reply and the plan to queue this into mm.git for testing.

I've gone through the Sashiko feedback regarding pkey_assert().
I agree this part needs adjustment, and I will fix this issue in the next
revision of the patch series.

Best regards,
Hongfu

