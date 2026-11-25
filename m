Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795584166;
	b=neIiNEn2BIM/nXmyd3lLchFwCAS7uGudmd9Q3Ki1hodEY8zNMtQZbbQfFPMKcozGbbge
	 em8trta33QfcU/yzy/Qcuy8l2KCAZ/qzl4Kpy9yjehpYyhz4yE24VJQBTO/Fypnjyv1Ah
	 NiAiKeIXmiUqUp8CExbfSCFRgrKdMiCOoCNL27BJWNDwRVaT1EKeeo4B2YkJMO4DgmSY4
	 l+WC/foVWqZrFWb5mp434/5c4lElpGSoC2HhyhUSDQjC1XLRXcmhaVskkBkocZ037p59q
	 N1n4D6lHaewO+KUqSPX3z/AyOJAdVlnC9gDC7PHoch8NZwdcmsIEzW5pzAxClRX3a/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584166;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TFe8kWdY8+vGgOw97zdkNQZl05mCmGUxolLHHDOwS3M=;
	b=dTO2nsmKsYa1YCb7rj+5FqSlhv/EwU1/4TCqJn6Vg1k0ut2malMOMCgIMjTGW36H/+Y5
	 11DR165U8u1nqEctoBbLNZG39gAJXVD6mU/kCPhy1VHxAGLw8WZxTI4qhK3aLYCNTuzA0
	 BIU+/eAnJW/yshCqQJgdJcbpEUCI7I/ESdCkGjo9nym5FO9N6YQpsnskFJMmH387ESe80
	 ++sU5S3xG4HN2BiskCzQ663HxAgrnCoe3qKW40hr7kCswAeFvS9PHz3kg25D2MOL8Rjov
	 0M6iO18Za+H8gdUxANREFyzjIe2BLjPE5H1PKGfjWMU6AL9/Yc8Pvv4N5MQrfZid47Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=VSf8pxjw;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=JUpeCONF;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4F606A31E;
	Wed, 25 Nov 2026 05:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=VSf8pxjw;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=JUpeCONF
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795584157;
	bh=xr0HC8i4KGobGXLmwmE5z7g7HssNFJIM52pToW7kcNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VSf8pxjwvCl6fHV18yMG5iOVMZEo7tsJyhn1WZGwykjVQQMmf0IfY6q1jpBtvdLUD
	 CPZuDhMJLZ0HMwii7tLtTT0KTBWq6H/abiLKlAQHNApbHagZtEFWlO1xognhc9+P9m
	 O/04l0agbXIJC7kXjHjY+f3H2H2xIvGjGoHEDZPCqMonywAlODqJgpc+su6poIaa2Q
	 F0E6QTYFJRUxaeTF8jPgDSlnev9+LUNbORSF8nOAlV/Y9iZAVlFzbsol6Jd/Fm+0Dq
	 K1lc0gETbgkZRJ4tOngjnqIEVQP+xwf6gHC4jRQVGrekwlL/vKG5Cj6spSdJeiTYlG
	 SzysJPIetolyR3t1c0IsPPvUsCk2ZdaQAy+MmmBt9o9OKKHAKw+/6Xi77G5YHBzkbX
	 7ULeivWV8bKqYnXOAp4cPutnK7irxfDpcCK0SYDkgiYL71jr+HWplQTSaiiaBVZ9XX
	 P8UN4vSUmQ0qpeXUypbVBjef9/UVapPnIq/jQsamOL34yq0GTBM3iNpbvB8POyBCOL
	 VM3CWs7TQm6G1l1MoOQgDjeB6nVlRjrftgOuccdDTEOmPlgvm3F3FCpVnNKwxKZL1s
	 9eJMpmeTgjyzv6dxGwwMZby9YPREALXbY/eZf7MgbURXeK6G1rTG6yGm4BQFCL79ko
	 mQ2CDn5VbZSlD4tAbi3fLAKQ=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 127F31EAD76; Wed, 25 Nov 2026 13:22:37 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795584155;
	bh=xr0HC8i4KGobGXLmwmE5z7g7HssNFJIM52pToW7kcNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JUpeCONF6x0WItKx1v5RfHoxE4CPuJC7dChmKX+FWSDfG10aSX/CkvZ15z3ABW9gT
	 slAibKUXw+fHuyRFjLwFvPN5TG3aVLYmf98Ff+Dbf0annbeLI96d2iaeAgDSrw2NkY
	 kJ76LwAjtbl45voNBIa9yLiVSbUL30M/mc1aKNYfuhtCgc8RoOig+jijL/mKKcAYeu
	 AsGlp3eL903EC4Mh0yOq4FGASxtKxuXjytmeTpZaAlTzp+n0qfT4PQDYbghDhtUHRO
	 5Uuy+gvQ69KSszso/92MFQkI3LLtvt4zcwUpIR0/YxMM98PbfskT9FtweP9fiFzzTq
	 r0Hx3W5lo2i6uMgIIMaM5WTASfqayXzMho97KXXwUnIzh9aDNQ4rLpS5Ahed3+mVV2
	 Z4+NZIr5nnrozRMopew1lEjifPU0zlER4XeYh8lhHycWEbHLbBloovgIV4Bt7btoK7
	 EZtL3PMEOqZ89jzL/wPS6KJQjWxGCSJ+FtDj087I8onEi3/J0XKAsNl8F6EB4dUDIy
	 lohjE0mJMf+N1AF+jMVT6KM7IVLZKOVAfKC5ztAxj1iayOSou6Qyj3mEp+5BCbNnUH
	 bxrjUrLRIH4Al8VbewBh7AptKO2GkGXQKGbavSa6obo0fbxL05Bpoz/+HiYInF5/Ak
	 3QMuKmDqIa7pcBFxY4QWOGbQ=
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id B49EF1EAD6F;
	Wed, 25 Nov 2026 13:22:35 +0800 (AWST)
Message-ID: <7c8034d9-4f56-49be-b3c2-7764114bf599@davidgow.net>
Date: Wed, 25 Nov 2026 13:22:32 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] kunit: tool: Count failed suites with only skipped
 tests
To: poulin.louis@student.oaklandcc.edu,
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
References: <20261124-kunit-v2-v2-0-e1adbcad6b48@student.oaklandcc.edu>
 <20261124-kunit-v2-v2-1-e1adbcad6b48@student.oaklandcc.edu>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261124-kunit-v2-v2-1-e1adbcad6b48@student.oaklandcc.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/11/2026 à 00:43, Louis H. Poulin II via B4 Relay a écrit :
> From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
> 
> A suite can report not ok while all its child cases are skipped.
> The parser retains the suite status as FAILURE but counts only the
> skipped children. The run status is then derived from those counts and
> incorrectly reports SKIPPED.
> 
> When a suite reports failure and the child aggregate is SKIPPED, add
> a failed count for the suite, as is already done when child aggregate
> is SUCCESS. Cover a correctly numbered failing suite with a skipped
> child.
> 
> Fixes: d65d07cb5b01 ("kunit: tool: improve compatibility of kunit_parser with KTAP specification")
> Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
> ---

Thanks very much: this patch survived the sending process successfully.

I do think that it's a little bit confusing to, depending on the status 
of the suite, suddenly get an extra test failure in the result count. 
But ultimately, it's probably less confusing than having the failure 
disappear altogether, so I'm okay with it.

Two other suggestions:
- The test data should live in tools/testing/kunit/test_data alongside 
all of the other test KTAP.
- It'd be nice to update _summarize_failed_tests() to count these. It 
should be as simple as extending the 'len(failed_subtests) == 
len(test.subtests)' check to also compare against 0, as far as I can 
tell. (Note, though, that this doesn't trigger by default unless there 
are >=100 tests run, so you may wish to hack that out to test it.)

With those, I think this would be good.

Cheers,
-- David

>   tools/testing/kunit/kunit_parser.py    |  4 +++-
>   tools/testing/kunit/kunit_tool_test.py | 13 +++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
> index d722874b..dce365d1 100644
> --- a/tools/testing/kunit/kunit_parser.py
> +++ b/tools/testing/kunit/kunit_parser.py
> @@ -694,7 +694,9 @@ def bubble_up_test_results(test: Test) -> None:
>   	elif test.counts.get_status() == TestStatus.TEST_CRASHED:
>   		test.status = TestStatus.TEST_CRASHED
>   
> -	if status == TestStatus.FAILURE and test.counts.get_status() == TestStatus.SUCCESS:
> +	# Preserve a failing suite result when its children all pass or skip.
> +	if (status == TestStatus.FAILURE and
> +			test.counts.get_status() in (TestStatus.SUCCESS, TestStatus.SKIPPED)):
>   		counts.add_status(status)
>   
>   def parse_test(lines: LineStream, expected_num: int, log: List[str], is_subtest: bool, printer: Printer) -> Test:
> diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
> index 85ae2175..5fd386d0 100755
> --- a/tools/testing/kunit/kunit_tool_test.py
> +++ b/tools/testing/kunit/kunit_tool_test.py
> @@ -265,6 +265,19 @@ class KUnitParserTest(unittest.TestCase):
>   		self.assertEqual(kunit_parser.TestStatus.SKIPPED, result.status)
>   		self.assertEqual(result.counts, kunit_parser.TestCounts(skipped=5))
>   
> +	def test_failed_suite_with_skipped_child_fails(self):
> +		output = ['KTAP version 1', '1..1',
> +			'    KTAP version 1', '    # Subtest: suite', '    1..1',
> +			'    ok 1 - case # SKIP reason', 'not ok 1 - suite']

For consistency, can we put this in a file in 
tools/testing/kunit/test_data -- that's what the other tests here do, 
and it makes it easier to debug the failures, IMO.

If you _really_ want to keep it here (which is fine if you have a really 
good reason, though I'd want to hear it), can we at least reformat it to 
have one line per line: as is, it's quite difficult to read.

> +		result = kunit_parser.parse_run_tests(output, stdout)
> +		suite = result.subtests[0]
> +		self.assertEqual(kunit_parser.TestStatus.SKIPPED, suite.subtests[0].status)
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
> +		self.assertEqual(suite.counts,
> +			kunit_parser.TestCounts(failed=1, skipped=1))
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
> +		self.assertEqual(result.counts, suite.counts)
> +
>   	def test_ignores_hyphen(self):
>   		hyphen_log = _test_data_path('test_strip_hyphen.log')
>   		with open(hyphen_log) as file:
> 

