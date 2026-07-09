Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70741EEBA;
	Thu,  9 Jul 2026 01:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783562125; cv=none; b=t3LwPd55uc/wOwxLFUrGVJKR0wLt3w+rA1FrBWjryKzZlEKEwnDAYT4ttVLn5n6qBlJr4rHKAVD21+m1FGIzyYBAWb5gW3OmDQ5HqUhexhuGA7OHBNCryo980Xcbv+/xuvdLs04M++SIOjyiC+wqkXjHDtWlxyUcCvtcEd8OQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783562125; c=relaxed/simple;
	bh=KUmsBiNsjtKg5Fv6moWN6SPZayBopnQwNBhpkQ6B1+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cm/6PPuhZVnPOzCEOGSQk/7INZWON+jzRPgZCgK9GS6PRj2Qr+Beb8fepYf+6NkvZweiTjNm8w4U0qCEO2vaqnU0OiKIcjSuco89ofoGwZjNSRMTSBqwX+EI3+8W/PrMhZEFGEPBRVUY/Q7nsfoaMz8jFlvWSwDHJ9D1NzLRdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3c4dde187b3911f1aa26b74ffac11d73-20260709
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:abfe4ba2-cac0-4f47-b462-ecca843d3bb0,IP:0,U
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
X-UUID: 3c4dde187b3911f1aa26b74ffac11d73-20260709
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 309357710; Thu, 09 Jul 2026 09:55:18 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
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
Date: Thu,  9 Jul 2026 09:54:04 +0800
Message-Id: <20260709015404.1267976-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a9b3885b-b764-49ce-9335-6efce3e67b77@kernel.org>
References: <a9b3885b-b764-49ce-9335-6efce3e67b77@kernel.org>
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
> > 
> 
> Probably best to add a Fixes: even when not really critical.
> 
> > Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> > ---
> 
> Nothing jumped at me
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks for reviewing. Will add the Fixes tag and post an updated patch.

Best regards,
Hongfu
