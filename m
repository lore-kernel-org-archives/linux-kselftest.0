Received: from sender-of-o53.zoho.eu (sender-of-o53.zoho.eu [136.143.169.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA00378812;
	Tue, 17 Mar 2026 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765193; cv=pass; b=YoAc7T6hYKM48lKZrTNZzzKIu/L6Z1cb837rAfVYTcr+BqoIaJUPz3Ct/GGKYGe8CW/PijimQQYHmuoW/k4Qo2LTXvXflWiueTo3YXBhh30lOQwgElzuKyBPzQuCQ5MkdSJrDPau/Sy1Ag0Dpm/lnXhtzD8QeyzmuOPhi+alehY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765193; c=relaxed/simple;
	bh=0Z2YXecqO3HBbFzK7A0B30OGDslsof46u957Y21t8W4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nbCgf9oNitBbjBbYOr/3bOUPb49PHqYNO8MBvKK6WWCQstUx/+eb49/Ydq1ZsEdsAI8Wl/QfrCB37Xdt1xicVP3BTLEzAkcwSZTJhYTHobEDjSSIb+rgQaBjcLvezWufxY3C58/NJUR+XWkQXMsfge/AcUkuIRFi2BvsHj7Gct8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=D4+Y2bcr; arc=pass smtp.client-ip=136.143.169.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="D4+Y2bcr"
ARC-Seal: i=1; a=rsa-sha256; t=1773765165; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=baUVfR8NxL+3cFS+QZHFFgBngpfaAyq9CuvMYrPKdXAs+2rJJk/q6H/oWAmzmagbIu2QyZIE2EEqt6O9XrMWJCPdBwO0sOCIeKn4FDY0Eb6zbOCOKXGF3pVvBO2ptO/ayyaEhEuCpAsFdXQOo8jjYBnNfquGId+BnSANJqblhbo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773765165; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NHPhO38pw2TQuObSqNYTdndDPEzhw002YpjCKYzaQ/M=; 
	b=IvVO4v61arYWMh3w9HBl31mEnXcaG8sm5h3PxAviU9WysLJf0rFJmBotn+Ibq/yS/nrKbje1GerTFDX38+c8ucksrrGGhWvlYYb8ACHKUDeLWZJGYTXKwb/MDJ/EPFbfUn0/peTAigNwWr6LAREbuQacpqv9UuJcHMhZ4RQcvK8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773765165;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=NHPhO38pw2TQuObSqNYTdndDPEzhw002YpjCKYzaQ/M=;
	b=D4+Y2bcrewsDnwlCpQHLzwEl7s7PGbOAHdYUNNVlJnWrptTGHWHKW0nDtkxXn6db
	TcZImU3Z0D8JkKyQVi1csyYSYiZDOSb8ffTxFgaGVr7Az2WDsC0Cb8P/DH6Wjt4/FDp
	ofCqKWQWLFA5x+gKJFPAf+G/0JpKXaYyGiCD2R1o=
Received: by mx.zoho.eu with SMTPS id 1773765162010596.4796033628999;
	Tue, 17 Mar 2026 17:32:42 +0100 (CET)
Date: Tue, 17 Mar 2026 16:32:37 +0000
From: Josh Law <objecting@objecting.org>
To: David Gow <david@davidgow.net>, Andrew Morton <akpm@linux-foundation.org>
CC: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/8] lib/glob: bug fixes, new features, and tests
User-Agent: Thunderbird for Android
In-Reply-To: <b077cc42-ee35-4165-9936-49ef7d53e0e8@davidgow.net>
References: <20260315211807.411173-1-objecting@objecting.org> <b077cc42-ee35-4165-9936-49ef7d53e0e8@davidgow.net>
Message-ID: <A5DA6F8B-C9B9-4BBB-ABE5-89A9E6EA577A@objecting.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External



On 17 March 2026 07:19:47 GMT, David Gow <david@davidgow=2Enet> wrote:
>Hi Josh,
>
>Le 16/03/2026 =C3=A0 5:17 AM, Josh Law a =C3=A9crit=C2=A0:
>> Bug fixes, extensions, and test coverage for lib/glob=2Ec:
>>=20
>> Patches 1-3 fix corner cases in the existing glob_match():
>>    - Inverted character class ranges like [z-a] are now normalized
>>      instead of silently failing to match=2E
>>    - A trailing backslash is treated as a literal '\' rather than
>>      reading past the end of the pattern string=2E
>>    - [^=2E=2E=2E] is accepted as an alias for [!=2E=2E=2E] to match the
>>      regex-style negation syntax documented in glob(7)=2E
>>=20
>> Patches 4-5 add two new utility functions:
>>    - glob_match_nocase() for case-insensitive matching, useful for
>>      subsystems like ATA that need case-folded denylist comparisons=2E
>>    - glob_validate() for checking pattern syntax before use, so
>>      callers can reject malformed patterns early with a clear error=2E
>>=20
>> Patches 6-7 add kunit test coverage:
>>    - 47 new test cases for glob_match covering escapes, inverted
>>      ranges, caret negation, edge cases, and unclosed brackets=2E
>>    - 11 test cases for glob_match_nocase=2E
>>    - 17 test cases for glob_validate=2E
>>=20
>> Patch 8 adds a real in-tree caller for glob_validate() in the kunit
>> executor, validating user-provided filter_glob patterns and returning
>> -EINVAL for malformed ones=2E
>>=20
>> Changes since v3:
>>    - Resend: v3 accidentally included stale v2 patch files in the
>>      same email thread=2E  No code changes from v3=2E
>>=20
>> Changes since v2:
>>    - Fixed missing '^' in __glob_match metacharacter comment (patch 4)=
=2E
>>    - Dropped unnecessary braces in glob_validate case '[' (patch 5)=2E
>>    - Added real-world example to glob_validate() commit message (patch =
5)=2E
>>=20
>> Changes since v1:
>>    - Added patch 8 (kunit executor caller for glob_validate)=2E
>>    - Updated glob_match_nocase() commit message to reference the ATA
>>      denylist as the intended caller (follow-up patch)=2E
>>=20
>> Josh Law (8):
>>    lib/glob: normalize inverted character class ranges
>>    lib/glob: treat trailing backslash as literal character
>>    lib/glob: accept [^=2E=2E=2E] as character class negation syntax
>>    lib/glob: add case-insensitive glob_match_nocase()
>>    lib/glob: add glob_validate() for pattern syntax checking
>>    lib/tests: add glob test cases for escapes, edge cases, and new
>>      features
>>    lib/tests: add kunit tests for glob_match_nocase() and glob_validate=
()
>>    kunit: validate glob filter patterns before use
>>=20
>>   include/linux/glob=2Eh   |   2 +
>>   lib/glob=2Ec             | 123 ++++++++++++++++++++++++++++++++++++--=
--
>>   lib/kunit/executor=2Ec   |  13 +++++
>>   lib/tests/glob_kunit=2Ec | 124 ++++++++++++++++++++++++++++++++++++++=
+++
>>   4 files changed, 252 insertions(+), 10 deletions(-)
>>=20
>
>Thanks: always good to have better test coverage (and those are some nast=
y corner cases!)
>
>Series is:
>
>Acked-by: David Gow <david@davidgow=2Enet>
>Tested-by: David Gow <david@davidgow=2Enet>
>
>I'm making the assumption that this is going in via mm-nonmm, not the kse=
lftest/kunit tree, as it has dependencies in that branch=2E
>
>Cheers,
>-- David
>


Also, David? You mean the *ENTIRE* series as in the code too (the new func=
tions) Or just your kunit changes=20


V/R



Josh Law
