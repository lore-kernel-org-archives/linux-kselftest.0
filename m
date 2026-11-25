Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795584181;
	b=DN+rf+wzO4Hpr2ozhlpqT7ATtd5Uu8gJlm6v6z/Ru1uHx3G0eXx/yE8Zpn/kX26YwASb
	 3AusPGOA4WvahC5Lft01mpAPUvlImzNogtZpCyA9y9CHlloamHYAhPFv6e5JAn29Fl5qC
	 d+TV55zB9xA4fVrnqNdWeqi6G0rVJ75BeAG92oKpZIe5EqOQpV3LRIdrmgdjwcJT1tKOH
	 xvlSiDZ9N8qzYJ1Hj8F5aeK+OdvvDgyV5NmxZO37iTZT94hH8QhAdB1VbjESxtfSUsC/U
	 fLhNR9WqLaQOb91XADz/QdNeLGNv+sqoCibC7H25y+sJmOOt5Zq1Q/7gWFXWNHWWFBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584181;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=pHGtOU+PWaesO8wNMdkkKOcUYC+DI3pKlyC/m+U98Qo=;
	b=3/BzfmneZSRTNF8F4X0jLnnbdnfDg2j3BpRgxpSUUhKwRySepN6qpJq35kQUcimyjRcK
	 XeEUYoKw+huMF8CsJInQOEHeA4MotvnR7TVPGRF+4pLrKqtxU2QxS+stSZXM2fp2jksNI
	 WT/F3KBWkFSZgjRSm38A8M5r9V8qrdn5zq4aH3Dv2rNAozbg3oHUfDK8C0/yqYO13uYRb
	 6ILYY3T8jxvOg49Fh5CBc9DIjhoJj/oPflOKcRYjQqFgID56vUY30X99x1a2zgpSna9O7
	 YBelP1LPuGnu4EyopvXJryuiPvREOV5oAEPL2YW8gZtQoKxWqPxjY9AZbx4tphsuJ9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=T2Q1DIWn;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=b5lKLDhS;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75461606A321;
	Wed, 25 Nov 2026 05:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75461606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=T2Q1DIWn;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=b5lKLDhS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795584178;
	bh=2eqwSjc+YY46159i/ZRwBAUKyCmeKhWvDGWVKCb+ZJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T2Q1DIWnhk5NEMNOYZSdsp6su2eQ2yL+nTMKrRMGqK5q19ARJ3K2G78YgocWVaaY9
	 /P4xalwddA7K7F4mml4jHbDhLqQRpQv0HiHrroa0NGE3jvMcmbmFhQg1judrGBfySd
	 tJ+Ijf6qodaJwSrueYEyNxery4Zkj1nK7YPLQAeXlfV/5WEP5dzqE5sqH5302JWfiy
	 1S2IudfltESCUFusnfwAKwoUT0rvizEvjrESpfUZa/S3zcZak3fKLWVce2nM86EHDT
	 XAAY0irCnopQMLWZFNIUh2FHepmKO0gN9dbN4XjAkt7QA75EtoQFJnyFNnRnfGRIhB
	 C2OzS7iWuEV1GTJmErv2W9QhIlykz6I6j4BEj1CaBT/0vOKoKvBh16S4F+O6mKCoqU
	 Gw/cOMvs8Fdp26rFTGQZ+MNkGKoBttYyZyycSxgGnUauPcEw2N7hprH/JsWbKEUJvp
	 k/j4SPlt357NbzYbdXfbiE8MWgWThZSt2qNrcqu4xSvGPKT51H0REPpFCRhMLaLlNJ
	 iuC8b+ySczCBTlxOI+d7544/tslNpm1xlPJYILOH9B4AB2xqkTPaTgZK6bfUVynm4O
	 3qKTjvOI6G1HZnctHUh2/te5E8eU4TTErgJZ1xzCiHYIgKqUSdOW8i5vWQcK+JHbND
	 LL5XVFLmYKuUaNaaXCytbU+8=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 8F79A1EAD6F; Wed, 25 Nov 2026 13:22:58 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795584176;
	bh=2eqwSjc+YY46159i/ZRwBAUKyCmeKhWvDGWVKCb+ZJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b5lKLDhSyUfpk+Ch1LCZdNLwVhtArRePXyLWux4KDDbZWayEhElN4l3MqPD9rMk/D
	 s4dmvk4j65/gHgphnh9UDUlPWPgQ46TUksf0qNBRc1UtRWuWGeLJbO/K1XKuJP5xAg
	 t+UeLkzLmIztLSXsgjDImmG5YrKrD5prWdCMg/+wQIN0v+mnxZOrtCjrrZGRnskuYf
	 bA/5lEhNBAl3/Wy9u9f506sf/k7nQwz8uw6o2YqKBpHsp3hBe1MJYJvDGj0TrQQiqj
	 k1NTbDO9ln+CsPLpHeeKVqL3Gu3giQ8eIJ9T6+CBXJ/QwcxekyeviVvdFKylhukq+w
	 33Bqf3ZmsoUqGzirqYneasl8sH/lG7A5V9RhrOwg1n2LvNaG9aEFoNtNi9ujOa1hwX
	 +d62G9AEu4VPGZw7gXH+ohfvR+XfUbHUI6CL1ZAKddfy4V8gi8RSgot12+brttAEOS
	 kOXJHvRZ1UTneVJ7+e/T8rkCpZuiDggz5bjaYPMjdd1Y+5/1a2rzX3Gbr8w9JwIk1I
	 3oCAUnq2fYdupyF+vqSOUFwi48AJtt2S2w5Rc8iadcJeEy58gLc87F4374TqsfvP5N
	 JAsI7w5ucFtBtTNOHAKha7xum4sBWyqtiNpf8cIAVKGvWPpFuQL1vjYIcbUtkZMkup
	 hoPvPsou2Pd9KXr3pLBDwasw=
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id DF0B81EAD6F;
	Wed, 25 Nov 2026 13:22:56 +0800 (AWST)
Message-ID: <a8ddf62a-071e-485b-883d-95088ef50ba4@davidgow.net>
Date: Wed, 25 Nov 2026 13:22:54 +0800
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
Subject: Re: [PATCH v2 2/2] kunit: tool: Fail on out-of-sequence test numbers
To: poulin.louis@student.oaklandcc.edu,
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
References: <20261124-kunit-v2-v2-0-e1adbcad6b48@student.oaklandcc.edu>
 <20261124-kunit-v2-v2-2-e1adbcad6b48@student.oaklandcc.edu>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20261124-kunit-v2-v2-2-e1adbcad6b48@student.oaklandcc.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/11/2026 à 00:43, Louis H. Poulin II via B4 Relay a écrit :
> From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
> 
> KTAP requires numbering to start at 1 and increase by one at each
> nesting level. The parser notes a mismatch as an error but can still
> mark an ok or skipped result as successful. A saved log with duplicate
> numbers can make kunit.py parse exit 0.
> 
> After decoding ok or SKIP, mark a wrongly numbered result as FAILURE.
> The result record is malformed even if the test assertion printed ok.
> It then contributes to both failed and error counts. This avoids a
> broader policy of failing on every parse error, which would also
> change late-plan handling. The preceding patch preserves this failure
> when a parent suite has only skipped children.
> 
> This change covers numbering mismatches only. A missing numbered line
> can flag subsequent results whose numbers differ from their expected
> positions. Other malformed or truncated logs retain their existing
> status policy.
> 
> Commit 14e594a1fc8b ("kunit: tool: fix count of tests if late test
> plan") deliberately kept a parsed pass despite missing results after
> a late plan. Its fixture also had an unrelated ok 4 result. Number
> that result as ok 1 to keep the plan test focused, and cover a wrong
> first number separately. Add duplicate, SKIP, nested-suite, missing
> number and CLI exit-code tests.
> 
> Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
> ---

Hmm... I distinctly recall there being a reason we didn't fail in this 
case: I think it was due to some tests being triggered early, so having 
two concatenated KTAP outputs in the kernel log at boot. That seems 
fixed, though, so I don't have a fundamental objection to this.

That being said, if anyone's using the KUnit KTAP parser for non-KUnit-y 
things which would fall afoul of this, now's the time to speak up!

As for the patch itself, it looks fine: the only real issues are with 
the comments and tests. For the comments: I think they need to be more 
specific about what we're doing (and targeted at people reading the 
code, not people looking at the changes in the patch).

As for the tests: they're extremely thorough -- perhaps excessively so. 
Do you think it'd be sensible to consolidate a few of them into a 
smaller number of more complicated examples. kunit_tool_test is already 
getting quite large and complicated, and this is a small, unlikely 
possibility which will probably need debugging only rarely, so a more 
complicated example shouldn't be a problem.

Equally, as with the previous patch, it'd be great to have the test 
inputs in separate files in tools/testing/kunit/test_data/ as with most 
of the other tests.

Cheers,
-- David

>   tools/testing/kunit/kunit_parser.py    | 11 ++---
>   tools/testing/kunit/kunit_tool_test.py | 79 ++++++++++++++++++++++++++++++++--
>   2 files changed, 82 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
> index dce365d1..38547312 100644
> --- a/tools/testing/kunit/kunit_parser.py
> +++ b/tools/testing/kunit/kunit_parser.py
> @@ -423,11 +423,6 @@ def parse_test_result(lines: LineStream, test: Test,
>   	else:
>   		test.name = match.group(4)
>   
> -	# Check test num
> -	num = int(match.group(2))
> -	if num != expected_num:
> -		test.add_error(printer, f'Expected test number {expected_num} but found {num}')
> -
>   	# Set status of test object
>   	status = match.group(1)
>   	if skip_match:
> @@ -437,6 +432,12 @@ def parse_test_result(lines: LineStream, test: Test,
>   		test.status = TestStatus.SUCCESS
>   	else:
>   		test.status = TestStatus.FAILURE
> +
> +	# A malformed result must not make the run successful.

Let's be more specific about what sort of malformed result we're 
checking here.

Something like "Mark the test as failed if it is not correctly numbered."

> +	num = int(match.group(2))
> +	if num != expected_num:
> +		test.add_error(printer, f'Expected test number {expected_num} but found {num}')
> +		test.status = TestStatus.FAILURE
>   	return True
>   
>   def parse_diagnostic(lines: LineStream) -> List[str]:
> diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
> index 5fd386d0..6a3011de 100755
> --- a/tools/testing/kunit/kunit_tool_test.py
> +++ b/tools/testing/kunit/kunit_tool_test.py
> @@ -410,13 +410,78 @@ class KUnitParserTest(unittest.TestCase):
>   	def test_parse_late_test_plan(self):
>   		output = """
>   		TAP version 13
> -		ok 4 test4
> +		ok 1 test1
>   		1..4
>   		"""
>   		result = kunit_parser.parse_run_tests(output.splitlines(), stdout)
> -		# Missing test results after test plan should alert a suspected test crash.
> +		# Keep this test focused on a late plan, not result numbering.

Let's keep the original comment: this one describes the _changes_ this 
patch is making, but doesn't describe the purpose of the test any more.

>   		self.assertEqual(kunit_parser.TestStatus.SUCCESS, result.status)
> -		self.assertEqual(result.counts, kunit_parser.TestCounts(passed=1, errors=2))
> +		self.assertEqual(result.counts, kunit_parser.TestCounts(passed=1, errors=1))
> +
> +	def test_wrong_first_number_fails(self):
> +		output = ['KTAP version 1', '1..1', 'ok 4 - fourth']

Again, let's put this a separate result file. Or, if you must have it 
inline, do it as a string (like the existing test_parse_late_test_plan() 
example), as it's much easier to read and/or copy out into a separate 
file for debugging.

> +		result = kunit_parser.parse_run_tests(output, stdout)
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
> +		self.assertEqual(result.counts, kunit_parser.TestCounts(failed=1, errors=1))
> +
> +	def test_repeated_test_number_fails(self):
> +		output = ['KTAP version 1', '1..2', 'ok 1 - first', 'ok 1 - second']

Let's make this a file (or at least a string), too.

> +		result = kunit_parser.parse_run_tests(output, stdout)
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
> +		self.assertEqual(result.counts,
> +			kunit_parser.TestCounts(passed=1, failed=1, errors=1))
> +
> +	def test_missing_number_fails_later_results(self):
> +		output = ['KTAP version 1', '1..3',
> +			'ok 1 - first', 'ok 3 - third', 'ok 4 - fourth']

Ditto.

> +		result = kunit_parser.parse_run_tests(output, stdout)
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
> +		self.assertEqual(result.counts,
> +			kunit_parser.TestCounts(passed=1, failed=2, errors=2))
> +
> +	def test_wrong_numbered_skip_fails(self):
> +		output = ['KTAP version 1', '1..1', 'ok 2 - skipped # SKIP reason']

Ditto.

> +		result = kunit_parser.parse_run_tests(output, stdout)
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
> +		self.assertEqual(result.counts, kunit_parser.TestCounts(failed=1, errors=1))
> +
> +	def test_wrong_numbered_suite_result_fails(self):
> +		output = ['KTAP version 1', '1..1',
> +			'    KTAP version 1', '    # Subtest: suite', '    1..1',
> +			'    ok 1 - case', 'ok 2 - suite']

And again... :-)

> +		result = kunit_parser.parse_run_tests(output, stdout)
> +		suite = result.subtests[0]
> +		self.assertEqual(kunit_parser.TestStatus.SUCCESS, suite.subtests[0].status)
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
> +		self.assertEqual(suite.counts,
> +			kunit_parser.TestCounts(passed=1, failed=1, errors=1))
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
> +		self.assertEqual(result.counts, suite.counts)
> +
> +	def test_wrong_numbered_nested_case_fails(self):
> +		output = ['KTAP version 1', '1..1',
> +			'    KTAP version 1', '    # Subtest: suite', '    1..1',
> +			'    ok 2 - case', 'ok 1 - suite']

Ditto.

> +		result = kunit_parser.parse_run_tests(output, stdout)
> +		suite = result.subtests[0]
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.subtests[0].status)
> +		self.assertEqual(suite.counts,
> +			kunit_parser.TestCounts(failed=1, errors=1))
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
> +		self.assertEqual(result.counts, suite.counts)
> +
> +	def test_wrong_numbered_suite_with_skipped_child_fails(self):
> +		output = ['KTAP version 1', '1..1',
> +			'    KTAP version 1', '    # Subtest: suite', '    1..1',
> +			'    ok 1 - case # SKIP reason', 'ok 2 - suite']

Ditto.

> +		result = kunit_parser.parse_run_tests(output, stdout)
> +		suite = result.subtests[0]
> +		self.assertEqual(kunit_parser.TestStatus.SKIPPED, suite.subtests[0].status)
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
> +		self.assertEqual(suite.counts,
> +			kunit_parser.TestCounts(failed=1, skipped=1, errors=1))
> +		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
> +		self.assertEqual(result.counts, suite.counts)
>   
>   def line_stream_from_strs(strs: Iterable[str]) -> kunit_parser.LineStream:
>   	return kunit_parser.LineStream(enumerate(strs, start=1))
> @@ -797,6 +862,14 @@ class KUnitMainTest(unittest.TestCase):
>   		self.assertEqual(self.linux_source_mock.run_kernel.call_count, 1)
>   		self.print_mock.assert_any_call(StrContains('Could not find any KTAP output.'))
>   
> +	def test_parse_duplicate_number_exits_failure(self):
> +		with tempfile.NamedTemporaryFile(mode='w+', delete=True) as log:
> +			log.write('KTAP version 1\n1..2\nok 1 - first\nok 1 - second\n')
> +			log.flush()
> +			with self.assertRaises(SystemExit) as result:
> +				kunit.main(['parse', log.name])

Couldn't this, too, be another file. Then we wouldn't need a complicated 
NamedTemporaryFile thing at all.

That being said, I'm not sure we need to separately verify that this 
causes a specific exit code given we're already testing that it gives 
tests with TestStatus.FAILURE above, but if you think there's a 
particularly good reason for it, I'm not absolutely set against it.

> +		self.assertEqual(result.exception.code, 1)
> +
>   	def test_exec_no_tests(self):
>   		self.linux_source_mock.run_kernel = mock.Mock(return_value=['TAP version 14', '1..0'])
>   		with self.assertRaises(SystemExit) as e:
> 

