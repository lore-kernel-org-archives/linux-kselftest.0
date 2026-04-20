Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A89738F941;
	Mon, 20 Apr 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678370; cv=none; b=u+/Urxrnw0GRIEevHxh1eLiZQOksIjVEmbHMUDBPpdslG/jSgcEnu77vTiPOfe4ChFhKaU5nJG4/jyfL5BdcbByRpAOsdFGrbQ5V1QnwQcZYHuA3mu6f/iLxPpg+O3NEe8z4/sghMbuvQsytN66V1cG9F3+Li6KsoXarC2hHeZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678370; c=relaxed/simple;
	bh=0LnwgCKSOKAxCSRRobCz2g3Fg7fEI4umGWE6lQbQdxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCE/QtkVFof7978t1stqyeteicGhnzaY4eqbU26CMSim2ZoV7tGOGMP6T8dXLEujsSGA28ndCx5yi5STas5c7S2Dm+z/kmOCHJjSPBCdC163pirzaM0O64ydlVoLNgoCe6h2SyPTQGLn3NbFQ26TUR/KNMawS+FF9hPDWkpCw5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=L1LwmNHa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="L1LwmNHa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A81581516;
	Mon, 20 Apr 2026 02:46:01 -0700 (PDT)
Received: from [10.57.89.131] (unknown [10.57.89.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82BA13F915;
	Mon, 20 Apr 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776678367; bh=0LnwgCKSOKAxCSRRobCz2g3Fg7fEI4umGWE6lQbQdxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L1LwmNHazBeqgP6sMtuBhEJMafYyFNM7jjZ0Qel4K/ytrAl+aBOWdqbirlIqrhu9E
	 t3l7UVo2nnaaHUWUcYmUCrdW7+wUVNPQY3UDCvHzMwNUFb4gY1NfZoFw0XGTHgLUHz
	 +9zhNRSNlLjUvCK43bQB6iqegMvA1nY9I+ygUsqw=
Message-ID: <1e2f1bdf-dca4-4b0c-90fa-d61a2552835f@arm.com>
Date: Mon, 20 Apr 2026 10:46:01 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/53] selftests/mm: make MM selftests more CI friendly
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
References: <20260406141735.2179309-1-rppt@kernel.org>
 <ee6bbac9-b375-4413-a771-6d32c7afda67@arm.com> <aeXvty_LE4v5XLq3@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aeXvty_LE4v5XLq3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/04/2026 10:19, Mike Rapoport wrote:
> Hi Ryan,
> 
> On Mon, Apr 20, 2026 at 09:37:03AM +0100, Ryan Roberts wrote:
>> On 06/04/2026 15:16, Mike Rapoport wrote:
>>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>>
>>> Hi,
>>>
>>> There's a lot of dancing around HugeTLB settings in run_vmtests.sh.
>>> Some test need just a few default huge pages, some require at least 256 MB, and
>>> some just skip lots of tests if huge pages of all supported sizes are not
>>> available.
>>>
>>> The goal of this set is to make tests deal with HugeTLB setup and teardown.
>>
>> Hi Mike,
>>
>> I haven't had a chance to review this series properly, but the intent certainly
>> seems extremely valuable!
>>
>> I thought I'd share some configuration magic that I always use when running on
>> arm64. Appologies if I'm teaching you to suck eggs...
>>
>> arm64 supports multiple hugetlb sizes and (at least in the past) the magic in
>> run_vmtests.sh only reserves for the default size. As a consequence, whenever I
>> run these tests on arm64, I always boot with:
>>
>> hugepagesz=1G hugepages=0:2,1:2
>> hugepagesz=32M hugepages=0:2,1:2
>> default_hugepagesz=2M hugepages=0:64,1:64
>> hugepagesz=64K hugepages=0:2,1:2
>>
>> Which reserves 2 pages of each supported non-default size in each of 2 NUMA
>> nodes, and 64 of the default size in each NUMA node. (This would need adjusting
>> if using a different base page size).
>>
>> My recollection is that this effectively overrides what the script was doing and
>> is sufficient to make all hugetlb tests run for all hugepage sizes.
> 
> My goal is to let the tests themself set up the right hugetlb configuration
> without forcing it neither in command line nor in the wrapper scripts.
> 
> On x86 I can run all the tests in a virtio-ng VM with two nodes and no
> kernel command line overrides. I suppose that should work on arm64 too.
> 
> There are some additional settings that such a VM would need to avoid
> skipping tests that presume swap or a real filesystem, but that's more of
> virtio-ng limitation.
> 
>> If it's possible to get this non-default hugepage size reservation logic into
>> the tests themselves, this will make the mm selftests much easier to run on
>> arm64 with full coverage.
> 
> That's what the second half of series do. E.g for cow tests:
> 
> https://lore.kernel.org/linux-mm/ee6bbac9-b375-4413-a771-6d32c7afda67@arm.com/T/#m62f23b835061449bc6249afacf993bb32ea11234

Ahh, excellent; you're already considering the non-default sizes. I'll get back
in my box :)

>  
>> Another observation is that "secretmem.enable" is currently needed on the
>> cmdline to enable secretmem so that the associated tests run. Not sure what can
>> be done to make that simpler?
> 
> Looks like you're testing really old kernels :)
> The secretmem default changed to "enabled" from 6.5 ;-)

Good to know; I created my scripts/environment pre-6.5, so that's just
historical baggage on my part, I guess.

>  
>> And there are tests that depend on having more than 1 NUMA node; I always run
>> under QEMU with 2 emulated NUMA nodes. I guess that's really just a property of
>> the HW, so nothing to be done from the test harness.
> 
> Right, test harness can't do much about it. It's either run in a virtual
> machines with 2 (or more) nodes or enable NUMA emulation in the kernel
> configuration and the kernel command line.

ACK

Thanks again for this improvement!

> 
>> Thanks,
>> Ryan
> 

