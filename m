Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDD1334C34;
	Mon, 26 Jan 2026 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429434; cv=none; b=SeclmaxtDmAYH1ghKqw23ALnyRF6hrefsRbob/X9L+ZXh32VQWugUO+cgyhZTjROfSXRnihA6qM0uynaHNO41UVb95GLHnp8EomCtxlXj9TKuVsnFHa5Xm/Qq/vWgXlnCfkYQYmgxU/Em99ZwNIchOls4RwLkCLw3bmrTWcwqFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429434; c=relaxed/simple;
	bh=gPkNaemZhpOFrTh78yFUMeR8+6cHYJvwykk4KASwnIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaM8CKEzESISAseYxIPW+qrqYSzFH2JIK+UTXJREkiDmZN3JmbBP8gbTHt9GtIjyM6RycGg5Tk0QLog+SyZyBqQBcGKfkGS2nBfosN0Q1TSRaVgvdDmZhl7c/LybcdnLWmLLX8V8GPV0SG2mws733LvCNMugqe1HSHkL/oOhKhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=LrTYdF08; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="LrTYdF08"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mq8cMoLR52MsEJ4dKjU+tC+o0B8MYSrs3knqj5FFS1s=; b=LrTYdF08+b3QyAcFyFleLU2na+
	fsnXU+QBEI1kJD+bz/LYpOWJc9Wc16jCfPsW+tH3zo/m7MyiOmpCSoZn3ti3e3eOHCwSrUpDoG5Ap
	atQTqh1ipFTjqGfXAbsuyRFHdsXufFLup2rdU8eNZqVh1CAj31Io/Pxe7vMtlKQW2eBZDeK+VNa7M
	ySzrZyMAv51/2voiwPxt2EdvH3gbkFMle76sbkJawHXEeCu251Y2g7fSVoBmnCCi48Uy9vIQkZaoZ
	rWRp6XGkrN483fVrHf1y4C5eh/VWaAeOtUB8Yxqtrc9WS4YBFRprxP0y+hGbFg6t5FV6awWu2LnBo
	8K020OIA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vkLQE-00GAGj-Nd; Mon, 26 Jan 2026 12:10:24 +0000
Date: Mon, 26 Jan 2026 04:10:18 -0800
From: Breno Leitao <leitao@debian.org>
To: Andre Carvalho <asantostc@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] netconsole: selftests: Move netconsole
 selftests to separate target
Message-ID: <aXdYwphLx2O-Hxis@gmail.com>
References: <20260124-netcons-selftest-target-v1-1-d3937f44c4c2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-netcons-selftest-target-v1-1-d3937f44c4c2@gmail.com>
X-Debian-User: leitao

Hello Andre,

On Sat, Jan 24, 2026 at 06:51:42PM +0000, Andre Carvalho wrote:
> This patch moves netconsole selftests from drivers/net to its own target
> in drivers/net/netconsole.
> 
> This change helps saving some resources from CI since tests in
> drivers/net automatically run against real hardware which are not used
> by netconsole tests as they rely solely on netdevsim.
> 
> lib_netcons.sh is kept under drivers/net/lib since it is also used by
> bonding selftests. Finally, drivers/net config remains unchanged as
> netpoll_basic.py requires netconsole (and does leverage real HW testing).
> 
> Signed-off-by: Andre Carvalho <asantostc@gmail.com>

Thanks for the patch. Looking at NIPA, it seems none of the netconsole
test run?

https://netdev.bots.linux.dev/contest.html?pw-n=0&branch=net-next-2026-01-25--06-00
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92768bceb929..d92927ce87cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18016,7 +18016,7 @@ S:	Maintained
>  F:	Documentation/networking/netconsole.rst
>  F:	drivers/net/netconsole.c
>  F:	tools/testing/selftests/drivers/net/lib/sh/lib_netcons.sh
> -F:	tools/testing/selftests/drivers/net/netcons\*
> +F:	tools/testing/selftests/drivers/net/netconsole/*

I don't think you need * here. The following might be enough.

	F:   tools/testing/selftests/drivers/net/netconsole/

> --- a/tools/testing/selftests/drivers/net/Makefile
> +++ b/tools/testing/selftests/drivers/net/Makefile
> @@ -15,13 +15,6 @@ TEST_PROGS := \
>  	hds.py \
>  	napi_id.py \
>  	napi_threaded.py \
> -	netcons_basic.sh \
> -	netcons_cmdline.sh \
> -	netcons_fragmented_msg.sh \
> -	netcons_overflow.sh \
> -	netcons_resume.sh \
> -	netcons_sysdata.sh \
> -	netcons_torture.sh \
>  	netpoll_basic.py \

That is right, I don't think we want to move netpoll_basic.py, which
is uses netconsole to test netpoll, and we want to run it against real
hardware.

Thanks
--breno
