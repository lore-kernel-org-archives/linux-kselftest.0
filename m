Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D2A348C62;
	Fri, 29 May 2026 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042348; cv=none; b=RURPDdZhwD4X8CFgAWGbrFGvhflkvieRtKeHV8meSXsJaZoehn/w/n1+5Rs3sKkKRgJb6USUZnNx+rWP2n+4x3cluRpLAfYIVUtaHBgKarUG6wufswkgaW/vRMOd4RyWJPd+/m3gi8I+kZNQjTzc3xaweGl3+jlct9eveog43f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042348; c=relaxed/simple;
	bh=oL7r6482501IqkmytXyyVydBBzp1xm0tUePTobderxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oqS24UQ1D8N1rpV+GE+dquuIK9bi0r65ojZRVjxU7xsD/0hVRycC2wBkBQuQyB0/Cnd2U8hP9DkdHHIIuYWiavXND80RRsFOgmEKVWbYlBw0dRyYrODF6cyfVUj5XlZBi3vOWxfWRUr/cXTvvM7ctf81tvx7XtFyH+U3IWqdNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1c7cb8de5b3611f1aa26b74ffac11d73-20260529
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_DIGIT_LEN
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_AS_FROM, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:37cd39e0-22c4-42c6-9d62-d1353e358d8b,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:37cd39e0-22c4-42c6-9d62-d1353e358d8b,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:c93644fa71fee3f4c383b2cb6f1dd880,BulkI
	D:260529161219XE6V6BAX,BulkQuantity:0,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|817|841|850|865|898,TC:nil,Content:-10|-8|-5|14|50,EDM:-3,IP:-
	2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1c7cb8de5b3611f1aa26b74ffac11d73-20260529
X-User: lihongfu@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1288081750; Fri, 29 May 2026 16:12:18 +0800
From: Hongfu Li <lihongfu@kylinos.cn>
To: lihongfu@kylinos.cn
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH v4 1/4] selftests/mm: move pkey selftest helpers to pkey_util.c
Date: Fri, 29 May 2026 16:12:24 +0800
Message-Id: <20260529081224.2839473-1-lihongfu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260529071633.2807814-2-lihongfu@kylinos.cn>
References: <20260529071633.2807814-2-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>  #include <sys/syscall.h>
>  #include <unistd.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <string.h>
>  
>  #include "pkey-helpers.h"
>  
> +#if CONTROL_TRACING > 0
> +static void cat_into_file(char *str, char *file)

Sorry, I sent the wrong patch file by mistake.

There are three issues in the current patch: the three new functions
in pkey_util.c (cat_into_file, tracing_on and tracing_off) should be
 defined as non-static. I will fix all of them in a later version.

Please ignore these three issues during review.
