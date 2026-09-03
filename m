Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D124FB9AB;
	Thu,  3 Sep 2026 20:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788468952; cv=none; b=n/chPZZKmV7sobjStyvsV6WKw6XI/+MezDpKp1M7KqLrHagbC5t4BrzrO4WQmuxfXOaSDWll6w3UViA5oiGp25J7UoI2rY6N8k+fdqWB5TXlVbL0XcYCg/wvXfPeeOfDgyy7UV4qK8JX9OUmzcv0+6jwVHt4T6KZa15JQ5h5R7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788468952; c=relaxed/simple;
	bh=nsnykFvKA6CUZI2i8nncnaHOBieMMPVzB48Gysb4EHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNjW3rtJkoMTw9/o/H5WnE4G9hRU2uU1/4zJdxri0CHHTqDTrUXhHXK3keNu7Uabsj0LAlfB1i9nTBjLLOT7trn5vpQeH8gBbNC+r4UkKfNSQdSlvdGy0IWpV4dFYMf7Bqm7QVYx/YQQ30VZee89moCVq/VPOFN3RL5dKYXvar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=GRqjWyDz; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GRqjWyDz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yFC2ClBw+6w8pStYMKhcLz/+4KqvGk4cr7parGrLYjY=; b=GRqjWyDzlED49vGoXmYfWSKpFp
	VjqLPVXi7PH+nw4EMqHN2m3mCG9aKgU2REHUFmEESwWNy94KEcCWR79CNtsJL9OI1JCylyeoa9zbs
	PQbnAB8UTK2pFgVWVS5+A1YHyUfDqifbWITJOsacCo6Md0DGlX5F1qZ15q55wyiJLNyo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x2ET5-002ndm-Oa; Thu, 03 Sep 2026 22:55:31 +0200
Date: Thu, 3 Sep 2026 22:55:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "Maxime Chevallier (Netdev Foundation)" <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] selftests: drv-net: Allow
 cross-compiling the hardware tests
Message-ID: <24d07be4-79e9-4541-b97b-a6735baf5fed@lunn.ch>
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
 <c45453d8-72ae-450b-be9a-565df1cf0287@lunn.ch>
 <c3f649fa-24b6-41d3-b6a1-7f37edec87ff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3f649fa-24b6-41d3-b6a1-7f37edec87ff@kernel.org>

On Thu, Sep 03, 2026 at 07:25:22PM +0200, Matthieu Baerts wrote:
> Hi Andrew,
> 
> On 03/09/2026 19:11, Andrew Lunn wrote:
> >> Tested on an aarch64 target, built on x86_64.
> > 
> > Probably a question for Jakub or Matthieu.
> > 
> > As part of the CI system which is feeding into patchworks, I don't
> > think we build the selftests? Do we have the CPU resources to build
> > them?
> 
> We do: the "build_tools" script [1] checks that. And they are also built
> before launching the selftests.
> 
> > We currently do x86 64 and 32 bit builds. Do we have the CPU resources
> > to do an arm64 cross build?
> 
> I think we do, but I don't know if we need to (see below)
> 
> > I assume a cross build the self tests needs something like buildroot
> > to be sensible? Or Debians multi-arch stuff where you can install .deb
> > packages for libraries for other architectures? So maybe that is going
> > too far?
> 
> >From what I understood, the goal is to execute the selftests on embedded
> systems as well, which will require building new image including the
> kernel and the drivers/net selftests. Do we need to build the whole
> kernel for arm64? :)

I see a few different goals.

Picking a patch at random:

https://patchwork.kernel.org/project/netdevbpf/patch/20260903-netcons_ipv6-v4-2-bdd183c844d3@gmail.com/

We see 32bit, allmodconfig, clang, and clang_rust. These are all
native builds, which given are servers are AMD64, these are AMD64
builds.

However, many of the network drivers are used on ARM platforms. Most
probably do compile on AMD64, but i expect there are a few which
don't. So we could do an ARM64 cross compile, to make sure the patches
are clean on ARM64 as well as AMD64.

We are encouraging developers to write self tests. Ideally we want
self test patches to be held to the same standard as driver
patches. So if a patch touches the self tests, it would be good to
build the self tests in order to show the number of warnings & errors
has not gone up. I expect such a build will be native.

But if we have gone to the time/effort to cross compile the kernel,
can we also cross compile the self tests? Can we ensure with cross
compile self tests don't have more warnings/errors, because the self
test write has AMD64 blinkers on?

And sometime down the road, we would like to get ARM servers, with
NICs in them, to run the self tests on. At that point, we either need
to cross compile the kernel to run all the self tests, or we need
another build server which is ARM64, so it can do native ARM64 builds
of the kernel to run on the ARM64 runners.

     Andrew
