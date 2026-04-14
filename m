Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D2442AA9;
	Tue, 14 Apr 2026 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167600; cv=none; b=ZF2RgfNvSqRqEs3hFJ7/yKONcBnUVzOCgrTyaZSOfJrNWvEv5WKIf59LFQPa5jmd2zWKX7c7pcvqMHYYwcvISTouhNCNE76vEqNp+kRv3rKP5g9LhBLPEuinJjLICqpMKoMN4FLHUsFB05cB0SyQ3n+779P3Cs5CUl8hSg51Sb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167600; c=relaxed/simple;
	bh=bOWJvnb+WlBXVvkWaUAUBioPsi6PAKoSEmTmEDuBu6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9hwXdbQJhBONnjvlGVtNPwjUqwzNeQNgELjZHj9BRdp8wI2G/YXWxbvgczj1GINIs06bTBK3b/J49f+TEZ3bwFaVt1Ut1jbb+A966k5a8vmFxorLz1rSny6eQYOwZkjhrYgY1s41G1jBvQgCe3/Oz690XK2/uC4lgh6BOyJyrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Mdp3GqyO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Mdp3GqyO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8A0A4ECA;
	Tue, 14 Apr 2026 04:53:11 -0700 (PDT)
Received: from [10.164.148.48] (MacBook-Pro.blr.arm.com [10.164.148.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F2D3F7B4;
	Tue, 14 Apr 2026 04:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776167597; bh=bOWJvnb+WlBXVvkWaUAUBioPsi6PAKoSEmTmEDuBu6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mdp3GqyOMVjYlN0r28tMkDTgkwOFuC9SrcWUedotlxK3zLLM03/skZBkZdiQojFeN
	 dSrREtJUafgYqbCT/Go2OER5USAVJLBHaFRmekq7tT1j2W3xLrH/dreSqGRNr2jtOv
	 0C2TRa8vcymaJM3PMCgAGgrLcqKIPBVusR5D+TWk=
Message-ID: <806952ab-8461-41eb-b7c7-7c8be56bd7c9@arm.com>
Date: Tue, 14 Apr 2026 17:23:09 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Simplify byte pattern checking in
 mremap_test
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 shuah@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com,
 Sarthak Sharma <sarthak.sharma@arm.com>
References: <20260410143031.148173-1-dev.jain@arm.com>
 <5297e0da-d8ec-49df-9b32-0d9f907588d6@kernel.org>
 <8b5544eb-5ec0-4c85-a2da-7a454fa606dc@arm.com>
 <134c372e-5c9e-493d-b954-d9954546beaf@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <134c372e-5c9e-493d-b954-d9954546beaf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> 
> 
> I would suggest to rewrite/simplify/clarify the patch description, not
> talking about "buggy" etc, focusing on the simplification.
> 
> "
> The original version of mremap_test (7df666253f26: "kselftests: vm: add
> mremap tests") validated remapped contents byte-by-byte and printed a
> mismatch index in case the bytes streams didn't match. That was rather
> inefficient, especially also if the test passed.
> 
> Later, commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
> execution time from minutes to seconds using chunkwise memcmp") used
> memcmp() on bigger chunks, to fallback to byte-wise scanning to detect
> the problematic index only if it discovered a problem.
> 
> However, the implementation is overly complicated (e.g., get_sqrt() is
> currently not optimal) and we don't really have to report the exact
> index: whoever debugs the failing test can figure that out.
> 
> Let's simplify by just comparing both byte streams with memcmp() and not
> detecting the exact failed index.

Thanks, I'll use this!

> "
> 
> 

