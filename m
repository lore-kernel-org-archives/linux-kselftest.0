Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDDB3E1CE2
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050722; cv=none; b=T8KMHYzKxIHisxM85N9OxaS+GmQ4SWQbhgBZCb+B2+6TDjpUXyX5lF2T00eLTDlOKrumcIGFONL8h/XdrUi5bR8mat2oTR5PebvkE1c3LXs8UeLsLVNTngM5YYvLnrb/2PUe3HqTAGwwTnf52z2nRTej30YnnZ1QMdLJBcHU0zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050722; c=relaxed/simple;
	bh=fj1g4K75IP3iY/sgG+yP5k3knwdiYeMDtMK+zqvij70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6/DLgBy37MVUkgU2JrmJuunOM9kkOvMva4a1iXLxCptoYrYbVeE7PFddqggR5RbTAGw7qZOhxSMzd3O+sfVcd7OXB6UdXj0kSUAv3QscuJ48scoYJw/uXh5s+oBWux7RHWL0CfQf5TAX7IPoS1d0Yc9P932BslYQiMsVjwsQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBX0w6wj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBX0w6wj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777050720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slsp0uJ4UEr9asoG1EzUOVXbkiFCo43hgbkmPupcjMg=;
	b=aBX0w6wjbI3avTuXEUbwGptA9tQ/tOqZ6zPkEQPvoRVoHGFoLoq2LgjpVRb6M55zMRM8Zc
	RZXQiJiTiFe7R8yp1881bva5hfjvkQ4Ps1a2d7/qciIYTc4+ENpJCNvd++AFLiyIxgZVmB
	1sooYXVARV5+VRqEb1YKazSae8dxZEE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-KT6tn1saNL-X6HwtTICo3Q-1; Fri, 24 Apr 2026 13:11:58 -0400
X-MC-Unique: KT6tn1saNL-X6HwtTICo3Q-1
X-Mimecast-MFC-AGG-ID: KT6tn1saNL-X6HwtTICo3Q_1777050718
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8dac6233so137972051cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 10:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777050718; x=1777655518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slsp0uJ4UEr9asoG1EzUOVXbkiFCo43hgbkmPupcjMg=;
        b=bnoVZDjoA0IoUPyyIWEzBBPhaoXDaG342UwQUEJSpMCfx8soKnbtC2ErdIgjeJ6u/G
         NcAOpDEN7At7icd4MGngc9lQPSTe4QprTc62fiWM9fgnZdQtw/iQHPhav6JNynJeju9U
         GGrCmWR6Q1FMubToJHs2/ixb4zkaJfvA4kIvtSudPU8G/XbVBZETBsHhAeLCb+qMUNXu
         BbF/gzmeII3crafAVXBit6+GFS90PoqsSKRLZuOHR7JxzPMyY6HsThZbVKrlD+CysSbP
         cLeFxsN2lSVK5TjNeTvzVAzCFB/AZa976weI1u03dny2RkHg1iA967KpbI0T0Dr5tclG
         VV/A==
X-Forwarded-Encrypted: i=1; AFNElJ9WRgXp9hzmICL3PZd6R/QqVxwFD2FSBE+bvOFwd+7fdCpzya9QaU61TTj2yj8VtSf26p1F1Q8u+I5dfCsp9eM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyldKMjKW8p2hnXw8D7hqGKQ/eCrg2bB+oLrbxHkKjHPb4cOBrc
	qrhdvR1QAHpDxBUrHCU2j8MvZwXyh8Xnms+txWCI4lX+qzp8HhNYqGouAMRDorCaNGhTCFE2I5t
	UnvMQk3rrtVtUInHmjONnbp4E8exdobQG14R1xoKfuyCXSHStMks7BjswHWjZkUNT8aqoUA==
X-Gm-Gg: AeBDies8H1WeUBonpAqXiht+jGIea4Stlon62F1wmJpr0ikc4QzleF1Ca+c7M54/HkQ
	IZPECLhlpz5P507zyoHjgcJ3UeYBRasiVJeki9UVx4Lzfumxd7UWIemFCBw5yOb31cXWZ2vFcCI
	nZnM9xRTRLuupFluG9HD9luwyQOBUiPfReBFgKPG2/CaRev3A2fP+H7fqlWlqYmE1LCxpUKBCIQ
	Ga/e+iYv6z0G9d0zxxKTiC6sD4X3WxAo6IzfX0Ednt1KJeWl3SBguJd/ZN/UC+8+Smn9NVOVewv
	xFj7La3VSbDkSNgogMsvu64rFonhLzc4qZX3hASCWuYrb33/XUu9nWeD4ljINufBdBHiPCmPx7T
	n+fAaQ123ZqMowT2DTzAMvX64EpPpBRNutFx4
X-Received: by 2002:ac8:5807:0:b0:50d:7c44:e144 with SMTP id d75a77b69052e-50e36b3ecaamr548956591cf.11.1777050717888;
        Fri, 24 Apr 2026 10:11:57 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:50d:7c44:e144 with SMTP id d75a77b69052e-50e36b3ecaamr548955921cf.11.1777050717311;
        Fri, 24 Apr 2026 10:11:57 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb5fc8e04sm107117251cf.13.2026.04.24.10.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 10:11:56 -0700 (PDT)
Message-ID: <a8510cbd-4a30-460c-b870-a250ceb8a522@redhat.com>
Date: Fri, 24 Apr 2026 13:11:45 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 43/53] selftests/mm: migration: add setup of HugeTLB
 pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sarthak Sharma
 <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-44-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260418105539.1261536-44-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-18 06:55, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> migration skips HugeTLB tests if there are no free huge pages
> prepared by a wrapper script.
> 
> Add setup of HugeTLB pages to the test and make sure that the original
> settings are restored on the test exit.
> 
> Since kselftest_harness runs fixture setup and the tests in child
> processes, use HUGETLB_SETUP_DEFAULT_PAGES() that defines a constructor
> that runs in the main process and add verification that there are enough
> free huge pages to the tests that use them.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/migration.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index ccf42002ce86..61fb00953f83 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -23,6 +23,8 @@
>   #define MAX_RETRIES	100
>   #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
>   
> +HUGETLB_SETUP_DEFAULT_PAGES(1)

Hey Mike,

I've been reviewing and testing this series and got a reproducible issue
with this test when running it on a x86 KVM guest with 88 vCPUs.

The issue is that, when executing the full MM suite with
sudo ./run_vmtests.sh -d -a, all 6 migration test pass but it doesn't exit.
Instead, it gets stuck after this output:

"""
# # PASSED: 6 / 6 tests passed.
# # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
"""

Getting a backtrace from gdb I see:

"""
#0  0x00007efd2f2c247b in __lll_lock_wait_private () from /lib64/libc.so.6
#1  0x00007efd2f26fa88 in __run_exit_handlers () from /lib64/libc.so.6
#2  0x00007efd2f26fabe in exit () from /lib64/libc.so.6
#3  0x0000000000404f2e in hugepage_restore_settings_sighandler ()
#4  <signal handler called>
#5  0x00007efd2f32f416 in __unregister_atfork () from /lib64/libc.so.6
#6  0x00007efd2f26f338 in __cxa_finalize () from /lib64/libc.so.6
#7  0x00007efd2f4548c7 in __do_global_dtors_aux () from /lib64/libm.so.6
#8  0x00007ffd66ae0320 in ?? ()
#9  0x00007efd2f55b2d2 in _dl_call_fini (closure_map=0x7efd2f5500c0) at dl-call_fini.c:43
"""

Could we be messing with libc internal state somehow? I also get systemd
services hung when I try to reboot.

Some of the migration tests fork() and then kill() their children
processes. Won't those all restore the hugetlb state concurrently
from hugepage_restore_settings_atexit()?

Also, for shared_anon_htlb, don't we need to reserve a HugeTLB page per
children?

And there's another issue: when running the migration test individually,
private_anon_htlb gets skipped. I guess it's because the previous test
is restoring the HugeTLB state:

"""
TAP version 13
# -------------------
# running ./migration
# -------------------
# # [INFO] detected hugetlb page size: 2048 KiB
# # [INFO] detected hugetlb page size: 1048576 KiB
# TAP version 13
# 1..6
# # Starting 6 tests from 1 test cases.
# #  RUN           migration.shared_anon_htlb ...
# #            OK  migration.shared_anon_htlb
# ok 1 migration.shared_anon_htlb
# #  RUN           migration.private_anon_htlb ...
# #      SKIP      Not enough huge pages
#
# #            OK  migration.private_anon_htlb
# ok 2 migration.private_anon_htlb # SKIP Not enough huge pages
#
# #  RUN           migration.shared_anon_thp ...
# #            OK  migration.shared_anon_thp
# ok 3 migration.shared_anon_thp
# #  RUN           migration.private_anon_thp ...
# #            OK  migration.private_anon_thp
# ok 4 migration.private_anon_thp
# #  RUN           migration.shared_anon ...
# #            OK  migration.shared_anon
# ok 5 migration.shared_anon
# #  RUN           migration.private_anon ...
# #            OK  migration.private_anon
# ok 6 migration.private_anon
# # PASSED: 6 / 6 tests passed.
# # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# # Totals: pass:5 fail:0 xfail:0 xpass:0 skip:1 error:0
"""

(I have minor comments about earlier patches, but I decided to send this
first since it's the most important).

> +
>   FIXTURE(migration)
>   {
>   	pthread_t *threads;
> @@ -277,6 +279,9 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
>   	if (!hugepage_size)
>   		SKIP(return, "Reading HugeTLB pagesize failed\n");
>   
> +	if (hugetlb_free_default_pages() < 1)
> +		SKIP(return, "Not enough huge pages\n");
> +
>   	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
>   		MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);
> @@ -308,6 +313,9 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
>   	if (!hugepage_size)
>   		SKIP(return, "Reading HugeTLB pagesize failed\n");
>   
> +	if (hugetlb_free_default_pages() < 1)
> +		SKIP(return, "Not enough huge pages\n");
> +
>   	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
>   		MAP_SHARED | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
>   	ASSERT_NE(ptr, MAP_FAILED);

