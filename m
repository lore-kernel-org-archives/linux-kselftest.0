Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21B271A6D;
	Wed, 29 Apr 2026 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479709; cv=none; b=DremDtZwX0CVZHlNCl+w/0RRUMzeUbC74fvIQ/e6lPg/KNsfg2QQe0REueo3WdqctmbsEkiJvgK6hNFxHLrL/hlbtQhisOBrVpbl/3yIbEhwURpSCByLttdmMkxMLDfH+hxewRrppITDaAVcF77QFtlPTWy+J1Xi55SV8K2OlC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479709; c=relaxed/simple;
	bh=l5K7oHX9jfrr/M1Jo2X/4mVFOBjftjYEin7wHrumSPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulp2yLy7VfAqWqOq8wMB7/eYTpGCD45zWNyLkCOlSqE3bG4u87G4oqDCn5sDv6Mb2GM9igxhRG0ikeTuSfThBiB1RbDoPAq+EM2MZevIX2QcCXLB7zfJEC7ZN2QFr3j9/KR1FDj3aZEqSO5dlNboafOqUg2gQtO/TphyJCmHzQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZcXczY8C; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZcXczY8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777479704;
	bh=l5K7oHX9jfrr/M1Jo2X/4mVFOBjftjYEin7wHrumSPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcXczY8CrXAtrS1aluZX55ZxdVAU7FbRP+TcM5C2srRelg+b9/FMqAK5g+Knjrtr7
	 3lt1wLsmSVSeyndGrCdYNvslJg8FJrMlj2Zv0uXVMVZJ9EX5GQH1mN9J7ZeD/9dy3x
	 FV6OuSaSSL7MRS5d5Ol7+GjFdZz81W/96B98RgSY=
Date: Wed, 29 Apr 2026 18:21:44 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/harness: harness-selftest: cover XFAIL_ADD
 ctor ordering
Message-ID: <3734f485-79d3-4c62-8a1e-bad74c6a54f2@t-8ch.de>
References: <20260309093752.808533-1-sun.jian.kdev@gmail.com>
 <20260309101044.809074-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309101044.809074-1-sun.jian.kdev@gmail.com>

Hi!

On 2026-03-09 18:10:44+0800, Sun Jian wrote:
> Add a fixture-based test with a single variant and mark it with
> XFAIL_ADD(). The test intentionally fails and is expected to be
> accounted as XFAIL, covering the constructor ordering dependency
> between TEST_F() registration and XFAIL_ADD() registration.
> 
> Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
> v2:
> - update Suggested-by address
> - update harness-selftest.expected
> - verify with 'make run_tests'
> 
>  .../kselftest_harness/harness-selftest.c      | 23 ++++++++++
>  .../harness-selftest.expected                 | 43 +++++++++++--------
>  2 files changed, 47 insertions(+), 19 deletions(-)

Can you rebase this on kselftest/fixes?
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=fixes

This doesn't apply anymore and I suspect the proposed ordering suffers
from the issue fixed by commit 465b05bae5ac ("selftests: harness:
Restore order of test functions")


Thomas
