Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B03FB074;
	Mon, 17 Aug 2026 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965915; cv=none; b=lDm30wIXK6IO+pU7f7ssWYVcHKtQPI7XcqGZKseGEJAKH/vJh2qSAGV4LIaLhii6ikGhRrJ03EKXmtwh32df2UpGlpp460jr7PcZ5+OgM+ACXeIVJEJAbOQquUiI5jiqWkHIiEaHKTDI9XT9UbtlljF6Bnec0AwI7DWX7Yvr1s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965915; c=relaxed/simple;
	bh=urWAdGNZMu5n5ajFJbyOq+54ew1XCa3PYVtIqZwjObE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXU0hhY2NJxuhA8KKuu9Np1Pv6LFZD1EpMTj6L+bgXaEnAUhbGYRCjsNmHdwfn8HUTWWlKYgCqEtMYdhiMC/GRSkGFBXLW2yQRX/StMurbqxZ5IVBn3WSpN5TxHc9maTEjOW8p29dhnfimBWtYmnb/bwN1l3X4FzQPUZqtIyjFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiVG1LTJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiVG1LTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DCF1F00A3A;
	Mon, 17 Aug 2026 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786965913;
	bh=eodZ9Rb4n0bAkFN1ha9WBQcFvF7IyL6dkjgO4Dxu55o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UiVG1LTJOaeHPT0ju9HwdcPGncOk6n2w46S25K8L0FRM2K+49EljiwcS1/bEbnt/d
	 pbTGQGs88PF1s1E3Mikz+gBsAY3W5pvED66K8q6bDZIiocQu3TcZjsimuk3LfYc2Gi
	 HDjTDtR2UCWezVkZbQ4WQ5UJG/k6NwgNUoKOvfjcPBapaWrHRHegpxpj2t2Fp9JaXx
	 lnt5iQzmav7ZfupU7a7ju9n8sgvz+swnkF/Gs0Iqt58yVwe9L6VCSLrBjFkCcTBKN3
	 t89SKumI9OQNvl5AeigM/DmEyzunlK7n+1A8UeYd348M/pLSvhq9wE27NAQvN4EdKR
	 2m+YvCR/kzmjQ==
Date: Mon, 17 Aug 2026 12:24:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: akpm@linux-foundation.org, rppt@kernel.org, usama.anjum@arm.com, 
	leitao@debian.org, linux-mm@kvack.org, shuah@kernel.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	peterx@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: emit KTAP output from
 ksft_kmemleak_dedup
Message-ID: <aoLvf6jyaQaYDixW@lucifer>
References: <20260815084231.3630742-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815084231.3630742-1-husong@kylinos.cn>

On Sat, Aug 15, 2026 at 04:42:31PM +0800, Song Hu wrote:
> ksft_kmemleak_dedup.sh reports its result with raw "SKIP:"/"FAIL:"/"PASS:"
> echoes and bare exit codes instead of KTAP, so parse_kselftest.py cannot
> read it.  Convert it to the ktap_helpers.sh API, like its sibling
> ksft_kmemleak_confirm.sh.
>
> skip() and fail() emit ktap_test_skip()/ktap_test_fail() instead of
> ktap_skip_all()/ktap_exit_fail_msg(), and a single ktap_set_plan() at the
> top covers every path; ktap_finished() then prints the totals line and
> provides the exit code for skip/fail/pass alike.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Song Hu <husong@kylinos.cn>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>
> Changes in v2, per review feedback from Usama Anjum:
> - use ktap_test_skip() instead of ktap_skip_all(), and ktap_test_fail()
>   instead of ktap_exit_fail_msg()
> - move ktap_set_plan() to the very start so it covers all paths
> - call ktap_finished() on the skip and fail paths as well
>
> v1: https://lore.kernel.org/all/20260812132142.582390-1-husong@kylinos.cn/
>  .../selftests/mm/ksft_kmemleak_dedup.sh       | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh b/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
> index d01950244490..fda6a9340e0e 100755
> --- a/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
> +++ b/tools/testing/selftests/mm/ksft_kmemleak_dedup.sh
> @@ -19,24 +19,31 @@
>  #
>  # Author: Breno Leitao <leitao@debian.org>
>
> -ksft_skip=4
> +# KTAP output helpers (ktap_test_pass, ktap_test_skip, ktap_test_fail, ...).
> +DIR="$(dirname "$(readlink -f "$0")")"
> +# shellcheck source=../kselftest/ktap_helpers.sh
> +source "${DIR}"/../kselftest/ktap_helpers.sh
> +
>  KMEMLEAK=/sys/kernel/debug/kmemleak
>  VERBOSE_PARAM=/sys/module/kmemleak/parameters/verbose
>  MODULE=kmemleak-test
>
> +ktap_print_header
> +ktap_set_plan 1
> +
>  skip() {
> -	echo "SKIP: $*"
> -	exit $ksft_skip
> +	ktap_test_skip "$*"
> +	ktap_finished
>  }
>
>  fail() {
> -	echo "FAIL: $*"
> -	exit 1
> +	ktap_test_fail "$*"
> +	ktap_finished
>  }
>
>  pass() {
> -	echo "PASS: $*"
> -	exit 0
> +	ktap_test_pass "$*"
> +	ktap_finished
>  }
>
>  [ "$(id -u)" -eq 0 ] || skip "must run as root"
> --
> 2.43.0
>

--
Cheers, Lorenzo
