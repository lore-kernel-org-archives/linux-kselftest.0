Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2063E3F871E;
	Wed, 27 May 2026 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779881590; cv=none; b=krZTwiHNIrbENTsEzgVg5DecJPII3S8kv4Y8HV36xtMxboMIb8bp/xGqK9vg+9xQiN31vmLZXhCBHay3w6rvks3MZyooG50UQCMCEBitN7cGLaET0xFQzN6ZFzrh7BsncjuOdhRHAKid2pTtcET1qoar3RZ1NH8Mx48e3uAGx6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779881590; c=relaxed/simple;
	bh=O8Cm+JFylGJrwhWvbIUGBbsA3glNEi8WENiLAA9eKf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9CQ9+3ahQc1ZLTYvqFHuP0xTs4JFpD3rL2YtbYl7OvQpZkDUei8Z1Dp8X0mGv3wjikGjmMw9xrssf2mlg0xflIuchZWbfSASaiqsO7SD3dLFChJzuXlKUr5AdswXq63VWI/5Tz40RaME/rYapFc2FkVRGgNyoMG4xKI55XYzos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbZo5//S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbZo5//S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B98D1F000E9;
	Wed, 27 May 2026 11:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779881579;
	bh=7gJ26zK78eOdBOgt7O7AAaGauSQe0tx46erorLEnJdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gbZo5//SYSZ3Re7PzPSWAssnThka7UKS7VIuBMvgX3Y6legw7Yo0Sw8rL+MuaFZj4
	 KYRE4watjleMRLfisx2wXId8cIT3doiDZN6LJG4NtXq7xvEmjUH/fPMMzJ3WEUmG0p
	 xCjBJumTJIfwCzt3hN9lYhwE78VUVE3Z1EeCUsitw6IUfxh3HU3ZOlpHCUIQ+PqQx5
	 RQNdD0oAbgh3TS50It08QsonlP0ibIPQhMC80HtHZeeU6ikWVqz00AydKAR4Kamkjq
	 vXlFNihcBrWDlTDPWQUhh+aEo0dDvOgc/fv/PxGYhGSkyhYvWh2zevh6X27K7XhuMw
	 /xXOZKyTveS0Q==
Date: Wed, 27 May 2026 14:32:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] selftests/mm: refactor pkey test helpers and
 unify assertions
Message-ID: <ahbWZJ2BbR8mmDd_@kernel.org>
References: <20260527013825.1134225-1-lihongfu@kylinos.cn>
 <20260527013825.1134225-2-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527013825.1134225-2-lihongfu@kylinos.cn>

Hi,

On Wed, May 27, 2026 at 09:38:24AM +0800, Hongfu Li wrote:
> Move shared tracing and assertion helpers to a common file, then
> convert the sighandler test to use pkey_assert() for consistent
> diagnostic output, and add per-test tracing around test execution.

This sounds like three patches to me.
 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
>  tools/testing/selftests/mm/pkey-helpers.h     |   5 +-
>  .../selftests/mm/pkey_sighandler_tests.c      | 108 +++++++++---------
>  tools/testing/selftests/mm/pkey_util.c        |  81 +++++++++++++
>  tools/testing/selftests/mm/protection_keys.c  |  82 -------------
>  4 files changed, 137 insertions(+), 139 deletions(-)

-- 
Sincerely yours,
Mike.
