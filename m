Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810450;
	b=e/BIUSAK80dYz9h/AVVzzICLmJhrMmzlaakKdHHt0aA4q9ijRmlJ15vVtRdHSzCFlVs0
	 KkuVUhFkRBwY7noAV4s+Tjbt/Kk6NKpB5PciwWSrgpABbwLukXYHFQIWapm/ECE0zvX3V
	 QTSbgNxpvWUaq4F2Y8atQ41QE0NV7rKZRIfxak3giUn2Z3eXpVwYASzCytn9S40hpkpQy
	 pl2lX+IGxRGEAh7ty8u/ncksRUOpV7jfmYQ68EUU/SeK0VRjmTed2mHzePIp4RDKTYgpF
	 O3bEaBnuOxeqh8odqBAGjVMeiGMjF4NyjqmabYpq3pM/ZUHY/0WLJxXMGgpQBRccJDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810450;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hwTmClWTxsFlbzuWxoT35i39mY0hOb4dtqELh37RY/s=;
	b=3JzGipvLe75HguH9S4G52UMZAo3mmVhetg7zUvm8fo8kf61GbYw1RriVbiL7qJC97WMt
	 PX4HUEgBmnOLFVvGexsGYXytDRAKVq3SIqX7kgAc2uqcu88a6v0X6+kGxBs+2OU/+Ytqo
	 izsmolKcxUqKWvKi4c/MUmttpd1FtnuQGvn0Yy6mtf6PItNspjmPGptBpmMHJNI7oqD5u
	 a/P9KYNcmVVC9LHUaIFiUfAf3PLudPRROT7Khu/zxNAzHhQbg6dKsBBSNE3N8L4GF1fYe
	 eiQy34Jxa36Pno6EWyGabQNFzDrtWnmdPDMz1YZN5YeBnNKs4eveJ+OHppt2egqJ/Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GlsyW5KF;
	arc=none smtp.remote-ip=95.215.58.138
Received: from mta1.migadu.com (out-138.mta1.migadu.com [95.215.58.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1B606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 06:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GlsyW5KF
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yJA/CsPKGJNNLcyenep5M0wmN80PBv5RK3h15MF3ueM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794810447; v=1; x=1795415247;
 b=GlsyW5KF+yFkOMGTxIyDyMZhQH5rg93Cv02CHWOS7eVsq86a+xbUaAptvNiLwEzx+O4nBQqR
 hClmvslr4ve1QOs+EDaMPisa613dNVvK3oXOH3UECIA7ptV+ZPGZoSp/X48bkpRjay2R97vwbB9
 w15IW+OvcSjgcmFH776sD4E0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 911e766ce9e0ecd2;
	Mon, 16 Nov 2026 06:27:27 +0000
X-Mizu-Trace-ID: 911e766ce9e0ecd2
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 14:27:17 +0800
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
Subject: Re: [PATCH net-next v3 4/5] selftest: seg6: explicit cleanup for
 SRv6 End PSP test
Message-ID: <avqiRTii9HYwXVXd@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-4-c9177bbbd965@kylinos.cn>
 <20261116053407.53b79a5dceef802586952e96@uniroma2.it>
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
In-Reply-To: <20261116053407.53b79a5dceef802586952e96@uniroma2.it>

Hi Andrea,
On Mon, Nov 16, 2026 at 05:34:07AM +0100, Andrea Mayer wrote:
> On Thu, 12 Nov 2026 17:27:59 +0800
> Hangbin Liu <hangbin.liu@linux.dev> wrote:
> 
> > The End PSP tests install policy and localsid state but rely on the
> > global namespace teardown to remove it. That leaves flavor-specific
> > state behind once more tests share this script.
> >
> > Use defer and defer_scopes_cleanup to remove the PSP specified
> > configurations. i.e.
> >
> >   * cafe::1, cafe::1:e9, cafe::2, cafe::2:e9 route and proxy on rt1, rt2
> >   * fcbb:0::x0e9 End next-csid,psp policies on rt 1,2,3,4
> >   * fcff:x::0ef1 End psp polices on rt 1,2,4
> 
> Hi Hangbin,
> 
> A few nits on the message:
> - The code uses defer_scope_pop, not defer_scopes_cleanup.
> - The NEXT-C-SID End SIDs are fcbb:0:x0e9::/48, not fcbb:0::x0e9.
> - "polices" is a typo.
> - The subject prefix is "selftest: seg6:", while the other selftest
>   patches of the series use "selftests: seg6:".

Thanks for the detailed review, I will fix them.

> 
> >
> > Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> > [snip]
> > diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > index 0ed5bfe99029..374b43661c28 100755
> > --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > @@ -759,6 +759,8 @@ setup_rt_endpoint()
> >  		add "${sid}" table "${LOCALSID_TABLE_ID}" \
> >  		encap seg6local action ${behavior_cfg} \
> >  		dev "${DUMMY_DEVNAME}"
> > +	defer ip -netns "${nsname}" -6 route \
> > +		del "${sid}" table "${LOCALSID_TABLE_ID}"
> >  }
> >  
> >  # Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
> > @@ -801,10 +803,16 @@ setup_rt_host_proxy()
> >  	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
> >  		proxy "${IPv6_HS_NETWORK}::${hs}" \
> >  		dev "${RT2HS_DEVNAME}"
> > +	defer ip -netns "$(get_rtname "${rt}")" -6 neigh del \
> > +		proxy "${IPv6_HS_NETWORK}::${hs}" \
> > +		dev "${RT2HS_DEVNAME}"
> >  
> >  	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
> >  		proxy "${IPv6_HS_NETWORK}::${hs}:${func}" \
> >  		dev "${RT2HS_DEVNAME}"
> > +	defer ip -netns "$(get_rtname "${rt}")" -6 neigh del \
> > +		proxy "${IPv6_HS_NETWORK}::${hs}:${func}" \
> > +		dev "${RT2HS_DEVNAME}"
> >  }
> >  
> >  # This helper function builds and installs the SID List (i.e. SRv6 Policy)
> > @@ -882,6 +890,8 @@ __setup_rt_policy()
> >  		add "${IPv6_HS_NETWORK}::${dst}" \
> >  		encap seg6 mode inline segs "${policy}" \
> >  		dev "${DUMMY_DEVNAME}"
> > +	defer ip -netns "${in_nsname}" -6 route \
> > +		del "${IPv6_HS_NETWORK}::${dst}"
> >  }
> >  
> >  # see __setup_rt_policy
> 
> If you agree to keep the proxy entry in __setup_rt_policy(), as
> proposed on patch 3, its defer can go next to the defer of the route.
> Something like:
> 
> 	ip -netns "${in_nsname}" -6 route \
> 		add "${IPv6_HS_NETWORK}::${dst}" \
> 		encap seg6 mode inline segs "${policy}" \
> 		dev "${DUMMY_DEVNAME}"
> 	defer ip -netns "${in_nsname}" -6 route \
> 		del "${IPv6_HS_NETWORK}::${dst}"
> 
> 	ip -netns "${in_nsname}" -6 neigh \
> 		add proxy "${IPv6_HS_NETWORK}::${dst}" \
> 		dev "${RT2HS_DEVNAME}"
> 	defer ip -netns "${in_nsname}" -6 neigh \
> 		del proxy "${IPv6_HS_NETWORK}::${dst}" \
> 		dev "${RT2HS_DEVNAME}"
> 
> > @@ -1460,11 +1470,13 @@ set +e
> >  router_tests
> >  host2gateway_tests
> >  
> > +defer_scope_push
> >  set -e
> >  setup_end_flv_psp
> >  set +e
> >  host_srv6_end_flv_psp_tests
> >  host_srv6_end_flv_next_csid_psp_tests
> >  host_srv6_end_flv_consumed_srh_tests
> > +defer_scope_pop
> >  
> >  print_log_test_results
> 
> setup_hs_lo_addr() has no defer. The loopback addresses cafe::1:e9
> and cafe::2:e9, and the routes that setup_hs_lo_addr() adds on rt-1
> and rt-2, stay after defer_scope_pop. Only the End PSP scenario uses
> them. Could setup_hs_lo_addr() defer their removal too, like the
> Policies? Something like:
> 
> 	ip -netns "${hsname}" addr add "${addr}/128" dev lo nodad
> 	defer ip -netns "${hsname}" addr del "${addr}/128" dev lo
> 
> 	ip -netns "${rtname}" -6 route \
> 		add "${addr}" \
> 		via "${IPv6_HS_NETWORK}::${hs}" dev "${RT2HS_DEVNAME}"
> 	defer ip -netns "${rtname}" -6 route \
> 		del "${addr}"

I will update the defer with your suggestions.

Thanks
Hangbin
