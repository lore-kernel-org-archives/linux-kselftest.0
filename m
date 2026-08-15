Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32D388E44;
	Sat, 15 Aug 2026 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786776032; cv=none; b=aWaO4lIqR8lo3F1Atml6Gt1G5WzfeG0ghMNbtq/CFvi+nd6Iq//JQ9RTuoOoObcaSJdX44YgVzE0WXDVu3y5s4eHxMsL6NhnoBRECC8bzKJZJBBnir26dDFoLb8toRJBnk3rMfJZupQ3G8Y1xduEXJmrB5z+JzZjCRxkXpsPlSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786776032; c=relaxed/simple;
	bh=Le7yXnOh0Fq8lgdN9jj9b3X/79IcFRbxYvs3mE/ScJ4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aRkp7sETfW5C0EX43x/iW8RwJzF5MqyRQuv0r1DCCMWUogHYgQOOv8aViOoB/VkbEed/jgCqVdwVuB2aPj3BIln+WJFjLUTaS+GLmGUzQG/dNrKiAgYHX5chzIzoeCs8Tc0Ep3cmMITUi4Fs4cClO4sBA4spHskZcM15b/cJQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 30ae70e2987411f19a56ed5b684f684d-20260815
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP
	SRC_LOWREP, DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	UD_TRUSTED, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:76122ef1-ab17-477f-92db-8a6a8fcbd9b3,IP:10,
	URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:35
X-CID-INFO: VERSION:1.3.19,REQID:76122ef1-ab17-477f-92db-8a6a8fcbd9b3,IP:10,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:35
X-CID-META: VersionHash:7db8b62,CLOUDID:dc9560921fa6f1c4877ccd567b6f0021,BulkI
	D:260813045119U2ONEQQI,BulkQuantity:1,SF:17|19|64|66|78|80|81|82|83|102|12
	7|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:93|82|11|1,File:nil,
	RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DK
	P:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30ae70e2987411f19a56ed5b684f684d-20260815
X-User: husong@kylinos.cn
Received: from [192.168.1.116] [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1604418485; Sat, 15 Aug 2026 14:40:22 +0800
Message-ID: <cc4f98e2-43c3-49f3-82c3-b38b52286cc4@kylinos.cn>
Date: Sat, 15 Aug 2026 14:40:19 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: husong@kylinos.cn, linux-mm@kvack.org, shuah@kernel.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, peterx@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] selftests/mm: TAP output and global-state fixes
To: Andrew Morton <akpm@linux-foundation.org>
References: <20260812120821.523860-1-husong@kylinos.cn>
 <20260812135106.7709da03e92e0e7f5d8d9a5e@linux-foundation.org>
From: Song Hu <husong@kylinos.cn>
In-Reply-To: <20260812135106.7709da03e92e0e7f5d8d9a5e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Andrew

在 2026/8/13 04:51, Andrew Morton 写道:
> On Wed, 12 Aug 2026 20:08:18 +0800 Song Hu <husong@kylinos.cn> wrote:
> 
>> uffd-wp-mremap and mremap_test never print the TAP header (and mremap_test
>> skips with a bare exit(KSFT_SKIP) rather than a KTAP skip), so their output
>> is not valid KTAP; hugetlb-soft-offline toggles enable_soft_offline during
>> the run and leaves it disabled afterwards.
> 
> Thanks.  AI review found a couple of minor error-path issues, both of
> which look legitimate to me.
> 	https://sashiko.dev/#/patchset/20260812120821.523860-1-husong@kylinos.cn

Agreed, both will be fixed in v2:

- hugetlb-soft-offline: restore via atexit() so it also runs on
  ksft_exit_fail_msg() exits, and use read_num()/write_num() per Mike's
  comment.

- mremap_test: save errno before fclose() in get_mmap_min_addr().

Thanks,
Song

