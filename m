Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073346983A;
	Fri, 21 Aug 2026 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306062; cv=none; b=tITuKm5aD/EGhBGb13cU4v9V0JpJR92NFXf7wjW253JASfxVygd136nBRgyFEdF238wJg7RtyzDu+nDKQgHqkq7oQmY6/z6eunVs8S230s/6DvM96YK9eYMqKyVkF/Uww3sCva7jffnz1C7/eriGuE7wrx4LlJ4p0QEv2f8A3sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306062; c=relaxed/simple;
	bh=Nz9hokw3F6xiSwJBUm0t+qitUnWerwH3uRhk6Hodtis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iU3aDtsUA4nML2qahLRIMFoWxihshF+8vftzWX0L2jWX7HTIRek7VkDAXT05+nJSTmO35MbMas29BFKPA0+WiFuV2NjN0ZAKdgSCj8xvW/rSrTEnq2emJUbuqAWt5TnLN9iBAQ3RVa0MXuyoiJ61dye+Oe13Nw7Go4Nf5M/PmzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVJrWNLC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVJrWNLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97B51F000E9;
	Fri, 21 Aug 2026 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787306044;
	bh=TjPLxJNysrCM3XRTjy0rjnsBt7BAmnyP4ZMFpEcN1Sw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SVJrWNLCMys4aydRPUHIVTuX7TEEsk2EQ1EQ4KNIWMxdspWLnKdBwX8GiAsWuIA+3
	 xeetpygDIYQhcq5Cx/zuvud0+6wiM3d5sexk5Q/bK3+8Mml/0oCrHplnLlt0S8ybqi
	 /v20kjxrlHkWTxETU19UioaRAE7YVc5VVJXmYwwOfl3DsT46cDmwqSH4k6xoBskYkV
	 MM9QjlqvBNeACDehdIfoTTS8XLm8SOGTTMipmrUM3VLqcNI6GqRjHcn3oIa3Rck1Yj
	 Bd7E7KVogJmt1BFhraC9rsxas26BHTa4+xJtYY3vX38LN7DVocCouQGFjByCEAwPGG
	 fm5ZyV0GW0Mbg==
Message-ID: <59525a3e-6003-4ab1-bd75-e0c7dcc8a257@kernel.org>
Date: Fri, 21 Aug 2026 11:53:57 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] selftests: mm: introduce page allocation stall
 reproducer
To: Andrew Morton <akpm@linux-foundation.org>, Jason Miu <jasonmiu@google.com>
Cc: Shuah Khan <shuah@kernel.org>, David Rientjes <rientjes@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Greg Thelen <gthelen@google.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20260819070538.2404983-1-jasonmiu@google.com>
 <20260820170348.48f04ed654dce5193ca3a532@linux-foundation.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260820170348.48f04ed654dce5193ca3a532@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 02:03, Andrew Morton wrote:
> On Wed, 19 Aug 2026 00:05:35 -0700 Jason Miu <jasonmiu@google.com> wrote:
> 
>> Background
>> ==========
>> Under severe system memory pressure, system unresponsiveness often 
>> occurs due to page allocation stalls. In commit 94e0bcde055e ("mm, 
>> page_alloc: reintroduce page allocation stall warning"), David Rientjes 
>> introduced a warning mechanism to emit a kernel log when a page 
>> allocation takes longer than 10 seconds. This log is used to correlate
>> a frozen system with the system memory state at the time of failure.
>>
>> To further debug and analyze these allocation stalls, we need a 
>> reproducible test case. This patch series introduces a new selftest 
>> designed to artificially mimic the severe memory pressure scenarios 
>> seen in production, allowing us to observe the resulting allocation 
>> stalls.
> 
> Interesting.
> 
>>  lib/Kconfig.debug                             |  11 +
>>  lib/Makefile                                  |   1 +
>>  lib/test_mempress_timer.c                     | 140 +++++++++++
>>  .../testing/selftests/mm/page_alloc_stall.sh  |  80 ++++++
>>  .../selftests/mm/page_alloc_stall_pressure.py | 235 ++++++++++++++++++
>>  5 files changed, 467 insertions(+)
>>  create mode 100644 lib/test_mempress_timer.c
>>  create mode 100644 tools/testing/selftests/mm/page_alloc_stall.sh
>>  create mode 100644 tools/testing/selftests/mm/page_alloc_stall_pressure.py
> 
> Nothing fits very well, does it?
> 

Why are we mixing python and sh?

> 
> 
> selftests is for quick tests which are run by run_kselftest.sh.  You
> had to place it in selftests because there isn't anywhere obvious for
> it to live.
> 
> So I suggest a brand new tools/testing/stresstests/mm.  If we create
> this, people will jump on it and start adding things which presently
> reside in their personal collections.

There was recently a discussion around performance tests, and one thought was to
not carry these in the kernel tree at all.

Stresstests, not sure.

So agreed, that this shouldn't be an ordinary selftests (nothing we would want
to run autoamtically), but I am also not 100% sure about having performance /
stress tests in the kernel tree. It's all stuff we have to maintain and drag along.

> 
> 
> 
> I can't say I like "mempress".  Is "memory_pressure" too wordy?
> 
> 
> 
> All of lib/test*.c shouldn't be in lib/.  lib/ is for library code! 
> Again, we put them there because people are shy about doing mkdir.

There were recent discussions where I raised the same. I would prefer if testing
kernel modules are somewhere in tools/testing/ if possible.


-- 
Cheers,

David
