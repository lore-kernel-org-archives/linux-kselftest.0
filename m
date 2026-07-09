Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004AB28D8DA;
	Thu,  9 Jul 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783566237; cv=none; b=ar+zxJQR6w86PNBwsYmcnTiUy19rwc6Rou2+KhaEQ+2l+V2NQmQyotVshxuwyviOos8oYrddlVyQ6dqczUb5HpDw8d5sOB454tL9os93OPZ6Z+UILsQ3k/WSux7w7RtYWiQfvBVmvcLw4DYj9d3jR2oLM6uwrzyzRnBXc4tB+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783566237; c=relaxed/simple;
	bh=0oxQk0+cRorqgDrgLhM9agFbByyiNqfb9y4sv4MiBYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bD0OI+hMOpw6a7aiguBpTqRoK4i+Ytyz9DGaAbMEdSGwtwoMXJtQ766Xskaxe9Tx6bU5DB0kmQbKg6AbKFJtszTplypO/qwqmXNYMeRb6WdFFF533CFxQN1GATpE+HjMZ5S8MbL5Yoimzzl+Q4E2Qk+qDSTlAbCFUQ6NT/KL4no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ce9ad4a27b4211f1aa26b74ffac11d73-20260709
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_7B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, UD_TRUSTED, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e883fde6-ce4f-4abd-b8f5-b11a700601e7,IP:10,
	URL:70,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:80
X-CID-INFO: VERSION:1.3.12,REQID:e883fde6-ce4f-4abd-b8f5-b11a700601e7,IP:10,UR
	L:70,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:80
X-CID-META: VersionHash:e7bac3a,CLOUDID:0de3d54f95152217951725f6c7d421f6,BulkI
	D:260708211528KWIAZP6K,BulkQuantity:3,Recheck:0,SF:10|38|64|66|78|80|81|82
	|83|127|841|865|898|1209,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:11|14|93|
	82|1,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_ULN,TF_CID_SPAM_UPP,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ce9ad4a27b4211f1aa26b74ffac11d73-20260709
X-User: lihongfu@kylinos.cn
Received: from [192.168.109.123] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <lihongfu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 717094302; Thu, 09 Jul 2026 11:03:48 +0800
Message-ID: <06b77011-4c48-4d9e-a27e-e50f23e729f6@kylinos.cn>
Date: Thu, 9 Jul 2026 11:03:44 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Fix memleak in migration benchmark
To: Andrew Morton <akpm@linux-foundation.org>, Hongfu Li <lihongfu@kylinos.cn>
Cc: jgg@ziepe.ca, leon@kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708103705.840679-1-lihongfu@kylinos.cn>
 <20260708193721.5aae192c95bd8c7840e9c1b0@linux-foundation.org>
From: Hongfu Li <lihongfu@kylinos.cn>
In-Reply-To: <20260708193721.5aae192c95bd8c7840e9c1b0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/9/26 10:37 AM, Andrew Morton wrote:
>> Several early return paths in run_migration_benchmark() skip
>> hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
>> label.
> Thanks.  Sashiko found a bug:
> 	https://sashiko.dev/#/patchset/20260708103705.840679-1-lihongfu@kylinos.cn

Thanks a lot for the reminder. I'll address it in the next revision of this patch.

Best regards,
Hongfu

