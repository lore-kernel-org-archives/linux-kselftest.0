Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDDA396B9D
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799753; cv=none; b=Gbe30wd5pgRTp3iBfsEsSMlAa3kwkRZ5dcGQmLOjIpx8Iv0I9U3S5RL7iFLZ0am7rPpgoyeNBVmMBwLtGG/xCtqg2twxZNS8bwn/Z+WQEm+IVfKyxIUd1aXyMp62RQlLAhsOlzJ71bI7EINyQ08aPtSpPt7Iu9+6niwGyPJRd4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799753; c=relaxed/simple;
	bh=j/764L48Xx+7Zu6cS0Hd0T/spRfk3/nWHgaW8v7Xkv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpAfA2dg4wJYabpGrMgApaemyuuKOxGhaHfJueh4HpvOq2a/PsTHZPIzuQJ3EQAFLYIEicJiPRYHAX8oOliO5FOYP5N9CcdPtq6FeUvpv/LYhOgFxAigfxxwcSYPOSF0UFg6iadDTVY1wgRZaNksn77uncrS8NdFVRIxATSD8yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=Vz1PiQbn; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="Vz1PiQbn"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2be26842fd5so1707319eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1772799745; x=1773404545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBRlKfOOjwlbHnXlngH96DL1JB+TDBbvPTEmG+WuzGA=;
        b=Vz1PiQbnvraLQQLr+JNTThMPce2UvP3/bHOO0NnnqOfuCkdX/d+7ik3D1IRSuvM1bf
         8sK2zTc+viLEw2A1R6X+fuCBLp/uWaQ9nVkpkNOZWRXaRfuhe2RTtxqNGguDyVksItN9
         iFqOrbTXnh0zVXpkM6CtPL6CQCNIWxsEly/C5gLZQ3VIpn14UW3hPEuUje0XcBq80d69
         GwAFKVfGuaDZGe1yz0MYFKu0EXMAefwuxB+LH7kOQM4H9gRKB7uT9dzUX5QiAfazaEpd
         MFSvGXZy2AHxknKHLAzFS+Jmrn5THTQNjVhEL9i6DAs//I0OOd6Ua4jf1s9FOainvaE+
         vUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799745; x=1773404545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBRlKfOOjwlbHnXlngH96DL1JB+TDBbvPTEmG+WuzGA=;
        b=fr01bY5M1koMZv4N74caRVaFwupuJCwEUZn9M2bdW0PZUxnKG7U03QVdjhh7MV9IuH
         cijTKw29yKiNZUyAgvz/fGNHuJWjk7Ln9bTyvhzlx3alCeP29B+8QidK9+V8P5jCD+aS
         r3RKO70waXwzR/+rJiIXI249nus0cBxfHJvZSzz/i/OGnPWadB7PqyE+REfja7XSzFsu
         fDWRawvf5F78/g2epgW8mhj/HEYm3ZqW5yn2awkeSl8Cyj0KVFgHcd3nk6nvSHfFZTVS
         OkOh7JfURtzlARBb1g8ALovqYz8v5hB9+S+0SRBZSszI1l8XZiPf3wvVRa6Lv663IQwZ
         YXBg==
X-Forwarded-Encrypted: i=1; AJvYcCW14j0MxXx63y5WN8+utmYOD/6D9JXZm/AWrXroWLamFUe7YfSCOEJPSFDerZqqK8S858seSfMkgLeNPF8Orv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjrd1XS23CFmm2JUK7eN4RRx5ccy69AuX5/9+5jfAQlwLXvkQr
	73nehDTYJ04VH79A8CJicdWem2jSqNfftdm7hn5tYNLgwV7sbFzgnCbUnj6VIBxaca8=
X-Gm-Gg: ATEYQzxd7zQlEdu+YOtNPEF/4FEo2luUmidCJV+VfujLO45a8wUfjySKxuAsB4Mm9I0
	H80m2ghHKNrRshcgzob5Al6nEwD6XaM6WWVsp3PcUa5f4b24eGGujt5p1epW/s3iKmKIbQs3mb7
	mxea3CTLyNoLFzY57msgiRKjZx+g9UuSdEfcJL2cukuLYd/IhMLbFzAtG9N5d3NW3VYylbb6v3R
	2co3eSe1iMstPc4tvy5P6d4MJESNNj3hEiGI8+kzqkA2m/+evXuFda8hpjNo7cRA+WVBaQqy8Hl
	aEBS18vEGq2pZf8cchOe0nR41nWH8dvANFrM0HmQtRftRZDmrs+wCaN+E+M/v8nTd8k0hEssFux
	soA15dT+pbrvu9N/2RGaQoKZVXwi9LHycdIvZJvSXqi8J1kvlgBX93Ut0pioDeLa3pmh0/qnsRV
	wNEVJpXM/RiZBOyZvHgDDx
X-Received: by 2002:a05:7300:434b:b0:2be:13e1:d2c4 with SMTP id 5a478bee46e88-2be3e62e8c4mr2125798eec.12.1772799745038;
        Fri, 06 Mar 2026 04:22:25 -0800 (PST)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f807a30sm1015873eec.6.2026.03.06.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:23 -0800 (PST)
Date: Fri, 6 Mar 2026 14:22:19 +0200
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, netdev@vger.kernel.org,
	jiayuan.chen@shopee.com,
	syzbot+80e046b8da2820b6ba73@syzkaller.appspotmail.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jussi Maki <joamaki@gmail.com>, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net v4 1/2] bonding: fix null-ptr-deref in
 bond_rr_gen_slave_id()
Message-ID: <aarG-99qsXKgPMws@penguin>
References: <20260304074301.35482-1-jiayuan.chen@linux.dev>
 <20260304074301.35482-2-jiayuan.chen@linux.dev>
 <aahWymAi_CtRG0gJ@penguin>
 <1293120.1772645248@famine>
 <aahsuPt7cY8LxETN@penguin>
 <1356528.1772744631@famine>
 <e08dcb78a13fc69be07d28d032cebe3734797a3a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e08dcb78a13fc69be07d28d032cebe3734797a3a@linux.dev>

On Fri, Mar 06, 2026 at 02:42:05AM +0000, Jiayuan Chen wrote:
> 2026/3/6 05:03, "Jay Vosburgh" <jv@jvosburgh.net mailto:jv@jvosburgh.net?to=%22Jay%20Vosburgh%22%20%3Cjv%40jvosburgh.net%3E > wrote:
> 
> 
> > 
> > Nikolay Aleksandrov <razor@blackwall.org> wrote:
> > 
> > > 
> > > On Wed, Mar 04, 2026 at 09:27:28AM -0800, Jay Vosburgh wrote:
> > > 
> > > > 
> > > > Nikolay Aleksandrov <razor@blackwall.org> wrote:
> > > >  
> > > >  >On Wed, Mar 04, 2026 at 03:42:57PM +0800, Jiayuan Chen wrote:
> > > >  >> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> > > >  >> 
> > > >  >> bond_rr_gen_slave_id() dereferences bond->rr_tx_counter without a NULL
> > > >  >> check. rr_tx_counter is a per-CPU counter only allocated in bond_open()
> > > >  >> when the bond mode is round-robin. If the bond device was never brought
> > > >  >> up, rr_tx_counter remains NULL, causing a null-ptr-deref.
> > > >  >> 
> > > >  >> The XDP redirect path can reach this code even when the bond is not up:
> > > >  >> bpf_master_redirect_enabled_key is a global static key, so when any bond
> > > >  >> device has native XDP attached, the XDP_TX -> xdp_master_redirect()
> > > >  >> interception is enabled for all bond slaves system-wide. This allows the
> > > >  >> path xdp_master_redirect() -> bond_xdp_get_xmit_slave() ->
> > > >  >> bond_xdp_xmit_roundrobin_slave_get() -> bond_rr_gen_slave_id() to be
> > > >  >> reached on a bond that was never opened.
> > > >  >> 
> > > >  >> Fix this by allocating rr_tx_counter unconditionally in bond_init()
> > > >  >> (ndo_init), which is called by register_netdevice() and covers both
> > > >  >> device creation paths (bond_create() and bond_newlink()). This also
> > > >  >> handles the case where bond mode is changed to round-robin after device
> > > >  >> creation. The conditional allocation in bond_open() is removed. Since
> > > >  >> bond_destructor() already unconditionally calls
> > > >  >> free_percpu(bond->rr_tx_counter), the lifecycle is clean: allocate at
> > > >  >> ndo_init, free at destructor.
> > > >  >> 
> > > >  >> Note: rr_tx_counter is only used by round-robin mode, so this
> > > >  >> deliberately allocates a per-cpu u32 that goes unused for other modes.
> > > >  >> Conditional allocation (e.g., in bond_option_mode_set) was considered
> > > >  >> but rejected: the XDP path can race with mode changes on a downed bond,
> > > >  >> and adding memory barriers to the XDP hot path is not justified for
> > > >  >> saving 4 bytes per CPU.
> > > >  >> 
> > > >  >> Fixes: 879af96ffd72 ("net, core: Add support for XDP redirection to slave device")
> > > >  >> Reported-by: syzbot+80e046b8da2820b6ba73@syzkaller.appspotmail.com
> > > >  >> Closes: https://lore.kernel.org/all/698f84c6.a70a0220.2c38d7.00cc.GAE@google.com/T/
> > > >  >> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>
> > > >  >> ---
> > > >  >> drivers/net/bonding/bond_main.c | 19 +++++++++++++------
> > > >  >> 1 file changed, 13 insertions(+), 6 deletions(-)
> > > >  >> 
> > > >  >
> > > >  >IMO it's not worth it to waste memory in all modes, for an unpopular mode.
> > > >  >I think it'd be better to add a null check in bond_rr_gen_slave_id(),
> > > >  >READ/WRITE_ONCE() should be enough since it is allocated only once, and
> > > >  >freed when the xmit code cannot be reachable anymore (otherwise we'd have
> > > >  >more bugs now). The branch will be successfully predicted practically always,
> > > >  >and you can also mark the ptr being null as unlikely. That way only RR takes
> > > >  >a very minimal hit, if any.
> > > >  
> > > >  Is what you're suggesting different from Jiayuan's proposal[0],
> > > >  in the sense of needing barriers in the XDP hot path to insure ordering?
> > > >  
> > > >  If I understand correctly, your suggestion is something like
> > > >  (totally untested):
> > > > 
> > > Basically yes, that is what I'm proposing + an unlikely() around that
> > > null check since it is really unlikely and will be always predicted
> > > correctly, this way it's only for RR mode.
> > > 
> >  Jiayuan,
> > 
> >  Do you agree that the patch below (including Nikolay's
> > suggestion to add "unlikely") resolves the original issue without memory
> > waste, and without introducing performance issues (barriers) into the
> > XDP path?
> 
> 
> Sure, it's basically similar to what my v1 did, but the patch below can be more generic.
> 
> https://lore.kernel.org/netdev/20260224112545.37888-1-jiayuan.chen@linux.dev/T/#m08e3e53a8aa8d837ddc9242f4b14f2651a2b00aa
> 

IMO that is worse, you'll add 2 new tests and potentially 1 more cache line
for everyone in a hot path that is used a lot and must be kept as fast as possible.

> >  -J
> > 
> > > 
> > > > 
> > > > diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> > > >  index eb27cacc26d7..ac2a4fc0aad0 100644
> > > >  --- a/drivers/net/bonding/bond_main.c
> > > >  +++ b/drivers/net/bonding/bond_main.c
> > > >  @@ -4273,13 +4273,17 @@ void bond_work_cancel_all(struct bonding *bond)
> > > >  static int bond_open(struct net_device *bond_dev)
> > > >  {
> > > >  struct bonding *bond = netdev_priv(bond_dev);
> > > >  + u32 __percpu *rr_tx_tmp;
> > > >  struct list_head *iter;
> > > >  struct slave *slave;
> > > >  
> > > >  - if (BOND_MODE(bond) == BOND_MODE_ROUNDROBIN && !bond->rr_tx_counter) {
> > > >  - bond->rr_tx_counter = alloc_percpu(u32);
> > > >  - if (!bond->rr_tx_counter)
> > > >  + if (BOND_MODE(bond) == BOND_MODE_ROUNDROBIN &&
> > > >  + !READ_ONCE(bond->rr_tx_counter)) {
> > > >  + rr_tx_tmp = alloc_percpu(u32);
> > > >  + if (!rr_tx_tmp)
> > > >  return -ENOMEM;
> > > >  + WRITE_ONCE(bond->rr_tx_counter, rr_tx_tmp);
> > > >  +
> > > >  }
> > > >  
> > > >  /* reset slave->backup and slave->inactive */
> > > >  @@ -4866,6 +4870,9 @@ static u32 bond_rr_gen_slave_id(struct bonding *bond)
> > > >  struct reciprocal_value reciprocal_packets_per_slave;
> > > >  int packets_per_slave = bond->params.packets_per_slave;
> > > >  
> > > >  + if (!READ_ONCE(bond->rr_tx_counter))
> > > >  + packets_per_slave = 0;
> > > >  +
> > > >  switch (packets_per_slave) {
> > > >  case 0:
> > > >  slave_id = get_random_u32();
> > > >  
> > > >  -J
> > > >  
> > > >  
> > > >  [0] https://lore.kernel.org/netdev/e4a2a652784ec206728eb3a929a9892238c61f06@linux.dev/
> > > >
> > > 
> > ---
> >  -Jay Vosburgh, jv@jvosburgh.net
> >
