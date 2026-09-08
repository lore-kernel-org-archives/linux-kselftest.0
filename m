Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF900BA3D
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 04:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788841293; cv=none; b=K/0jnpjPibxtrZI+AFKyjcg+E+X+0xosFOL5IJ5ltH83aQHGfOkTFh8DnAd5JYSd4JABx2QYHUvaKzzKg/k74J+/oLvLzTS66ZSo+Sey5rIrdWfQHJGk8oXRu4acgXC6z/EK3vckFXqXoFXn6Xxjg5Ts3QAkSxy8A1pXwoM5OX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788841293; c=relaxed/simple;
	bh=K0Wlf9u1v8EnKIQ5AhyaZte4Iwg0VOgbEUCSHSr2OBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puvjroffcGZTiCVaIA8PUrBPwuw1gHLee0auAygclULud3i6ZlKMw2Dol6MbPk7Bh/8xaIo5BLoxrdwm0GE/EEbYVMcJkt0tZzpHER6HBqVywKmafRB6V+cpTODADTIfLOEAGJPYK/LCgGGUqNV5Susd++9qIUa9tHWjiiLga+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RqqsGDNb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RqqsGDNb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E71921476;
	Mon,  7 Sep 2026 21:21:18 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 520A93F528;
	Mon,  7 Sep 2026 21:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788841282; bh=K0Wlf9u1v8EnKIQ5AhyaZte4Iwg0VOgbEUCSHSr2OBY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RqqsGDNbNtoGF8UaRD/lb3640ii0GOwPaqfaV9OUSkpZ8Pv7s0Ig+sx0ZF2WElmJL
	 QGEE2st8jPLsPDEvCKixIHnvUwWRf3ky8NfQXwxbdzy1Pxg7G7hl8TrxYDz6qOTfHf
	 UCxTossPmCnXFlVPRAx55tMMlqTM3W75gCtjdI+c=
Message-ID: <943faa15-06b8-49ce-8b91-e4c1e2f22fa2@arm.com>
Date: Tue, 8 Sep 2026 09:51:14 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT macro
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org
References: <20260907081509.924979-1-yeoreum.yun@arm.com>
 <9f8c6e91-c1c8-4ec5-96a9-9d6d4ab571cc@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <9f8c6e91-c1c8-4ec5-96a9-9d6d4ab571cc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/7/26 8:06 PM, David Hildenbrand (Arm) wrote:
> On 9/7/26 10:15, Yeoreum Yun wrote:
>> HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
>> When this macro is used in some test, test result would be strange in
>> the system where PAGE_SIZE is more then 4KB.
>>
>> Here is the example with transhuge-stress test with 16KB PAGE_SIZE:
>>
>>   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
>>     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 failed, 2566 different pages
>>     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 failed,    0 different pages
>>     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 failed,    0 different pages
>>     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 failed,    0 different pages
>>     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 failed,    0 different pages
>>     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 failed,    0 different pages
>>     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 failed,    0 different pages
>>     ...
>>   ok 1 Completed
>>
>> Remove the HPAGE_SIZE and HPAGE_SHIFT macros and introduce pmd_page_shift()
>> helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-existing
>> helper, read_pmd_pagesize().
>>
>> Also, run the KSM_MERGE_TIME_HUGE_PAGES test with a size of 512 MiB,
>> which is the least common multiple of the PMD sizes for 4 KiB, 16 KiB,
>> and 64 KiB base pages. Since allocate_transhuge() allocates mappings in
>> PMD-sized units, the test may fail with the previous size of 100 MiB,
>> which is not a multiple of the PMD size when the base page size is
>> 16 KiB or 64 KiB.
>>
>> After this patch, output of transhuge-stress:
>>
>>   transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtual memory and 119 MiB of ram
>>     2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s	2585 succeed, 1232 failed, 2585 different pages
>>     2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s	2585 succeed, 1232 failed, 2585 different pages
>>     2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s	2585 succeed, 1232 failed, 2585 different pages
>>     2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s	2616 succeed, 1201 failed, 2616 different pages
>>     2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s	2627 succeed, 1190 failed, 2627 different pages
>>     2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s	2628 succeed, 1189 failed, 2628 different pages
>>     2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s	2630 succeed, 1187 failed, 2630 different pages
>>     2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s	2631 succeed, 1186 failed, 2631 different pages
>>     ...
>>   ok 1 Completed
>>
>> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> ---
> 
> 
> [...]
> 
>> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
>> index d09f9f6a384e..24aa1de27c25 100755
>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>> @@ -360,8 +360,8 @@ fi
>>  CATEGORY="memfd_secret" run_test ./memfd_secret
>>  fi
>>  
>> -# KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 100
>> -CATEGORY="ksm" run_test ./ksm_tests -H -s 100
>> +# KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 512
>> +CATEGORY="ksm" run_test ./ksm_tests -H -s 512
> 
> 
> Why the magic value 512? (desrves a comment)
> 
> A clear sign that the ksm tests must be rewritten to be standalone and just
> handle this internally. @Sarthak

Sure David, I'll work on this.

