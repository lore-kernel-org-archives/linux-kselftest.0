Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481AD3C2796;
	Wed, 18 Mar 2026 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849272; cv=pass; b=vEGURNiQD3o8fBzUzinkq7i67ibywnG/v9e2/WJQRserUzoRAT5PDv6OxJPII0w4PuunslRa7Yg7DY7r0DmJ5RVgSpMkUA3C3/IJ85tYIBeWeYTxqzG89yUnx6ozGi1KOkHZTWlMYikW85IKjMVNTLUiYnz/XQKGrDckM9H7FRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849272; c=relaxed/simple;
	bh=FxSPfXZqRWESHkMna2l48MFMbBxUcfKvMzHwfbG40zs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ihn0ivJjTHcPnqhsa1k8yZ+PZ7Ayc6ekhvnh4GZQZxOFdRDkQCU/nUJSg7g8wR6ZETZxAgeirKYXxt62PsLzNiz1Rt6rBs+GVczWPJhZvORG8jgt2oiASNEWBx4ZGnDNCA+fawsnUcg59JdEXbMj7fQPNJ9UceaxKchC60BA3Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=HVjmOzMd; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="HVjmOzMd"
ARC-Seal: i=1; a=rsa-sha256; t=1773849251; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=a7qHmhc8Zgfff1MVCD6aEFz2R+nEbcXoJzXvVqGnveRGLW7SVS3670Mg9LbO8SQjk89cnSnHoh8i2VZSN4quaqG/81BgJwndKga4w4POZF5WlkHyA+VnYhF7DZq0iCPNv4UzXK9TXaPnBe9P4C5hFSflFJS8TIJ3sbEU9ogEZo8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1773849251; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MA6UIsLXS8wRBlMnn5LchEv7OmWMkQn/mw99wSOuInY=; 
	b=bIHlLheSEOim/CpXFaCe6YcbNkQqLcA5K4txEffkdWNPIxB4K5h2hjac/0X0GPTubBRmjErPRWPDzoo/zJx2oIJMLErVTZsExGe66Y0QcEXo61i2yYlC0naDWwn57e6ftN3MaizkbZEGkdYpvUGFEkOHLUteDgz5aZ2tmppO4bY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773849251;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=MA6UIsLXS8wRBlMnn5LchEv7OmWMkQn/mw99wSOuInY=;
	b=HVjmOzMdcFX2+hNynuk3yiQZRnt3KvVRee2LCFTUi9GbXx/4vRhltDEJsJaH+GW6
	ah4mPrQDvMOMIP+rlyXeQQaeZnIDqW49xXIYCvyMJ4F0vCL39sDb1GrfUN3MC3eTPog
	hmyyhQduDo2nOhxrX1kFjiJrm0UsculBDM1ObgvI=
Received: by mx.zoho.eu with SMTPS id 1773849249858799.4830500122287;
	Wed, 18 Mar 2026 16:54:09 +0100 (CET)
Date: Wed, 18 Mar 2026 15:54:10 +0000
From: Josh Law <objecting@objecting.org>
To: David Gow <david@davidgow.net>, Andrew Morton <akpm@linux-foundation.org>
CC: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/8] lib/glob: bug fixes, new features, and tests
User-Agent: Thunderbird for Android
In-Reply-To: <6522d194-12f1-49d2-ba91-ef3e26b49817@davidgow.net>
References: <20260315211807.411173-1-objecting@objecting.org> <b077cc42-ee35-4165-9936-49ef7d53e0e8@davidgow.net> <A5DA6F8B-C9B9-4BBB-ABE5-89A9E6EA577A@objecting.org> <6522d194-12f1-49d2-ba91-ef3e26b49817@davidgow.net>
Message-ID: <09BE9997-CA39-4BB6-8271-4767C6BC2943@objecting.org>
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



On 18 March 2026 07:19:53 GMT, David Gow <david@davidgow=2Enet> wrote:
>Le 18/03/2026 =C3=A0 12:32 AM, Josh Law a =C3=A9crit=C2=A0:
>>=20
>>=20
>> On 17 March 2026 07:19:47 GMT, David Gow <david@davidgow=2Enet> wrote:
>>> Hi Josh,
>>>=20
>>> Le 16/03/2026 =C3=A0 5:17 AM, Josh Law a =C3=A9crit=C2=A0:
>>>> Bug fixes, extensions, and test coverage for lib/glob=2Ec:
>>>>=20
>>>> Patches 1-3 fix corner cases in the existing glob_match():
>>>>     - Inverted character class ranges like [z-a] are now normalized
>>>>       instead of silently failing to match=2E
>>>>     - A trailing backslash is treated as a literal '\' rather than
>>>>       reading past the end of the pattern string=2E
>>>>     - [^=2E=2E=2E] is accepted as an alias for [!=2E=2E=2E] to match =
the
>>>>       regex-style negation syntax documented in glob(7)=2E
>>>>=20
>>>> Patches 4-5 add two new utility functions:
>>>>     - glob_match_nocase() for case-insensitive matching, useful for
>>>>       subsystems like ATA that need case-folded denylist comparisons=
=2E
>>>>     - glob_validate() for checking pattern syntax before use, so
>>>>       callers can reject malformed patterns early with a clear error=
=2E
>>>>=20
>>>> Patches 6-7 add kunit test coverage:
>>>>     - 47 new test cases for glob_match covering escapes, inverted
>>>>       ranges, caret negation, edge cases, and unclosed brackets=2E
>>>>     - 11 test cases for glob_match_nocase=2E
>>>>     - 17 test cases for glob_validate=2E
>>>>=20
>>>> Patch 8 adds a real in-tree caller for glob_validate() in the kunit
>>>> executor, validating user-provided filter_glob patterns and returning
>>>> -EINVAL for malformed ones=2E
>>>>=20
>>>> Changes since v3:
>>>>     - Resend: v3 accidentally included stale v2 patch files in the
>>>>       same email thread=2E  No code changes from v3=2E
>>>>=20
>>>> Changes since v2:
>>>>     - Fixed missing '^' in __glob_match metacharacter comment (patch =
4)=2E
>>>>     - Dropped unnecessary braces in glob_validate case '[' (patch 5)=
=2E
>>>>     - Added real-world example to glob_validate() commit message (pat=
ch 5)=2E
>>>>=20
>>>> Changes since v1:
>>>>     - Added patch 8 (kunit executor caller for glob_validate)=2E
>>>>     - Updated glob_match_nocase() commit message to reference the ATA
>>>>       denylist as the intended caller (follow-up patch)=2E
>>>>=20
>>>> Josh Law (8):
>>>>     lib/glob: normalize inverted character class ranges
>>>>     lib/glob: treat trailing backslash as literal character
>>>>     lib/glob: accept [^=2E=2E=2E] as character class negation syntax
>>>>     lib/glob: add case-insensitive glob_match_nocase()
>>>>     lib/glob: add glob_validate() for pattern syntax checking
>>>>     lib/tests: add glob test cases for escapes, edge cases, and new
>>>>       features
>>>>     lib/tests: add kunit tests for glob_match_nocase() and glob_valid=
ate()
>>>>     kunit: validate glob filter patterns before use
>>>>=20
>>>>    include/linux/glob=2Eh   |   2 +
>>>>    lib/glob=2Ec             | 123 +++++++++++++++++++++++++++++++++++=
+----
>>>>    lib/kunit/executor=2Ec   |  13 +++++
>>>>    lib/tests/glob_kunit=2Ec | 124 +++++++++++++++++++++++++++++++++++=
++++++
>>>>    4 files changed, 252 insertions(+), 10 deletions(-)
>>>>=20
>>>=20
>>> Thanks: always good to have better test coverage (and those are some n=
asty corner cases!)
>>>=20
>>> Series is:
>>>=20
>>> Acked-by: David Gow <david@davidgow=2Enet>
>>> Tested-by: David Gow <david@davidgow=2Enet>
>>>=20
>>> I'm making the assumption that this is going in via mm-nonmm, not the =
kselftest/kunit tree, as it has dependencies in that branch=2E
>>>=20
>>> Cheers,
>>> -- David
>>>=20
>>=20
>>=20
>> Also, David? You mean the *ENTIRE* series as in the code too (the new f=
unctions) Or just your kunit changes
>>=20
>
>I only really need to Ack the KUnit changes, but I did test the entire se=
ries, so feel free to apply it to all of them=2E
>
>Cheers,
>-- David
>


Hello David, So the new functions are perfectly fine? I mean code review w=
ise I think they are, and I have tested them with a stash driver=2E=2E

So I guess also


Tested-by: Josh Law <objecting@objecting=2Eorg>
