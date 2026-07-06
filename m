Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B65303C9C;
	Mon,  6 Jul 2026 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333944; cv=none; b=YeYzLWRHjgAQ39cU3GbA1b6CxJ5Scu7NDhRbUD/uamhusSOtbPPDG5v6NVRvs8VYlI33Kpf8skMmEevD/gP3OPUQyx7bxgIuM2zNvxeuPO/ynU7o4obj2UuX4uCu+B04IXPXC65bHa6L85xy0EuGbT9w/InbdUP+5Ma8/neYa9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333944; c=relaxed/simple;
	bh=sqanHEo/cHDJEwMS8kl/GOliyAuEokEWzQh38F+MVwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=quD2CgB/qxFLdov/zhwU+OX9P2aqI0UB1KWRrCIc0GCIm9vXYAZeY+z87L5EblAaz4PhJ5fHBBNe9Sb73yMn1cEzQq8cMNA4JKg6Lb+AkBGTW+SjUEzLQLzYwsqbvHNULjCM203wqrcgdIE6veu4FZcm2Li0v3URotjr38k5zsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f559448a792511f1aa26b74ffac11d73-20260706
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
X-CID-O-INFO: VERSION:1.3.12,REQID:3b99b28f-9c22-4c81-99c5-564192bb4652,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:3b99b28f-9c22-4c81-99c5-564192bb4652,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:a5810aaf9e41aedb88353a90b9405af6,BulkI
	D:260706172852M3XCK1II,BulkQuantity:1,Recheck:0,SF:10|64|66|78|80|81|82|83
	|102|127|841|850|865|898,TC:nil,Content:-10|0|15|50,EDM:-3,IP:-2,URL:0,Fil
	e:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f559448a792511f1aa26b74ffac11d73-20260706
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1786583648; Mon, 06 Jul 2026 18:32:16 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
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
Subject: Re: [PATCH v9 1/5] selftests/mm: move pkey selftest helpers to pkey_util.c
Date: Mon,  6 Jul 2026 18:31:43 +0800
Message-Id: <20260706103143.3638104-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <436863f8-5840-4c3f-82ec-c55b46fb9969@kernel.org>
References: <436863f8-5840-4c3f-82ec-c55b46fb9969@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

> > diff --git a/tools/testing/selftests/mm/pkey_util.c b/tools/testing/selftests/mm/pkey_util.c
> > index 255b332f7a08..fbef3cd45447 100644
> > --- a/tools/testing/selftests/mm/pkey_util.c
> > +++ b/tools/testing/selftests/mm/pkey_util.c
> > @@ -2,9 +2,99 @@
> >  #define __SANE_USERSPACE_TYPES__
> >  #include <sys/syscall.h>
> >  #include <unistd.h>
> > +#include <fcntl.h>
> > +#include <stdio.h>
> > +#include <string.h>
> >  
> >  #include "pkey-helpers.h"
> >  
> > +int iteration_nr = 1;
> > +int test_nr;
> > +int dprint_in_signal;
> > +
> > +#if CONTROL_TRACING > 0
> 
> Who sets that CONTROL_TRACING? And if it's nobody, why are we dragging this along?

Thanks a lot for your comment.

CONTROL_TRACING is disabled by default. It can be enabled at build time
with -DCONTROL_TRACING=1 to capture extra debug info via ftrace for pkey
failure debugging. This patch just moves the tracing and abort-hook code
to the shared pkey_util.c, fully retaining the original opt-in debug logic.
This is based on my understanding of the existing code design, are
there any corner cases I overlooked?

Best regards,
Hongfu
