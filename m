Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810071;
	b=3JQSEepa8PypGXHPTcGmhm24Iv5FmpjefYYjE4jN6yXho8IL8Cb0wbfz54d4b/HVZdTV
	 DO9UAbl2z98HU6W1H8e3RZmcLCegmgUgUjjffXrRKjCyxI656dXOWtWCzLPrcVJQQ69al
	 6YBBVkPwb1tpi5+wY19/mgq7mDkCJB+02VuZj5vJY8tCg9OdMFt9F8cDEN9/ZXGX5gTpB
	 bvHHDAvHY5ZnXPl4KmBod/CX8/cxBD89TSGa4hJntksoioDJ9A4KuUojn+dIU536NCEw0
	 AZWqelW+bRfgfffUUwWBY0+/2usK1Ca7bJAVmnMFIk9qnVdrdKMf4hGuLqY+Yl6sW9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LrWqePIA2dRTl7gYO+GfHcmbC6K7NaHxnw6+i+GpqQw=;
	b=EEMjpmRJoAifwQpfXe7ZgVcbnNLG+PMjRhsiFtKI6+73ax3MNAc7AU6vJS5s3MF+WEAS
	 iraoR9h1mEAGD8P1tYhjVXJH5xsD7oh/yFgU3KfN0QBunN9rQiP/eccM2gGly4om7BGi6
	 oCvAHeJdNrgEJpaws2HZykneyJA+VSk++//N3CrecYNDzu23r6GvdQL1BUrpNvwlVBnz3
	 NWy3aMvjzitqH0wpKMY9LXjlXI+phogCOJBBegjnSYhqZDg69bixbrmwM/XcCpDCk7E+J
	 /+iGJeQyoAOrt5Bzx+qPyqTg0kGinVWyC8O4xKNkqIDJ04O1f3Mc7inWfzh8Gt762tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UbqegxeK;
	arc=none smtp.remote-ip=91.218.175.93
Received: from mta0.migadu.com (out-93.mta0.migadu.com [91.218.175.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0276C606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 06:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0276C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UbqegxeK
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=82DVlU1A65d2Os+X64YwR4fF5H6GyPEMAPG89PFIji8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794810068; v=1; x=1795414868;
 b=UbqegxeK8YBLfncOs+okLzUNa3QCOA8D49D5hsiU8UMy4wE7u/Dp72h77j9+f3YaTlLZgf5d
 EFI4XfoszHwYSeIGePhhoBFrvdFBnkom9ilbiU/lBFG6TJB6wqrd/TnpjhNPTfdrf06dLQylIXw
 ZkOY5G5+irqxl+1K4LQ480Cc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 92b96a1db4b59b3b;
	Mon, 16 Nov 2026 06:21:07 +0000
X-Mizu-Trace-ID: 92b96a1db4b59b3b
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 14:20:57 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 3/5] selftests: seg6: move SRv6 End PSP setup
 into its own helper
Message-ID: <avqgyRcQkWLvpiA9@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-3-c9177bbbd965@kylinos.cn>
 <20261116052659.e8843a373807242737faeef0@uniroma2.it>
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
In-Reply-To: <20261116052659.e8843a373807242737faeef0@uniroma2.it>

Hi Andrea,
On Mon, Nov 16, 2026 at 05:26:59AM +0100, Andrea Mayer wrote:
> > [snip]
> > diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > index 157baa8ecb0b..0ed5bfe99029 100755
> > --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > @@ -488,8 +488,9 @@ cleanup()
> >  
> >  	# check whether the setup phase was completed successfully or not. In
> >  	# case of an error during the setup phase of the testing environment,
> > -	# the selftest is considered as "skipped".
> > -	if [ "${SETUP_ERR}" -ne 0 ]; then
> > +	# the selftest is considered as "skipped", unless a test has already
> > +	# recorded a failure.
> > +	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then
> >  		echo "SKIP: Setting up the testing environment failed"
> >  		exit "${ksft_skip}"
> >  	fi
> 
> When a test has already failed and the setup then fails, the script
> exits with 1 and does not say that the setup failed. For example, with
> hs-2 -> gw failing and then an error in setup_end_flv_psp(), the last
> TEST lines in the log are:
> 
>     TEST: IPv6 Hosts connectivity: hs-1 -> gw                           [ OK ]
>     TEST: IPv6 Hosts connectivity: hs-2 -> gw                           [FAIL]
> 
> The End PSP tests did not run. Before this patch, the setup ran before
> any test, and cleanup() printed "Setting up the testing environment
> failed" on every setup error. Could cleanup() print it also in this
> case, keeping the exit code 1? Something like:
> 
> 	if [ "${SETUP_ERR}" -ne 0 ]; then
> 		if [ "${ret}" -ne "${ksft_fail}" ]; then
> 			echo "SKIP: Setting up the testing environment failed"
> 			exit "${ksft_skip}"
> 		fi
> 
> 		echo "FAIL: Setting up the testing environment failed"
> 	fi
> 
> 	exit "${ret}"

OK, I will fix it.

> >  # see __setup_rt_policy
> > @@ -962,17 +980,29 @@ setup()
> >  	setup_hs 1 1
> >  	setup_hs 2 2
> >  
> > -	# set up the loopback addresses of the hosts used by the Policies (i.c)
> > -	# and (i.d).
> > -	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
> > -	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
> > -
> >  	# set up default SRv6 Endpoints (i.e. SRv6 End behavior)
> >  	setup_rt_local_sids 1 "2 3 4"
> >  	setup_rt_local_sids 2 "1 3 4"
> >  	setup_rt_local_sids 3 "1 2 4"
> >  	setup_rt_local_sids 4 "1 2 3"
> >  
> > +	# testing environment was set up successfully
> > +	SETUP_ERR=0
> > +}
> > +
> > +setup_end_flv_psp()
> > +{
> > +	SETUP_ERR=1
> > +
> > +	# set up the loopback addresses of the hosts used by the Policies (i.c)
> > +	# and (i.d).
> > +	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
> > +	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
> > +
> > +	# setup proxy on route entries for hosts
> > +	setup_rt_host_proxy 1 2 "${END_CSID_PSP_FUNC}"
> > +	setup_rt_host_proxy 2 1 "${END_CSID_PSP_FUNC}"
> > +
> >  	# set up SRv6 policies
> >  	# create a connection between hosts hs-1 and hs-2.
> >  	# The path between hs-1 and hs-2 traverses SRv6 aware routers.
> 
> Before this patch, __setup_rt_policy() added the proxy entry together
> with the route of each Policy. With this patch, each scenario calls
> setup_rt_host_proxy() instead.
> 
> In this v3, 4/5 deletes the proxies when the scenario ends, like the
> routes of the Policies. So I think the proxy entry can stay in
> __setup_rt_policy(), and in 4/5 its defer can go next to the defer of
> the route. What do you think?

OK, I will keep the proxy set up in __setup_rt_policy.

Thanks
Hangbin
