Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE4128689B;
	Thu,  9 Apr 2026 14:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746720; cv=none; b=Ju+suNPLFHZWvgL+P6J0MrdBmnALqJRV5Xm5MbuhHA8kH1ZmaW1owU6o5xJrn2r1JoKDkm/SIuka5iJFN2f9QE1hGz+ob+TlJOo2K2uBr7IwHhpxx9VG+vYYrpwrkAHRCKNPbLb35RXTqUipRJlKVQBdx6yKImhfL3vJxuDxMVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746720; c=relaxed/simple;
	bh=AK9etkrPYUkxNOV17ogeCXfpR1zJLLoT1n4ny0SPeHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0VIXbrdOD1s6KH1d5nzdfWuC2RIXG1XtvAxxnzZy1N6UfGdJ/kp05KSpepG7YxmmVtsDv8C83KwmaGEwL9z8rWhm8CSgXWzpBe9NykGmTWSN2Hk5ESR0Z4J/qOrrJJshdFF3+8JR/lSvFrE7EY5utNW8ZgoqKiSK7RlaE/I7Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=iA7HW2ag; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="iA7HW2ag"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jCeoq9qeFmegdsWjvaoJBUZx97UVsqpZhnoO4YsAZJw=; b=iA7HW2agPwpWv9mrjU8hLCUFoZ
	5e/RaRibY/vymyH7ce5Pi45JZ3mjxPAzEUIhdReA3wLHME8YvF54exNgk38jCALWP634FlilYHq/c
	DX2UZqCv9y2Z3bOSmYOwKpzbKs2SLO1Da1uFKtMzHksKMH9buZ5Ef+DJzL8FMFLUA/HNoMo7R0FRj
	op+OgUW1P6V8gMduv6KEfiyKCX4CpLP1Y6pCtxjUxNX9zMwsB59CD+VQZxCQepbuD66C4rWJge2AD
	gMJQ7aXGGnMhFYqNHbGFCViuOZ9X1X70tShRaRRyQ98x7ih/bAFMhaKrqDx10rNcJdjfs71QVLhQp
	DoLY+nQQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wAqq1-009HNn-1d;
	Thu, 09 Apr 2026 14:58:33 +0000
Date: Thu, 9 Apr 2026 07:58:28 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, 
	petrm@nvidia.com, willemb@google.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: py: add test case filtering and
 listing
Message-ID: <ade-U4-qdM34w712@gmail.com>
References: <20260407151715.3800579-1-kuba@kernel.org>
 <adedNCKW0WE_FqZK@gmail.com>
 <20260409075617.0b22db0a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409075617.0b22db0a@kernel.org>
X-Debian-User: leitao

On Thu, Apr 09, 2026 at 07:56:17AM -0700, Jakub Kicinski wrote:
> On Thu, 9 Apr 2026 05:41:59 -0700 Breno Leitao wrote:
> > > +                print(f"Usage: {sys.argv[0]} [-h|-l] [-t|-T name]\n"
> > > +                      f"\t-h       print help\n"
> > > +                      f"\t-l       list all tests\n"  
> > 
> > I initially expected the help text to mention "(all or filtered)" based
> > on the commit message, but since this option lists all tests
> > unconditionally, the current wording is correct.
> 
> Ugh, good catch. Not sure how I lost this. It does display a filtered
> list. I wanted the filtering to take effect so that one can see what
> tests would have been executed with the filters without running them.
> Sort of like a --dry-run.
> 
> LMK if you have any thoughts on this, otherwise I'll rephrase as:
> 
> 	 f"\t-l       list tests (filtered, if filters were specified)\n" 

Ack, the above is fine.
