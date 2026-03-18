Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B3F33D6D2;
	Wed, 18 Mar 2026 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818402; cv=none; b=KE3PKsSPIgImdlIvOGlJCLsfUgmHTk17YkN0lN2REWH0bhBG+nkzDSuYILb5g9VaVowTyxAGxK/0jr3SHnJxMIjwByD2CL598k1qQKf0NoYqpC2HCv0NeEEvPiZKcIuEwOrvzLC4udgOX/falQj9ysCEj7aXthXXsmPpg+3Pevs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818402; c=relaxed/simple;
	bh=X5phuSWAi+AekiVmJplfRCsVo8uogimNNVasgHiT+fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJPtjZtjDCQkbde3vwI4ZBOiLbzESPvAu/H0EBFCTbFyKwd19Pd5sCIPfPjekUNgtrUox801gMcLQD4VIHuEAV6XhAcdH7DJq27QYY9HebNCJ58ylpvQfBPW+Gg0l9PwXNLpyuKI5WcDnUnb6rbfv0UnwyjaDcr128y9yk+rwuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=Texf1fR7; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=qpNl5rE5; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="Texf1fR7";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="qpNl5rE5"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1773818397;
	bh=X5phuSWAi+AekiVmJplfRCsVo8uogimNNVasgHiT+fc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Texf1fR7MpUQXbhKZ3r5lCbDFcKanyIvQGpuru+ac3NJf31YHpxWkEI1A1DUIROn8
	 QiJKyJVX9teGYGQCYfPyXwjtJalOQLa57EuHvNSDd6bCfoIuVBpR8lD8QZT7049hv8
	 So6YobSJiUDVXyOY4LBhrA3kZ5GJZmCrP6dM/c7V+Vh58wMMOH6l1W5sMQ//RyMFxl
	 qCZd4XA5DhHANb9oQqR776+aWoafsv3ItE4tA+Bc7D84sj0r0nPYwWny87nh1Oz1oj
	 d+l2cDFmVkNxUTouNSXsIX6P7/Aq+4lh0iFGvZk8eGOSsB9IzCrhhT0Qv3sb2kDWwu
	 fVdrC1uHmUGFhCouKJNIaflO4msMfu5PswND/E87W6lnODe3/GXMju4/SfWpJ+hBhk
	 kZdxeT07EhIJiXShmDQ7VoFtX+XhOdRXW/Mn/MLrOid40ztiTjUShNOhQNThtqYlNi
	 nuD85Ld11CctdfwXPAPAFaHTPDxqFBf9qpi6BJ9zLo+xNoAVFGg3K9uVcGh+bUXfC1
	 VF2yGO5xaR/NSjp2ABzs/tXo8f7ESbvNa4uhKXMuEWun87kiti46ZSLpu+9AIhEnZp
	 FNOpwCyMhv4xYuSadOYZC7cXu6zWn8RRzvGhRwbrLqO2g7TdDIo61A5scH3Jj1K+6R
	 5ML/euN1jtWWhCjHV4t0CAks=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 81A141E8095; Wed, 18 Mar 2026 15:19:57 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1773818395;
	bh=X5phuSWAi+AekiVmJplfRCsVo8uogimNNVasgHiT+fc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qpNl5rE5r9s4HGR5C5zoYZp41Nar5DgaVFwhro3oSMCpd5UfhZK5BQplxz+HLYUKb
	 2KBjObMcJLK+yATmIxAScBLPE1PiqjOeQdUZMDGHz4hvmFuyR4Wh6iICoAhUP68krk
	 ZUpG+J6DW5Ckv5wgzEyll5ulWaN/xwUKjip76QBfgbtMz/vwdGW5rUsOxaLb6furlr
	 altfwFsKt4ue0ye9jwGLOpJ6D3G+jdulPzn0gqSY22GXka+wAySqed3yRuzbyc1Ide
	 3IdvOBpTIiKWKkqMVG+I8hzzwYK6VW+WDtM9ElIx9QTYF5g9aSmL1GOIIvjNFbfl9T
	 mqH2adK9MV7MdobI7KxyzSEMaZO7jCVBMm+1NoM7nEQJb/8Sq125YXvGr/BYQ6tWX0
	 uv3NP5cX+gf06wZS4w129Pn2D6zfRCj0ct2GooFAEr4h1PxoTiKhv78aSkW4WgovRx
	 Ww8XVG/ZjvLyzjUbErYNwDgvziruTl5rS4OypaisAP8isSoTTSSqkZG0hoReggwqtr
	 viygdr/kbPE45c5yBj8DKsXg2CT587nziE6+va+hyVzcPksbyDIAjxXhbo/5ajFMvj
	 CID5Y/M0dAhv5ooByXR4NZqB8UULRIa44wkTi+7IdYDKzePMm8qbfIgzuBbrmgRkfv
	 qm19t9zmdFQRH8Y/qEIwuPv0=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id D67AD1E808F;
	Wed, 18 Mar 2026 15:19:55 +0800 (AWST)
Message-ID: <6522d194-12f1-49d2-ba91-ef3e26b49817@davidgow.net>
Date: Wed, 18 Mar 2026 15:19:53 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] lib/glob: bug fixes, new features, and tests
To: Josh Law <objecting@objecting.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
References: <20260315211807.411173-1-objecting@objecting.org>
 <b077cc42-ee35-4165-9936-49ef7d53e0e8@davidgow.net>
 <A5DA6F8B-C9B9-4BBB-ABE5-89A9E6EA577A@objecting.org>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <A5DA6F8B-C9B9-4BBB-ABE5-89A9E6EA577A@objecting.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 18/03/2026 à 12:32 AM, Josh Law a écrit :
> 
> 
> On 17 March 2026 07:19:47 GMT, David Gow <david@davidgow.net> wrote:
>> Hi Josh,
>>
>> Le 16/03/2026 à 5:17 AM, Josh Law a écrit :
>>> Bug fixes, extensions, and test coverage for lib/glob.c:
>>>
>>> Patches 1-3 fix corner cases in the existing glob_match():
>>>     - Inverted character class ranges like [z-a] are now normalized
>>>       instead of silently failing to match.
>>>     - A trailing backslash is treated as a literal '\' rather than
>>>       reading past the end of the pattern string.
>>>     - [^...] is accepted as an alias for [!...] to match the
>>>       regex-style negation syntax documented in glob(7).
>>>
>>> Patches 4-5 add two new utility functions:
>>>     - glob_match_nocase() for case-insensitive matching, useful for
>>>       subsystems like ATA that need case-folded denylist comparisons.
>>>     - glob_validate() for checking pattern syntax before use, so
>>>       callers can reject malformed patterns early with a clear error.
>>>
>>> Patches 6-7 add kunit test coverage:
>>>     - 47 new test cases for glob_match covering escapes, inverted
>>>       ranges, caret negation, edge cases, and unclosed brackets.
>>>     - 11 test cases for glob_match_nocase.
>>>     - 17 test cases for glob_validate.
>>>
>>> Patch 8 adds a real in-tree caller for glob_validate() in the kunit
>>> executor, validating user-provided filter_glob patterns and returning
>>> -EINVAL for malformed ones.
>>>
>>> Changes since v3:
>>>     - Resend: v3 accidentally included stale v2 patch files in the
>>>       same email thread.  No code changes from v3.
>>>
>>> Changes since v2:
>>>     - Fixed missing '^' in __glob_match metacharacter comment (patch 4).
>>>     - Dropped unnecessary braces in glob_validate case '[' (patch 5).
>>>     - Added real-world example to glob_validate() commit message (patch 5).
>>>
>>> Changes since v1:
>>>     - Added patch 8 (kunit executor caller for glob_validate).
>>>     - Updated glob_match_nocase() commit message to reference the ATA
>>>       denylist as the intended caller (follow-up patch).
>>>
>>> Josh Law (8):
>>>     lib/glob: normalize inverted character class ranges
>>>     lib/glob: treat trailing backslash as literal character
>>>     lib/glob: accept [^...] as character class negation syntax
>>>     lib/glob: add case-insensitive glob_match_nocase()
>>>     lib/glob: add glob_validate() for pattern syntax checking
>>>     lib/tests: add glob test cases for escapes, edge cases, and new
>>>       features
>>>     lib/tests: add kunit tests for glob_match_nocase() and glob_validate()
>>>     kunit: validate glob filter patterns before use
>>>
>>>    include/linux/glob.h   |   2 +
>>>    lib/glob.c             | 123 ++++++++++++++++++++++++++++++++++++----
>>>    lib/kunit/executor.c   |  13 +++++
>>>    lib/tests/glob_kunit.c | 124 +++++++++++++++++++++++++++++++++++++++++
>>>    4 files changed, 252 insertions(+), 10 deletions(-)
>>>
>>
>> Thanks: always good to have better test coverage (and those are some nasty corner cases!)
>>
>> Series is:
>>
>> Acked-by: David Gow <david@davidgow.net>
>> Tested-by: David Gow <david@davidgow.net>
>>
>> I'm making the assumption that this is going in via mm-nonmm, not the kselftest/kunit tree, as it has dependencies in that branch.
>>
>> Cheers,
>> -- David
>>
> 
> 
> Also, David? You mean the *ENTIRE* series as in the code too (the new functions) Or just your kunit changes
> 

I only really need to Ack the KUnit changes, but I did test the entire 
series, so feel free to apply it to all of them.

Cheers,
-- David

