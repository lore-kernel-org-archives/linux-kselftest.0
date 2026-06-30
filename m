Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4842AA6;
	Tue, 30 Jun 2026 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782784123; cv=none; b=nMUX/wU9umRGkyaEvsPMhpyITkVtscLPW1nou9OMc2y1mCV5fmzCI3wokqQnvN4NJXGK0rKkZUdAdTOoPSgMcunBZEQTr0141QvZLmyvY9ZFa0uSdBFJ6m3X7YYZ3CFFGIdn/4gCWMMirSP7Ajc9wgKcm4cI6bh8nXar6IET0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782784123; c=relaxed/simple;
	bh=7QY0UhBz5VmC+6WpkX0BwFpI7AzbOw9ZKLBPfXxBXnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjPcLLAJklC2LAvh4w1Ki5yZh5SUo69g/WdAjyDKkiaMT7cJ02/T+qcAV5PBEH6VLNT048pBXoZi1emMpSXLOg0BLhSrWZ8BEFjz5EbsBO7FZXqF9su1p9KprB9gtKiMe+FIY0UyTcYpDW7CGaJKzJs9PgNZ/wAyW7TAe8NE/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cc8d4f7e742511f1aa26b74ffac11d73-20260630
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
X-CID-O-INFO: VERSION:1.3.12,REQID:27841b02-81fa-46ad-b2d1-45888c62a8a8,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:27841b02-81fa-46ad-b2d1-45888c62a8a8,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:73d97e2976b0796ddf58f3bcb3c88721,BulkI
	D:260630074233XC71B67L,BulkQuantity:1,Recheck:0,SF:10|64|66|78|80|81|82|83
	|102|127|136|841|850|865|898,TC:nil,Content:-10|0|15|50,EDM:-3,IP:-2,URL:0
	,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cc8d4f7e742511f1aa26b74ffac11d73-20260630
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 169727272; Tue, 30 Jun 2026 09:48:31 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	hongfu.li@linux.dev,
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
Subject: Re: [PATCH v7 0/5] selftests/mm: refactor pkey helpers and fix mmap error handling
Date: Tue, 30 Jun 2026 09:47:40 +0800
Message-Id: <20260630014740.3651158-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260629164224.ba45dc18cdef2848950631e4@linux-foundation.org>
References: <20260629164224.ba45dc18cdef2848950631e4@linux-foundation.org>
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
> 
> Thanks.
> 
> >
> > ...
> > 
> >  tools/testing/selftests/mm/pkey-helpers.h     |  4 +-
> >  tools/testing/selftests/mm/pkey-powerpc.h     |  2 +-
> >  .../selftests/mm/pkey_sighandler_tests.c      | 81 ++++++++--------
> >  tools/testing/selftests/mm/pkey_util.c        | 86 +++++++++++++++++
> >  tools/testing/selftests/mm/protection_keys.c  | 95 ++-----------------
> >  5 files changed, 141 insertions(+), 127 deletions(-)
> 
> Unfortunately MAINTAINERS and get_maintainer are often useless in
> selftests.  In this case, I expect the people who wrote and work on the
> pkey tests don't know that this patchset exists!
> 
> Poking around with git-blame or git-log
> tools/testing/selftests/mm/pkey* will show who should be cc'ed.
> 
> So can I ask that you figure that out and send out a v8?

Thank you for the reminder and for taking the time to review.

I will use git blame and git log on tools/testing/selftests/mm/pkey* to
identify the relevant developers and CC them in v8.

Best regards,
Hongfu

