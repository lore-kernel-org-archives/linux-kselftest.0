Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108E138735E;
	Sat, 15 Aug 2026 06:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786775949; cv=none; b=axkiJMhR3cKYK4LZrETd71sUTpwxkuLkP+NXvZTtro6U7dfsPkP5Xi7IwgIfJsj+3DdGE4GneHu6e7HWIb9P78p5U42kteRLRlGsq3oHTw13neTZ3g4gHOBXIQjlTNLV0UeIOcxRs5nqzVfYRsvf1qzOYnZ+4LPZgoED7Es5iBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786775949; c=relaxed/simple;
	bh=z4zjSVKIpcjkvISs3jycyljsQdm/ZYSErbuMwVWoh1I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nEkgbEGyRzt3T6NNImYWvhiM5fQQsRxNkoEFDtbk+Z+NBaB4nisxqoPLKEefpYfYZa7hDOo6oA8MnFIPmeSMyHZ13l9XBfiIrirjwPP/ls6ESTM4X4pjEMjCiEd5GvL36ZhoI2jKX1QtozQcHwCeceZ76EuX+EIihA+4vAEpi2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fa0409c6987311f19a56ed5b684f684d-20260815
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NAME, HR_TO_NO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED
	IP_LOWREP, SRC_LOWREP, DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fb178eca-0891-4843-ace8-81d671212b4a,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:fb178eca-0891-4843-ace8-81d671212b4a,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:aa11ef74c60a00cac4d399fe696f8f7a,BulkI
	D:260812214313OFOE5GCE,BulkQuantity:1,SF:17|19|38|64|66|78|80|81|82|83|102
	|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil,RT:nil
	,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa0409c6987311f19a56ed5b684f684d-20260815
X-User: husong@kylinos.cn
Received: from [192.168.1.116] [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 702260678; Sat, 15 Aug 2026 14:38:50 +0800
Message-ID: <51e562a7-661e-4581-9e02-ae56b20b9728@kylinos.cn>
Date: Sat, 15 Aug 2026 14:38:47 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: husong@kylinos.cn, shuah@kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, peterx@redhat.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] selftests/mm: emit TAP header and use TAP skip in
 mremap_test
To: Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20260812120821.523860-1-husong@kylinos.cn>
 <20260812120821.523860-3-husong@kylinos.cn>
 <83c5375c-a374-4c51-b564-0b7ca4f4502d@arm.com>
From: Song Hu <husong@kylinos.cn>
In-Reply-To: <83c5375c-a374-4c51-b564-0b7ca4f4502d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi, Sarthak
在 2026/8/14 14:30, Sarthak Sharma 写道:
> Hi Song Hu!
> 
> On 8/12/26 5:38 PM, Song Hu wrote:
>> mremap_test calls ksft_set_plan() without ksft_print_header(), and its
>> get_mmap_min_addr() skip path uses a bare exit(KSFT_SKIP) that prints no
>> TAP line, so its output is not valid KTAP.  Add the header and switch the
>> skip to ksft_exit_skip().
>>
>> Signed-off-by: Song Hu <husong@kylinos.cn>
>> ---
> 
> While running the test, I saw that still some diagnostic lines are being
> printed without being prefixed with a #. This is because of some prints
> in the code of the format:
> 
> ksft_*("...\n\t...")
> 
> which is causing the part after the \n to not be prefixed with a #. If
> you are planning for a respin, maybe you can include this in the same
> patch so that the whole output becomes KTAP compliant :).
> 
Thanks for your review!
Will fix those three call sites in v2.
The fclose()/errno one will also be addressed in v2.
> Rest of your changes look good. Once Sashiko's point on this patch has
> been addressed, feel free to add
> > Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Sure.

Thanks,
Song
