Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794549609;
	b=nw513kFxJZ5qXO2vpP4sQamMbmzUzxow9ZA9OaYQS5DO0Y4zp3kYrCzh+Vc1rMeyqsWF
	 ZPcU42mmFP3p3mKedLad51Ep+CI8O4cBEsVkRAdv2Ns9rafIL7qfBEiIr5zUK+AqYxL+F
	 yER81zkDdZZx18X0Q1Emf83rmOhxshniYZQv7nGVsyiJJSRiLQACk0e5KljX5xtGLK8db
	 nffYiiBTEVjyUDF1/BJckPMtYbLt0pAC5LsvEsh3jRbrpicikYDwjI+Zsk89++6oqbEbG
	 zjWXcbT38Hd62Kl8VASb3Tj5pxwYDmDQOS5qrv6HMLD4Uv/5r+Yz4Ot1N2iEH6jev8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549609;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EUL/aitfrfcM+1FPige7nV2S2I8JxJoAUHGZmHuZsgI=;
	b=RQyf3qwo4vM+yDGE68umAo2OwCYm4jo5RsGANcBGohKKCli4i85fBQjpQxQ0kuWjVv5b
	 8YXsiIui0wdlwBpIHuOagQBM1yF20f/a4oLyGvuSR9ru4GVws/EdCNoHioC1UlVdXRzof
	 NIgq0eH9NqUA6CkSPSoj5wPT7LwHVU3OYgXppiyC+zsG/j2XerEzORv0evS8XPvvITYP0
	 /2xBcflH5H/nptLUU7xHv9ak1Kv0Cwmk2YhWDvgD4Mb4ydZBCTtqi7iTRpDKJ6RUGAE53
	 kbge+W/w4bHOePuVThETxs5ukUjv88vcaZXNUKHz9F6pVyhHWs2YJqYUfekgG+4dw1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iO0RfYFP;
	arc=none smtp.remote-ip=91.218.175.14
Received: from mta0.migadu.com (out-14.mta0.migadu.com [91.218.175.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE467606A323
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 06:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE467606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iO0RfYFP
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1shkp6ga0nLVFcW3TwDYwwcGH+hW1PeCl5r+sJWDuUM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794549606; v=1; x=1795154406;
 b=iO0RfYFPG97y9HZmu9OO1xu1ajZ/BA/0EsxCmoC1yesK+6jn+JLZM/wR3xYz4/1Qvk9ToqGy
 PJ9u6VbkX18iA1f9EjYYfGtknyQTHmGDSShieuvo8lFGUgVH1Z0j4d+0c9YCSDhrYfE2ySalY7b
 T66PS43WiYbTCrNpam84iPsc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id ec24db99b47d8887;
	Fri, 13 Nov 2026 06:00:04 +0000
X-Mizu-Trace-ID: ec24db99b47d8887
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 13:59:50 +0800
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
Message-ID: <avanVkILHDYdpond@fedora>
References: <20261112014942.2946303-1-treapking@google.com>
 <avaewOJD7tX1UYfE@fedora>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avaewOJD7tX1UYfE@fedora>

On Fri, Nov 13, 2026 at 01:23:40PM +0800, Hangbin Liu wrote:
> Hi Pin-yen,
> On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> > The prio test intermittently fails in the arp_ip_target and
> > ns_ip6_target variants:
> > 
> >   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [FAIL]
> >   	Current active slave is eth0 but not eth2
> > 
> > The ARP/NS monitor marks a slave down when it has received nothing for
> > too long. With arp_interval 100 and the default arp_missed_max, that is
> > about 250ms for the active slave (eth1) and 350ms for a backup slave
> > (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the reply,
> > and eth0/eth2 receive a copy forwarded by the gateway bridge. Once eth1
> > is down, its probes reach no one and no slave receives anything, so
> > eth1 normally times out first and the new active slave is picked by
> > prio:
> > 
> >   t=0    probe: eth1 gets the reply, eth0/eth2 get a copy
> >   t=10   test sets eth1 down
> >   t=300  monitor: eth1 idle 300ms -> down
> >                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> > 
> > But the test takes eth1 down right after bond_check_connection(), whose
> > ping replies only arrive on eth1:
> > 
> >   t=0    probe: eth1 gets the reply, eth0/eth2 get a copy
> >   t=70   ping reply on eth1 only
> >   t=85   test sets eth1 down
> >   t=300  monitor: eth1 idle 230ms -> still up
> >   t=400  monitor: eth1 idle 330ms -> down
> >                   eth2 idle 400ms -> down too
> > 
> > eth2 can then no longer be picked. eth0 becomes the active slave if it
> > happened to receive some other packet (e.g. an MLD report), otherwise
> > whichever slave comes back first does. With primary_reselect 1 or 2,
> > the bond keeps eth0 even after eth2 comes back.
> > 
> > Before taking the active slave down, wait two monitor intervals
> > (200ms), so that at least one more probe is sent after the last ping
> > reply and all slaves last received that probe. The miimon variants do
> > not need the wait, but the extra delay is negligible.
> 
> I'm afraid the waiting time is too strict, especially with a debug kernel
> since delays can happen.
> 
> Bjoern is also fixing[1] this issue by pinging a non-existent neighbor to
> keep traffic flowing. Would you like to test whether that works for you?
> 
> [1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@amazon.de/

BTW, using ping may not able to triger the arp request in time. You can try
arping instead.

Thanks
Hangbin
