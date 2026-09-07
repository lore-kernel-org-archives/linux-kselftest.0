Received: from mta1.migadu.com (out-66.mta1.migadu.com [95.215.58.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4A23D283
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 02:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788749498; cv=none; b=XyzE0R8/cLa294OhmqQZHiTdxMfQs6D02aNwm5JmWzcCD0gKknsyYbilF3PJz5BVGlLf4rtPYxPJ4djmpaIk5higQjO3CJIqTDzLqOuKv5xd9jJXf0o6GQWhgmII0OnZcOvZnwz+p/UXj/4QrzCUPxmNfG8YnsMsflIIQJZRvn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788749498; c=relaxed/simple;
	bh=SxzjzX434z8T2FekJgnAJrbYVmucvXUWeYnZppPlDZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qj8jNFOy6YkZIr53ojekO0BcMu+V8RIohLUPTbabpFhqVWwTZiJgGF2OHwhQIR9OtfMHXPuJuCVLmo6uXyWX4qHRBAjBBu9FkO4NTDv/2feu1BjPV+Q5XIGwrs+n5Ej3deu7be7KaNQqZenUj889HWMRRtTZT6l9BBXZ6zRz4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IsjEXfDq; arc=none smtp.client-ip=95.215.58.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IsjEXfDq"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SxzjzX434z8T2FekJgnAJrbYVmucvXUWeYnZppPlDZk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788749494; v=1; x=1789354294;
 b=IsjEXfDqwDFBLJ6Ovb0TYHjb99/MR86C9FMmnlmUIImQB2pMRWMV+G6MSkPeRrFst59BK2EF
 o4mnwkB+bj3M9V75So/Pl9jxyQ8AwE6YKgS7yFoU6q2RABPzToPGKpJ+0DQFjZnQkvwA5pCurjc
 FaJ7qvLbVYjnPDXhr9tApS3U=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 209a31feee9fdb3e;
	Mon, 07 Sep 2026 02:51:33 +0000
X-Mizu-Trace-ID: 209a31feee9fdb3e
X-Migadu-Flow: FLOW_OUT
Date: Mon, 7 Sep 2026 10:51:23 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/lib.mk: run_tests= print summary at the end
Message-ID: <ap4mq02KukH7W8kI@fedora>
References: <20260625-sft-run-tests-print-totals-v1-1-bfe588266249@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625-sft-run-tests-print-totals-v1-1-bfe588266249@kernel.org>

On Thu, Jun 25, 2026 at 06:22:19PM +0200, Matthieu Baerts (NGI0) wrote:
> When there are many tests and/or many log lines, it is difficult to
> quickly find out how the different tests went when running:
> 
>     make -C tools/testing/selftests run_tests
> 
> This run_tests target executes 'run_many' from runner.sh, which relies
> on ktap_helpers.sh. At the end of the execution, the KTAP_CNT_* counters
> have been populated, and the total can then be simply printed with the
> ktap_print_totals helper.
> 
> Now a summary is printed at the end, e.g. here with the two last lines:
> 
>     $ make -sC tools/testing/selftests TARGETS=(...) run_tests
>     # timeout set to (...)
>     # selftests: (...)
>     (...)
>     ok 1 selftests: (...)
>     # timeout set to (...)
>     # selftests: (...)
>     (...)
>     ok 2 selftests: (...) # SKIP
>     # timeout set to (...)
>     # selftests: (...)
>     (...)
>     not ok 3 selftests: (...)
>     # 1 skipped test(s) detected.  Consider enabling relevant config options to improve coverage.
>     # Totals: pass:1 fail:1 xfail:0 xpass:0 skip:1 error:0
> 
> This summary is printed, using '#' as prefix to be treated as a comment
> in the TAP format. The summary is also printed when summary=1 is used to
> redirect log lines in different files because it still looks useful when
> there are many tests, not to have to check each line.
> 
> Note that this 'make' command will continue to exit without errors
> (returned code is 0) when the tests can be executed. I guess it is
> better not to change this behaviour to be able to continue detecting
> kselftests failures.
> 
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> ---
>  tools/testing/selftests/lib.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index f02cc8a2e4ae..de15e63bc6b4 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -106,7 +106,8 @@ define RUN_TESTS
>  	if [ "X$(summary)" != "X" ]; then       \
>  		per_test_logging=1;		\
>  	fi;                                     \
> -	run_many $(1)
> +	run_many $(1);				\
> +	ktap_print_totals
>  endef
>  
>  define INSTALL_INCLUDES

This helps get a clear summary for make run_tests.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
