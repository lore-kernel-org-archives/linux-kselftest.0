Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803679;
	b=i1lxmlaJkSfI/gW87bfZ1zr+Ng708gHT+jz7cOtfiaWBKCxVEmIas4zuGp3LteQ8alj8
	 fZwywE/sk5cBJUKc/rNDxEBBwHhwFcjoOcgylcydpQ1zPd6MgCnECXyDXAxs+gPnGhFAV
	 /XU2lsMLJIvn9ERA0Dnok4uQiunBw3ZJNTjyGyT70H5QgnBGoy59SoyX/m8T4Xz5ErZuj
	 ZNohw3L0XrBrEqvez3EkKI6phUzo2D3WSkFbP1twEd+v67lNYAap6ps6PtOHaOSKyx4w3
	 dkYuTjBr9U1xBhCAGTru6dg/Enl/aHF3HJAkh3iyIOkzgCy2ZNMLkuJXmj+isH9xL8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803679;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=ojR2X/nGEgb9gsblJll4owlj0mkhyqJx4EjWxmqLP3U=;
	b=jZtI5r7ze9aFYURNdSAmK+EH69ra5dKsumJzajVNFjcBa6ERuhUNSKlazHKeYomzgVBc
	 jfPxIXmEybajlKIa+RX+qgEZlVW2JX0a41rjPniCYyRsEMaPUS0ONsj+YVFT9Eq4On5Pc
	 9VHOrV7CQpOQh4f+E95yQ0J01yegP6v2pwnE7X3WDSew4LhqXOUogV0XQLrofDvcObUgM
	 /z/pP50kAvvuIQeopu8lk4BcyqjU938dK+mz257s0oVezaLLVfKcl6ht2QHb+mnZnR+bJ
	 ebgK9PDuCAikBA4S4lGjSzdALs/HKuM4UCJfU+YRhrS+fjjlYB6TaLO0RyVFdYjduow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=JcEc2Cmg;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=SjoLTgus;
	arc=none smtp.remote-ip=160.80.4.39
Received: from smtp.uniroma2.it (smtp.uniroma2.it [160.80.4.39])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A87606A31C;
	Mon, 16 Nov 2026 04:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=JcEc2Cmg;
	dkim=pass (2048-bit key) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=SjoLTgus
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AG4YB0H029941;
	Mon, 16 Nov 2026 05:34:16 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id EFC45120755;
	Mon, 16 Nov 2026 05:34:07 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1794803648; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojR2X/nGEgb9gsblJll4owlj0mkhyqJx4EjWxmqLP3U=;
	b=JcEc2Cmg4f60Qwjcttf/BvtwrzeeQbXDapORG5umBA17kcYCksuDmlT2yIqYsJVlDPCuv1
	S1RfyMi4tz3mGXBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1794803648; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ojR2X/nGEgb9gsblJll4owlj0mkhyqJx4EjWxmqLP3U=;
	b=SjoLTgusQH5+AKOL9dXTwwQGYgKPlr5SKQU/HfH4kprnEZAwcGwkxXgJqr5K+ZTWJnPwKx
	p5H1tO389+8jxS1Hj6SqX2J//C3MyBRZz3K0LJ+TfgKLq8+x+Mku0e3BpYkVIa410Wik1F
	ssTRqLYyryypc3bjkvrzu+t+I+FVBgf2d2c4UcG9x/BE5Uj6ZpIg5sVIclPoY+3LhMBl3l
	aaJvnDZFrpt7JkozwGESz4U2zOy6Zbh7CzCDbFkzL5lmUwzSQ6503W7hVXAQ6aRJ1ZOobd
	Q7e4VBeQS5k89wElqQFP/gdy8vs+jZ5zHWISHZT+h7mSgx1TZ3WFCMJOJUYy+Q==
Date: Mon, 16 Nov 2026 05:34:07 +0100
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Hangbin Liu <liuhangbin@kylinos.cn>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Andrea Mayer
 <andrea.mayer@uniroma2.it>,
        Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 4/5] selftest: seg6: explicit cleanup for
 SRv6 End PSP test
Message-Id: <20261116053407.53b79a5dceef802586952e96@uniroma2.it>
In-Reply-To: <20261112-srv6_flavors_endx-v3-4-c9177bbbd965@kylinos.cn>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-4-c9177bbbd965@kylinos.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Thu, 12 Nov 2026 17:27:59 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> The End PSP tests install policy and localsid state but rely on the
> global namespace teardown to remove it. That leaves flavor-specific
> state behind once more tests share this script.
>
> Use defer and defer_scopes_cleanup to remove the PSP specified
> configurations. i.e.
>
>   * cafe::1, cafe::1:e9, cafe::2, cafe::2:e9 route and proxy on rt1, rt2
>   * fcbb:0::x0e9 End next-csid,psp policies on rt 1,2,3,4
>   * fcff:x::0ef1 End psp polices on rt 1,2,4

Hi Hangbin,

A few nits on the message:
- The code uses defer_scope_pop, not defer_scopes_cleanup.
- The NEXT-C-SID End SIDs are fcbb:0:x0e9::/48, not fcbb:0::x0e9.
- "polices" is a typo.
- The subject prefix is "selftest: seg6:", while the other selftest
  patches of the series use "selftests: seg6:".

>
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> [snip]
> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 0ed5bfe99029..374b43661c28 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> @@ -759,6 +759,8 @@ setup_rt_endpoint()
>  		add "${sid}" table "${LOCALSID_TABLE_ID}" \
>  		encap seg6local action ${behavior_cfg} \
>  		dev "${DUMMY_DEVNAME}"
> +	defer ip -netns "${nsname}" -6 route \
> +		del "${sid}" table "${LOCALSID_TABLE_ID}"
>  }
>  
>  # Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
> @@ -801,10 +803,16 @@ setup_rt_host_proxy()
>  	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
>  		proxy "${IPv6_HS_NETWORK}::${hs}" \
>  		dev "${RT2HS_DEVNAME}"
> +	defer ip -netns "$(get_rtname "${rt}")" -6 neigh del \
> +		proxy "${IPv6_HS_NETWORK}::${hs}" \
> +		dev "${RT2HS_DEVNAME}"
>  
>  	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
>  		proxy "${IPv6_HS_NETWORK}::${hs}:${func}" \
>  		dev "${RT2HS_DEVNAME}"
> +	defer ip -netns "$(get_rtname "${rt}")" -6 neigh del \
> +		proxy "${IPv6_HS_NETWORK}::${hs}:${func}" \
> +		dev "${RT2HS_DEVNAME}"
>  }
>  
>  # This helper function builds and installs the SID List (i.e. SRv6 Policy)
> @@ -882,6 +890,8 @@ __setup_rt_policy()
>  		add "${IPv6_HS_NETWORK}::${dst}" \
>  		encap seg6 mode inline segs "${policy}" \
>  		dev "${DUMMY_DEVNAME}"
> +	defer ip -netns "${in_nsname}" -6 route \
> +		del "${IPv6_HS_NETWORK}::${dst}"
>  }
>  
>  # see __setup_rt_policy

If you agree to keep the proxy entry in __setup_rt_policy(), as
proposed on patch 3, its defer can go next to the defer of the route.
Something like:

	ip -netns "${in_nsname}" -6 route \
		add "${IPv6_HS_NETWORK}::${dst}" \
		encap seg6 mode inline segs "${policy}" \
		dev "${DUMMY_DEVNAME}"
	defer ip -netns "${in_nsname}" -6 route \
		del "${IPv6_HS_NETWORK}::${dst}"

	ip -netns "${in_nsname}" -6 neigh \
		add proxy "${IPv6_HS_NETWORK}::${dst}" \
		dev "${RT2HS_DEVNAME}"
	defer ip -netns "${in_nsname}" -6 neigh \
		del proxy "${IPv6_HS_NETWORK}::${dst}" \
		dev "${RT2HS_DEVNAME}"

> @@ -1460,11 +1470,13 @@ set +e
>  router_tests
>  host2gateway_tests
>  
> +defer_scope_push
>  set -e
>  setup_end_flv_psp
>  set +e
>  host_srv6_end_flv_psp_tests
>  host_srv6_end_flv_next_csid_psp_tests
>  host_srv6_end_flv_consumed_srh_tests
> +defer_scope_pop
>  
>  print_log_test_results

setup_hs_lo_addr() has no defer. The loopback addresses cafe::1:e9
and cafe::2:e9, and the routes that setup_hs_lo_addr() adds on rt-1
and rt-2, stay after defer_scope_pop. Only the End PSP scenario uses
them. Could setup_hs_lo_addr() defer their removal too, like the
Policies? Something like:

	ip -netns "${hsname}" addr add "${addr}/128" dev lo nodad
	defer ip -netns "${hsname}" addr del "${addr}/128" dev lo

	ip -netns "${rtname}" -6 route \
		add "${addr}" \
		via "${IPv6_HS_NETWORK}::${hs}" dev "${RT2HS_DEVNAME}"
	defer ip -netns "${rtname}" -6 route \
		del "${addr}"

Thanks,
Andrea
