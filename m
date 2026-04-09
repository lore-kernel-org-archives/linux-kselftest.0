Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D493CAE6C;
	Thu,  9 Apr 2026 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738532; cv=none; b=dTOhv/BGSlGzakxa3uhBw+PITyiGy6WWY1e5rU1Edz+VdoT5D9Nrfp216Sq/3ib2Oy2M+rouTAEhTrmrHuoGS6kPYJB2cFpXaAUbfQRdBrvx3voo43pYqOoGssvB8moApEitM64YTqxLdPFwQJ9t3uwKs3THPwcNj9gRsPO4DB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738532; c=relaxed/simple;
	bh=xnDepoYTxvRiogO1ADsVRmIinVDcmworTrvUdlFnPNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrSDMLkCOy0g8pdTsc6CdszdUBepPfuq/uUTOJ2+9OMy15DSvSdmLoxuYenr3wuWpGBWCoSvvzATcGjzp0RgzFf9Sgfy0N4ydoF/uCv1FnSouJHgAkfYG5o0TZ4x2Wy4ZJB1XKeY9GeAuicPt82pCrpfAnXJc6MDTEHL+eJjOVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Dh9Npjqv; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Dh9Npjqv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AAaBFGub3bRoCO4XKF0ZLRIwiuhjsNw+rpCrrQQmH6I=; b=Dh9Npjqv9Yv/woc+IxwtxY0hn7
	IDikFYVB+CRonRL5TLVPkhcrn2bdz01XjMBsa7qvP0a0AGT1KDj/K0y/drj9lyWGuqjpa3CK6X5DT
	M6ZZD1Zxvt6tajc/WcUsfDfjlWWC0XUAvVYpAjSIOnj1rIvFUbl1uPhGFyJr4aYcjW5DlhawQePrP
	TyksT+8OLz6EHMcqn/Tj/G3bwkwdY5OhI0fVt7cnZT9NHxqAngt6zGVCgWt+R2hXIM2JB2i+I46UU
	ipjwp3Z69QnMQwRbiVCkWuidjGf/Gw2tEh6yTXn3vmD+gGmOPTBaGYqqdP5cqYqA5qayTc0hp0/x3
	rXHzVR/Q==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wAohv-009Cnv-2L;
	Thu, 09 Apr 2026 12:42:04 +0000
Date: Thu, 9 Apr 2026 05:41:59 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	petrm@nvidia.com, willemb@google.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: py: add test case filtering and
 listing
Message-ID: <adedNCKW0WE_FqZK@gmail.com>
References: <20260407151715.3800579-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407151715.3800579-1-kuba@kernel.org>
X-Debian-User: leitao

On Tue, Apr 07, 2026 at 08:17:15AM -0700, Jakub Kicinski wrote:
> When developing new test cases and reproducing failures in
> existing ones we currently have to run the entire test which
> can take minutes to finish.
>
> Add command line options for test selection, modeled after
> kselftest_harness.h:
>
>   -l       list tests (all or filtered)

<snip>

> +                print(f"Usage: {sys.argv[0]} [-h|-l] [-t|-T name]\n"
> +                      f"\t-h       print help\n"
> +                      f"\t-l       list all tests\n"

I initially expected the help text to mention "(all or filtered)" based
on the commit message, but since this option lists all tests
unconditionally, the current wording is correct.

Reviewed-by: Breno Leitao <leitao@debian.org>
