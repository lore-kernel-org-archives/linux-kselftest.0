Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41693203B4;
	Tue, 29 Sep 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699514; cv=none; b=vBfDSaiPnUb3dp7jDcbXqaGwTrb4pubY9aJLb8xfdEWQvZ/l5WO6rgEnbJr0r9+7Z9UAhpGVXNBS+U+XYftM82q99lG+J1HvH6Anwlc46GzhS1DX3xH9JVLoTF3WScRTVp4y3biF4FXDTwg+XR7u0CBVBFVApPk8WkNZfSHtYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699514; c=relaxed/simple;
	bh=xGIC9ukH6gEyDgetd1+zTYJ3M1yE8a1OlcNiEMpB11Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdSEi92OIpOkLcdCIEPTSmMo4Wlv2rW1PfetzEFuSoKby4fsvtLSHZ/FR2eWvnf6zP4QIiqQTzdBe9KvnQFT32DyzTgAfGJ3GwJEg4GsmZUwrHCi2ryCNP2OIef9e7j2EvmlgW0SxNqTQM0GF7aSZfDu7hU5H35d/ZFSSXKknmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcS4VX9B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcS4VX9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B708C1F000FF;
	Tue, 29 Sep 2026 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790699512;
	bh=Cb55vnZF0tji/8Hh7HeRYE1TJ+5qLvHUb2TCyUud44s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcS4VX9BuDADAWvHThcEJciJY8c5U2DPax2tVe8SdFV7Mkp31FoPXSqUD5dSSGefA
	 Bg/kOJTWfilZL/6bkjpnmj703FLEgDBc8kj4N/+wBXrKv9u2D0zlgMHTAus+zaiFZ4
	 Im2dFqcd0CruZgxVNOcr9CtWWhgN958brBYZbHscPIuBL+iCUH/eGKWGrPtHUlbyN/
	 D+C1Rma06ypZTSMlreRztrmzxiFSsybfJyQsdTJdnZ2ao9cYm15jEaMwUIFifLs3Oz
	 KmMsLcbbCxLP8BWls60LvMm8yljReK6pg03Aah04/NVAexiuccKepILidhuIR3x86/
	 /izHOM4pJBJXg==
Date: Tue, 29 Sep 2026 17:31:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/11] kselftest/arm64: Use exit_error() rather than
 SIGABRT in fp-stress
Message-ID: <arvmJ50r86WCk9RY@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-4-31bce995b49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-4-31bce995b49b@kernel.org>

On Tue, Sep 01, 2026 at 06:06:44PM +0100, Mark Brown wrote:
> The fp-stress test loads all deliver a SIGABRT to the process group to
> report some errors they detect. There is no particular reason to use
> this mechanism over exiting with an error code, the fp-stress harness does
> not care. In order to facilitate running as KVM guests replace this with
> use of the exit_error() function we added.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/arm64/fp/fpsimd-test.S | 10 ++--------
>  tools/testing/selftests/arm64/fp/sve-test.S    | 10 ++--------
>  tools/testing/selftests/arm64/fp/za-test.S     | 10 ++--------
>  tools/testing/selftests/arm64/fp/zt-test.S     |  8 +-------
>  4 files changed, 7 insertions(+), 31 deletions(-)
>
> diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> index 5ee8ef51ea4e..fcbb3a872490 100644
> --- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
> +++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
> @@ -176,7 +176,7 @@ function setsignal
>  	cbz	w0, 1f
>
>  	puts	"sigaction failure\n"
> -	b	.Labort
> +	b	exit_error
>
>  1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
>  	ret
> @@ -224,7 +224,7 @@ function _start
>  1:	puts	"Bad vector length: "
>  	mov	x0, x19
>  	bl	putdecn
> -	b	.Labort
> +	b	exit_error
>
>  2:	puts	"Vector length:\t"
>  	mov	x0, x19
> @@ -266,12 +266,6 @@ function _start
>
>  	add	x22, x22, #1
>  	b	.Ltest_loop
> -
> -.Labort:
> -	mov	x0, #0
> -	mov	x1, #SIGABRT
> -	mov	x8, #__NR_kill
> -	svc	#0
>  endfunction
>
>  function barf
> diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
> index 3447fe0e5554..26efdbdd88f9 100644
> --- a/tools/testing/selftests/arm64/fp/sve-test.S
> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -344,7 +344,7 @@ function setsignal
>  	cbz	w0, 1f
>
>  	puts	"sigaction failure\n"
> -	b	.Labort
> +	b	exit_error
>
>  1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
>  	ret
> @@ -397,7 +397,7 @@ function _start
>  1:	puts	"Bad vector length: "
>  	mov	x0, x19
>  	bl	putdecn
> -	b	.Labort
> +	b	exit_error
>
>  2:	puts	"Vector length:\t"
>  	mov	x0, x19
> @@ -474,12 +474,6 @@ function _start
>
>  	add	x22, x22, #1
>  	b	.Ltest_loop
> -
> -.Labort:
> -	mov	x0, #0
> -	mov	x1, #SIGABRT
> -	mov	x8, #__NR_kill
> -	svc	#0
>  endfunction
>
>  function barf
> diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> index 33dc4ce8bfa1..7208bb2db9f1 100644
> --- a/tools/testing/selftests/arm64/fp/za-test.S
> +++ b/tools/testing/selftests/arm64/fp/za-test.S
> @@ -189,7 +189,7 @@ function setsignal
>  	cbz	w0, 1f
>
>  	puts	"sigaction failure\n"
> -	b	.Labort
> +	b	exit_error
>
>  1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
>  	ret
> @@ -240,7 +240,7 @@ function _start
>  1:	puts	"bad vector length: "
>  	mov	x0, x19
>  	bl	putdecn
> -	b	.Labort
> +	b	exit_error
>
>  2:	puts	"vector length:\t"
>  	mov	x0, x19
> @@ -288,12 +288,6 @@ function _start
>
>  	add	x22, x22, #1	// Everything still working
>  	b	.Ltest_loop
> -
> -.Labort:
> -	mov	x0, #0
> -	mov	x1, #SIGABRT
> -	mov	x8, #__NR_kill
> -	svc	#0
>  endfunction
>
>  function barf
> diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
> index c67242c2d5ab..c6cfbdeb2f0c 100644
> --- a/tools/testing/selftests/arm64/fp/zt-test.S
> +++ b/tools/testing/selftests/arm64/fp/zt-test.S
> @@ -158,7 +158,7 @@ function setsignal
>  	cbz	w0, 1f
>
>  	puts	"sigaction failure\n"
> -	b	.Labort
> +	b	exit_error
>
>  1:	ldr	x30, [sp], #((sa_sz + 15) / 16 * 16 + 16)
>  	ret
> @@ -222,12 +222,6 @@ function _start
>
>  	add	x22, x22, #1	// Everything still working
>  	b	.Ltest_loop
> -
> -.Labort:
> -	mov	x0, #0
> -	mov	x1, #SIGABRT
> -	mov	x8, #__NR_kill
> -	svc	#0
>  endfunction
>
>  function barf
>
> --
> 2.47.3
>

--
Cheers, Lorenzo
