Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7ECD3FD96E;
	Wed, 12 Aug 2026 16:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552530; cv=none; b=seGPzuyXmbhTKTYtvRijnJl2p5MAmDN0c3rajebwn3okJX5v0GyR7dXdI2mDcejaeQ0poX0I1llvKo2rC8Eio2trfcFUOgiphaSvKJaXtRiINJoQvsegELsfUnPAt+BRYMeLIsy7C/NtWscxjrX1LvTuAkoynUAMzWkd7KmMmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552530; c=relaxed/simple;
	bh=vAzC+X//h7RK+RdYehEeObcWvbQXeEefa6AO2LuUd2U=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hMQPIBdloGvaMtTfAcKOUlFoG18GTqLf5UBx9nSvYaMv3jQ73JBJZWn+RCOcklNw+72kuCpB8Jprh7Ru8QIuKtEUExA82edo06gF0R9Ft3UfQQYj/DadY5atsxyaHciVa5UcqpUQMtOviorxo0onZi/73jXPhqFR2HN8889KZT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p32sLKDB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p32sLKDB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F2C31596;
	Wed, 12 Aug 2026 09:35:22 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A69D3F632;
	Wed, 12 Aug 2026 09:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786552526; bh=vAzC+X//h7RK+RdYehEeObcWvbQXeEefa6AO2LuUd2U=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=p32sLKDBQEa8FZowC/IPTW+jRnqWB6wR0HJwddeZPIupI5zuWI2RDJ2GDulX9SC0j
	 K/0N3zp8pNXrmuJkvGN3GgIQOHS+JvDVws0V+pE30ns7ZPorEfMmBTfzQnVF3I6B9y
	 j1bCKvzFsVOpOGAt1Y90XAdlwMKJ8b/vVVE8oPhU=
Message-ID: <4ef8b130-6c36-474e-904d-901c0d967c38@arm.com>
Date: Wed, 12 Aug 2026 17:35:22 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, shuah@kernel.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org
Subject: Re: [PATCH] selftests/mm: emit KTAP output from ksft_kmemleak_dedup
To: Song Hu <husong@kylinos.cn>
References: <20260812132142.582390-1-husong@kylinos.cn>
Content-Language: en-US
From: Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <20260812132142.582390-1-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2026 2:21 pm, Song Hu wrote:
> ksft_kmemleak_dedup.sh reports its result with raw "SKIP:"/"FAIL":"PASS:"
> echoes and bare exit codes instead of KTAP, so parse_kselftest.py cannot
> read it.  Convert it to the ktap_helpers.sh API, like its sibling
> ksft_kmemleak_confirm.sh.
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  .../selftests/mm/ksft_kmemleak_dedup.sh       | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh b/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
> index d01950244490..2db7f006808f 100755
> --- a/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
> +++ b/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
> @@ -19,24 +19,30 @@
>  #
>  # Author: Breno Leitao <leitao@debian.org>
>  
> -ksft_skip=4
> +# KTAP output helpers (ktap_skip_all, ktap_exit_fail_msg, ktap_test_pass, ...).
> +DIR="$(dirname "$(readlink -f "$0")")"
> +# shellcheck source=../kselftest/ktap_helpers.sh
> +source "${DIR}"/../kselftest/ktap_helpers.sh
> +
>  KMEMLEAK=/sys/kernel/debug/kmemleak
>  VERBOSE_PARAM=/sys/module/kmemleak/parameters/verbose
>  MODULE=kmemleak-test
>  
> +ktap_print_header
> +
>  skip() {
> -	echo "SKIP: $*"
> -	exit $ksft_skip
> +	ktap_skip_all "$*"
Please use ktap_test_skip to make it generic please.
> +	exit "$KSFT_SKIP"
>  }
>  
>  fail() {
> -	echo "FAIL: $*"
> -	exit 1
> +	ktap_exit_fail_msg "$*"
Please call ktap_test_fail instead here to mark the failure.
ktap_exit_fail_msg is usually used in unrecoverable error case.

>  }
>  
>  pass() {
> -	echo "PASS: $*"
> -	exit 0
> +	ktap_set_plan 1
ktap_set_plan must be called for fail and skip cases as well. So please
move it to the very start of the test.

> +	ktap_test_pass "$*"
> +	ktap_finished
ktap_finished must be called for all the cases (skip/failure) as well it
prints the final line that how many tests got pass/failed or skipped.

Please look into how other tests work  and then refactor this test
accordingly. 

>  }
>  
>  [ "$(id -u)" -eq 0 ] || skip "must run as root"

