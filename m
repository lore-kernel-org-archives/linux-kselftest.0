Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439487;
	b=RHx6mwu8o37UAl/lCq8vyC/QFMrITI5HOdg892X5U/YU5ZBCN4CVq9+wJ1aWvxF+1rmT
	 yB+70dzL7dFzYOmPMxhPBMxS+GwqBKJTUcq5qQGPDbR4ABFaRPyYKdR09lYRiqR66gZJr
	 +0J17PknlRdM0ajOiB4PvkEWWgL2vFlXDjA01Fb7TAfq0gRicDeX1nKienR3UWkRjK+fC
	 so7muK0wuKtKmTNPD5iNkQC9zc6/rr4wqnKT7GKMEyys9b+WrbsyA4ydwctwZQGXwNMhL
	 E52h0CbBi4Fwfdo+N/nvqanjR7o2tXxVP4HgaurFzjYzIrffpGZ3nwyvJwnVx2PsbdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439487;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=N/hUyT208PWL628P3dp42I10YIeJiwbXLU10EQAkCuU=;
	b=oOjRRo67m+BsVivUgDrx1nUpgkgbMH/nKFtjnm+rh3OH2DxrHmyX4O16mVih9zbvVnMa
	 f2wxhgr72qpmzRBN8wTWuP9FgM4VUT1/tLNthXPgqAWLmF60YCFWyzzw00gdcDqWqMtnU
	 w3wC0qUvpZBvH3V0UaydDCK9daQINjn9LRSxmJyJ1rhqU9+Q6gzs7HygGRicc/ztOjiBo
	 RRjivdZLu5tShWpeyBAjwQYIqPZw+GRhw86xvaynu8RbvTp/e3zDGCrK+IJ2fh2LxKucq
	 hO8YM5cFI/8W4h17vUGKvnqEOKhJxEfyoTPa/omAUPElNSeAT0MSwYMCG+sn/c5jz/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEFC606A31A;
	Mon, 23 Nov 2026 13:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AEFC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 0A6E4200DF4; Mon, 23 Nov 2026 21:11:24 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 1A151200DF0;
	Mon, 23 Nov 2026 21:11:22 +0800 (AWST)
Message-ID: <c6c991f6-f92e-4621-b5b2-7d21e4396fee@davidgow.net>
Date: Mon, 23 Nov 2026 21:11:18 +0800
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
Subject: Re: [PATCH] kunit: tool: report executor errors when listing tests
To: simonsudarushkin@gmail.com, Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20260929-kunit-list-errors-v1-1-16bf855e2ec3@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260929-kunit-list-errors-v1-1-16bf855e2ec3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 29/09/2026 à 23:50, Simon Sudarushkin via B4 Relay a écrit :
> From: Simon Sudarushkin <simonsudarushkin@gmail.com>
> 
> --list_tests, --list_suites, --list_tests_attr and --run_isolated first
> ask the kernel for the list of tests. extract_tap_lines() keeps the
> "kunit executor:" lines printed before the KTAP header, but the list
> code then drops the first line as the dummy header and filters the rest
> by name, so an executor error is silently lost:
> 
>    $ ./tools/testing/kunit/kunit.py run --list_tests --filter 'nosuchattr=1'
>    ...
>    $ echo $?
>    0
> 
> The kernel log has "attribute not found: nosuchattr=1" and "error
> filtering suites: -22", while a normal run with the same filter reports
> the error and exits with 1. If the kernel prints no KTAP output at all,
> the same pop() raises ValueError and kunit.py exits with a traceback.
> 
> Move the code shared by _list_tests() and _list_tests_attr() into
> _run_list_action(), which raises ListError on executor errors or when
> there is no KTAP output. exec_tests() prints the error and returns
> TEST_FAILURE, as a normal run does.
> 
> Fixes: ff9e09a3762f ("kunit: tool: support running each suite/test separately")
> Fixes: 723c8258c8fe ("kunit: tool: Add command line interface to filter and report attributes")
> Assisted-by: LLM
> Signed-off-by: Simon Sudarushkin <simonsudarushkin@gmail.com>
> ---
> Tested with kunit.py on arm64 (QEMU with KVM): a bad --filter now prints
> both executor errors and exits with 1 for --list_tests and
> --run_isolated, while normal listing, --list_suites, --list_tests_attr
> and --run_isolated=suite behave as before. In run_checks.py,
> kunit_tool_test.py and mypy pass; the UML smoke test could not be run,
> as UML does not build on this arm64 host (it fails the same way
> without this patch).
> ---

Thanks very much: this is a nice catch.

I'm pretty happy with it overall, though I'm starting to feel that we're 
pushing a bit more functionality into the main kunit.py than we want, 
and this probably should live in another module (like kunit_kernel.py or 
kunit_parser.py, or possibly something new). That'd probably require 
more refactoring than we want for a fix (and there are a few other 
patches which also would benefit from some refactoring, so I think we 
can save that for a future version).

Regardless,
Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   tools/testing/kunit/kunit.py           | 57 +++++++++++++++++++++-------------
>   tools/testing/kunit/kunit_tool_test.py | 18 +++++++++++
>   2 files changed, 54 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
> index 91d234ac3b579..6db09144d7cfc 100755
> --- a/tools/testing/kunit/kunit.py
> +++ b/tools/testing/kunit/kunit.py
> @@ -109,8 +109,12 @@ def config_and_build_tests(linux: kunit_kernel.LinuxSourceTree,
>   
>   	return build_tests(linux, request)
>   
> -def _list_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> List[str]:
> -	args = ['kunit.action=list']
> +class ListError(Exception):
> +	"""Represents an error from the kernel while listing tests."""
> +
> +
> +def _run_list_action(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest, action: str) -> List[str]:
> +	args = ['kunit.action=' + action]
>   
>   	if request.kernel_args:
>   		args.extend(request.kernel_args)
> @@ -121,31 +125,34 @@ def _list_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest)
>   			   filter=request.filter,
>   			   filter_action=request.filter_action,
>   			   build_dir=request.build_dir)
> -	lines = kunit_parser.extract_tap_lines(output)
> +	stream = kunit_parser.extract_tap_lines(output)
> +	lines = []  # type: List[str]
> +	errors = []  # type: List[str]
> +	while stream:
> +		line = stream.pop()
> +		match = kunit_parser.EXECUTOR_ERROR.search(line)
> +		if match:
> +			errors.append(match.group(0).strip())
> +		else:
> +			lines.append(line)
> +
> +	# The executor reports a bad filter or action instead of listing.
> +	if errors:
> +		raise ListError('\n'.join(errors))
> +	if not lines:
> +		raise ListError('Could not find any KTAP output. Did any KUnit tests run?')
> +
>   	# Hack! Drop the dummy TAP version header that the executor prints out.
> -	lines.pop()
> +	return lines[1:]
> +
> +def _list_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> List[str]:
> +	lines = _run_list_action(linux, request, 'list')
>   
>   	# Filter out any extraneous non-test output that might have gotten mixed in.
>   	return [l for l in lines if re.match(r'^[^\s.]+\.[^\s.]+$', l)]
>   
>   def _list_tests_attr(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> Iterable[str]:
> -	args = ['kunit.action=list_attr']
> -
> -	if request.kernel_args:
> -		args.extend(request.kernel_args)
> -
> -	output = linux.run_kernel(args=args,
> -			   timeout=request.timeout,
> -			   filter_glob=request.filter_glob,
> -			   filter=request.filter,
> -			   filter_action=request.filter_action,
> -			   build_dir=request.build_dir)
> -	lines = kunit_parser.extract_tap_lines(output)
> -	# Hack! Drop the dummy TAP version header that the executor prints out.
> -	lines.pop()
> -
> -	# Filter out any extraneous non-test output that might have gotten mixed in.
> -	return lines
> +	return _run_list_action(linux, request, 'list_attr')
>   
>   def _suites_from_test_list(tests: List[str]) -> List[str]:
>   	"""Extracts all the suites from an ordered list of tests."""
> @@ -160,6 +167,14 @@ def _suites_from_test_list(tests: List[str]) -> List[str]:
>   	return suites
>   
>   def exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> KunitResult:
> +	try:
> +		return _exec_tests(linux, request)
> +	except ListError as e:
> +		for line in str(e).splitlines():
> +			stdout.print_with_timestamp(stdout.red('[ERROR] ') + line)
> +		return KunitResult(status=KunitStatus.TEST_FAILURE, elapsed_time=0.0)
> +
> +def _exec_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> KunitResult:
>   	filter_globs = [request.filter_glob]
>   	if request.list_tests:
>   		output = _list_tests(linux, request)
> diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
> index 85ae21754bdf9..d0cb3340a328d 100755
> --- a/tools/testing/kunit/kunit_tool_test.py
> +++ b/tools/testing/kunit/kunit_tool_test.py
> @@ -991,6 +991,24 @@ class KUnitMainTest(unittest.TestCase):
>   				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
>   		self.assertEqual(got, want)
>   
> +	def test_list_tests_executor_error(self):
> +		self.linux_source_mock.run_kernel.return_value = [
> +			'[    0.100000] kunit executor: attribute not found: nosuchattr=1',
> +			'[    0.100000] kunit executor: error filtering suites: -22']
> +
> +		with self.assertRaises(SystemExit) as e:
> +			kunit.main(['exec', '--list_tests'])
> +		self.assertEqual(e.exception.code, 1)
> +		self.print_mock.assert_any_call(StrContains('attribute not found: nosuchattr=1'))
> +
> +	def test_list_tests_no_output(self):
> +		self.linux_source_mock.run_kernel.return_value = []
> +
> +		with self.assertRaises(SystemExit) as e:
> +			kunit.main(['exec', '--list_suites'])
> +		self.assertEqual(e.exception.code, 1)
> +		self.print_mock.assert_any_call(StrContains('Could not find any KTAP output'))
> +
>   	@mock.patch.object(kunit, '_list_tests')
>   	def test_run_isolated_by_suite(self, mock_tests):
>   		mock_tests.return_value = ['suite.test1', 'suite.test2', 'suite2.test1']
> 
> ---
> base-commit: e38f53f0482468efd04397f66bda4648b70ac9fa
> change-id: 20260929-kunit-list-errors-63c1b3066812
> 
> Best regards,
> --
> Simon Sudarushkin <simonsudarushkin@gmail.com>
> 
> 

