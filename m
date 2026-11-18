Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040136;
	b=XmXoE/YoXUBMkM1R7sJWxcSVlRNQ4cmmvm7zfNOcvEPgyO0oBHi82Z10LwPXq8SCqBNn
	 7vsux2dHdzCJMZA8rLfW2x+1jubheZJ0Sji6S5Llo6lvJW5EHgw491MGDcUKXUyA5YzKW
	 /Ze+e16yupfnBAugdnIGGPDN2UspKNvKm8Q4uYDkDoGGf6Gj8CT9yFGXd4B03dwf2/fLe
	 P14/mrQ6r9knm8hr6SEVLBKQNWysCFEWYk6fD3KYe5amXcb5BWsD2AjHMs0c8TC7pnqpG
	 kqifK65T1gZXJJwyp5bwKWBIspEFyL/Lg1ysXtWOqF2sF71I3RoWiWZnGagLqoz4s1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=e0puxu11uw6EkDOS3QsOBhNMDjZor1AmTioNsCPSIoU=;
	b=TnYoE3hq8kldi2d9Vd7AycVbNJTvvaqRr++Va9KLwPbrG+CoQZZj8eQtv022KhfcakaZ
	 rmGj8CkPys/LA+Ro43zAOEVDO/crzZ66QnH8URgqtvqMSh9z6BBRcCIEJ4Eev3aOqveRx
	 xwEJGa/HnPMSZjDs+NAluThOjCPNDnL2nTrsIh35jeSLNK6z4Z08RgEBuIKvCok9Ll6fW
	 1SbtHLrZeUmOL9wmeCO6Ip9Sj4LT1PcGpDxsqrSnCWaJfytsT8tAGvVoL4ue1P+vmcaOF
	 qeizVEaJ2e0qIVblpjbbmnD15tGkU+k5l7NxX4GwuzfI97p/mUNoeQzBPHEFFbPTcjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vmip2v4f;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E955606A31C;
	Wed, 18 Nov 2026 22:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E955606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vmip2v4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795040135; x=1826576135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kMuBiIFxltAIjikpl7vK3di7IS3jrzFLHdvUlAWFAtM=;
  b=Vmip2v4fPQX9tNZgylnvpJTnUAauRD6HYma/5elA2noIrSCnv4y9pVek
   nm6pSTPeTaCl55c+J56Sd0bkeOaSr4051P7ToZ02S0ObgDBoAmgsa5CyG
   +EV4Z08iPfPxHz+peUh4q/F2n4EYqKLNfewU5FM/3Pa/RbzC65cJF8jip
   5RIQpUhkxWfKJl6Pio7jQmB83IwEfLhzDSwQXK0RzGSXm90lUAxKKmSKg
   EsyqohmYdfNPvvvrDwmHgBos/2rwX2j/RM89dUMhEu4DbQq7u5LO1h65n
   Pi3jsGwj0fBaTOgAuV5yJ2pJwpzEMVZufzmmiT3m85yC5+teJNyuESL0s
   w==;
X-CSE-ConnectionGUID: AUf4m39jRtqEjbUFI6oqJg==
X-CSE-MsgGUID: Xq6IgimUTvSc4zoGeitcDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3919412"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3919412"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:15:33 -0800
X-CSE-ConnectionGUID: oVdWhmTXTcGBnFFPqzvCiQ==
X-CSE-MsgGUID: PORxCRw+TimmA918XZfGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10651745"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2026 14:15:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTnw6-00000001ETm-2tJG;
	Wed, 18 Nov 2026 22:15:26 +0000
Date: Thu, 19 Nov 2026 06:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org,
	kuba@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] netdevsim: add TLS device offload
 emulation
Message-ID: <202611190536.FTvmv1cW-lkp@intel.com>
References: <20261117140642.4008-2-jiayuan.chen@linux.dev>
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
In-Reply-To: <20261117140642.4008-2-jiayuan.chen@linux.dev>

Hi Jiayuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiayuan-Chen/netdevsim-add-TLS-device-offload-emulation/20261117-220630
base:   net-next/main
patch link:    https://lore.kernel.org/r/20261117140642.4008-2-jiayuan.chen%40linux.dev
patch subject: [PATCH net-next v2 1/2] netdevsim: add TLS device offload emulation
config: i386-buildonly-randconfig-1004-20261119 (https://download.01.org/0day-ci/archive/20261119/202611190536.FTvmv1cW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611190536.FTvmv1cW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611190536.FTvmv1cW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:103,
                    from drivers/net/netdevsim/tls.c:3:
   drivers/net/netdevsim/tls.c: In function 'nsim_tls_dev_add':
>> include/net/sock.h:404:37: error: 'struct sock_common' has no member named 'skc_v6_rcv_saddr'; did you mean 'skc_rcv_saddr'?
     404 | #define sk_v6_rcv_saddr __sk_common.skc_v6_rcv_saddr
         |                                     ^~~~~~~~~~~~~~~~
   drivers/net/netdevsim/tls.c:298:35: note: in expansion of macro 'sk_v6_rcv_saddr'
     298 |                 conn->laddr = sk->sk_v6_rcv_saddr;
         |                                   ^~~~~~~~~~~~~~~
>> include/net/sock.h:403:45: error: 'struct sock_common' has no member named 'skc_v6_daddr'; did you mean 'skc_daddr'?
     403 | #define sk_v6_daddr             __sk_common.skc_v6_daddr
         |                                             ^~~~~~~~~~~~
   drivers/net/netdevsim/tls.c:299:35: note: in expansion of macro 'sk_v6_daddr'
     299 |                 conn->raddr = sk->sk_v6_daddr;
         |                                   ^~~~~~~~~~~


vim +404 include/net/sock.h

4dc6dc7162c08b9 Eric Dumazet             2009-07-15  382  
68835aba4d9b74e Eric Dumazet             2010-11-30  383  #define sk_dontcopy_begin	__sk_common.skc_dontcopy_begin
68835aba4d9b74e Eric Dumazet             2010-11-30  384  #define sk_dontcopy_end		__sk_common.skc_dontcopy_end
4dc6dc7162c08b9 Eric Dumazet             2009-07-15  385  #define sk_hash			__sk_common.skc_hash
5080546682bae3d Eric Dumazet             2013-10-02  386  #define sk_portpair		__sk_common.skc_portpair
05dbc7b59481ca8 Eric Dumazet             2013-10-03  387  #define sk_num			__sk_common.skc_num
05dbc7b59481ca8 Eric Dumazet             2013-10-03  388  #define sk_dport		__sk_common.skc_dport
5080546682bae3d Eric Dumazet             2013-10-02  389  #define sk_addrpair		__sk_common.skc_addrpair
5080546682bae3d Eric Dumazet             2013-10-02  390  #define sk_daddr		__sk_common.skc_daddr
5080546682bae3d Eric Dumazet             2013-10-02  391  #define sk_rcv_saddr		__sk_common.skc_rcv_saddr
^1da177e4c3f415 Linus Torvalds           2005-04-16  392  #define sk_family		__sk_common.skc_family
^1da177e4c3f415 Linus Torvalds           2005-04-16  393  #define sk_state		__sk_common.skc_state
^1da177e4c3f415 Linus Torvalds           2005-04-16  394  #define sk_reuse		__sk_common.skc_reuse
055dc21a1d1d219 Tom Herbert              2013-01-22  395  #define sk_reuseport		__sk_common.skc_reuseport
9fe516ba3fb29b6 Eric Dumazet             2014-06-27  396  #define sk_ipv6only		__sk_common.skc_ipv6only
26abe14379f8e2f Eric W. Biederman        2015-05-08  397  #define sk_net_refcnt		__sk_common.skc_net_refcnt
7c268eaeec6388b Kuniyuki Iwashima        2025-10-14  398  #define sk_bypass_prot_mem	__sk_common.skc_bypass_prot_mem
^1da177e4c3f415 Linus Torvalds           2005-04-16  399  #define sk_bound_dev_if		__sk_common.skc_bound_dev_if
^1da177e4c3f415 Linus Torvalds           2005-04-16  400  #define sk_bind_node		__sk_common.skc_bind_node
8feaf0c0a5488b3 Arnaldo Carvalho de Melo 2005-08-09  401  #define sk_prot			__sk_common.skc_prot
07feaebfcc10cd3 Eric W. Biederman        2007-09-12  402  #define sk_net			__sk_common.skc_net
efe4208f47f907b Eric Dumazet             2013-10-03 @403  #define sk_v6_daddr		__sk_common.skc_v6_daddr
efe4208f47f907b Eric Dumazet             2013-10-03 @404  #define sk_v6_rcv_saddr	__sk_common.skc_v6_rcv_saddr
33cf7c90fe2f97a Eric Dumazet             2015-03-11  405  #define sk_cookie		__sk_common.skc_cookie
70da268b569d32a Eric Dumazet             2015-10-08  406  #define sk_incoming_cpu		__sk_common.skc_incoming_cpu
8e5eb54d303b7cb Eric Dumazet             2015-10-08  407  #define sk_flags		__sk_common.skc_flags
ed53d0ab761f5c7 Eric Dumazet             2015-10-08  408  #define sk_rxhash		__sk_common.skc_rxhash
efe4208f47f907b Eric Dumazet             2013-10-03  409  
5d4cc87414c5d11 Eric Dumazet             2024-02-16  410  	__cacheline_group_begin(sock_write_rx);
43f51df41729559 Eric Dumazet             2021-11-15  411  
9115e8cd2a0c6ea Eric Dumazet             2016-12-03  412  	atomic_t		sk_drops;
5d4cc87414c5d11 Eric Dumazet             2024-02-16  413  	__s32			sk_peek_off;
7d452516b67add4 Eric Dumazet             2025-09-29  414  	struct sk_buff_head	sk_error_queue;
b178bb3dfc30d95 Eric Dumazet             2010-11-16  415  	struct sk_buff_head	sk_receive_queue;
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  416  	/*
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  417  	 * The backlog queue is special, it is always used with
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  418  	 * the per-socket spinlock held and requires low latency
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  419  	 * access. Therefore we special case it's implementation.
b178bb3dfc30d95 Eric Dumazet             2010-11-16  420  	 * Note : rmem_alloc is in this structure to fill a hole
b178bb3dfc30d95 Eric Dumazet             2010-11-16  421  	 * on 64bit arches, not because its logically part of
b178bb3dfc30d95 Eric Dumazet             2010-11-16  422  	 * backlog.
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  423  	 */
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  424  	struct {
b178bb3dfc30d95 Eric Dumazet             2010-11-16  425  		atomic_t	rmem_alloc;
b178bb3dfc30d95 Eric Dumazet             2010-11-16  426  		int		len;
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  427  		struct sk_buff	*head;
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  428  		struct sk_buff	*tail;
fa438ccfdfd3f6d Eric Dumazet             2007-03-04  429  	} sk_backlog;
b178bb3dfc30d95 Eric Dumazet             2010-11-16  430  #define sk_rmem_alloc sk_backlog.rmem_alloc
2c8c56e15df3d4c Eric Dumazet             2014-11-11  431  
5d4cc87414c5d11 Eric Dumazet             2024-02-16  432  	__cacheline_group_end(sock_write_rx);
5d4cc87414c5d11 Eric Dumazet             2024-02-16  433  
5d4cc87414c5d11 Eric Dumazet             2024-02-16  434  	__cacheline_group_begin(sock_read_rx);
5d4cc87414c5d11 Eric Dumazet             2024-02-16  435  	/* early demux fields */
5d4cc87414c5d11 Eric Dumazet             2024-02-16  436  	struct dst_entry __rcu	*sk_rx_dst;
5d4cc87414c5d11 Eric Dumazet             2024-02-16  437  	int			sk_rx_dst_ifindex;
5d4cc87414c5d11 Eric Dumazet             2024-02-16  438  	u32			sk_rx_dst_cookie;
5d4cc87414c5d11 Eric Dumazet             2024-02-16  439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
