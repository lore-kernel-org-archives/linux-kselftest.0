Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A05D47799E;
	Thu, 24 Sep 2026 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249567; cv=none; b=ZUGEa5YZyNpY2bXHqAxAzWcSikQ5I5XhAnHggXPgI7U51U77vx7xK4wxBbV4p51i7E7zzc5NJ15iBgvQDYqUJ7L0WQ0PoOuT0z+4w61q685uv7bM55A799VgjBdEIaT7mOI7q48zLRCzd82VjN2u+u4xyBUWljUTZavxAt043BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249567; c=relaxed/simple;
	bh=DLlsBqo0eMS+6mNCW0A3yo26qVE4Z8SudAU2wMXXblo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dv8YrrqNS9hY3sZO6CaxanGxLHe2kB/u8wV6DCJiRSUMVPnI+rTCCx86+A1dn1KrFmJAiSqjEcDk/xnOD35zs48NZLbTDEXSAcHOJ2KTveKcpQSQAjch7iAb/RfSoEp6wI6RiaQx8myted8ydr+ziXMlfqwjY0S2s3COFiUM9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSoPi3ry; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSoPi3ry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D2E1F000FF;
	Thu, 24 Sep 2026 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790249551;
	bh=cQj9D8x4oEPB7huvIPsbaucEe6zKoS2sjeEUT0tAQCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XSoPi3ryBulL5yHm+JAZdpDmXLrr9wQ1M3T1ZlEhgWVgsGlYKjxFDZBFvYCZ7nsOT
	 H3ipKCg+yeX9+ER9/1OEaMf9qS9tIzofbR2CD6T+XXzQ+VbD+JE/uTMJA4+7/wTXhC
	 Wii4PSEJUEfEq4j3cwHX4HkKmklrqUyTAEJKTVAmAifjnzRkTbU0IKQWdOOkZ093eD
	 hcAcNtr8uO4q89+C3cs0DaJ2k6Vhjz4ceLsgzs73AEDX96WEYw70NA2dn35QgyvHS7
	 Y27tHYQhwBsJMr9Y38I9JakIxF6rICjFL1qvNuC3vzo/IRLtVWmr8Tjw6sbFh5+Etl
	 7YwYR8c534qAw==
Message-ID: <e459d3c9-ad60-47bb-8b02-bed3819e8067@kernel.org>
Date: Thu, 24 Sep 2026 13:32:25 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] selftests/mm: exercise MADV_COLD and MADV_PAGEOUT
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, liam@infradead.org, vbabka@kernel.org,
 jannh@google.com, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-2-gourry@gourry.net> <arPgwegm8XgbEUrO@gremlin>
 <arPjwPwVxdvdR5S0@gourry-fedora-PF4VCD3F> <arPl6UhNDbwds4uR@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <arPl6UhNDbwds4uR@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/26 16:46, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 23, 2026 at 10:44:17AM -0400, Gregory Price wrote:
>> On Wed, Sep 23, 2026 at 03:26:05PM +0100, Lorenzo Stoakes (ARM) wrote:
>>>
>>> I think in general we want to avoid putting stress tests as part of the
>>> selftests in general? Or at least if they might take a long time to run or
>>> excessive memory usage, etc.
>>>
>>> Though that might be benchmarks, as we have the THP stress tests so maybe it's
>>> OK?
>>>
>>>
>>> In any case I really do think this should be split out into smaller parts, this
>>> is a _gigantic_ change :)
>>>
>>
>> Absolutely, but alas my poor email hosting throttles me if i send too
>> many emails - and sending a 38-part series where the important part is
>> the endpoint of the refactor moreso than the individual tests...
>> instant 24-hour timeout.
>>
>> I'm working on a solution.  Need better hosting.
> 
> Thanks! But yeah damn indeed you do! :)
> 
> Though larger series can scare people off so maybe better to send the tests
> separately?

In any case, we have to break this down into reviewable pieces. We neglected
selftests for too long.

... and there are some schlopped tests in there that we really shouldn't have as
they are way too special and hard to maintain.

Like this monstrosity:

+/*
+ * A folio faulted on another CPU can remain in that CPU's pending LRU batch.
+ * MADV_COLD drains only the calling CPU and must safely skip the non-LRU
+ * folio without changing the mapping.
+ */
+static void test_madvise_cold_remote_lru_batch(void)
+{

-- 
Cheers,

David
