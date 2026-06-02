Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C42DC332;
	Tue,  2 Jun 2026 04:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376325; cv=none; b=stL0OQnkSVy/43tQ1jHZ/gNWMTasZ8Qidch11Y5d6lM8MF8PEc+dtqFnjC/2TSd5QfqTRylbNxiGosCA2xeADPKcGPjEHDh0cshcF5SkM6XRm8+UiAGHYPfx9/OxuppZN/iw96MUbKPYE27zqErIhmB6XKLEcn1CxsWcjOqdkUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376325; c=relaxed/simple;
	bh=djkWX4Hi1PC3akGAsoUVJU4ekn4QqRF0xahihutbiKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUiXC/P74FeMFZxoviKF24txo4IYR3KZxkBE2a5lv3yAbHvvU2BHsOm6niFEhLejdQc+ErfsEQO6UfyEiJ9h5xEV66iujwN6NMG8wn8FeMMByg3FeLL85MkBeBD7KQubxDlmYVgT7D5Trw2u67gxakA8OFfaBcFx23gFt23HEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b5d3bd5a5e3f11f1aa26b74ffac11d73-20260602
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, UD_TRUSTED, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5042bfde-d3af-422d-b906-80343846f216,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:5042bfde-d3af-422d-b906-80343846f216,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:468d7e58709b32c741750523244e7009,BulkI
	D:260602071707M3QLEKGM,BulkQuantity:1,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|136|817|841|850|865|898,TC:nil,Content:-10|-8|-5|14|50,EDM:-3,
	IP:-2,URL:11|94|82|1,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b5d3bd5a5e3f11f1aa26b74ffac11d73-20260602
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 420245183; Tue, 02 Jun 2026 12:58:35 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
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
Subject: Re: [PATCH v5 0/4] selftests/mm: refactor pkey helpers and fix mmap error handling
Date: Tue,  2 Jun 2026 12:58:31 +0800
Message-Id: <20260602045831.1385324-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601161656.203154d9f53c2861f1bb2623@linux-foundation.org>
References: <20260601161656.203154d9f53c2861f1bb2623@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > The main changes in this series are to refactor shared tracing and assertion
> > helpers into a common file, unify both pkey selftests on pkey_assert() and 
> > per-test tracing for consistent diagnostics, and add missing mmap() return 
> > checks with MAP_FAILED used throughout for readability and consistency.
> 
> Thanks.  AI review found a couple of legitimate-looking issues.  At
> least one of these was also reported against the v2(?) series and you
> said you'd take a look.  Were these things false positives?
> 
> 	https://sashiko.dev/#/patchset/20260601061953.696844-1-lihongfu@kylinos.cn

Thanks for pointing these out.
I initially suspected this one was a false positive, but upon recheck, 
it also needs a fix. I will address both issues in the next revision.

Best regards,
Hongfu
