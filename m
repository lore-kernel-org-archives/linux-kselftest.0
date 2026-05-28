Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F136BCCA;
	Thu, 28 May 2026 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956991; cv=none; b=YTItZfVELQz0mqC6XbhMILREJtVazuAXea2ukNO0NS3Mjas/AL+kl6C1rmv8ESsS4oUPO/srYDR+6K0CZEA/2jd77Iz85vywBm3zdl+u1y8IijDhfyysAw92iPRus1nJ5hhOozlnhH98aoPA8xcAG47O7QnwimNderQIST3pAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956991; c=relaxed/simple;
	bh=ihIVDOfRLd1mDjf30qmPzKPb/0ookHW6T4ICDGPf+ik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T0X9/qVX/kP42R554RDgT3AZpAukzkN+KyBHTbyZOwxsrBapGA+9jHvCUPFxIRvUJjaYA0c2XIwEL4/jHySIY5HcR+An74JZUm3FFTH7lRGE2PJvbJCQbP5rB2srKBBL9h9zyDDQ0bVO8DRP1X6Q2xGa9mlH65euoXV1jrznyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5f56d2d85a6f11f1aa26b74ffac11d73-20260528
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
X-CID-O-INFO: VERSION:1.3.12,REQID:e6b2ad58-eef1-4f5f-9207-726362c184e8,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:e6b2ad58-eef1-4f5f-9207-726362c184e8,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:0b48ced4fbb6c8167dbe113e56e41c41,BulkI
	D:260526040209ZS2AJ5N5,BulkQuantity:4,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|817|841|850|865|898,TC:nil,Content:-10|-8|-5|14|50,EDM:-3,IP:-
	2,URL:94|82|11|99|1,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5f56d2d85a6f11f1aa26b74ffac11d73-20260528
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 232205519; Thu, 28 May 2026 16:29:41 +0800
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
Subject: Re: [PATCH v2 0/2] selftests/mm: refactor pkey helpers and fix mmap error handling
Date: Thu, 28 May 2026 16:29:50 +0800
Message-Id: <20260528082950.2065901-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ahcatXuo1pI9Z59G@lucifer>
References: <ahcatXuo1pI9Z59G@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > > > This series is version 2 of the previous patch [0].  In v2, the changes are
> > > > split into two patches for easier review.
> > > > [0] https://lore.kernel.org/all/20260518082120.3890552-1-lihongfu@kylinos.cn/
> > > >
> > > > The main changes in this series are to refactor shared tracing and assertion
> > > > helpers into a common file, unify both pkey selftests on pkey_assert() and
> > > > per-test tracing for consistent diagnostics, and add missing mmap() return
> > > > checks with MAP_FAILED used throughout for readability and consistency.
> > >
> > > Thanks.  AI review seems to have found a legitimate problem:
> > > 	https://sashiko.dev/#/patchset/20260525073026.27594-1-lihongfu@kylinos.cn
> >
> > Thanks. I'll go through the problem reported by the AI review and make
> > corresponding fixes in v2.
> 
> You mean v3? :P

Oh sorry, my mistake. It should be v3, and I've already sent it out.
Here is the link:
https://lore.kernel.org/all/20260527013825.1134225-1-lihongfu@kylinos.cn/

Best regards,
Hongfu
