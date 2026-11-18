Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989768;
	b=PA/aXmCG1KWMN2+O/NjyocZk8KwZ2g96NYQdR326kOiyhayPJ55JQoJQqa9prK9/ihk5
	 BoOgZvCGJEw+xkZbHOQzs9EakJUWnXHyZBlgPo0Eh9UxqFY1Mm/b1jI25dsNn7sei2erA
	 Lesx8/k/1lQ/vnrDIPbdtQnPNPoROd8w8KcQFFqTXHJC8eUz4DgW8JjsQ3FSsEKBBcRcb
	 cbEYpEPOo6dJv6Fj5cO4sYmY0U+vvf56ePMJbTW1Md/TQVMxATHWCP92Xq92KOfcvnFi1
	 5vwuL3SZrfBpgZi1vBDT3PTjbmvyi9k1z6abY7cp8g7ev3wTOr25rPyIB0qIV5DTu4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989768;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=NYSvF3w4fJZaH+dCoDovCFBy1OSTg48d7tJNsIEBVo8=;
	b=f9QlNGwmBzhK/bbVkt2r14120PK0ulx4HtkkKGDOVpXHXrgcGsJ1nOaXe6mJSowxMip0
	 TyARo9up1OKik/beHoFlGn9XoJR+GgYbLLWypBzfa4KdtXILx4VadaWWtkL3QwXos4poy
	 bSOx+RLIV/n17Z3hI7zTXeTEeYGk8CHu9cgN+ZPk1YPpUG84a2lQU7PgS5Ob53PH/6vjh
	 GOZ0/pBI2ADykOX+nhh5d5nFAU2MmbWwk7P+GN0bJ4kLZ4vcCzVwCrROiNwm8jUbJvNDY
	 l0iAfuoMFuYOctRNiYmKXK4bknN3ZtAVUenKOPxqHACF1qQcPvyWpF/dhIzuqV7wezA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c06OloGD;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62460606A331;
	Wed, 18 Nov 2026 08:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62460606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c06OloGD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794989768; x=1826525768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZFy8lElfDcfVXCFI7XDvMs7NAlQEj6nfUntxpIvbV20=;
  b=c06OloGDvHnhr0jao3bMeskewyMGxsvACBb4iOPqiFdjQiCXYiDKC5/h
   pT+outmUo/dKMo3X5RtCsc/jzjWxDkgJ+O4FK1pbaVst2IRRI9r1i1Sgo
   HxKn/4pzHiWec52ts2lj38OUg0Dwnv65fI9/qiirpCyP4shHIm4jrFPs6
   tMves9GaaxAtFfY4ecoPMYr9qDmxa62G5ZxpwR9x2sc608CI+AkYq34WX
   RFgVn4VdocrdVIix02nCBkda9R4hYa3Hq5Z7FBpGPOiKo1Px9JAqIa1yq
   qisP39SdEip0kMhFRw2gAUJJ7NPb7IKAar7O+Rv/sDUmtUQKhqBQh5Cm/
   w==;
X-CSE-ConnectionGUID: MliC4XESSuiLDBfgEkteuw==
X-CSE-MsgGUID: kNy5jwxxTeGnnbDZAsCsTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3813907"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3813907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:16:08 -0800
X-CSE-ConnectionGUID: XZPja6g9QN2b6kHbI7v8+A==
X-CSE-MsgGUID: 6Fn4JIDyRpCOlLmivOUtoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10340996"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2026 00:16:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTapm-00000001DEU-1BVi;
	Wed, 18 Nov 2026 08:16:02 +0000
Date: Wed, 18 Nov 2026 16:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org,
	kuba@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] netdevsim: add TLS device offload
 emulation
Message-ID: <202611181558.YOFWJh8M-lkp@intel.com>
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
config: x86_64-randconfig-1004-20261118 (https://download.01.org/0day-ci/archive/20261118/202611181558.YOFWJh8M-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/202611181558.YOFWJh8M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611181558.YOFWJh8M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/netdevsim/tls.c:298:21: error: no member named 'skc_v6_rcv_saddr' in 'struct sock_common'
     298 |                 conn->laddr = sk->sk_v6_rcv_saddr;
         |                               ~~~~^~~~~~~~~~~~~~~
   include/net/sock.h:404:37: note: expanded from macro 'sk_v6_rcv_saddr'
     404 | #define sk_v6_rcv_saddr __sk_common.skc_v6_rcv_saddr
         |                                     ^
>> drivers/net/netdevsim/tls.c:299:21: error: no member named 'skc_v6_daddr' in 'struct sock_common'
     299 |                 conn->raddr = sk->sk_v6_daddr;
         |                               ~~~~^~~~~~~~~~~
   include/net/sock.h:403:34: note: expanded from macro 'sk_v6_daddr'
     403 | #define sk_v6_daddr             __sk_common.skc_v6_daddr
         |                                             ^
   2 errors generated.


vim +298 drivers/net/netdevsim/tls.c

   274	
   275	static int nsim_tls_dev_add(struct net_device *netdev, struct sock *sk,
   276				    enum tls_offload_ctx_dir direction,
   277				    struct tls_crypto_info *crypto_info,
   278				    u32 start_offload_tcp_sn)
   279	{
   280		struct netdevsim *ns = netdev_priv(netdev);
   281		struct nsim_tls_conn *conn;
   282		int ret = 0;
   283	
   284		/* Mirror the cipher support of a typical offload capable NIC. */
   285		switch (crypto_info->cipher_type) {
   286		case TLS_CIPHER_AES_GCM_128:
   287		case TLS_CIPHER_AES_GCM_256:
   288			break;
   289		default:
   290			return -EOPNOTSUPP;
   291		}
   292	
   293		conn = kzalloc_obj(*conn);
   294		if (!conn)
   295			return -ENOMEM;
   296	
   297		if (sk->sk_family == AF_INET6) {
 > 298			conn->laddr = sk->sk_v6_rcv_saddr;
 > 299			conn->raddr = sk->sk_v6_daddr;
   300		} else {
   301			ipv6_addr_set_v4mapped(sk->sk_rcv_saddr, &conn->laddr);
   302			ipv6_addr_set_v4mapped(sk->sk_daddr, &conn->raddr);
   303		}
   304		conn->family = sk->sk_family;
   305		conn->lport = htons(inet_sk(sk)->inet_num);
   306		conn->rport = sk->sk_dport;
   307		conn->dir = direction;
   308		conn->start_sn = start_offload_tcp_sn;
   309		conn->cipher_type = crypto_info->cipher_type;
   310		conn->tls_ctx = tls_get_ctx(sk);
   311	
   312		spin_lock_bh(&ns->tls.lock);
   313		if (ns->tls.count >= NSIM_TLS_MAX_CONN) {
   314			ret = -ENOSPC;
   315			goto out_unlock;
   316		}
   317		list_add_tail_rcu(&conn->list, &ns->tls.conns);
   318		WRITE_ONCE(ns->tls.count, ns->tls.count + 1);
   319		if (direction == TLS_OFFLOAD_CTX_DIR_TX)
   320			ns->tls.tx_conn++;
   321		else
   322			ns->tls.rx_conn++;
   323	out_unlock:
   324		spin_unlock_bh(&ns->tls.lock);
   325	
   326		if (ret)
   327			kfree(conn);
   328	
   329		return ret;
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
