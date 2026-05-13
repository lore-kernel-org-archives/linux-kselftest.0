Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59093A6B8B;
	Wed, 13 May 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670976; cv=none; b=hCY9oCLLafHWw0TF/f0vCvtsx6EfX207u+j5LkIs1ABcI5bFXRzYOzbNG3X/F7UZiJpPvYalYltcNxDYIUptn3YU18g2fu5buMeLOHdQyYt1pVESNo8Q1WN9aIYH6ajD4B1EKlzWpVTYmoxHG2b1BzRKxpnGPCB0984mZzlda+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670976; c=relaxed/simple;
	bh=y8rQbMndo2srFaXh3NkszFiqDDFXnUz6OZVCV/sTT6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OGfAUs7/JYq7rz0yXCLNhs8NJjB3MfZOlukjfAg/JQpydUFUXuwfM6TcyXivzpkARk5zA0E0s5z3EVH/TI3ENVU1z2l/hmGteMIQWi62+InmR9CSMp7paZ+Cxq0LVuo7cL7OiiIbw5wBc4J4Myy4mjewdgWpQcrFDiDb0WOwFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 21e5a3104ebd11f1aa26b74ffac11d73-20260513
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
X-CID-O-INFO: VERSION:1.3.12,REQID:77ded235-1e1c-407b-a79e-b5cc4d0b8cd5,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:77ded235-1e1c-407b-a79e-b5cc4d0b8cd5,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:8fbb76106d7c896d451a9b9b4f497a04,BulkI
	D:260513180600PLGD15QJ,BulkQuantity:4,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|841|850|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil
	,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,D
	KP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 21e5a3104ebd11f1aa26b74ffac11d73-20260513
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 194317941; Wed, 13 May 2026 19:16:04 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	dev.jain@arm.com,
	liam@infradead.org,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH v2] selftests/mm: Fix incorrect mmap() error handling with NULL instead of MAP_FAILED
Date: Wed, 13 May 2026 19:15:22 +0800
Message-Id: <20260513111522.824074-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9e302879-d218-4257-9e2b-e468564b89ea@kernel.org>
References: <9e302879-d218-4257-9e2b-e468564b89ea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi David,
Thanks for your review.

> > mmap() returns MAP_FAILED, which is defined as (void *)-1, on error,
> > not NULL.  Several selftests incorrectly check the return value of
> > mmap() using !ptr or ptr == NULL, which would erroneously treat
> > MAP_FAILED as a valid pointer since MAP_FAILED is non-zero and
> > non-NULL.  This can lead to segfaults when mmap() actually fails
> > under memory pressure.
> 
> Well, your patch also adds more checks where we previously didn't have any checks?

Yes, I added a few checks for the mmap return value, as they were not
handled previously. Perhaps I should also adjust the commit message to
match this change.

> > 
> > Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > ---
> > v2:
> > - Add missing mmap() return value checks in pkey_sighandler_tests.c
> >   and protection_keys.c
> > ---
> 
> [...]
> 
> > diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
> > index 2085982dba69..580bf1668c71 100644
> > --- a/tools/testing/selftests/mm/protection_keys.c
> > +++ b/tools/testing/selftests/mm/protection_keys.c
> > @@ -1217,6 +1217,7 @@ static void arch_force_pkey_reg_init(void)
> >  	 * doing the XSAVE size enumeration dance.
> >  	 */
> >  	buf = mmap(NULL, 1*MB, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> > +	pkey_assert(buf != (void *)-1);
> 
> What's the reason for not using MAP_FAILED?

I tried to keep consistency with the existing mmap handling pattern in protection_keys.c.
That said, using MAP_FAILED would indeed be more appropriate.
I'll adjust this and send out a v3 shortly.

Best regards,
Hongfu
