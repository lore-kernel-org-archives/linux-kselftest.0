Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266953D6497;
	Fri, 24 Jul 2026 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881338; cv=none; b=esAQ9jXo3SOeVHaJonZKslH/zlwZRUNe86XiH+9uFTjXQfbKcfe7MyQ3k3Y2gVoHjZA662unUN8lYsu8heq9/UCeNK1GGsqDmBjD5KX1wzgUoOCadtV8Zjc1QeLCaUQGGMvvcvnXIP2mkI2apuNAyxMksEyVSlE2qIN6hONYgic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881338; c=relaxed/simple;
	bh=mw8GMJBoAr0TSzOlQ2s8pvtCmil3Xo8vPxz6aH4bq30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cK1W739kEOFJB3DgRajF7PzE7rbqC4DgLYWzOt3gCIiPvJPGL46OlkGvHymwLsE3/D6JgVyjn3vQkhUGgVKf6cfk7QRzzr3BKbPzi2NjSJxcl+bLEmrZIadcFHdfXZCfu+bZ8DIeKwdCtMeOglrGN5jPuBqJ3PhoLvB/it0cXns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AdMMi+Al; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AdMMi+Al"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A672C1477;
	Fri, 24 Jul 2026 01:22:06 -0700 (PDT)
Received: from [10.164.19.44] (unknown [10.164.19.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCFBD3F66F;
	Fri, 24 Jul 2026 01:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784881330; bh=mw8GMJBoAr0TSzOlQ2s8pvtCmil3Xo8vPxz6aH4bq30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AdMMi+AlHl7dxWpvlR3U4+adYGUgCFMySue09WG0pcsg7WANzAfxP+jBFrmLeXmHa
	 Twshh24OCU7p7LMe+bU2EJ0MYwWbHEjB8iJKgJCDbQwu+LpnIvmUM19kK+vrUx2ugh
	 Oz89jPMLUfYSmCAPTkN8M0tpKQjYidHFO8SETJcc=
Message-ID: <b7f59901-f0d5-4ff0-839e-cd45440b87ed@arm.com>
Date: Fri, 24 Jul 2026 13:52:04 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: fix gup_longterm EINVAL error message
To: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Sarthak Sharma <sarthak.sharma@arm.com>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <8A3ADC563A32EF67+20260724065929.1474539-1-zhaozhengzhuo@uniontech.com>
 <23557F4CB8CF36FF+20260724074603.1479243-1-zhaozhengzhuo@uniontech.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <23557F4CB8CF36FF+20260724074603.1479243-1-zhaozhengzhuo@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/07/26 1:16 pm, zhaozhengzhuo wrote:
> The gup_longterm test prints a literal "n" when
> PIN_LONGTERM_TEST_START fails with EINVAL because the string is missing the
> newline escape sequence.
> 
> Print a newline instead.
> 
> Fixes: 800ddf3cd74b ("selftests/mm: report errno when things fail in gup_longterm")
> Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---

Thanks.

For future, please send the next version of the patch in a separate thread, not as a
reply to the previous.

Reviewed-by: Dev Jain <dev.jain@arm.com>


> Changes in v2:
> - Add Fixes tag as suggested by Sarthak.
> - Add Reviewed-by tag from Sarthak.
> 
>  tools/testing/selftests/mm/gup_longterm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
> index eb8963e9d..c03b4f891 100644
> --- a/tools/testing/selftests/mm/gup_longterm.c
> +++ b/tools/testing/selftests/mm/gup_longterm.c
> @@ -196,7 +196,7 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
>  		args.flags |= rw ? PIN_LONGTERM_TEST_FLAG_USE_WRITE : 0;
>  		ret = ioctl(gup_fd, PIN_LONGTERM_TEST_START, &args);
>  		if (ret && errno == EINVAL) {
> -			ksft_print_msg("PIN_LONGTERM_TEST_START failed (EINVAL)n");
> +			ksft_print_msg("PIN_LONGTERM_TEST_START failed (EINVAL)\n");
>  			result = KSFT_SKIP;
>  			break;
>  		} else if (ret && errno == EFAULT) {
> 
> base-commit: c04df384b55dd9dcf72c36b661becb5aaba371a9

