Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5D4ED1AF;
	Tue, 29 Sep 2026 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698971; cv=none; b=MwppOp0b20tBpBiiWmp2MU2nhNn4uchfTegBTtBNpge8eqRmEu6v9OjtW+7xm0x8VWFMvbw5e9V+LcIFY4qm7vyZ6dg3gfNt7+CG7WVJxUzpCskMu9k+M62a+617MGIris6AouPOx3cKAMk66CF1l5ZwasLtnQwbs9dz31CLNjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698971; c=relaxed/simple;
	bh=ut2J7FV+xzcByKavaPYspIlcWhPeCT2z0qCEaaBjjnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHj6MxvLFT8/8S36qxLXcW67w8kfDrimLmd9T5ScagKFzs8HF3AO8TzFWYHAWGvg1reLoWC4P2/vu8cPimPrlWYdWT3neZwo6bmimjOHlAlwtCxuYqky7yPkRwJobW0sbROhG3KYYZ6mc4EEQvkW0pWdBss6D+Nu+2ezSykI3Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2JsrX5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2JsrX5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDA11F00893;
	Tue, 29 Sep 2026 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790698969;
	bh=rz7FB1JiQQWECxyDkCp2pLSNs/1cOz9bKlgbTiChjT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2JsrX5j9lsR1xXFVjTTyGN1wqf4vuTJeDCXzjA7c1FJtEqdf2CogUDPSrS05l06T
	 hho2m8ZFTk7ayXFvLrZCcvxd/R6MJE7xOBBNbRyFWwZB5SpzxdGpHEV7b+ACLxfxM4
	 Y3LV0Yb+xXLuVBwDVhGqEpAjbZv4dElKNM73d39xCl3V4l7Zw8hjN4X4yt8Y26UTU+
	 c9zrOrjcBBwbnKhzT9bhDdJvxt/fxBzT5r/RKGbw29rHIGEE83xB/+FMxo881WVRVP
	 2BSBv4Xp8BUR91UQtnBVoWvc4jV6zPQPu8rAOm7nOg9lcMVxHdt6/vEtWl6VlfsRA9
	 ShhhFSG6KrJlw==
Date: Tue, 29 Sep 2026 17:22:44 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <arvjKjrh1NU4CKPE@gremlin>
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

Maybe nice to say 'bare metal guests' here, though not sure if that's the usual
terminology?

In any case, to me it's a bit unclear in what sense you mean they're running as
KVM guests here.

> No functional change.

I don't think this is accurate, as you're changing the register into which a
value is loaded (x0 instead of x1).

That seems to be correct to me, but worth calling out that you're fixing that up
in the commit message and dropping this line.

>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Looks sensible to me, with commit msg nits addressed:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> diff --git a/tools/testing/selftests/arm64/fp/asm-utils-linux.S b/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> index 3effeb1fbf50..9cd31dc47709 100644
> --- a/tools/testing/selftests/arm64/fp/asm-utils-linux.S
> +++ b/tools/testing/selftests/arm64/fp/asm-utils-linux.S

> +// Terminate the program, reporting failure.  Does not return.
> +function exit_error
> +	mov	x0, #1
> +	mov	x8, #__NR_exit
> +	svc	#0

And looking this up, svc = SuperVisor Call = -> EL1 essentially syscall(__NR_exit) :)

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

Looking it up I see that 'b' is the unconditional variant, but it makes sense to
use it in the case of an exception being raised.

--
Cheers, Lorenzo
