Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7713DB650;
	Mon, 13 Apr 2026 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776108477; cv=none; b=OoEEr9ZnxPenxbUcaCBW6IhTXMq9dMJq5iJKUi2YRJsScjwlV9otWxc9dTT/AniNB5u375zqKSLUOwj5lfAhvUI/iGvAXJoMOeuzKprAHSS2/jHsc4GJRrofAAjnMu7be/UEXxp/nvUHp+wsN3JVudKPzv3+ziDTjnZSBdoP36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776108477; c=relaxed/simple;
	bh=Hfs+6Y7gcGQJL72F4dYFx5Gznr+OvUZ9Zk/MEnMHgoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCcGcfLNJnSoPJd+QphIUawyXI9KrluqABW42FOxH4SpabJYCeY70EdZOl+4VfNctsbTDnofSNf9t84fjL8vamToul/+QfaLbnbqlpNhdom4gqMjA/QRF7zcYEL/4DBqxZqAXLOaYYs09Qfr7ttYI31BLO0xXwfEMEKtUrk2/dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sq5WgcMY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sq5WgcMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD778C2BCAF;
	Mon, 13 Apr 2026 19:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776108477;
	bh=Hfs+6Y7gcGQJL72F4dYFx5Gznr+OvUZ9Zk/MEnMHgoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sq5WgcMYK3l0ZU8RH001hZQzqmJ3HVN+S6B9cNcMMkw4TJetW4VcreAaHi4SRFjAv
	 FQGTb49s+/ZujASfwByx/J+PFsM3VB6fv0ZqUqevLYsYE+iaAHrXiO9lDF5n3MU5PF
	 UsXIi6rs68VbFkxXw5doQQOV6Jg0GpG+deu5k5F6inEItwzivzVttZtCEPbjAVDkE4
	 NBy1FTG9Fgm/jlPm5Kkt9hMZEXV4JeOJuYYEY/RGqhxDQRUjth6fpxLkHx8f8w51ng
	 mH/3sSu1zvqFwegHgzCTlJBOp1KkM13EttTGrgngClFKw4L1F3tWGyt9x4gT7HVCvZ
	 xbyeMfgJLi11w==
Message-ID: <5297e0da-d8ec-49df-9b32-0d9f907588d6@kernel.org>
Date: Mon, 13 Apr 2026 21:27:48 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Simplify byte pattern checking in
 mremap_test
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, shuah@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com,
 Sarthak Sharma <sarthak.sharma@arm.com>
References: <20260410143031.148173-1-dev.jain@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260410143031.148173-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/10/26 16:30, Dev Jain wrote:
> The original version of mremap_test (7df666253f26: "kselftests: vm: add
> mremap tests") validated remapped contents byte-by-byte and printed a
> mismatch index in case the bytes streams are not equal. That made
> validation expensive in both cases: for "no mismatch" (the common case when
> mremap is not buggy), it still walked all bytes in C; for "mismatch", it
> broke out of the loop after printing the mismatch index.
> 
> Later, my commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
> execution time from minutes to seconds using chunkwise memcmp") tried to
> optimize both cases by using chunk-wise memcmp() and only scanning bytes
> within a range which has been determined by memcmp as mismatching.
> 
> But get_sqrt() in that commit is buggy: `high = mid - 1` is applied
> unconditionally. This makes the speed of checking the mismatch index
> suboptimal.

So is that the only problem with 7033c6cc9620: the speed?

> 
> The mismatch index does not provide useful debugging value here: if
> validation fails, we know mremap behavior is wrong, and the specific byte
> offset does not make root-causing easier.

Fully agreed.

> 
> So instead of fixing get_sqrt(), bite the bullet, drop mismatch index
> scanning and just compare the two byte streams with memcmp().

How does this affect the execution time of the test?

> 
> Reported-by: Sarthak Sharma <sarthak.sharma@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Fixes: 7033c6cc9620 ("selftests/mm: mremap_test: optimize execution time
from minutes to seconds using chunkwise memcmp")

?

> ---
> Sorry for sending two patchsets the same day - the problem was made known
> to me today, and I couldn't help myself but fix it immediately, imagine
> my embarrassment when I found out that I made a typo in the binary search
> code which I had been writing consistently throughout college :)

:)

> 
> Applies on mm-unstable.
> 
>  tools/testing/selftests/mm/mremap_test.c | 109 +++--------------------
>  1 file changed, 10 insertions(+), 99 deletions(-)

I mean, it certainly looks like a nice cleanup.

-- 
Cheers,

David
