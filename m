Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC70347BC4;
	Sat, 15 Aug 2026 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786775755; cv=none; b=ugQR7DEng2Ohs7RSinf2sbvP8bHf1FwpkEyGGb5XoM79Qvidixr574UY+NCk2yM77Vk1PMmeyau2fyBRJ3qAuYOs48TdL+leBixuqZt2c6a0aMn3zCB9VoSEOZnUrm3bQlc+H5Shzwc7lidbx2krGOMTxYPMtl0WxwphDjfpT5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786775755; c=relaxed/simple;
	bh=hH4/Wow1swkl1Mfv5qFIr1d7t1yEwSMrE3hto4K5ptM=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BI0L1PsffThdCTIuHLYHWHyss40kAOIgAok6xzMFJqZFer2tIhukZ6qOgEkWqeIqFOaOOofH7kqaevib6lg4oqmaRL5FKNkWN5H3NZ5Dt7mvxhRuWEsxzlFNWLuPBaMDz4rxITJlti/or/MV0pYUVZ94TG863V+JDLF4carnno4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 85af23d0987311f19a56ed5b684f684d-20260815
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NAME, IP_UNTRUSTED, SRC_UNTRUSTED, IP_LOWREP
	SRC_LOWREP, DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5d3b5378-70f7-4ad1-b4a4-a831192e5e2c,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.19,REQID:5d3b5378-70f7-4ad1-b4a4-a831192e5e2c,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:7db8b62,CLOUDID:565d65f63a1052e78a0145bb396e5f6d,BulkI
	D:260812214231S0PNYE0P,BulkQuantity:1,SF:17|19|64|66|78|80|81|82|83|102|12
	7|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bu
	lk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0
	,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 85af23d0987311f19a56ed5b684f684d-20260815
X-User: husong@kylinos.cn
Received: from [192.168.1.116] [(111.162.215.50)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2089476727; Sat, 15 Aug 2026 14:35:35 +0800
Message-ID: <6c7644ac-9161-415a-ac18-551ff1eb6537@kylinos.cn>
Date: Sat, 15 Aug 2026 14:35:32 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: husong@kylinos.cn, linux-mm@kvack.org, akpm@linux-foundation.org,
 shuah@kernel.org, david@kernel.org, ljs@kernel.org, liam@infradead.org,
 vbabka@kernel.org, surenb@google.com, mhocko@suse.com, peterx@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests/mm: restore enable_soft_offline in
 hugetlb-soft-offline
To: Mike Rapoport <rppt@kernel.org>
References: <20260812120821.523860-1-husong@kylinos.cn>
 <20260812120821.523860-4-husong@kylinos.cn> <anx4NBqyMKwqvEGb@kernel.org>
From: Song Hu <husong@kylinos.cn>
In-Reply-To: <anx4NBqyMKwqvEGb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/12 21:42, Mike Rapoport 写道:
> Hi,
> 
> On Wed, Aug 12, 2026 at 08:08:21PM +0800, Song Hu wrote:
>> hugetlb-soft-offline toggles /proc/sys/vm/enable_soft_offline between 1 and
>> 0 (test_soft_offline_common(1) then (0)) and leaves it at 0 when it
>> finishes, silently disabling soft offlining for the whole system after the
>> run.  Read the original value before the test and restore it before
>> ksft_finished().
>>
>> Signed-off-by: Song Hu <husong@kylinos.cn>
>> ---
>>  .../selftests/mm/hugetlb-soft-offline.c       | 24 +++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
>> index bc202e4ed2bd..35dcf661b091 100644
>> --- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
>> +++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
>> @@ -99,6 +99,23 @@ static int set_enable_soft_offline(int value)
>>  	return 0;
>>  }
>>  
>> +static int get_enable_soft_offline(void)
>> +{
>> +	FILE *fp = fopen("/proc/sys/vm/enable_soft_offline", "r");
>> +	int value = -1;
>> +
>> +	if (!fp) {
>> +		ksft_perror(EPREFIX "failed to read enable_soft_offline");
>> +		return -1;
>> +	}
>> +	if (fscanf(fp, "%d", &value) != 1) {
>> +		ksft_perror(EPREFIX "failed to parse enable_soft_offline");
>> +		value = -1;
>> +	}
>> +	fclose(fp);
>> +	return value;
>> +}
> 
> We have read_num() in vm_util and write_num() that can replace
> set_enable_soft_offline().
> 
Will switch to them in v2 and drop both helpers.
>> +
>>  static int create_hugetlbfs_file(struct statfs *file_stat)
>>  {
>>  	int fd;
>> @@ -185,6 +202,8 @@ static void test_soft_offline_common(int enable_soft_offline)
>>  
>>  int main(int argc, char **argv)
>>  {
>> +	int orig;
> 
> Please spell out what orig is this.
> 
Will rename to orig_enable_soft_offline.

Also, per the error-path issue Andrew pointed out, v2 will register the
restore with atexit() so it also runs when the test exits via
ksft_exit_fail_msg(), like hugepage_restore_settings_atexit() in
hugepage_settings.c.

Thanks,
Song>> +
>>  	ksft_print_header();
>>  
>>  	if (!hugetlb_setup_default(8))
>> @@ -192,8 +211,13 @@ int main(int argc, char **argv)
>>  
>>  	ksft_set_plan(2);
>>  
>> +	orig = get_enable_soft_offline();
>> +
>>  	test_soft_offline_common(1);
>>  	test_soft_offline_common(0);
>>  
>> +	if (orig >= 0)
>> +		set_enable_soft_offline(orig);
>> +
>>  	ksft_finished();
>>  }
>> -- 
>> 2.43.0
>>
> 

