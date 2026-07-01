Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C324F3FD96E;
	Wed,  1 Jul 2026 10:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902042; cv=none; b=iSwig1+usCUhTkQpmU3qepbF1S3QJTVmbPdPdhRrj+9OdVGBaFippcIBAyW6tVAXf8isqJHneRPhl1/76AJg3X01konRaSEC3XicDyeUx/XGpWQ/5rDZBZubW8YEdrB7rDPuuqjKmZKjminNh82w8GoBYY2VQT7zPY4ZpyrV6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902042; c=relaxed/simple;
	bh=EDagRsk6yT9OpgA0k7dLQ2MuSjAuTG0RtfOvdmSWJO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pRU02ryYsTAjT3/LcOYa0lJvZKSwdUop9DYkPT8wXEtkyF36FidGSpBJClXxxumOako+JghgasWYNqTV+o0jtlSH8n3PQp3m4YoLo4zoxb6ScsB6zdhMuDG6hbXiDYAQosHSMTjeRRhONEjGZaRe6dTVKSduxRU+X3aQcMjSusU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 59c765ec753811f1aa26b74ffac11d73-20260701
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
X-CID-O-INFO: VERSION:1.3.12,REQID:fec1accb-4499-4070-bc03-1739f843941f,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:fec1accb-4499-4070-bc03-1739f843941f,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:c2b7554a1cb8331f306b33837f8e295f,BulkI
	D:260701164826BQSDSSH8,BulkQuantity:3,Recheck:0,SF:10|64|66|78|80|81|82|83
	|102|127|841|850|865|898,TC:nil,Content:-10|0|15|50,EDM:-3,IP:-2,URL:0,Fil
	e:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 59c765ec753811f1aa26b74ffac11d73-20260701
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 900317000; Wed, 01 Jul 2026 18:33:51 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: kevin.brodsky@arm.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	hongfu.li@linux.dev,
	jhubbard@nvidia.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
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
Subject: Re: [PATCH v8 2/5] selftests/mm: unify pkey sighandler selftest assertions and tracing
Date: Wed,  1 Jul 2026 18:33:32 +0800
Message-Id: <20260701103332.352021-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d8a1c72d-831e-4880-ac00-5aeac41ceeaa@arm.com>
References: <d8a1c72d-831e-4880-ac00-5aeac41ceeaa@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

> >  #include <sys/types.h>
> > @@ -36,6 +35,10 @@ static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
> >  static pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
> >  static siginfo_t siginfo = {0};
> >  
> > +int iteration_nr = 1;
> > +int test_nr;
> > +int dprint_in_signal;
> 
> Might as well define those in pkey_util.c as well (move them in patch 1
> too).

Thanks for the suggestion. I'll move test_nr, iteration_nr and
dprint_in_signal into pkey_util.c in patch 1/5 and drop the duplicate
definitions from protection_keys.c and pkey_sighandler_tests.c.

> > [...]
> >  
> >  	/* Use clone to avoid newer glibcs using rseq on new threads */
> > -	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
> > +	ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
> >  			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
> >  			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
> >  			     CLONE_DETACHED,
> 
> Align these lines to the opening (.

Thanks for catching that. I'll align the clone_raw() argument lines to
the opening '(' in the next version.

Best regards,
Hongfu
