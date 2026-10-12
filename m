Received: from mta0.migadu.com (out-227.mta0.migadu.com [91.218.175.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E37445AEA
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 07:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791679; cv=none; b=gAaGxkPpI5k5uMkwuNZoJNKY4dr5DjPmgfwa07NX8qL+SpMYC3VoKeZcT0Rz57CkMMDALuLJDjqO0u3a7G0KKEeg3bHYnvYAdf+V3zc9BzbWnkE9kZIIsVnmRUNeMUPoln4A1r11GiCPVW88eTHRr4OthtB8rlJqd/QD3HOwh2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791679; c=relaxed/simple;
	bh=BklsQMO+SsIIuSPsxoYOjE73hpbf2LQWVC3wm/IEZVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIqefoXxKPjohHrzoBDIniglGrg1uFPn4tgaSZM2A6qY43XJVW7EWUeaoRKqEtPS7388jR5sRXJp9XIzeFb3e2KSTJ2Ghr+crd6HZoXtyUcbf0685EI4/2nq7mZURj41rjEUKMcVy3m/3gdxlCVGgQNyA98i15syjQyf+2qK4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uaZJpPPs; arc=none smtp.client-ip=91.218.175.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uaZJpPPs"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BklsQMO+SsIIuSPsxoYOjE73hpbf2LQWVC3wm/IEZVs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791791674; v=1; x=1792396474;
 b=uaZJpPPskEIsb2/scWJvm1zH3qDEU8IZQduwCR0zNH7CxUtrNBLnyw/6Wik6PvQkD7ZtOlHy
 ulFSpx9lUePNPnzHiw8ZyMVENiIQfAP/gOeRUBEi2E67lZj74mEjqI/ZnGCm/EMOx3U3zwn1yKq
 yunHw/cgyQgbPQz2/RJ6wHJo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 77d487c906af96b3;
	Mon, 12 Oct 2026 07:54:34 +0000
X-Mizu-Trace-ID: 77d487c906af96b3
X-Migadu-Flow: FLOW_OUT
Date: Mon, 12 Oct 2026 15:54:18 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Ahmed Abdelsalam <ahabdels@cisco.com>,
	Stefano Salsano <stefano.salsano@uniroma2.it>
Subject: Re: [PATCH net-next 4/5] selftests: seg6: add tests for PSP together
 with NEXT-C-SID
Message-ID: <asySKloMDEQmTLpc@fedora>
References: <20261011192310.55-1-andrea.mayer@uniroma2.it>
 <20261011192310.55-5-andrea.mayer@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011192310.55-5-andrea.mayer@uniroma2.it>

Hi Andrea,
On Sun, Oct 11, 2026 at 09:23:09PM +0200, Andrea Mayer wrote:
> Extend srv6_end_flavors_test.sh with tests for the SRv6 End behavior
> with both the NEXT-C-SID and PSP flavors.
> 
> The tests use two SRv6 Policies with C-SID containers, where every
> router after the ingress one applies End with the NEXT-C-SID and PSP
> flavors. To check PSP, set net.ipv6.conf.all.seg6_enabled to 0 on the
> hosts in setup_hs(). The hosts then drop any packet that still carries
> an SRH, and a ping to an address on the loopback of a host succeeds
> only if the router connected to that host has removed the SRH. The tests
> fail when PSP is not applied together with NEXT-C-SID.
> 
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  .../selftests/net/srv6_end_flavors_test.sh    | 229 +++++++++++++++++-
>  1 file changed, 226 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 30a939392eea..baa1b09a1aab 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> @@ -439,6 +549,7 @@ setup_rt_local_sids()
>  	local devname
>  	local nsname
>  	local neigh
> +	local csid
>  
>  	nsname="$(get_rtname "${rt}")"
>  
> @@ -452,6 +563,14 @@ setup_rt_local_sids()
>  			add "${LOCATOR_SERVICE}:${neigh}::/32" \
>  			table "${LOCALSID_TABLE_ID}" \
>  			via "${net_prefix}::${neigh}" dev "${devname}"
> +
> +		# set underlay network routes to reach the C-SID containers
> +		# that start with a C-SID of the neighbor, for any Function.
> +		csid="$(build_csid "${neigh}" 00)"
> +		ip -netns "${nsname}" -6 route \
> +			add "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODE_BLEN}" \
> +			table "${LOCALSID_TABLE_ID}" \
> +			via "${net_prefix}::${neigh}" dev "${devname}"
>  	done
>  
>  	# Local End behavior (note that "dev" is a dummy interface chosen for
> @@ -461,6 +580,17 @@ setup_rt_local_sids()
>  		table "${LOCALSID_TABLE_ID}" \
>  		encap seg6local action End dev "${DUMMY_DEVNAME}"
>  
> +	# Local End behavior with the NEXT-C-SID and PSP flavors, bound to the
> +	# C-SID of the router (e.g. fcbb:0:04a1::/48 on rt-4). The /48 prefix
> +	# covers every C-SID container whose first C-SID is this one, whatever
> +	# the Argument that follows.
> +	csid="$(build_csid "${rt}" "${END_CSID_PSP_FUNC}")"
> +	ip -netns "${nsname}" -6 route \
> +		add "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODEFUNC_BLEN}" \
> +		table "${LOCALSID_TABLE_ID}" \
> +		encap seg6local action End flavors next-csid,psp \
> +		lblen "${LCBLOCK_BLEN}" nflen "${LCNODEFUNC_BLEN}" \
> +		dev "${DUMMY_DEVNAME}"

This is a End + PSP specific encapsulation. If there is a new version patch,
can we move this block

> @@ -494,6 +634,7 @@ __setup_rt_policy()
>  	local in_nsname
>  	local rt_nsname
>  	local policy=''
> +	local container
>  	local function
>  	local fullsid
>  	local op_type
> @@ -520,6 +661,15 @@ __setup_rt_policy()
>  			behavior_cfg="End flavors psp"
>  			;;
>  
> +		"next-csid,psp")
> +			# the behavior is already set up on every router by
> +			# setup_rt_local_sids.
> +			container="$(build_csid_container "${node}" \
> +				"${END_CSID_PSP_FUNC}")"
> +			policy="${policy}${container},"
> +			continue
> +			;;
> +

to here? So we can align with the other SRv6 Endpoint behavior?
Because later in the End.X PSP support we also need to cleanup and
re-setup with END.X.

If this version is applied (which is also good), I can do the modification
in my patch set.

Others looks good to me.

Tested-by: Hangbin Liu <liuhangbin@kylinos.cn>
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

Thanks
Hangbin
