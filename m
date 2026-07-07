Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B423559CA;
	Tue,  7 Jul 2026 03:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394736; cv=none; b=UPnWaCrpEVbz2ijB+6sF1v/cHmqjUnjYZs6UEIlZEGWs+K0Em8Ub0v1ijJlRUQFVvd1/RJrvWPwqUv8UMhgtUC2EVqogMtqm+40aRxAn5csPUjoFU02QlnzOOWLS7r9EebhjlYO9c4rbW/oKlEJa6e582QV16if72uAqZbIhe6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394736; c=relaxed/simple;
	bh=Czg6JlvYcDcAgZCT995EwyC7TpJNK+rKmmwv2rdNYSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jko9mFC2xfrCt3hefFdD1Zj7tRGmnaa8+Z4jr54M9G4+F93jhIvK1vyrAv4K83tIjKG9apvmWdAdK2XemfdK5QazA1pE7VafJPYxUUfgyZjYta9gojJR6B2Ni4PjBEuddWisoWzinNd5VBdrwrUNZoyYKBz18yCPXkAFkUjp8Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7edffda679b311f1aa26b74ffac11d73-20260707
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
X-CID-O-INFO: VERSION:1.3.12,REQID:de2c9d99-1ad0-48d0-a199-11bd1859cbc1,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:de2c9d99-1ad0-48d0-a199-11bd1859cbc1,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:8f47211fc9ae32c51164c1a04e61ee7a,BulkI
	D:260707072851LA5JZ863,BulkQuantity:1,Recheck:0,SF:10|64|66|78|80|81|82|83
	|102|127|136|841|850|865|898,TC:nil,Content:-10|0|15|50,EDM:-3,IP:-2,URL:0
	,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7edffda679b311f1aa26b74ffac11d73-20260707
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 647136457; Tue, 07 Jul 2026 11:25:25 +0800
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
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	usama.anjum@collabora.com,
	vbabka@kernel.org,
	yury.khrustalev@arm.com,
	zwisler@google.com
Subject: Re: [PATCH v10 0/6] selftests/mm: refactor pkey helpers and fix mmap error handling
Date: Tue,  7 Jul 2026 11:25:06 +0800
Message-Id: <20260707032506.4155410-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706162841.b34d9bc1ba1aaa4be4f6254e@linux-foundation.org>
References: <20260706162841.b34d9bc1ba1aaa4be4f6254e@linux-foundation.org>
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
> Thanks, I've updated mm.git to this version.
> 
> > v10:
> > - Add patch 6/6 to fix a pre-existing cleartid race: remove unused
> >   settid/cleartid clone flags and wait for the clone child to exit in
> >   the sigsegv test.
> 
> Below is how v10 altered mm.git.  As you mentioned, this is all from
> the addition of [patch 6/6].
> 
> btw, I thought the official way to wait for a child thread to exit is
> pthread_join()?  Why is that sched_yield() loop used?

Thanks a lot for your question.

As I understand it, the primary reason is pthread_create automatically
enables rseq on all threads, which corrupts the isolated pkey signal
handling kernel context this selftest is designed to exercise. We use
raw clone_raw explicitly to avoid rseq interference as noted in the
code comment.

Besides, pthread_join cannot work here. Since the thread is created via
raw clone instead of pthread_create, it is not tracked by libpthread at
all, so invoking pthread_join with its TID will return EINVAL.

Best regards,
Hongfu
