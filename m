Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C6D370D54;
	Wed, 12 Aug 2026 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542373; cv=none; b=FTjc0K0wiYyAwSzWV958mSIlOlLCgvMSUn82NDXrDhqOQcLtVObJKT1GT9UIUM0sODDMOn88T2XBY62/G4NqG4IHTiwcyeDdn8f1KDAR0zq+QQw7jAw/GkDyPFxCcNvKE644h781wNvhjD1XlpwI5SWMb0lkQX/i+2EqtV3nubQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542373; c=relaxed/simple;
	bh=qfMPKVNSN2ZaPv8CbyEDjD/aFfK67ih1pPFSsm9Qt4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asM63KTLrT1Lny1243E2gu/xE8V1vu4EbfIG5qoXGoPkNFGdhqLLJLpad8t1Ilwjad9/s3FByLZOe63iKfo3lMBsUvvlD4gYw+88rELGk56VRn9UGjgjFLvIlrnBoiyqHL5/88MpX56AzH/e9bShWCdVYx0l2w7epN7EHINwJks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M546RZ58; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M546RZ58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C731F00A3A;
	Wed, 12 Aug 2026 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542372;
	bh=dPPfCRg3JlfVv/4f6FK6LVxgGLE7bCFUuDbT6h8lgBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M546RZ58kHKzTydWMuY5WEtHJaCQrwspIfdlS4p99Hkd7+vVXTMWTO9ofaYbnL7Lz
	 hzM8op6tZLBpqL/IttyerVkZL3O76U34OPr5Ahgbq+fgJvv+Gy/caKTQUTcDImhNAe
	 2c5GcaNH0197jxiv/HgWwBBaJ8XQJtEPXSm1+yFolJbjYY+lV7qcVFxRttGh1sN55U
	 rfvFEMFhhJeH+uQGNrwNCWyl6uXvyXaGG3fX2cIXc5wgYAh/UA22Nul8J+3RRFppGE
	 zftYX9V92w/JC3s95h5pqxnoZA1VQsJa1sOXDKAMwP9infngzu3ydtrPAmhuCip6sq
	 Tzd7GBij9KKGw==
Date: Wed, 12 Aug 2026 16:46:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, shuah@kernel.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: emit KTAP output from ksft_kmemleak_dedup
Message-ID: <anx5HTQVVrgwtTqK@kernel.org>
References: <20260812132142.582390-1-husong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812132142.582390-1-husong@kylinos.cn>

On Wed, Aug 12, 2026 at 09:21:41PM +0800, Song Hu wrote:
> ksft_kmemleak_dedup.sh reports its result with raw "SKIP:"/"FAIL":"PASS:"
> echoes and bare exit codes instead of KTAP, so parse_kselftest.py cannot
> read it.  Convert it to the ktap_helpers.sh API, like its sibling
> ksft_kmemleak_confirm.sh.
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

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
> +	exit "$KSFT_SKIP"
>  }
>  
>  fail() {
> -	echo "FAIL: $*"
> -	exit 1
> +	ktap_exit_fail_msg "$*"
>  }
>  
>  pass() {
> -	echo "PASS: $*"
> -	exit 0
> +	ktap_set_plan 1
> +	ktap_test_pass "$*"
> +	ktap_finished
>  }
>  
>  [ "$(id -u)" -eq 0 ] || skip "must run as root"
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
