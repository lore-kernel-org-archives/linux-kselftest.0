Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427914;
	b=TDtRn+sC3zNz3/76iCKTPj+RHUHazgQsv6Wxsablb39L3rYfw2Byk5erBuuVSV612TzY
	 6MKjSqfeC86p2lIJtej9arM6wmn7yEP88o3xlN2rPtzCUxRTqSIxoa43DvX7HlrtMn1yp
	 GKi+eoYVzfV7+sX5y/WToudotfAgCXnHWysA09hSi5Vw1YxbW5enZ8YEamiS3gsUQchWM
	 b+Rx6h05Pak/GXafeP2QrDeynjGwiw1N2No19tNnstSwqldaZ8j8YIqZfFL9rxUbExuNB
	 2FqdGocmon4jjsNyAkUWTpvMnHeLDXOB+PycXC32rvA72yIQaRw1SaCjmcZwjVq0+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427914;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2Z7Xz619FeC8badztBau88EEBfdSMK9atrKun47QtBs=;
	b=FicYp1w7Ix0kC/FJtMACvcKp1TcEr0P5u2a0oysTmhfHpSOmZTAs4vLkegIdovbE+4Zz
	 DJt0V6zppH5yWLcfPPOuJQ2OvjXn0r3kDlytQeIeMo18Oc0iW4Rq2MxOaS5HEF1jYd+7+
	 Hfd3LQpUYTHdXTxaOo55yqofYrbxAqlKo6m2BBCDu+mCo7j/KgvZKwAcwPhqvjBdwfyDl
	 HUdWfxZVJiztESwdlEB173+emOjBLTZb8bxNE2uVsu9siDhF2NyYDFF8ZmGlXI6GjRU6Q
	 sN1VlIuyXhuMOgHPu8tlACr3ebJQLObIxKI2WY0BQYLBGAnyBF6OB1yA1ftFZ3cRb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4174606A31A;
	Mon, 23 Nov 2026 09:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4174606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 04DE5200DEE; Mon, 23 Nov 2026 17:58:32 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 2BDE3200DE8;
	Mon, 23 Nov 2026 17:58:30 +0800 (AWST)
Message-ID: <89b987c0-8b88-468c-8d60-33dfaa060cad@davidgow.net>
Date: Mon, 23 Nov 2026 17:58:27 +0800
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
Subject: Re: [PATCH 1/2] kunit: tool: Count failed suites with only skipped
 tests
To: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 brendan.higgins@linux.dev
References: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
 <CAGQButurzJT6fQqqxO9xD0GABME=AtGeYS0kQf-jDFSqKH6GaA@mail.gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <CAGQButurzJT6fQqqxO9xD0GABME=AtGeYS0kQf-jDFSqKH6GaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/11/2026 à 02:14, Louis H. Poulin II a écrit :
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
> Fixes: d65d07cb5b01 ("kunit: tool: improve compatibility of
> kunit_parser with KTAP specification")
> 
> Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
> ---

Hi Louis,

Thanks very much for your patch.

Unfortunately, it looks like your email client has mangled it somewhat:, 
some of the lines have been wrapped.

This is a known issue with some email programs: particularly with gmail. 
The file Documentation/process/email-clients.rst has some details about 
different clients:
https://docs.kernel.org/process/email-clients.html

But I'd personally recommend either using git send-email:
- https://git-send-email.io
or the b4 tool:
- https://b4.docs.kernel.org/en/latest/

Those will ensure that the patch will be sent properly, so that 
maintainers can use git to apply it automatically. I personally use git 
send-email for my patches, and once it's set up, it works great.

Apart from that, the patch looks okay from here, but I'll run my full 
battery of tests once I can apply it.

Cheers,
-- David

>   tools/testing/kunit/kunit_parser.py    |  4 +++-
>   tools/testing/kunit/kunit_tool_test.py | 13 +++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/kunit/kunit_parser.py
> b/tools/testing/kunit/kunit_parser.py
> index d722874b..dce365d1 100644
> --- a/tools/testing/kunit/kunit_parser.py
> +++ b/tools/testing/kunit/kunit_parser.py
> @@ -694,7 +694,9 @@ def bubble_up_test_results(test: Test) -> None:
>   	elif test.counts.get_status() == TestStatus.TEST_CRASHED:
>   		test.status = TestStatus.TEST_CRASHED
> 
> -	if status == TestStatus.FAILURE and test.counts.get_status() ==
> TestStatus.SUCCESS:
> +	# Preserve a failing suite result when its children all pass or skip.
> +	if (status == TestStatus.FAILURE and
> +			test.counts.get_status() in (TestStatus.SUCCESS, TestStatus.SKIPPED)):
>   		counts.add_status(status)
> 
>   def parse_test(lines: LineStream, expected_num: int, log: List[str],
> is_subtest: bool, printer: Printer) -> Test:
> diff --git a/tools/testing/kunit/kunit_tool_test.py
> b/tools/testing/kunit/kunit_tool_test.py
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

