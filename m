Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B8B32D45B;
	Fri, 10 Apr 2026 05:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775799010; cv=none; b=cYoQkLvMLWDcBuy1m10SRursaxGX1wS2VnjOdcAdjOmOxQDLsavYiK/MU1HAxx2ba2UGdqwJ7rOim6HyJE3w7pfWpEmH2DekaNf/uTYiILk0UJTCBPA5gGXA8N7IOUF9vSjMXE6ZNmjMkp7onT72+44JEs/aPQ01UZ2w+gOAM9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775799010; c=relaxed/simple;
	bh=V/k8TpK7UgCFEnab0NAEjH8K1d+6H1LN2eToXJ55ZmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvOKbyyZAflZdeX36ckEQC0d4QZays8ni7os+pSmGS3uS6ZgPXMeewVLclUKaa8PeBnGWQN2jJL9q+kjX0nqzrcLXdZCQmuPHmjSfMyfrtvK5st5hLp4N0s2R0Pkm7TtctFiNhve05dL9MGRY6cqBGv1Pyu9cbD9BPvzXeTmmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFH86ZPY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFH86ZPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C33C19421;
	Fri, 10 Apr 2026 05:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775799010;
	bh=V/k8TpK7UgCFEnab0NAEjH8K1d+6H1LN2eToXJ55ZmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFH86ZPYLPRLGIKMRe0X98YbVecVo5hC24ux2/hK6n2pfqumoSoRRY7DtAS4zli+D
	 UeVEaBuQyHFb4HmHeA0L38tz2hVhUo7RYEt9TNKL4jxROZ2ZfW9I2guf0tXcQVGK6Z
	 UGmQLkwlHeCxSFKtkqEIJv4SI0mpqZ+mXeRdjQ/pQfZVr4+K9XoA7oFu9lv6CzQxoq
	 9uNR/merZCvt5eT1C03Leaz3gTJ63Cu+xbdU8yTPYclOg+LhjjiJ4VNOMBALPhQexM
	 MeUBs7BgXsomsSqNf6srC/e0pTns+G745vWaWMBz17DriNXvoDZx5VtkgEYFYguKDk
	 UAiIDk5p+1TPg==
Date: Fri, 10 Apr 2026 08:30:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Cao Ruichuang <create0818@163.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: mm: skip charge_reserved_hugetlb without
 killall
Message-ID: <adiK27fGKSZyl1Rf@kernel.org>
References: <20260406053126.217196-1-create0818@163.com>
 <20260410044139.67480-1-create0818@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410044139.67480-1-create0818@163.com>

On Fri, Apr 10, 2026 at 12:41:39PM +0800, Cao Ruichuang wrote:
> charge_reserved_hugetlb.sh tears down background writers with
> killall from psmisc. Minimal Ubuntu images do not always provide
> that tool, so the selftest fails in cleanup for an environment reason
> rather than for the hugetlb behavior it is trying to cover.
> 
> Skip the test when killall is unavailable, similar to the existing
> root check, so these environments report the dependency clearly
> instead of failing the test.
> 
> Signed-off-by: Cao Ruichuang <create0818@163.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> v2:
> - replace the PID tracking approach with a simple skip when killall is
>   unavailable
> - follow Mike Rapoport's review suggestion
> 
>  tools/testing/selftests/mm/charge_reserved_hugetlb.sh | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> index 44776965763..44f4e703deb 100755
> --- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> +++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> @@ -11,6 +11,11 @@ if [[ $(id -u) -ne 0 ]]; then
>    exit $ksft_skip
>  fi
>  
> +if ! command -v killall >/dev/null 2>&1; then
> +  echo "killall not available. Skipping..."
> +  exit $ksft_skip
> +fi
> +
>  nr_hugepgs=$(cat /proc/sys/vm/nr_hugepages)
>  
>  fault_limit_file=limit_in_bytes
> -- 
> 2.39.5 (Apple Git-154)
> 

-- 
Sincerely yours,
Mike.
