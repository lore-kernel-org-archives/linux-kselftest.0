Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26238CFF4;
	Tue, 17 Mar 2026 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732343; cv=none; b=SKjbvH0raIMBtCAcDvYQB3dVp+9MiHz19FuOpUWf8bUAPHMVu6VnOA7nFBjWumYvdBZhvZ2HX1A1ep9hJetIinosul3ry5scZAQc7ss6t+cX0FJk8cDIqPyXoIYZ2FtMn6Ma6cVjj9UPoavBl58dRJXLL0PtN/9kJ4fL28dA19I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732343; c=relaxed/simple;
	bh=lZKx1GlPART86GaMyVPOpun/ynN/QOXqaU/brHclMVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFwq98+drBM6yCn5ZpcjiqifnBNCkoCX1w/NJ0WCrITSFsLiKWHwR2W6PxcM5c1OvnzdAsFz1gzH8UsAGFuhGWeLHdHjqctcQ7tQxl+Bxyo1pWxoB2R/GG5a+8gmm49HVWy4jyIPcOh8DetNAud0qPWceUOR9FzvWYdSoIhAXDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=WYCoiTS+; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=P4GDBOxi; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="WYCoiTS+";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="P4GDBOxi"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1773731994;
	bh=lZKx1GlPART86GaMyVPOpun/ynN/QOXqaU/brHclMVU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WYCoiTS+ICZb6n5vvtC9QePBNzyz9BWRhAB8dwFUpRuZodLOkVjJEQnf2zYig1WJ2
	 qG4x2ot/MPvWpF+7SQIa7wEQdn/2lTfc7B5BtADP2vZDvuE4v3y0bjGwl/7IQM0OyH
	 u+nDGixK4vGBNHHEeMxdp9ikD0jNo0i3CR4/T2Kn8KcKCmWmwX3ttIenN09LFgyDcL
	 NFJFGtWvFhWgXWUi+yMl+YuNok/FhRxK5gW6ox2WDROBtiKy233cHU/f/gUgHdv6KQ
	 +AqcSpZ9p1fLRXb234g0L74mwrBseAKdSXacIO1TcrUXryvZ0J/lJnn0/sjTBTNBkI
	 AJElzqB4WRQWrO7yXnBhovNLHavhq88d0OmB838/WmkuhArHTV/xo/26itBvsGnYFb
	 Mv40m8G07HwhjNSnOdSsk0X4QSNnns574KmA8S19gYj4jvvcB9uRBflQ6KVSms6Opr
	 syfuzhr+do8anG15If142bX2Ry6B+8shJwMphCYEcMLomMeuNdtQ7kQ8DYivU6xjla
	 DolasbcAUU1aH2lXhv4C220Ucdx3yu/0wq4+RDDISaXZooC9i7lszUDb8t6xUcLdAZ
	 IllhV7BekYyIxqVbwsNkM4Fn5ffMo79djfWQ7Kb736ej3eldF8ufjZ10TTjKupcuQR
	 RM9X9EvnHPjaZR1EQ3f0JBiA=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 2DD251E802E; Tue, 17 Mar 2026 15:19:54 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1773731992;
	bh=lZKx1GlPART86GaMyVPOpun/ynN/QOXqaU/brHclMVU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P4GDBOxiCdfmk64Z/5OJ3Ot54stfBIGyZy9HeEsngBYW4TnpO2b96BTc3Pasp02tN
	 rZTtjQ6Q3VQLFcJNMuM+jZ9l9Swx4k2PlIWA9rvKMYeeUiL1oYJQHkoE6u+b5xVxb2
	 uV4Z19Nuq8p36J8G0fI6B/05ZIDxQlsVL+uGhzqTytFsMrGev67CAw/3RgqBpjsfl+
	 mH+woQg3vThYvNdmF1idZZCVYaQGa6st8itGnxIUjBAjyGktjMsQIhuYjQf+rqQSxH
	 aBSgB99JNYc54zzb41o3ASmswn/eY2Cc5rt/0ttgVnBntQhVoqoGL82DMll5cXSW9M
	 /U0JPgCe208lnq1RCBB2t8u7Bo9pio08GZxlLJZCimCy5zdH1Ca9XOS2FzXb83+s35
	 OPO9xvA1mwloiGsge2L24vWh0mNcoIg20mSaWD9PMpogqFT3VLR+3gvDkoOyJU+hsE
	 A+rfiWcBPoWoPyTRv7wKkeahEr4tk2xbu910ZMW7ZvlArfLVIPebRApotohTBq6IbF
	 hT0VBwTDfhuirNRayrQugJgj/5gmbl54vASMmUV62enXY5lsD5S6JsLhYkoPkxAi8w
	 6i31lFF7vf5hf9WIuqsqLaVdY2oh5fxZsH/2G08BdDjXqAOBZA6V9rKG+OK7aggkh5
	 Mk+GN+PahZcNisd4/e8eoCeU=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 93F561E8028;
	Tue, 17 Mar 2026 15:19:52 +0800 (AWST)
Message-ID: <b077cc42-ee35-4165-9936-49ef7d53e0e8@davidgow.net>
Date: Tue, 17 Mar 2026 15:19:47 +0800
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
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260315211807.411173-1-objecting@objecting.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Josh,

Le 16/03/2026 à 5:17 AM, Josh Law a écrit :
> Bug fixes, extensions, and test coverage for lib/glob.c:
> 
> Patches 1-3 fix corner cases in the existing glob_match():
>    - Inverted character class ranges like [z-a] are now normalized
>      instead of silently failing to match.
>    - A trailing backslash is treated as a literal '\' rather than
>      reading past the end of the pattern string.
>    - [^...] is accepted as an alias for [!...] to match the
>      regex-style negation syntax documented in glob(7).
> 
> Patches 4-5 add two new utility functions:
>    - glob_match_nocase() for case-insensitive matching, useful for
>      subsystems like ATA that need case-folded denylist comparisons.
>    - glob_validate() for checking pattern syntax before use, so
>      callers can reject malformed patterns early with a clear error.
> 
> Patches 6-7 add kunit test coverage:
>    - 47 new test cases for glob_match covering escapes, inverted
>      ranges, caret negation, edge cases, and unclosed brackets.
>    - 11 test cases for glob_match_nocase.
>    - 17 test cases for glob_validate.
> 
> Patch 8 adds a real in-tree caller for glob_validate() in the kunit
> executor, validating user-provided filter_glob patterns and returning
> -EINVAL for malformed ones.
> 
> Changes since v3:
>    - Resend: v3 accidentally included stale v2 patch files in the
>      same email thread.  No code changes from v3.
> 
> Changes since v2:
>    - Fixed missing '^' in __glob_match metacharacter comment (patch 4).
>    - Dropped unnecessary braces in glob_validate case '[' (patch 5).
>    - Added real-world example to glob_validate() commit message (patch 5).
> 
> Changes since v1:
>    - Added patch 8 (kunit executor caller for glob_validate).
>    - Updated glob_match_nocase() commit message to reference the ATA
>      denylist as the intended caller (follow-up patch).
> 
> Josh Law (8):
>    lib/glob: normalize inverted character class ranges
>    lib/glob: treat trailing backslash as literal character
>    lib/glob: accept [^...] as character class negation syntax
>    lib/glob: add case-insensitive glob_match_nocase()
>    lib/glob: add glob_validate() for pattern syntax checking
>    lib/tests: add glob test cases for escapes, edge cases, and new
>      features
>    lib/tests: add kunit tests for glob_match_nocase() and glob_validate()
>    kunit: validate glob filter patterns before use
> 
>   include/linux/glob.h   |   2 +
>   lib/glob.c             | 123 ++++++++++++++++++++++++++++++++++++----
>   lib/kunit/executor.c   |  13 +++++
>   lib/tests/glob_kunit.c | 124 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 252 insertions(+), 10 deletions(-)
> 

Thanks: always good to have better test coverage (and those are some 
nasty corner cases!)

Series is:

Acked-by: David Gow <david@davidgow.net>
Tested-by: David Gow <david@davidgow.net>

I'm making the assumption that this is going in via mm-nonmm, not the 
kselftest/kunit tree, as it has dependencies in that branch.

Cheers,
-- David

