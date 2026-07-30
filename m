Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7242FCA8;
	Thu, 30 Jul 2026 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420736; cv=none; b=asAIm5r+ayP7JyLPk1EU0+hfbBnpVGUzEZoLzepfRMLgEdq4a8MTqEUgIsvROPIaTuSL/3KPVjgFfu6Y5mQnuKgNgIgDudiJVgjk2V35UV9VN95XegOkxX5ZQuXTIjwmLi9kjAW430lPaD2c8fn5pQmO+PtfDQuH7lX5sPpdOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420736; c=relaxed/simple;
	bh=u6CX1OwvhD6q3jUPVoNwV1Np3OeIG84DF31qS3UNX98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tn20o4Ca+yHBirzf1QaqpuxUIg2AK01MDtVcsfhPhjSxURY5ZlSVs8NMgpGGTlAEre1NL/plS/Pm+LTsgZEVR6WvwRZnyb0h8MmIwq51mwr7MQebM+8u9hnHk0OPsDCheNyMIGdyDFWjpqy6FvRSaNNtQwLwFyYM++oo9+F5bMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4WG35o3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4WG35o3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6441F000E9;
	Thu, 30 Jul 2026 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785420735;
	bh=9jTCc+dC0J5dZ7rhqhwfRECrsviChTGMOBzkGJ8U3GY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i4WG35o3hxys5VlaZLmvy6fM1porCnbU7qeEwAbupEZfPCX7F09L5Sdqzg6HF6W4A
	 UGAbZjR4lIivny8cx0qxYHNevolkd6i+UkoXOCAyZhN/RPwHBTUV0yh0fVZEVBT0kw
	 w6aZMDxlYC6JVEzbYV4x9C2wshWXFOyZcNKit6WzbQv/NkDWu8434MYP2LesQ9q5Da
	 XqEDTUKjHqJWQDGpVjCSkHADDKYQSq3egY+iQdwOdAUWGppIOQ4oM/9NXze/Xsslp3
	 rbDsyy4KiIG5AVwGGvICU1ju5/VwkJMF6r8WarqwbxkZwsZdm5DwG9b3unOliLjTuB
	 A8pWV5AuJ2QKg==
Message-ID: <38eb2487-3ce0-4d02-a7b4-d5b81e249ef4@kernel.org>
Date: Thu, 30 Jul 2026 16:12:06 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] mm/memory_hotplug: bound offline retry loops with
 a configurable limit
To: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Michal Hocko <mhocko@suse.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>
References: <20260722074811.378283-1-aboorvad@linux.ibm.com>
 <3d18e400-5e7f-468a-b96e-d603d9535ac9@kernel.org>
 <fdf72bbd-dd00-4a65-a196-75371f2585bc@kernel.org>
 <1260a5746d88eff27565d506f69cf74bd766abc1.camel@linux.ibm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <1260a5746d88eff27565d506f69cf74bd766abc1.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> Usually that happens when we race offlining (has_unmovable_pages()) with page
>> allocation, and failing on unmovable pages is actually perfectly fine.
>>
>> But for ZONE_MOVABLE we should keep retrying, because some pages might only look
>> temporarily unmovable.
>>
>> So that would be the low hanging fruit: on !ZONE_MOVABLE, fail faster.
> 
> This handles scenarios like Case 1. A page can still be allocated from the range after
> isolation and become slab. When test_pages_isolated() fails, we can re-check that
> page with page_is_unmovable() and return -EBUSY if it's unmovable. I'm currently testing this approach
> will send a patch for review.

Yes, and that we should handle. It's a known race and we should just fail faster
in that case. !ZONE_MOVABLE.

> 
> Case 2 is different. The page is on the LRU, so it is considered movable and the fast-fail condition abovewon't be triggered. Instead page migration keeps failing, causing
> offline_pages() to retry indefinitely
> and can hang forever. This could be handled with a timeout or a user
> policy in the application that
> initiated the hotplug operation (signals). However, for the kworker
> paths that trigger memory
> offlining (ACPI remove, etc.), should this instead be handled by the
> driver rather than relying on
> offline_pages(), similar to virtio-mem?

If it's on ZONE_MOVABLE, then we should figure out why it keeps failing forever
and try fixing that instead.

Above you write: "I can also trigger it in a VM by hot-adding a DIMM, pinning a
page and removing the DIMM."

Anybody who intends to take a longterm pin must be using FOLL_LONGTERM, which
will take care of exactly this condition: migrating memory out of ZONE_MOVABLE
first.

So which interface does you reproducer use to trigger pinning?

-- 
Cheers,

David
