Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD9188CC9;
	Wed,  9 Sep 2026 08:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944217; cv=none; b=k9qs2e/gL3QtEHluZvkiU6q4qM58k+hV2MSuKczpb2QtOqX6GV+htjBBQbUCu+iitiCGhfb5rqziayj/vfTdXZxBNqOMyjJ4fVo1ygENhhdtXaGsVSW7w6jwNii9U4mWtcE6G8aSEzxCzifjG3/mC4u4arAIYaijJVpmYBBEFfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944217; c=relaxed/simple;
	bh=o8ZWftNYiiTpwbs8NCaoiaSvZ9COpovRV5Gz3dxlo/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTNEUpq8LmdXQ5VbSMUTm0GwFRoKm+jAKNatVXzA7ZGMMan3q127BafMzS2YAcJaVRhGlXzXbXwd8qkihzU2h5L8eHJ8cN995RtojMxRCmXphLEdRlOLzxRVsHSJK810y0Nz5HwwELORX+rEbO86PnbgI7mQ+KVm264F75yReZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbRTmd/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbRTmd/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7B01F00A3A;
	Wed,  9 Sep 2026 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788944215;
	bh=84+nBQDm+o+S8DfCJAt/wL5E7ITLnnU0M/9KT4DLzOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PbRTmd/gF2NsVAfbYrHPMTKkJ8cDe6j3PXtfVM9QxKPaSxDrgCza896pxXE+c02g5
	 UvAM/+cp9d3Bsb6WzKP8ng3m2uU3oao9lZxs36YrbB7tDRwwFuthV04n5evM3vv0HW
	 qfOLnV4p51IdokO9+nvDP5hy5Fuih4yzlufjlqe98ZCPyfy5zxElMP+sRu3ivAKKl/
	 dLGi26urGTgGuGVbr2ghLFkO7uRUlSIG75WH5vVybx1431cPayjOSZRU7/TeDDtbUp
	 P0rgRik3OqN8Pp1wMthSmFQBnqBdykrhHzQ/BI98RXH+nYUW9LrRTUD2gkj/FcHXGu
	 f8TkQr60PgOVQ==
Message-ID: <d80d892c-8505-4530-a23f-e3b6daf72d03@kernel.org>
Date: Wed, 9 Sep 2026 10:56:49 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/powerpc/tm: Fix tcheck() reading uninitialised
 CR value
To: Venkat <venkat88@linux.ibm.com>,
 Thibault Ferrante <thibault.ferrante@canonical.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907215420.1258678-1-thibault.ferrante@canonical.com>
 <4206CE63-979B-4464-BECE-F89D0B1BDC91@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <4206CE63-979B-4464-BECE-F89D0B1BDC91@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2026 à 07:28, Venkat a écrit :
> 
> 
>> On 8 Sep 2026, at 3:24 AM, Thibault Ferrante <thibault.ferrante@canonical.com> wrote:
>>
>> tcheck() is used to check the current transaction state (active,
>> suspended, doomed) via the "tcheck" instruction, which writes its
>> result into CR field 0. The inline asm declared a GPR output operand
>> for this result but never actually moved the CR into it.
>>
>> Every caller (tcheck_doomed(), tcheck_active(), tcheck_suspended(),
>> tcheck_transactional()) has effectively been testing bits of an unrelated,
>> arbitrary register value since this helper was introduced.
>> The "& 4" mask discards the TDOOMED and TS_lsb (suspended) bits before
>> they ever reach the callers, so tcheck_doomed() and tcheck_suspended()
>> can never return true, and tcheck_transactional() degrades to being
>> equivalent to tcheck_active().
>>
>> Fix tcheck() to actually move CR into the output register with mfcr,
>> and widen the mask from "& 4" to "& 0xf" so the full CR0 nibble
>> (TDOOMED | TS_msb | TS_lsb | reserved) is preserved for the callers.
>>
>> This bug has been present since tcheck() was introduced.
>>
>> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugs.launchpad.net%2Fbugs%2F2107442&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4805edfd01004fae88bf08df0e334066%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639245285430142903%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ho9uy5Jyj7SnKtiSZibCDfMR22FhBIuUSkgmguhENts%3D&reserved=0
>> Fixes: 8e03bd4e70b6 ("selftests/powerpc: Add TM tcheck helpers in C")
>> Signed-off-by: Thibault Ferrante <thibault.ferrante@canonical.com>
>> ---
> 
>> tools/testing/selftests/powerpc/tm/tm.h | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
>> index c03c6e778876..6024ce4ba6ff 100644
>> --- a/tools/testing/selftests/powerpc/tm/tm.h
>> +++ b/tools/testing/selftests/powerpc/tm/tm.h
>> @@ -105,8 +105,12 @@ static inline bool failure_is_nesting(void)
>> static inline int tcheck(void)
>> {
>> long cr;
>> - asm volatile ("tcheck 0" : "=r"(cr) : : "cr0");
>> - return (cr >> 28) & 4;
>> + asm volatile("tcheck 0;"

Why not use cr7 instead of using cr0 and doing cr >> 28 below ?

>> +     "mfcr %0;"
>> +     : "=r"(cr)
>> +     :
>> +     : "cr0");
>> + return (cr >> 28) & 0xf;
>> }
>>
>> static inline bool tcheck_doomed(void)
>> -- 
>> 2.55.0
>>
> 

