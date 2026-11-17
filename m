Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918417;
	b=0lATm1Q7osGanTp73eHHWQ+FHdkq+P34dYf7EjBzL2NHODgq0h1lJEs7b32sxjyyzaIa
	 0bbg3qa+59OLnFd6jXCTxF76FzkXXL3EBKZS6jxt5ykndsehxhE5SChQWlIqM6t8dgkUO
	 IFSIqRElO42CCcQVYPECiCO9sNb8gohQSzsaSo8g+fTYVRnkh5e66a/5UjJb7O6EtRFOT
	 h3YaPwFv/FGEImZ4HXUwDvVPYDtCAR0NJSQ3xuVqH8rhTGa7Wiqq+3WIIZCOXeE83hSCL
	 yiYl1eOkVyZqMJAcpgdM/lm6AkCDZSihW760CQ1CSlOB5ONjM0RHXeFA3K8a+US0FnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918417;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=a0Hhh6EB7u7ze6tHi/AqmllD56uVT+yPDQDWEyuvBtQ=;
	b=fSqNQlGzTRS7XysedJqhEfM2oBUoM7Mdaohabm2XGlukU95qrRiPcQk8+GprV0q0ix4E
	 /mSLuO29EtGKSDF/ZXgOpEQg+sBKKIbbbLMRbNYIvb/WynbpLr+2MUmYuw77GaLXuBGI8
	 dLHD+lz9HzQBIb7UcU+aGK3MWZF9yIvElGBM9KTraom7ab0XKOb00qRT4L3Isri80uF0Y
	 tro+3+vZmZ2xBztxUenEDkO8Ntr9JMh8aN80Q9Vjm8s3VYfefe6lvqAOeCRItQawKnAFe
	 Pgk5HXMd6jjGmDoigJcKbv2YvrZFFzvR/u0nj/0dyjfzGSVxXNUGTUXrb+5qsecjeWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L3B8zwEX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A60606A88F;
	Tue, 17 Nov 2026 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L3B8zwEX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5012B1F000C5;
	Tue, 17 Nov 2026 12:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794918417;
	bh=a0Hhh6EB7u7ze6tHi/AqmllD56uVT+yPDQDWEyuvBtQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=L3B8zwEX1FTal6O2Eoy7mwJOAUsJyaL07I0n5sa7jQbOMTnV8LSBRDO5mhrYj7xBL
	 qmncfH3N68+9Ld2c0KC+cQh6tJUWmGDp1uhXgdNRYi8YXggB1uVr9+U1iIv1kvgzbW
	 0IVV0KaOH9/vIMOAgAWPCHZIQ20rMwcSflm4Df6WkAaoyvPN2hkGeoFF9Av7FPArqt
	 Ck+nzUb0sMblXMJymF8IVhrsfMjRGfRucr1V0Yz2luxdfACZ5ItBcsXcWnDnhOhmmr
	 iL6Yt7QGzH43LPppRMilN3ujiwNT/FkKpnMOGp3f4T2kI0geMpS0HYN5Y+jxz75X6i
	 suriT9i4Gl5GA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Alexander Graf <graf@amazon.com>,  Jonathan Corbet <corbet@lwn.net>,
  Shuah Khan <skhan@linuxfoundation.org>,  Randy Dunlap
 <rdunlap@infradead.org>,  Andrew Morton <akpm@linux-foundation.org>,
  Tarun Sahu <tarunsahu@google.com>,  David Matlack <dmatlack@google.com>,
  Samiullah Khawaja <skhawaja@google.com>,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] KHO map
In-Reply-To: <179486913878.127049.11178890384802388709.b4-review@b4> (Pasha
	Tatashin's message of "Mon, 16 Nov 2026 17:45:38 -0500")
References: <20261116134013.1636689-1-pratyush@kernel.org>
	<179486913878.127049.11178890384802388709.b4-review@b4>
Date: Tue, 17 Nov 2026 13:26:52 +0100
Message-ID: <2vxzwlqbfxtf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 16 2026, Pasha Tatashin wrote:

>> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>> 
>> Hi,
>> 
>> This series introduces the KHO map. It is a sparse map from integer keys
>> to u64 values. It is implemented as a radix tree of fixed depth.
>> Currently the tree depth is 6, so it can support keys up to 54 bits
>> wide.
>> 
>> The main user of the map is memfd. Currently memfd uses a vmalloc buffer
>> that has a pair of {index,pfn} to track the folios in the file. That
>> uses 16 bytes per page. The KHO map uses only 8 bytes per page with some
>> overhead. So for a 1 GiB memfd, it uses roughly half the memory.
>> 
>> In addition, it is a more versatile data structure. For example, it
>> allows for adding or removing pages from a memfd after preserve more
>> efficiently than the vmalloc array.
>> 
>> Post-LPC 2026, the plan is for KHO to maintain backwards compatibility
>> as much as possible. So this data structure allows the serialization
>> format to be more flexible to future changes. It can also be used by the
>> upcoming HugeTLB and guest_memfd preservation.
>> 
>> I have talked about this as "KHO xarray" before, but I think using
>> "xarray" is just going to confuse everyone since it isn't really a
>> xarray, and the API works a fair bit differently. So I renamed it to
>> "KHO map".
>> 
>> This series isn't complete yet, but it is in fairly good shape so I want
>> to share it to get some early feedback.
>> 
>> Things that are missing and planned in the future:
>> 
>> - Multi-index entry support: currently, while the map is very efficient
>>   with 4k folios, it is horribly inefficient with 2M folios. Each folio
>>   in the memfd takes up a full page to track. Multi-index entry support
>>   can fix this by tracking entries that cover a whole page in the
>>   previous level, similar to page tables.
>
> Let's fix it, see below.
>
>> 
>> - LUO versioning support: LUO versioning headers are still in
>>   discussion. This data structure should use them for future
>>   extensibility. I am mainly waiting for things to settle down there.
>
> I would not worry about this. If versioning lands first, this series can 
> be updated then; if this series lands first, Tarun will update his 
> series.

Sure, fair enough.

>
>> 
>> - Dynamic depth support: Currently the depth is static, so it can only
>>   support keys up to 54 bits wide. Adding support for multiple depth
>
> Let's allow keys to cover the full 64-bit space from day 1, and make 
> values 63-bit (like XArray), using bit 0 to distinguish a child node 
> pointer from a leaf value.
>
> By making it generic from the beginning, we won't need to worry about 
> ABI churn for these features later.

Right, that makes sense. I didn't want to over-complicate things, but
you have a point. Taking the ABI complexity up-front is better than the
churn later down the line.

> Instead of caller-chosen depth, the tree should grow (and shrink?)
> dynamically bottom-up based on the widest key.
>
> Plus, with bit 0 tagging leaf values, 2M entries can be stored directly 
> at L1 and 1G at L2 (on 4K pages). Even for huge memfds, the pgoff space 
> is much smaller than 64 bits, so in practice the tree stays tiny in 
> depth.

I think it is a good idea to allow dynamic depth in the ABI, but I am
not sure if we should deal with the automatic resizing just yet. How
about we start with making callers specify the depth (max index/pgoff)
up-front for now? The ABI stays the same, so we can add support for
dynamic resizing later if needed.

The reason for this is to keep things simpler to begin with. That said,
I don't have a _strong_ opinion about this, so if you insist, I can add
dynamic resizing from the get go.

-- 
Regards,
Pratyush Yadav
