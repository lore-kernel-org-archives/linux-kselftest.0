Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845166;
	b=NApkXx5Mu6Y1M/rqGydICNjFfN01w6kbLXuz8uZPmftd00kiJSrpLeLazfj/fIek/rqJ
	 irsSrT1JuBobNnlpZLJV0wcJUKBnYK3cEgeI21fJjkOD7pJcno0Zih7jXRzk/CKFVJVjy
	 HHKSusAPWWEblNs9EXvN0KGRrJDjZrTpofdZIAB+xecDrujdI4vuAGas5QubfOD7cMY0K
	 LP/rVfizdDcQcj6cfciaG0+zQXO2VTZ9L1lfHp0iU1JVYTMvi3/6yjM3YSfQWbQwLIWaI
	 R9DlZMMb0F55FkunoUDKSAhoT8ZAEqzGUaEYWv2sC7uiRoiJ0P9/HZ6wF1NG7L8A41Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845166;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vCAogybCaVTsP1wOzLL4HrNOiDNKINH4T30RdYUbjCY=;
	b=rYLERiz2vKIg3Xi8VIY3CAKOFioMeIlG8jQGlDdFv7uqSsqQXgLFLk0GXYFoGFBp/YJx
	 SLrnpwrnEC/kBywnsok0+VrnsBLe7kOF/MevbGNlc0xTZoW/rk1mpKIJBzjdmPr8fBPMe
	 KPg/hc46u6d3Kse5QbA2OlspvVzyyIk4B8PR7+MUBck4rJCEgp7kZt1O+Uz1FpErifqkC
	 sy6FdUXDQCNCRCNDRRJMKL3xhDnKHyBavcmPU3zvI5Nmwt/Odn7jtmj6OLQdz+A/uAjsT
	 b3MVEx9on/bXy94pC/CR4Z7znqV96PCHVfy30YUgVGMSObP8bySe1vLU5Bz1rlheD6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cMjLdVAx;
	arc=none smtp.remote-ip=95.215.58.27
Received: from mta1.migadu.com (out-27.mta1.migadu.com [95.215.58.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E577D606A328
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 02:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E577D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cMjLdVAx
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vq/2PwFpnYdqp7NYMLzjiV/QsikQgp5SP9E8rhZNyQ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793845164; v=1; x=1794449964;
 b=cMjLdVAxCh4bj12YhMneUevGO4LeZ2PZgAyGoGtwCTtP5NJjPjxFrzCUCxgh22GA115GIjCL
 Tg6vaRK9+GALurt6WErLFeq7mGRQaZ7c4MzSaTj8lm6ccEOKt7eBiWKqha+5EZD7MQCCcwT8dUB
 /OMrLFFcpV/HTBG4UykurtLE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 1851632e6d4801f8;
	Thu, 05 Nov 2026 02:19:23 +0000
X-Mizu-Trace-ID: 1851632e6d4801f8
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 10:19:08 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Bjoern Doebel <doebel@amazon.de>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>,
	Liang Li <liali@redhat.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests: bonding: feed link monitor to deflake
 prio_test
Message-ID: <auvnnIXQV2zufxtF@fedora>
References: <20261104142018.552135-1-doebel@amazon.de>
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
In-Reply-To: <20261104142018.552135-1-doebel@amazon.de>

Hi Bjoern,
On Wed, Nov 04, 2026 at 02:20:18PM +0000, Bjoern Doebel wrote:
> With the bond idle between test steps, the arp/ns link monitor can
> declare a healthy slave down (~300ms without RX/TX). If this hits a
> failover step, the bond picks a different active slave than expected,
> and primary_reselect=failure/better never reverts it:
> 
>   TEST: prio (active-backup ns_ip6_target primary_reselect 2) [FAIL]
>       Current active slave is eth0 but not eth2


Thanks for the fix. I also saw this issue but haven't checked it yet.

> 
> Reproducible when running tests under load (2-4 / 100 runs).
> 
> Fix by pinging a non-existent neighbor for the duration of the test to
> keep traffic coming. 100 runs under the same load with the patch
> applied: 0 failures.
> 
> Fixes: 42a8d4aaea84 ("selftests: bonding: add bonding prio option test")
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> ---
>  .../selftests/drivers/net/bonding/bond_options.sh   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tools/testing/selftests/drivers/net/bonding/bond_options.sh b/tools/testing/selftests/drivers/net/bonding/bond_options.sh
> index 187b478d0ddf2..f599a2a8ef156 100755
> --- a/tools/testing/selftests/drivers/net/bonding/bond_options.sh
> +++ b/tools/testing/selftests/drivers/net/bonding/bond_options.sh
> @@ -74,6 +74,16 @@ prio_test()
>  
>  	# create bond
>  	bond_reset "${param}"
> +
> +	# Keep the arp/ns link monitor fed for the duration of the test:
> +	# ping a non-existent neighbor, which generates steady broadcast
> +	# ARP requests sourced from the bond's own address. These egress on
> +	# the active slave and are flooded onto the backup slaves' links,
> +	# where they validate as RX activity. Without traffic, idle slaves
> +	# are declared down by the monitor between test steps and the
> +	# failover checks below race with the monitor.
> +	ip netns exec ${s_ns} ping -i 0.1 -W 1 192.0.2.99 &> /dev/null &
> +	local ping_pid=$!
>  	# set active_slave to primary eth1 specifically
>  	ip -n ${s_ns} link set bond0 type bond active_slave eth1
>  
> @@ -157,6 +167,9 @@ prio_test()
>  		check_active_slave "eth0"
>  		bond_check_connection "change slave prio"
>  	fi
> +
> +	kill $ping_pid 2>/dev/null
> +	wait $ping_pid 2>/dev/null

If the kill fails for some reason, will we wait here forever and hang the
entire test?

Thanks
Hangbin
