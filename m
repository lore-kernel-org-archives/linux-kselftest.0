Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900413;
	b=e4laReU6yat2XuaQuiujfIVZkz3MY/bPddaXzV3aXCqfUfkBkDHo+hl78UOl3Mi4UDav
	 3sekqCJpodYKQGfO10bJB7S85EGh7jpcGSk4XYPBO8xNzxQDaUg+m8IWhoHm6b2NoYmxt
	 UYtFTTIBKxJZp/xAjeRh7YcPSNEudTFjY1m1/Nuo96Gga61t2traoPz+NQeGFOFOHszdZ
	 PnSavUhgexm5qoyPuLcjwySvbWxRpwkSHT27IPQBfPcCYRvhEwUUAvY5Pilk09fKFR0p7
	 3lm1zKADCxdvmCkthtAl3n3XkpDIWxdcYOuqNFzJHhZmuUjhp4XHIBQKIBzsSKeqcAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900413;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MNmh1Reg5Czo+a3LVsCK+8As4ZT63TJjE//xLVoIjok=;
	b=c7UiDP1xVpA0jPtbFaH3uZb0/9uLXWz/csY9WdJaoeYwLKe2vxlBbaVEJcNEabdTg6hy
	 C9wxKWQj6UAZCxrpy53sWrD6FdjMHA3bbecre2gkZLbs+LOcppeShAxj1lYJorJTKqS+j
	 IyyI0a1gThf5HLIQWr1wQSvPPvnaDji+IziPM3tH7iNs7rFf5ndxZTUBbAR7iWI83oZwy
	 LVuh7NzmkGIqVWwyK9H0BbCPEdakUFFfsL6Ul9CIl6CCBz38C+ZixuALCz+HCbNQRZpMO
	 qAt1AAE9FkEId8ihRlN/iLWgyutWUcveynUV9E7pkQdSYOlkkLjJJD9kSi4xVYBvH7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P2BFPSWq;
	arc=none smtp.remote-ip=95.215.58.78
Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09D7606A32A
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 07:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09D7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=P2BFPSWq
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZHQ7vGXzig53gxhV15EJJjqr5AYYwWSgOJJV79sVoaQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794900410; v=1; x=1795505210;
 b=P2BFPSWq9Bsx/WL684prYR47sAoRAqgVjfLNXZoMZMvxxCgcZQ49YoewdGoXMM52aWHcTSa6
 IfGYAP4m9ieTqIWTMQ56iyp0ff1whYBeTKJ/cd12qibbIAS9pttFtym/Vpy823SFfsp5IlJUQPN
 AkmBawkdoFFzwnrgrFkLCCbE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 5c923570b0d44339;
	Tue, 17 Nov 2026 07:26:50 +0000
X-Mizu-Trace-ID: 5c923570b0d44339
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 15:26:37 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Pin-yen Lin <treapking@google.com>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Bjoern Doebel <doebel@amazon.de>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, Matthieu Baerts <matttbe@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Toppins <jon.toppins+linux@gmail.com>,
	linux-kselftest@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>
Subject: Re: [PATCH net] selftests: bonding: fix failover race in
 bond_options.sh prio test
Message-ID: <avwBrbJfp4ET9ifT@fedora>
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora>
 <avanVkILHDYdpond@fedora>
 <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHwYsio=qtCY10EPnh+qvWpdgtQUG5mw1b3WKMt9_Kytcc7h9A@mail.gmail.com>

Hi Pin-yen,
On Mon, Nov 16, 2026 at 05:30:28PM -0800, Pin-yen Lin wrote:
> Hi Hangbin,
> 
> On Thu, Nov 12, 2026 at 10:00 PM Hangbin Liu <hangbin.liu@linux.dev> wrote:
> >
> > On Fri, Nov 13, 2026 at 01:23:40PM +0800, Hangbin Liu wrote:
> > > Hi Pin-yen,
> > > On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> > > > The prio test intermittently fails in the arp_ip_target and
> > > > ns_ip6_target variants:
> > > >
> > > >   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [FAIL]
> > > >     Current active slave is eth0 but not eth2
> > > >
> > > > The ARP/NS monitor marks a slave down when it has received nothing for
> > > > too long. With arp_interval 100 and the default arp_missed_max, that is
> > > > about 250ms for the active slave (eth1) and 350ms for a backup slave
> > > > (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the reply,
> > > > and eth0/eth2 receive a copy forwarded by the gateway bridge. Once eth1
> > > > is down, its probes reach no one and no slave receives anything, so
> > > > eth1 normally times out first and the new active slave is picked by
> > > > prio:
> > > >
> > > >   t=0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > > >   t=10   test sets eth1 down
> > > >   t=300  monitor: eth1 idle 300ms -> down
> > > >                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> > > >
> > > > But the test takes eth1 down right after bond_check_connection(), whose
> > > > ping replies only arrive on eth1:
> > > >
> > > >   t=0    probe: eth1 gets the reply, eth0/eth2 get a copy
> > > >   t=70   ping reply on eth1 only
> > > >   t=85   test sets eth1 down
> > > >   t=300  monitor: eth1 idle 230ms -> still up
> > > >   t=400  monitor: eth1 idle 330ms -> down
> > > >                   eth2 idle 400ms -> down too
> > > >
> > > > eth2 can then no longer be picked. eth0 becomes the active slave if it
> > > > happened to receive some other packet (e.g. an MLD report), otherwise
> > > > whichever slave comes back first does. With primary_reselect 1 or 2,
> > > > the bond keeps eth0 even after eth2 comes back.
> > > >
> > > > Before taking the active slave down, wait two monitor intervals
> > > > (200ms), so that at least one more probe is sent after the last ping
> > > > reply and all slaves last received that probe. The miimon variants do
> > > > not need the wait, but the extra delay is negligible.
> > >
> > > I'm afraid the waiting time is too strict, especially with a debug kernel
> > > since delays can happen.
> > >
> > > Bjoern is also fixing[1] this issue by pinging a non-existent neighbor to
> > > keep traffic flowing. Would you like to test whether that works for you?
> > >
> > > [1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@amazon.de/
> >
> > BTW, using ping may not able to triger the arp request in time. You can try
> > arping instead.
> 
> Thanks for the pointer, but I believe Bjoern's patch addresses a
> different problem.

I think they are the same issue, as you comment also said

The ARP/NS monitor marks a slave down when it has received nothing for
too long.

> 
> Bjoern's patch keeps the traffic flowing so that idle slaves are kept
> alive between the test steps. This patch fixes the case where the ping
> replies from bond_check_connection() only arrive on the active slave
> right before it is set down. The active slave's failure is then
> detected one monitor interval late, when the backups have also timed
> out.

The reason is we set arp interval to 100ms, and slowwait also check every
100ms. If the backup slave down at the same check point, e.g.

  t=300  monitor: eth1 idle 230ms -> still up
  t=400  monitor: eth1 idle 330ms -> down
                  eth2 idle 400ms -> down too

The test failed.

> 
> The ARP requests triggered by Bjoern's ping are sent only about once
> per second, which isn't frequent enough for this failure. I tested
> Bjoern's patch and confirmed that it didn't fix the issue in our
> testing environment. We also can't simply use arping instead because
> iputils arping doesn't support sub-second intervals.
> 
> If you're worried that the 200ms sleep is too short, would increasing
> it to 0.5s or 1s work for you?

It's not about the sleep time before setting active slave down. I'm afraid
about the slowwait checking time. Even we sleep 1s, with arp interval 100,
we still only have 100ms checking window. Before the window, the active slave
is up, after the window, the backup slave also down. With a debug kernel, this
time is a little tight.

So, either we have some background arp traffic, or let's extend the arp
interval to a larger one.

What do you think?

Thanks
Hangbin
