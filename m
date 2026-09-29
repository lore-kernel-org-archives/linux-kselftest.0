Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2054FDA51;
	Tue, 29 Sep 2026 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699258; cv=none; b=UD+HJxMcHklZ3NijMlqF749eWPigsEio4H/hU3qT8h8AG6X4necb5P1e0zX9AbK6du9T3C4iwh/lkM/bZV3amWHCLa8qt9sz7uT0pI6F2s3ilrsOD6tOrKtxTFKpAMjGUgCecXBuZoWtCj5p7siHlie0gaMPIEn/IWrhUDJ8JIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699258; c=relaxed/simple;
	bh=f+toKPxTkGskuYP4BIAoBwY0gM1JTizLIKbQIY6XvLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/eCz3tLWx4Xi8WyBDcfZRenQ4SmszMwAyiYJUbZAybVScmzIhlkOAB4leuukooESOF5n6mFEBxIuvuSrn94z4pNENaE4QcA4gxd55D9Meg5RJt0M4TvwgqRbqr0Yl5D5tZHBz6dyWdRaQm1p3/SSsRYUtCKNHB+10wN76nJg0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VfLzuTya; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VfLzuTya"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E3ED1516;
	Tue, 29 Sep 2026 09:27:31 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42EF53F85F;
	Tue, 29 Sep 2026 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790699255; bh=f+toKPxTkGskuYP4BIAoBwY0gM1JTizLIKbQIY6XvLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfLzuTyaXU010of07I75FH3lL4Coynai8PZ2wFNavd8Ces8RJ4ImO/+ytxcQJq88z
	 kuxsp2k8s137nhkan9jywVpwOu0ATqD1Q1VAAcKeUA6QJxhLh8KCpZ3cP4ilakLqjE
	 qe5mTt/LJzYFTDqH/oywNbKlACZMMCcMQV21rpQg=
Date: Tue, 29 Sep 2026 17:27:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>

On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:
> When they detect corruption the fp-stress test loads print load specific
> diagnostics and exits with a failure status.  In preparation for
> building versions intended to run as KVM guests factor the exits into
> asm-utils-linux.S.
> 
> No functional change.

This is a good cleanup, but I do think it'd be worth noting that some of
the existing asm was wrong and worked by coincidence.

I did mention that in the patches I linked you to a while back:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=922d15ef46cb486a79f168949e103f6df26f4fba

Mark.

> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/fp/asm-utils-linux.S | 8 ++++++++
>  tools/testing/selftests/arm64/fp/fpsimd-test.S     | 4 +---
>  tools/testing/selftests/arm64/fp/sve-test.S        | 8 ++------
>  tools/testing/selftests/arm64/fp/za-test.S         | 8 ++------
>  tools/testing/selftests/arm64/fp/zt-test.S         | 4 +---
>  5 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> index 3effeb1fbf50..9cd31dc47709 100644
> --- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> +++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> @@ -84,3 +84,11 @@ function tickle_handler
>  	ret
>  endfunction
>  .globl	tickle_handler
> +
> +// Terminate the program, reporting failure.  Does not return.
> +function exit_error
> +	mov	x0, #1
> +	mov	x8, #__NR_exit
> +	svc	#0
> +endfunction
> +.globl	exit_error
> diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> index 9db7b5419397..5ee8ef51ea4e 100644
> --- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
> +++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> @@ -298,7 +298,5 @@ function barf
>  	bl	dumphex
>  	puts	"]\n"
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
> diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
> index 2aadb5c3c0f3..3447fe0e5554 100644
> --- a/tools/testing/selftests/arm64/fp/sve-test.S
> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -543,9 +543,7 @@ function vl_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
>  
>  function svcr_barf
> @@ -555,7 +553,5 @@ function svcr_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
> diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> index 84e63e510f23..33dc4ce8bfa1 100644
> --- a/tools/testing/selftests/arm64/fp/za-test.S
> +++ b/tools/testing/selftests/arm64/fp/za-test.S
> @@ -354,9 +354,7 @@ function vl_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
>  
>  function svcr_barf
> @@ -366,7 +364,5 @@ function svcr_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
> diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
> index afcadb5aff23..c67242c2d5ab 100644
> --- a/tools/testing/selftests/arm64/fp/zt-test.S
> +++ b/tools/testing/selftests/arm64/fp/zt-test.S
> @@ -284,7 +284,5 @@ function svcr_barf
>  	mov	x0, x10
>  	bl	putdecn
>  
> -	mov	x8, #__NR_exit
> -	mov	x1, #1
> -	svc	#0
> +	b	exit_error
>  endfunction
> 
> -- 
> 2.47.3
> 
