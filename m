Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7D1C84A6;
	Thu, 19 Mar 2026 01:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773883533; cv=none; b=kdOM5WLbZfx2E9UVSdxkDI3MmkglEUYDILaNZSGvoD0JKygfmf8tazcl62fQ/zkaxayMJ8eKifC/gVGBmQSd0NeWHMPHDaUQExbUzmnrgnS8eXzmDRJfDnj5UlVYdIRLuUI4uqZKgGekBE3MhPToljPIYD7Mh3R+Hy2tWQIjMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773883533; c=relaxed/simple;
	bh=p12nku/LYCjTC5niFkrQGpAeCi+46klPr+3XLdRv/fk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7DnsH7X1jUcFzhhXcVwOp/70tpcfIoUSz7y2Zyckz5cvCp9aQp9a0ddslHzuQHiGqgx2f2qpQFjLQGAiVtMbd2SgLMjz3HX4rO6i7714sDSJG6iuZtojnU1VmHlRTexiYR8XiSbzRW7BJtR0vBIRfy1gsEB8zCB/O5f05pDdgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRDINDio; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRDINDio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB58C19421;
	Thu, 19 Mar 2026 01:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773883533;
	bh=p12nku/LYCjTC5niFkrQGpAeCi+46klPr+3XLdRv/fk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oRDINDioKO55UkLxu9w3M3+p80tGi4AgWcufCDBZlX2TomYaoC4mrJFQ0J1TJS8Nb
	 NOHabxIB88BxD4QCLPNNbwQp4EJCi2F1ICpdcfWOYIa3fbIunkfjN5sAb3c5B7wbKc
	 LiFk/k+8vrY53shygWissZhDyjLneO4VdSWMhDCV6YWCkINwjSGfNqcGL1rlN3w/hh
	 DXtdCmTisw9cT8nBvaEsl4ie5cjX7BhgeYojkh36BnaE22wRECYe0SG847wQoikI6z
	 bSUWo7SmyCw6+KimZGk20Vj+ipLnAciB0jXMSmMbDE31UsEDxDOz5xDMIfzPs12NV3
	 +xqWWdBlOgMnQ==
Date: Wed, 18 Mar 2026 18:25:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Pin-yen Lin <treapking@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Taehee Yoo
 <ap420073@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, Willem de Bruijn
 <willemb@google.com>
Subject: Re: [PATCH net] selftests: drv-net: ping: Wait for carrier after
 toggling offloads
Message-ID: <20260318182531.2e8bf837@kernel.org>
In-Reply-To: <CAHwYsirHq7PRWg-jeGz=+Yrn2Td=o3vBSXrjfPos57V0VQL6gA@mail.gmail.com>
References: <20260318010325.2003395-1-treapking@google.com>
	<20260318172802.46c1fef1@kernel.org>
	<CAHwYsirHq7PRWg-jeGz=+Yrn2Td=o3vBSXrjfPos57V0VQL6gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Mar 2026 17:51:11 -0700 Pin-yen Lin wrote:
> > On Tue, 17 Mar 2026 18:01:17 -0700 Pin-yen Lin wrote:  
> > > Toggling checksum offload (or HW-GRO via feature dependencies) can cause
> > > certain physical interfaces to undergo a reset or a temporary link-down
> > > state. In the ping.py test, this leads to immediate test failures if the
> > > ping is attempted before the carrier is restored.
> > >
> > > This is observed when running the test with GVE driver when HW-GRO is
> > > enabled. When checksum offload is toggled, HW-GRO is toggled as well
> > > because of the feature dependency. This leads to an interface reset,
> > > causing the subsequent ping to fail.
> > >
> > > Add a sleep period after changing these features to allow the link to
> > > stabilize.  
> >
> > Sounds like the test found a legitimate problem. The configuration
> > should not return to user space until the operation has completed.
> > User should not have to sleep 10sec each time they touch NIC
> > configuration.  
> 
> To clarify, the configuration operation itself completes before
> returning to userspace. However, the short link-down during the
> configuration triggers asynchronous systemd events. These userspace
> operations affect the subsequent pings. Sorry for not making this
> clear in the commit message.

Can we somehow avoid / suppress this systemd behavior as part of
(your local) environment setup? Each environment will have some 
setups steps. We assume that DAD is disabled, IPv6 addresses are 
not flushed on ifdown, of course no firewalls.. 
