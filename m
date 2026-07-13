Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2125B34040A;
	Mon, 13 Jul 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936061; cv=none; b=NUe7jKvbYS4ov4J8mLT8d+SqUyVIVXzbT0wwfE00G/UavnzxPfN36eVU2R92LCOz0c4uz1q7pE0cn3UITk7Pks3aOwxa63LOwE7FqyvhNgSB0U/1Z3A5OJa49gyHQf83xLRnmkjVFAAOwl6/35OsLrVXhnr/55LEfS9NrdahIT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936061; c=relaxed/simple;
	bh=biFiedicgMMcJVCplTQ7ne5PXu5whq2tWlAOf+mfUI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=giEQaIpt8B9oIEu8utW0xMQ54w4xVHBCFyeTGurwXUipJE1sw14Mx2TPCProWR2wgs4JiIgiGoO5/oTPKssc0O0VymVfE6n+3VwNfjkkGKXkUfNImiDDaNfKZpYBPJ587RyjAI02PQIemx9C57NykkiSygJu3TfkoeaWXLYPozY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: df5f0e927e9f11f1aa26b74ffac11d73-20260713
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_FG_IT
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:60d8362c-6cef-45a9-a263-4c8bf58ea623,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:60d8362c-6cef-45a9-a263-4c8bf58ea623,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:3f7e6dd9bb0a844e91e4071a92d53dab,BulkI
	D:2607131747341JOPC8F2,BulkQuantity:0,Recheck:0,SF:10|64|66|78|80|81|82|83
	|102|127|841|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,File
	:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: df5f0e927e9f11f1aa26b74ffac11d73-20260713
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 185128032; Mon, 13 Jul 2026 17:47:33 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: yanlonglong@kylinos.cn
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	mingo@redhat.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH] selftests/x86/fsgsbase: Check mmap return value
Date: Mon, 13 Jul 2026 17:47:13 +0800
Message-Id: <20260713094713.497199-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260709121323.591-1-yanlonglong@kylinos.cn>
References: <20260709121323.591-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, longlong

> mmap() in main() returns MAP_FAILED on error, but the return value is
> not checked. Subsequent dereferences of shared_scratch (e.g. in
> test_ptrace_write_gsbase) would segfault. Add a MAP_FAILED check using
> err(), consistent with the rest of the file.
> 
> Fixes: 697096b14444 ("selftests/x86/fsgsbase: Fix some test case bugs")
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

Thank you for your patch.
I notice that the fix for this issue has already been addressed by my
previous patch [1]. Could you please take a look?

[1] https://lore.kernel.org/all/20260626094646.1292754-1-lihongfu@kylinos.cn/

Best regards,
Hongfu
