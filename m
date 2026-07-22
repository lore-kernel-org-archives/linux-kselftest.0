Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DEA282F0E;
	Wed, 22 Jul 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723408; cv=none; b=CGuo1H3qAue2hsLK5sWVc+QQ3cXUcOt2/+vwiSGvok1pd8ZoUg+Go7ma9YTXj2319WHedGYindfi6o49zoRYrITBbmvC3IW2CeRHlT/yz9a5VevzQifbqNxIralFR0Um0toUrn4L0vVPOUM7oQw74WwRIvDKAq84QjikjgP7CoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723408; c=relaxed/simple;
	bh=v8f3Y6Va4MYAMte3Ym0aeTlEoMhGlP40kL/cMrbSs0Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AcjGqbsVKODCyqwTiCeRlSoIB883GsZKmftfo124zh7pbgLJ3++npwRS6xp4qT3FjZ/llruCqYn/JlXSWHpchfkGNDgfG7C/13L8eTR9zvBa7BZgIHjmPZSvCyedlOZGLElb/1lTxaqq3kYvM0d8FILtaww7pm7aSIqnH/XtMbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBTHz7JI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBTHz7JI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713261F00A3A;
	Wed, 22 Jul 2026 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784723406;
	bh=hrOPOUTvi7d4zFr0ZQTGTnbL7Djm33SC2gEDM33Natk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=GBTHz7JIktkPshg/tdO4IZLMEYgC4lBVN+oR275OWfoy/V5zPsN3Xh8oClpeby6h3
	 nGEx4OrQsRalXgfgRXARR7ArxWouv8ZdMroO+Vuky0e+RuG2THbaNoNgWGDDq2xtGA
	 Q5h9cQ+LajqztSLJDtZnrwb+X0iYDUIMyk5d7pgNI7EBbwtrlps9yLdFb8IwsE3cNh
	 0/rOfHClCEmplfhT+jypne0Xxx0Pdm8KqfYKYDsEqTyfnActQjev2Q7QFTi6xPkizp
	 TpiaUcnGsbMiquG/ctvf55hSCAxNkBqV3t3d4PX8xOcYaIVch9tNpaeRY7z2yelfCU
	 fvaz9qi8FjkIQ==
Message-ID: <fdf72bbd-dd00-4a65-a196-75371f2585bc@kernel.org>
Date: Wed, 22 Jul 2026 14:29:57 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] mm/memory_hotplug: bound offline retry loops with
 a configurable limit
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Aboorva Devarajan <aboorvad@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>
References: <20260722074811.378283-1-aboorvad@linux.ibm.com>
 <3d18e400-5e7f-468a-b96e-d603d9535ac9@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <3d18e400-5e7f-468a-b96e-d603d9535ac9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 14:08, David Hildenbrand (Arm) wrote:
> On 7/22/26 09:48, Aboorva Devarajan wrote:
>> Memory offlining can loop forever when a memory block holds a page that
>> can never be migrated or freed.  This series adds an opt-in retry limit
>> that lets offline_pages() bail out with -EBUSY instead of retrying
>> forever.  The default (0) preserves today's behaviour exactly.
>>
>> Patch 1 is the fix; patch 2 is an in-tree selftest that reproduces the
>> hang from an unsignalable kworker and verifies the limit recovers it.
>>
>> 1. The problem
>> ==============
>>
>> offline_pages() repeats two nested steps until the whole range is
>> isolated:
>>
>>   1. Inner loop: find and migrate movable pages out of the range
>>      (scan_movable_pages() + do_migrate_range()).
>>   2. Outer loop: re-check isolation (test_pages_isolated()); if not
>>      fully isolated, go back to step 1.
>>
>> Neither loop has a termination condition.  When a page can never be
>> migrated, scan_movable_pages() keeps returning the same pfn,
>> do_migrate_range() keeps failing on it, and control never even reaches
>> the outer isolation re-check - the inner loop spins forever.  The admin
>> guide acknowledges this:
>>
>>   "Further, memory offlining might retry for a long time (or even
>>    forever), until aborted by the user."
>>
>> The single escape in the loop is signal_pending(current):
>>
>>     offline_pages(pfn, end_pfn):
>>         do {                                    /* outer: isolation */
>>             do {                                /* inner: migration  */
>>                 if (signal_pending(current))    /* <-- ONLY escape   */
>>                         goto failed_removal;
>>                 pfn = scan_movable_pages(pfn, end_pfn);
>>                 do_migrate_range(pfn, end_pfn); /* may never succeed */
>>             } while (pfn < end_pfn);
>>         } while (test_pages_isolated(...));
>>
>>
>> 2. Why the kernel itself should be able to bail
>> ===============================================
>>
>> We keep hitting this during memory hot-remove operations: a single
>> stuck page can block the whole operation.  This was also reported in
>> [4] earlier; one example, where offlining kept failing to migrate a
>> busy block-device page-cache page (aops:def_blk_aops) in a normal zone:
>>
>>   [10880.889199] page dumped because: migration failure
>>   [10880.889232] migrating pfn 2a87b failed ret:1
>>   [10880.889235] page: refcount:3 mapcount:0 mapping:00000000718ec5a6 index:0x857 pfn:0x2a87b
>>   [10880.889241] aops:def_blk_aops ino:800003 dentry name(?):""
>>   [10880.889245] flags: 0x33ffffe00004104(referenced|active|private|node=3|zone=0|lastcpupid=0x1fffff)
>>   ...
>>   [10880.889291] migrating pfn 2a87b failed ret:1
> 
> Hi,
> 
> the text reads AI generated. If you did use AI, please disclose it properly.
> 
> Quick feedback:
> 
> 1) Using passes is not really what we want in many cases (e.g., ZONE_MOVABLE
> where we might need a couple of seconds/minutes to complete offlining with a lot
> of concurrent activity). An actual timeout is also problematic (see below).
> 
> 2) Having a toggle for all offline_pages() users is questionable. In particular,
> user-triggered offlining or offlinig triggered on ZONE_MOVABLE etc should not
> obey such timeouts.
> 
> I proposed a more restricted approach only for offline_and_remove_memory()
> previously [1]
> 
> [1] https://lore.kernel.org/all/20230627112220.229240-1-david@redhat.com/
> 
> Michal back then commented "I really hate having timeouts back. They just proven
> to be hard to get right and it is essentially a policy implemented in the
> kernel. They simply do not belong to the kernel space IMHO."
> 
> And I agree.
> 
> I assume you run into such issues with DIMMs in VMs? virtio-mem handles that
> much nicer nowadays, by essentially doing the hard part that should fail easily
> through alloc_contig_range().
> 
> offline_pages() is just designed to retry forever.
> 

One thing we can definitely do is to just fail faster if we find an unmovable
page in !ZONE_MOVABLE.

Usually that happens when we race offlining (has_unmovable_pages()) with page
allocation, and failing on unmovable pages is actually perfectly fine.

But for ZONE_MOVABLE we should keep retrying, because some pages might only look
temporarily unmovable.

So that would be the low hanging fruit: on !ZONE_MOVABLE, fail faster.

-- 
Cheers,

David
