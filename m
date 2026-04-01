Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199F2DB7BB;
	Wed,  1 Apr 2026 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054391; cv=none; b=seaY7ux2iwE84kgIiasJyoSfTLcEiCRH8SzdxN0Yrv7pylxvMOnOiFqVR+U7V+7EiAcdYmYPL94bevcY4bBtjcAZ3t8Omilnjov3IjNvZ14GlUmebxNW/SKqMcXHExSPvgAaWYy7TilNA60FqKinGNT+2Me70HKG1blxzo5NkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054391; c=relaxed/simple;
	bh=Bin3h0MVBuLpZNOozDl0N5IbBmgJsj/6z8avaWy2Ems=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQRppUfJtLwn8WtINnAO432SAzh9/gCmaAQxO8GSO0fqpbdih5dSMHi+cCdFCCZ1kvV9SbJfRN/EKGRtHnxBVFhJZs8ne+aKZ3F+IZUBW4yfuqocmLg+DhewM2cu+XIBpjQLjtGmr9mFFapbdIJO8VJ34zlhHE/IFSoM2Xd4SWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fq45RAyf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fq45RAyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64474C19423;
	Wed,  1 Apr 2026 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775054391;
	bh=Bin3h0MVBuLpZNOozDl0N5IbBmgJsj/6z8avaWy2Ems=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fq45RAyfqPyZhSNjubD5Vk0QTJAji108yWWmRtTHXhBeBGa6SNTNhSQfa/8ImIA5t
	 PBbwVa0LSavhZMqUNLMp6HxVMCoN3UPaxbLk6lZn0HwvyQ2KyC95N9kTxeTLAHthg+
	 wVfMR2v0jA4jXxMDSar8TIz74Q8xSFRAil/h3g523HQ/JC0PhJxRGKAp3/Th2ocn7V
	 zpWDIsOR/NH4nJhehVMK1x2osOI+N4vj4skpuO0lVLF6XOdeYs08ieKPBBA0VrfWXt
	 YGu/Ao9/N00IOwjfDwDSTGmJNn3ZB4M7VSO6153nvheEa7+3Irz6X55p3gAO/kxNb7
	 VKjwk9lyc3CUg==
Message-ID: <5684cab6-d5a6-4de9-9545-f8cae775d825@kernel.org>
Date: Wed, 1 Apr 2026 16:39:45 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] selftests/mm: fix double increment in linked
 list cleanup in compaction_test
To: Sayali Patil <sayalip@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1774591179.git.sayalip@linux.ibm.com>
 <4c47a2ebbc41f90c7a0cb3f8b34106b2b64296f6.1774591179.git.sayalip@linux.ibm.com>
 <b6d211e1-233e-4079-a8b9-6682e12077ba@linux.ibm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <b6d211e1-233e-4079-a8b9-6682e12077ba@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/1/26 16:32, Sayali Patil wrote:
> 
> On 27/03/26 12:46, Sayali Patil wrote:
>> The cleanup loop of allocated memory currently uses:
>>
>>      for (entry = list; entry != NULL; entry = entry->next) {
>>          munmap(entry->map, MAP_SIZE);
>>          if (!entry->next)
>>              break;
>>          entry = entry->next;
>>      }
>>
>> The inner entry = entry->next causes the loop to skip every
>> other node, resulting in only half of the mapped regions being
>> unmapped.
>>
>> Remove the redundant increment to ensure every entry is visited
>> and unmapped during cleanup.
>>
>> Fixes: bd67d5c15cc1 ("Test compaction of mlocked memory")
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
>> ---
>>   tools/testing/selftests/mm/compaction_test.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/
>> testing/selftests/mm/compaction_test.c
>> index 30209c40b697..f73930706bd0 100644
>> --- a/tools/testing/selftests/mm/compaction_test.c
>> +++ b/tools/testing/selftests/mm/compaction_test.c
>> @@ -263,9 +263,6 @@ int main(int argc, char **argv)
>>         for (entry = list; entry != NULL; entry = entry->next) {
>>           munmap(entry->map, MAP_SIZE);
>> -        if (!entry->next)
>> -            break;
>> -        entry = entry->next;
>>       }
>>         if (check_compaction(mem_free, hugepage_size,
> 
> Sorry, this change is not valid.
> 
> The goal of this test is to verify the kernel’s ability to compact
> unevictable (MAP_LOCKED) pages. The loop is intentionally written to
> unmap every other chunk, thereby creating fragmentation with locked pages
> before check_compaction() is invoked.
> 
> With the proposed change (removing the double increment), the loop ends up
> unmapping all allocated locked pages instead of leaving a fragmented
> pattern. This results in memory being effectively unfragmented.

Ahhh, we should really make that clearer in a comment. I missed it myself :(

-- 
Cheers,

David
