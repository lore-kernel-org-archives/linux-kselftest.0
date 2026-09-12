Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB033EAF3;
	Sat, 12 Sep 2026 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789238439; cv=none; b=JqQ/FfjC1jdEu+HCi6Mgxe3PWERs2rTtdTFNbBI5abwHg7KM4utqywe1DrnhY/Tu0wI6A628SLdfjpREurXPeEbF1nXXAlyZmeJoTFDR/0s1US71IhBy7J8UrImg2atMDfWE++H/103epZVRKPb5oNm2C3u6kw+NIn8xrKHmihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789238439; c=relaxed/simple;
	bh=feGQjLsjp9QR+P8XbdIRYHpjRLB04VfdxUjH1AfHsW4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hODKoJ6ca8AO1e/7O7VuO5+D8VYiD9mGSE0+ivzAxafzZY+MLRh6t8K8tHlPc22PKVe4IKU1BV6zK31Q6EflwzIPCKphpSW0OFol1lAdmtSfuORkoy2+T6ZCGugXa6Nt9Qm2Xq3NOztUGIAtphriS4ABgQhrSxZlzmFq6skAeCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6I9qaVI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6I9qaVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE981F000FF;
	Sat, 12 Sep 2026 18:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789238427;
	bh=PyVUkoEzTYYgdYhMfWVlTxZE00BQsQtl3tpKIEMb6KE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=G6I9qaVIIxavxCzZxKS0RHdqQrO8/fIaUP+iZZX2t5yMP8yGfj1MWcpJst/PnmrTU
	 fhNFy1wThxie3BEqI/zw0YH1eeUp6q3mhTD3Pj8X+AqbfcvRER6qRmdh2rdYQEei3L
	 17kJcMTrDm+rc/vEiWhRvFRKwP4g62NvellUivh49ClI7FIY+gZ93RmVmN9izMn9DT
	 exMHaEIcwTIeB0MgFv/phK8ZE/5txFGs4BM3iEdybKFQBPWD+BOOl6C7ryWvauoEI2
	 xDbLNkmAJw67BiueH8q8AiWMU6ZEc6lRs66CSsP5J+Od390zaUJP12zqq0hhTxJJMV
	 Cvx/lgmn91yNA==
Date: Sat, 12 Sep 2026 11:40:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: netdev@vger.kernel.org, daniel.zahka@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 shuah@kernel.org, horms@kernel.org, willemb@google.com, petrm@nvidia.com,
 anubhavsinggh@google.com, richardbgobert@gmail.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] selftests: drv-net: add BIG TCP test cases
Message-ID: <20260912114026.6a39fb91@kernel.org>
In-Reply-To: <aqWYNpcPRjTAoDok@gmail.com>
References: <20260912050327.20616-1-narcisav.kernel@gmail.com>
	<20260912093226.529ff414@kernel.org>
	<aqWYNpcPRjTAoDok@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Sep 2026 11:21:42 -0700 Narcisa Vasile wrote:
> On Sat, Sep 12, 2026 at 09:32:26AM -0700, Jakub Kicinski wrote:
> > On Fri, 11 Sep 2026 22:03:27 -0700 Narcisa Vasile wrote:  
> > > Add four new test cases that validate coalescing
> > > under increased size limits (BIG TCP):
> > > 
> > > big_tcp_data_same
> > >   - validates that equal-sized segments coalesce past
> > >    the legacy IP_MAXPACKET limit.
> > > big_tcp_data_lrg_sml
> > >   - validates that a smaller final segment coalesces into the
> > >     previous chain of large-sized segments while crossing the
> > >     IP_MAXPACKET limit.
> > > big_tcp_tcp_seq
> > >   - validates that a packet with a wrong sequence number doesn't
> > >     coalesce. The test uses a sequence number for which the low 16 bits
> > >     correspond to the correct sequence number to validate against
> > >     truncation bugs, since total aggregate length crosses over the
> > >     legacy size limit for BIG TCP.
> > > big_tcp_large_max
> > >   - validates that coalescing stops at the configured BIG TCP limit.  
> >  
> > Still failing:
> > 
> > https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-drv-dbg/results/819882/3-gro-sw-py/stdout
> > 
> > https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-drv-dbg/results/819882/3-gro-sw-py-retry/stdout
> > 
> > Grep gro_lib.py for KSFT_MACHINE_SLOW  
> 
> Are you suggesting to just skip the big tcp test cases on slow machines?
> That's the current behavior for the large_* existing tests.

Yup!

> > Then the 15x increase is probably unnecessary/too high as well, since
> > we GRO 64k 128k shouldn't need more than 2x ?  
> 
> If I skip them in slow envs, then yes, 2x should be enough.
> Those pre-existing up-to-64K large tests don't pass either in the run
> above. They're skipped, so we don't actually know the proper
> timeout value for them in this test envirnoment. From the test run above:
> 
> # #           Received {40560 [!=65495]24935 [!=599]599 [!=0]}, Total 3 packets.
> # #           /srv/vmksft/testing/wt-18/tools/testing/selftests/net/lib/gro: incorrect number of packets
> # # Ignoring ipv4/large_max failure due to slow environment

Exactly, that's what made me remember the MACHINE_SLOW hack :S

> Instead of skipping them, I was thinking to change the approach and
> send packets continuously, enough for more than just one aggregate.
> The the test would verify that at least one aggregate passed the 64K boundary.
> I'd also keep the increased timeout. What do you think?

Probably not worth it? The SLOW machines testing is primarily
aimed at catching debug asserts/WARNINGS/kasan issues etc.
Here we are trying to test the receiver behavior but the SLOW
machine is slowing down the sender. We could try to optimize
the sender somehow but it will probably add complexity to the
test and catch no additional bugs?
