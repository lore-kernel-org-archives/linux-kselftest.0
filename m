Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357438D6A9;
	Wed, 13 May 2026 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671174; cv=none; b=fOlyxda6yVYsYqYZs4V61vIxW+zCxy4bQtFWsyjdDCMCivJT433ouT1ccR0LdpdX1szlZg5WTkUdTou41Jnq9X5H2lZ2bbhqxbBXCHKHrkcvO2QV1qw/iusQ3tidwVay6QAmtCDeA1Ea9hLhZxXOaEh1il8YyQ10BufApB+l3Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671174; c=relaxed/simple;
	bh=3lKlm6s14m8eEvJ7HI5LMkuOcoqMieUWR7Dl+qBUiYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f7Q2a+rWwmAelgA8dZZhWUKLAzYCwiFAij2SKfLmHb7ZNQM5X4CVW0uUAn5E7+MHuEvLP6TBZxqO2dpTQFED6WxwNSsgkk6H7nxKeNkTIFsZs2mXz4CQRgeAGzbwuX2rRJYdFcCVzcXXx9I8PBCiSj/JgG7BKw7uaJTxA17bTD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 999f8e7a4ebd11f1aa26b74ffac11d73-20260513
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1a7550de-465c-4d02-9b00-f384ec28b4e9,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:1a7550de-465c-4d02-9b00-f384ec28b4e9,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:10036077922ecd3bcab7faee5bb3e2cd,BulkI
	D:260513180600PLGD15QJ,BulkQuantity:6,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|817|841|850|898,TC:nil,Content:-10|-8|-5|14|50,EDM:-3,IP:-2,UR
	L:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 999f8e7a4ebd11f1aa26b74ffac11d73-20260513
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1006308994; Wed, 13 May 2026 19:19:25 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	dev.jain@arm.com,
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
Subject: Re: [PATCH v2] selftests/mm: Fix incorrect mmap() error handling with NULL instead of MAP_FAILED
Date: Wed, 13 May 2026 19:20:00 +0800
Message-Id: <20260513112000.825625-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <agRX7BXxuv-VWqN4@lucifer>
References: <agRX7BXxuv-VWqN4@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > mmap() returns MAP_FAILED, which is defined as (void *)-1, on error,
> > not NULL.  Several selftests incorrectly check the return value of
> > mmap() using !ptr or ptr == NULL, which would erroneously treat
> > MAP_FAILED as a valid pointer since MAP_FAILED is non-zero and
> > non-NULL.  This can lead to segfaults when mmap() actually fails
> > under memory pressure.
> >
> > Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> 
> You forgot my tag :)
> 
> Also, please do not send a respin right away if you can, multiple revisions in
> one day can be tricky to deal with.
> 
> As per David's points - please update the commit message to reflect the fact
> you've added a missing assert too and replace the (void *)-1 with MAP_FAILED.

Thanks for the reminder. I will avoid sending a quick respin within the
same day, and I'll update the commit message to mention the added assert
check, and replace (void *)-1 with MAP_FAILED in the next version.
