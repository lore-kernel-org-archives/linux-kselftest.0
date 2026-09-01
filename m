Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18A4CCDE4;
	Tue,  1 Sep 2026 22:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302782; cv=none; b=IQ4TjY5a84IQu2CAd7anxrCKbxJdYRLvOj+zx6+sudfrfStSHwjkC2ftq0CEys+No7oies3t7FGdKMiNArNEL7Z4AdgfGDYeWODUCOLfY0mAWb/Azm0hKOFT/bE58NrQZy//LI0RolvnfrBFWkOHKFPjeooPK0y8Pf/uZ6tnFxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302782; c=relaxed/simple;
	bh=o1YaUPzMUEWUrWnq64yGJLNH1Cvm2M0jaTT38EAUCrg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kg0eEhuL9MeZKiE1sPEpl9HDCjfXRb/JjsqOlaVFtGGnNwrJ8GyOq08Tmk2n6PF6V+wmqRJz4dgCQWYc6CGVTVdc9JYbuCKaDxiR8B9BtDxmQU4amYdYf4xdshLTvMoeuCgrms6T/h0sJKTv8jY/kXG1qLAiQds7ZytbjzRLjAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnSYA3tP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnSYA3tP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11711F000E9;
	Tue,  1 Sep 2026 22:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788302781;
	bh=wEL9yVRaCvLplrPadvlbrdLt9/pOGLB8ecyiEr7E9LA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bnSYA3tP/Xt0G8ICX1OhiONYGT38pcygiVv15vj6AouIQ/zzU927fpjb7B9QE/zCp
	 H02Lj0SSP1sq0+UlBNoWPswmQKCa9J3Tx95auM/me+5n9xTISJNbEB3jJ3swek5IfZ
	 immeU9FBny1+FHeOlH2TS1J7KxzrozIW3uBK+SJFsWVkvotbeUPmHBOcxig1hbymmP
	 Uan5cr5rHJyABZjmAS/rbYDkEEitCamYGkobFytj6H0FWXjfiG5dzHn4em+wun7A4n
	 fwdlFDy5UGA4Nl8keSkd3Bqf6zfL9UR71cPymWjyrulUIVjLh5nOppIwpgguphubmC
	 jzSN5rZ3DR2Mg==
Date: Tue, 1 Sep 2026 15:46:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Stanislav Fomichev
 <sdf@fomichev.me>
Subject: Re: [PATCH net-next 2/2] selftests: drv-net: Use cross-compilation
 environment for the io_uring check
Message-ID: <20260901154620.492ab980@kernel.org>
In-Reply-To: <20631f9a-1a2f-4ef5-a4c5-e1948e55dd78@bootlin.com>
References: <20260901164200.1124343-1-maxime.chevallier@bootlin.com>
	<20260901164200.1124343-3-maxime.chevallier@bootlin.com>
	<a42cdc44-efaf-44ff-9ace-f08e0c3b9856@kernel.org>
	<20631f9a-1a2f-4ef5-a4c5-e1948e55dd78@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Sep 2026 22:45:47 +0200 Maxime Chevallier wrote:
> Hi Matthieu,
> 
> On 9/1/26 19:24, Matthieu Baerts wrote:
> > Hi Maxime,  
> >> +# Set CC for the io_uring check
> >> +CC := $(CROSS_COMPILE)gcc  
> > 
> > Could we have something similar to
> > tools/testing/selftests/riscv/cfi/Makefile:
> > 
> >   # Set CC for the io_uring check done before including lib.mk
> >   ifeq ($(LLVM)$(CC),cc)
> >   CC := $(CROSS_COMPILE)gcc
> >   endif
> > 
> > WDYT?  
> 
> Ah this is better indeed IMO, I'll use that in V2 then, thanks for
> the tips.
> 
> Initially I considered doing a larger rework of extracting the logic
> in lib.mk that sets CC to the right value base on CROSS_COMPILE, LLVM
> and ARCH into a dedicated .mk file that we would include at the top,
> but at that time it seemed to be too big of a rework for just the
> io_uring check.
> 
> It lead to some headache about double-inclusions and relative paths lookups
> that far exceeded my Makefile skills :(
> 
> Thanks for the review,

I assume you don't actually have luring for your cross- env? Could we
keep it simple and just declare luring as unavailable when cross
compiling? Because the probing compilation rule is probably missing 
more flags to make cross compilation work.

Ignore if selftests using luring do actually work for you after this
patch..
