Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAA32F8E8C;
	Thu,  9 Jul 2026 02:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783562599; cv=none; b=iCfRGhm1wOYzOGPpdiF5zSdwKwhhQiH4WA3IEIvKyr1jQQbpNyT08sVcwJ0nWoW0tBdiPL+9BaGA4mFZATz4GGgGWrkhUSn6fG3ONf4Or3OtrDtbfA6jd+HwNn2rZGTJJJypjrtz45o5U4lqaODqPbZrVJrpViutgQrGp4y7Xj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783562599; c=relaxed/simple;
	bh=n+LoakVduko/iDDFmtU+tbH7dST+7uZd/cYpBsYGVcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hK21RTj5jmcQn96FadgubRuNhDzmrf8J0Q1Z0QFQpm6S6Ls2bw4b7HCujlD4NORFCSSZ3sMWSliYzcu3SHqEjjouc3Gm+4dLLQssrQSJbkx6pPpHFEW6sz6EZb7qdf3PVPlWxzYGuOcyJI2EgzL9ZkMs+xbcW6NA1KjysENnZWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 554f81727b3a11f1aa26b74ffac11d73-20260709
X-CID-CACHE: Type:Local,Time:202607090955+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:554efa85-6dea-4037-98b1-8a24f18eb564,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:fc6c9494758eabc419db5f7bb6b48182,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|850|865|898,TC:nil,Conte
	nt:-10|0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 554f81727b3a11f1aa26b74ffac11d73-20260709
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1842798811; Thu, 09 Jul 2026 10:03:09 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: sj@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	hongfu.li@linux.dev,
	jgg@ziepe.ca,
	leon@kernel.org,
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
Subject: Re: [PATCH] selftests/mm: Fix memleak in migration benchmark
Date: Thu,  9 Jul 2026 10:02:14 +0800
Message-Id: <20260709020214.1271413-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260709010905.128451-1-sj@kernel.org>
References: <20260709010905.128451-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

> > Several early return paths in run_migration_benchmark() skip
> > hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
> > label.
> 
> Looks good to me.
> 
> > 
> > Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> 
> As David suggested, having Fixes: would be nice.  Seems 271a7b2e3c13
> ("selftests/mm/hmm-tests: new throughput tests including THP") could be the
> one?
> 
> Reviewed-by: SJ Park <sj@kernel.org>
> 
> [...]
> >  
> >  	/* Cleanup */
> > +cleanup:
> >  	hmm_buffer_free(buffer);
> > -	return 0;
> > +	return ret;
> 
> A trivial nit.  I think '/* Cleanup */' doesn't really need to be stayed there,
> as the 'cleanup:' label self-explains what it is doing here.

Thanks a lot for your review and suggestions.

I'll add the Fixes tag referencing commit 271a7b2e3c13 and drop the
redundant comment in the next version.

Best regards,
Hongfu
