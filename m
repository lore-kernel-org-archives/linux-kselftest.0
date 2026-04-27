Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABB836C597
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294603; cv=none; b=HseJSAJRLbUzTa9MCMaLqVYiAn8BWSyOYkYjW13S9peks7RpP2zVh6c5xA0WjTNeXChvWurcp4Qw1yvu2w/b77qwhLEgLZ1zJbP532+gtZskBodtUnQR3BsiBmrDr65MMSqCpuO65osn+txXNlPoQFOa0p0K71AbX9G5RpoOTfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294603; c=relaxed/simple;
	bh=8t0VYON5zGhnHZloPadv6KiTma/S00GU/iIieLRl7Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjX9FW3cH+5Qc6a8G4wcPWq19nVKmZnOKK/aik3O+JN5pHzoxWYkZJ7Qcau4p2kjTPdDrKA1P3bBrWgQAfmYR/nj7zXxrdtw/ewXHOv91mSPG/L8R2AxVq97ps/BKvlSCTIM9XvNy8g/axTBeEW2IWVacsvu1onTkwb5NWHElV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bW4vgcK7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bW4vgcK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777294601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+URdhFKjGzMvMSRmjpUoghA1XThJExmfB2vNvQphk6w=;
	b=bW4vgcK7Wqcb3k/PGw61yZXNKv5IA9CU2GnHp3QWbxK96XhI7HYzs00MNversZC/n2yFSm
	QKkX7phMjKY9YfNmTl5rS+hZ+ncXTKRcb5bgsl8nht26WrbFzwjrGYGlErXRMm6nAuWRTu
	xVGSGSvTVDOC8u+xhjmHM9E4PeJ83zM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-XwfXGd2nMw2EevgC7W6zrQ-1; Mon, 27 Apr 2026 08:56:40 -0400
X-MC-Unique: XwfXGd2nMw2EevgC7W6zrQ-1
X-Mimecast-MFC-AGG-ID: XwfXGd2nMw2EevgC7W6zrQ_1777294600
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd722c1a69so1825151585a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 05:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294600; x=1777899400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+URdhFKjGzMvMSRmjpUoghA1XThJExmfB2vNvQphk6w=;
        b=mH4lNfRgb/paqLK1DIPo5qjadvuTh/DISUhLuTPCO1bdLLZFleqe/YBzhe4fx9mNKg
         OJbWhkOZdk5ijmYryg6z9O0yI7qmBdEqdJOVoTn4iEWdG/ReqrziDFqAnKfpds2C2O4O
         g76mzW0X845ZsPOS+Bwy5aydFqKuuyUNY27KY2R02DDFRxxRTRTslj6iHW0FvGNUCGv2
         p3Hjjlai2O8p+sms8u86fPiGqcHGRnGbg3oG7u85rBdlj2aYR5TMrz+qJLmWnhy4srrz
         LMjlnd8r1I7DbU53qOtyPrMeCA/sjIyBpDaUN4VOte2sM35Eg460nPo8sw6gbxzkRsIN
         Gpag==
X-Forwarded-Encrypted: i=1; AFNElJ+TcCN2YHEUD6dTZ+MEe9iTdnu6GF+ui5TROeyleKJWnBwZQQG0tWPyko0pyXBHNfzC/D9F7G7s2i01O1nczxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ2h/wLn2EnFJvSRkGXkc0K94nl8mKx716FT9LyJaWLTKS6NNs
	QDn0zp+bMbC1bzJxhMHevSKUf3YXYQrs6+dWNRbl1Z/ir0rsXNKxprGMOOLJtzmYojdjYqdEbAg
	yxBa8fBu8gXzt1iJueV6dXmjjGecOfEot9Tap4cp+D4VUtPtBA9FF54ei2Gf/kHt9dAd99Q==
X-Gm-Gg: AeBDies0ZvfgEDcYmeNwR6jMWDelLa2iKoye2SuI46GH0EPKjf2zYaTF19ObzbibPGa
	pd9/NwTdO436BkfL4+7j05TgB7GdfYqQQ7H1Yr+jlNII6bpDELmrmo+lTccRdXRF8Hdrk0Pylhn
	SwXO9jZhJKz+JvqOfu/G50rC6XJzawaIQ3icemPHww7vA4HydTIbRfA9bcAvI3WGP7IW7G69RkA
	gQ4YdtZZH4i30hgYwh34BWOFA/sLeU2yFdoYGbUPrMW07vZXWohTROzn91IGq2bp/Ck7nNt3XWc
	9lnL+7BSyB6Fo5niXENOfXULawY20mxh2yWVOEtq29w8g1iKcrzYn4VG7sMt1RK8DE2Jf/AcWmb
	fj5cUx+vi60P3pyY4iBI4iExx30BSt5GN38zn
X-Received: by 2002:a05:620a:31a6:b0:8ee:f43a:bb6d with SMTP id af79cd13be357-8eef44a0499mr3559418685a.57.1777294599620;
        Mon, 27 Apr 2026 05:56:39 -0700 (PDT)
X-Received: by 2002:a05:620a:31a6:b0:8ee:f43a:bb6d with SMTP id af79cd13be357-8eef44a0499mr3559414585a.57.1777294599047;
        Mon, 27 Apr 2026 05:56:39 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02aa4f1f9sm256378186d6.0.2026.04.27.05.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:56:38 -0700 (PDT)
Message-ID: <67d7b067-97a8-4600-a9a6-46f3e797ffed@redhat.com>
Date: Mon, 27 Apr 2026 08:56:27 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 43/53] selftests/mm: migration: add setup of HugeTLB
 pages
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Donet Tom <donettom@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lance Yang <lance.yang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Sarthak Sharma <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-44-rppt@kernel.org>
 <a8510cbd-4a30-460c-b870-a250ceb8a522@redhat.com>
 <ae3v1cyMLbcvJtYW@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <ae3v1cyMLbcvJtYW@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-26 06:58, Mike Rapoport wrote:
> On Fri, Apr 24, 2026 at 01:11:45PM -0400, Luiz Capitulino wrote:
>> On 2026-04-18 06:55, Mike Rapoport wrote:
>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>
>>> migration skips HugeTLB tests if there are no free huge pages
>>> prepared by a wrapper script.
>>>
>>> Add setup of HugeTLB pages to the test and make sure that the original
>>> settings are restored on the test exit.
>>>
>>> Since kselftest_harness runs fixture setup and the tests in child
>>> processes, use HUGETLB_SETUP_DEFAULT_PAGES() that defines a constructor
>>> that runs in the main process and add verification that there are enough
>>> free huge pages to the tests that use them.
>>>
>>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> ---
>>>    tools/testing/selftests/mm/migration.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
>>> index ccf42002ce86..61fb00953f83 100644
>>> --- a/tools/testing/selftests/mm/migration.c
>>> +++ b/tools/testing/selftests/mm/migration.c
>>> @@ -23,6 +23,8 @@
>>>    #define MAX_RETRIES	100
>>>    #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
>>> +HUGETLB_SETUP_DEFAULT_PAGES(1)
>>
>> Hey Mike,
>>
>> I've been reviewing and testing this series and got a reproducible issue
>> with this test when running it on a x86 KVM guest with 88 vCPUs.
>>
>> The issue is that, when executing the full MM suite with
>> sudo ./run_vmtests.sh -d -a, all 6 migration test pass but it doesn't exit.
>> Instead, it gets stuck after this output:
>>
>> """
>> # # PASSED: 6 / 6 tests passed.
>> # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
>> """
>>
>> Getting a backtrace from gdb I see:
>>
>> """
>> #0  0x00007efd2f2c247b in __lll_lock_wait_private () from /lib64/libc.so.6
>> #1  0x00007efd2f26fa88 in __run_exit_handlers () from /lib64/libc.so.6
>> #2  0x00007efd2f26fabe in exit () from /lib64/libc.so.6
>> #3  0x0000000000404f2e in hugepage_restore_settings_sighandler ()
>> #4  <signal handler called>
>> #5  0x00007efd2f32f416 in __unregister_atfork () from /lib64/libc.so.6
>> #6  0x00007efd2f26f338 in __cxa_finalize () from /lib64/libc.so.6
>> #7  0x00007efd2f4548c7 in __do_global_dtors_aux () from /lib64/libm.so.6
>> #8  0x00007ffd66ae0320 in ?? ()
>> #9  0x00007efd2f55b2d2 in _dl_call_fini (closure_map=0x7efd2f5500c0) at dl-call_fini.c:43
>> """
>>
>> Could we be messing with libc internal state somehow? I also get systemd
>> services hung when I try to reboot.
> 
> I don't think we are messing with libc internal state, but we surely leave
> zombies around.
> All the tests that fork() terminate the children with kill() but they never
> call wait*() to collect the exit status.

Right!

>> Some of the migration tests fork() and then kill() their children
>> processes. Won't those all restore the hugetlb state concurrently
>> from hugepage_restore_settings_atexit()?
> 
> Yeah, I missed the kill()s :/
>   
>> Also, for shared_anon_htlb, don't we need to reserve a HugeTLB page per
>> children?
> 
> We only mmap() a single huge page in the parent, the children don't create
> new mappings.

You're right, I missed the fact that the children only read from the
page.

>> And there's another issue: when running the migration test individually,
>> private_anon_htlb gets skipped. I guess it's because the previous test
>> is restoring the HugeTLB state:
> 
> It could be.
> 
> I pushed the updated version that has the fixes for both zombie and
> signal issues:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=mm-selftest/v3
> 
> Would be great if you can test it in your setup.

This works! Both issues are fixed: the migration test completes w/o
hanging and when I run it individually all tests run.

One last question: should we munmap() the mappings in this test? Though
I understand this goes beyond your series goal.

