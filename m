Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E01A30C143;
	Wed, 29 Jul 2026 03:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785296289; cv=none; b=ua/T2lUVJ/ott1zk9QzCIsbPZtuT0xZ43ie1Svgxu+XxDGqwfSfaGo/IjFSCmbHN/Ko95IHmyAVTzgKQGWKt0yxPqkPdvf9A+72Zy1rDmBDHfXWmtBzcEhIJ7Br1ssk+2fenszZHfcTHPd8vHSpYP8/OBlL/j8LLe/3i+jQN1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785296289; c=relaxed/simple;
	bh=Oi+Fl9cv8+JO6yVe5agq06orBSgBSHnofwnZqhjHX3o=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EaabzZhUetieouQqYCXG69awEKLLNNpKUZ3VimXwbkiVKT9wb+CfSn7OIINznsAlM7/2JGNIU1h4vEX1p4613pEHthwT75z1DTDijH9chX3lK5M/3kl8U9CDzcdbIJeOzgiAvSJhGJFmhoYnQ19nDbzVlp/66e2TU5Xy4mgzlVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=kMRhhoag; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="kMRhhoag"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5dJy2BwEn0kVulvVpmXjZDrR67cWI0QsFRXsAfEbQCQ=;
	b=kMRhhoagZ3otRMIf6kVu72AEYqW6j4kJExP2OKvQ8LVdfaByHgDZGXGqB6DUQ128C+hjZNlp9
	6i5HrzB+QDsfE0WMkbZgn1BB7hrtsh36w85076AfThZTCJ4/UVw//h88kVKw4wZpMfr3imTopFN
	azTxVo7N6hB572NKfDT3l28=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4h8yTw28Ffz1K98V;
	Wed, 29 Jul 2026 11:28:36 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E799640563;
	Wed, 29 Jul 2026 11:38:01 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 11:38:01 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 11:38:00 +0800
Subject: Re: [PATCH] selftests/mm: unpoison pages in memory-failure teardown
To: "David Hildenbrand (Arm)" <david@kernel.org>, Muhammad Usama Anjum
	<usama.anjum@arm.com>
CC: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20260727095415.385026-1-usama.anjum@arm.com>
 <a811c371-ef3d-4932-a9d4-2390a98e1382@kernel.org>
 <9a289152-70c1-4e13-a0d5-f77bdee72d8a@arm.com>
 <744290ab-b5b3-40b4-bb70-006231fcb328@kernel.org>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <067fdf0f-7322-c011-0f2a-882dc63f0964@huawei.com>
Date: Wed, 29 Jul 2026 11:38:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <744290ab-b5b3-40b4-bb70-006231fcb328@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/7/29 3:06, David Hildenbrand (Arm) wrote:
> On 7/28/26 16:22, Muhammad Usama Anjum wrote:
>> On 27/07/2026 1:31 pm, David Hildenbrand (Arm) wrote:
>>> On 7/27/26 11:54, Muhammad Usama Anjum wrote:
>>>> The memory-failure tests call cleanup() only after all result checks.
>>>> A failed ASSERT_* invokes fixture teardown and aborts the test, so it
>>>> skips cleanup() and leaves the injected page hardware-poisoned.
>>>>
>>>> Invoke cleanup() from FIXTURE_TEARDOWN() instead. Guard it with
>>>> self->triggered so tests that exit before injection do not try to
>>>> unpoison a page when no injection was attempted. This runs the existing
>>>> HWPoison and HardwareCorrupted checks on both normal and assertion-failure
>>>> paths.
>>>>
>>>> Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>>>> ---
>>>>  tools/testing/selftests/mm/memory-failure.c | 26 +++++++++------------
>>>>  1 file changed, 11 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
>>>> index 5d00aab31f9b5..eaa8b9bd401a1 100644
>>>> --- a/tools/testing/selftests/mm/memory-failure.c
>>>> +++ b/tools/testing/selftests/mm/memory-failure.c
>>>> @@ -122,13 +122,6 @@ static void teardown_sighandler(void)
>>>>  	sigaction(SIGBUS, &sa, NULL);
>>>>  }
>>>>  
>>>> -FIXTURE_TEARDOWN(memory_failure)
>>>> -{
>>>> -	close(self->kpageflags_fd);
>>>> -	close(self->pagemap_fd);
>>>> -	teardown_sighandler();
>>>> -}
>>>> -
>>>>  static void prepare(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self,
>>>>  		    void *vaddr)
>>>>  {
>>>> @@ -200,8 +193,7 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
>>>>  	ASSERT_EQ(pfn_flags & KPF_HWPOISON, KPF_HWPOISON);
>>>>  }
>>>>  
>>>> -static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self,
>>>> -		    void *vaddr)
>>>> +static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self)
>>>>  {
>>>>  	unsigned long size;
>>>>  	uint64_t pfn_flags;
>>>> @@ -217,6 +209,16 @@ static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failu
>>>>  	ASSERT_EQ(size, self->corrupted_size);
>>>>  }
>>>>  
>>>> +FIXTURE_TEARDOWN(memory_failure)
>>>> +{
>>>> +	if (self->triggered)
>>>> +		cleanup(_metadata, self);
>>>
>>> If the variant->inject(self, addr) fails, self->triggered would already have
>>> been set.
>>>
>>> Wouldn't it be cleaner to have a new self->poisoned that we set only after
>>> ->inject succeeded?
>> Setting self->poisoned after variant->inject() returns would not cover the
>> MADV_HARD signal path.
>>
>> The call path of madvise(MADV_HWPOISON) is:
>>
>> madvise() -> madvise_do_behavior() -> madvise_inject_error(MF_ACTION_REQUIRED) ->
>> memory_failure() -> hwpoison_user_mappings() -> kill_procs(BUS_MCEERR_AR) ->
>> kill_proc() -> force_sig_mceerr()
>>
>> SIGBUS is therefore queued while the madvise system call is executing and
>> delivered on return to userspace, before execution can continue after
>> variant->inject().
>>
>> The test's sigbus_action() then calls siglongjmp(), so an assignment placed
>> after variant->inject() would be bypassed. The flag would remain false and
>> the test would attempt the injection again after returning to sigsetjmp().
>>
>> Also, memory_failure() sets PG_hwpoison before several recovery paths that
>> can return an error, so a failed injection return does not prove that the
>> page was not poisoned.
>>
>> Maybe renaming triggered to injection_attempted is more precise here.
> 
> Yes, that would make it clearer. + adding a comment that we want to cleanup even
> when injection was attempted, but failed.

self->triggered indicates whether the memory failure injection has been performed,
and it has the same meaning as injection_attempted. However, injection_attempted is
indeed clearer. So this change makes sense to me.

Thanks both.
.


