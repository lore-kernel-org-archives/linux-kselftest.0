Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230FD4EBAD4;
	Tue, 29 Sep 2026 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672732; cv=none; b=met4QskA0Eoxv6PsKz7pMiS3pAT1/MyRqPH0x5ziFEGs13N9cLTs4Wu5P18MuR0pZiwi/VZBb0BZjwouhGL+d9uw0J7JjAMSNAtMllVTT2B+TBZppsWcw28cUgn6b1/ZDsKMhVZSGLCwg575u0v/Z6fNzGEUyMs5FgFuyzJE8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672732; c=relaxed/simple;
	bh=wxmwOLxAhQpBe7UtMnjFcrSEnz/kEIYY9IPLyMGptV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKlx3YNMP/Hk2AjsMxFFLAdDVaMvkYNizNkrsnOdpQjsUHyDEE9wD1VFwIXoPi1OST3xlh40Eurne8LVoNz9LyMnCZJyPyky/XYMPuDC/reiIx5WG0CHdd95Uou2c7lJ7j2a0oWSGSh0Bs0YlTbBqFEuYixb9s7xBx7D++Mw4dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AEVzYGRL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AEVzYGRL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED58A1516;
	Tue, 29 Sep 2026 02:05:10 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D9993F85F;
	Tue, 29 Sep 2026 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790672714; bh=wxmwOLxAhQpBe7UtMnjFcrSEnz/kEIYY9IPLyMGptV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AEVzYGRLbEG6f0HWOgDUWAZxT88uI/fydL6u0G2bJG0cxIal7ePkx+TDFllEwLf/Y
	 TaT96+nTqZn119qDOq0Pr91rb+pZLZdEHWZqX4Krvm/iEgMIqAn51gHZDd+ZK+srBW
	 5UrQuhsQfxmLVqGLkg6OaCm2Ypzhxxo1rp6jQsgk=
Message-ID: <7edcf2a8-0dc4-456d-98c8-730ade633df5@arm.com>
Date: Tue, 29 Sep 2026 14:35:07 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/9] selftests/mm: improve mremap_test
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun
 <ts930@dgu.ac.kr>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
 <b8da4a73-296b-47f9-95dd-b8a74f3a0984@arm.com>
 <CAC_TJvexEaehZno0P=xsoCbLw7wgfz+22iV4fwzcuGCiu3vAAw@mail.gmail.com>
 <92ec3966-e68c-4dda-9d8b-9462f22c9e93@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <92ec3966-e68c-4dda-9d8b-9462f22c9e93@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kalesh and David!

On 9/29/26 1:17 PM, David Hildenbrand (Arm) wrote:
> On 9/29/26 09:32, Kalesh Singh wrote:
>> On Mon, Sep 28, 2026 at 10:54 PM Sarthak Sharma <sarthak.sharma@arm.com> wrote:
>>>
>>>
>>>
>>> On 9/24/26 10:30 AM, Sarthak Sharma wrote:
>>>> This series fixes several correctness issues in mremap_test and
>>>> simplifies and strengthens its data validation.
>>>>
>>>> Patch 1 converts the mremap_test to use kselftest helpers, removes
>>>> manual tracking of failed tests and corrects some spelling errors.
>>>>
>>>> Patches 2 to 5 fix userfaultfd skipping, unexpected mremap success
>>>> handling, multi-VMA data validation and failure reporting when data
>>>> corruption is detected.
>>>>
>>>> Patch 6 removes the randomization and uses a simple pattern based approach.
>>>>
>>>> Patch 7 removes perf tests and timing infrastructure.
>>>>
>>>> Patch 8 removes validation threshold and always validates complete mappings.
>>>>
>>>> Patch 9 strengthens the multi VMA validation by also checking the
>>>> mapping state of holes after remapping.
>>>
>>> Hello everyone! Just wanted to check if someone has had a chance to look
>>> at the series.
>>>
>>> Also, Sashiko has a concern [1], and I had the same while posting the
>>> series. I hope I can get some opinion from the community.
>>>
>>> Currently, for PUD remap tests, we allocate a source mapping of 2GB. We
>>> only fault in the first threshold_mb amount of memory, remap the whole
>>> region, and validate the already faulted threshold_mb amount of memory,
>>> which is, by default, equal to 4MB and can be changed by the user by
>>> supplying a command line option.
>>>
>>> Since we plan to remove all command line options from teh selftests, I
>>> removed threshold_mb altogether, following some discussion on the list
>>> [2]. This would now cause a 2GB source mapping, and its contents copied
>>> from another 2GB buffer. This causes the process to have a 4GB RSS.
> 
> Yeah, that's a lot for small CI systems indeed.
> 
>>> Sashiko says that this can cause OOM killing in small CI machines.
>>>
>>> Would it be okay to keep a 4GB RSS in this case, or should we find some
>>> other way of validating a part of the whole range instead?
>>
>> Hi Sarthak,
>>
>> IIRC when I initially introduced the test, John was concerned that
>> validating the whole range would significantly increase the duration
>> of the mm selftests; this is why the threshold was introduced. Please
>> check how much it increases if we validate the full range (with
>> David's suggestions) and if it's no longer a concern from other folks.
>> I am fine with removing the threshold.

I tested on an Orion O6. Here's the difference before and after removing
the threshold right now.

Before:
0.02user 0.07system 0:00.10elapsed 98%CPU (0avgtext+0avgdata
87332maxresident)k
0inputs+0outputs (0major+21133minor)pagefaults 0swaps

After:
1.67user 4.91system 0:06.63elapsed 99%CPU (0avgtext+0avgdata
4195564maxresident)k
0inputs+0outputs (0major+2225058minor)pagefaults 0swaps

I think instead of the time taken, the more concerning thing here is RSS
(85MB vs 4GB).

> 
> As discussed off-list, I guess it makes more sense to validate a couple of pages
> at the beginning, the middle and the end?

Yup, makes sense. I will implement this then.

