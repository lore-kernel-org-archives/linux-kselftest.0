Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794547435;
	b=go5zg7x4pU1nQ8pvBS82NgdwmQC6y76B/LaWm1TwP6BMlue80bDW1qXEqtBF04yjkJEd
	 AV+VaKQherYaZHmi2Il43uIhN4K4Z/gIZ0Z0esO6TGd2WuONPupMQv6UjT6aXSnT1JM7h
	 x/JQniikrDrtj7Y4tI4ZmeBOIGkIzwft6ZGWy1Dq3yjrRWl5YdbWZucdBoDfk+Bqfpbt+
	 Hn+vHSAaKmbx+hyjK3bnnyoVzc8aSbqvn+agnN9PF0LQy5U6KIfIoGfekvH4isX5qKP3a
	 I+pnkHM+z2uN1rX2PvaZTlx4ZUByLsPauw4Z6GU6xOfLqcUkBDPh/hL3IC+VC4xx++A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547435;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yNTGZ6HgL81sFOWpVaEuJsNuoy6BFVlh8YpAP+qxSFg=;
	b=yBKOCgxZYQz2r8UKbhGtnIVEjYhrUJcV4exhSkhqAtX99HeoYUkcnhgiIgGiQ1B3LO1V
	 jYL45hbiU+j5j0ntMm7sQwpVqcioG83/2VpTLvcL40hW8rMSE/MnPuMzhpK77jl8LqKX1
	 RFKiehSmCiAwUaf3A0BoKE0B5cWpnp7AsXrVGuWipPRJ5pDDIYN3DcFxjNMnnjS/0brdx
	 h4uM0JRD52JbZPyw87vMGr3fUS5Dwuvn8c5IMhvUEnRfmmrJPKke7qNDEXkvyBKSKKrqe
	 e390nQgkLGB+vgZ/Ff+6RMEMSISkPQTQkjbj+rkZkVAJaHiBriEhBDOFZwiUUF0Q0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WSU2j+Xi;
	arc=none smtp.remote-ip=95.215.58.61
Received: from mta1.migadu.com (out-61.mta1.migadu.com [95.215.58.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C2606A323
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 05:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E2C2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WSU2j+Xi
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nETvmS/sv7eeoqiH4Fl5bLT2YjeMLjjRzngwbfcsPpQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794547432; v=1; x=1795152232;
 b=WSU2j+XiebmLYrNp9W9Shr5UPkdngXfFdyHjKmniofOAAt9fjXRSY/iLichbVRWTGtxXt4sX
 JjF8L2FBD87afjzdgjU2hpsIt5msQMEFDF3XYfxRr3xsBch1EXFD4KrFVOt28WP9y+gU1GWuzpL
 hmqlSe7b3YL16n2sSPstAkf4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 4c369a421a5cba68;
	Fri, 13 Nov 2026 05:23:51 +0000
X-Mizu-Trace-ID: 4c369a421a5cba68
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 13:23:40 +0800
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
Message-ID: <avaewOJD7tX1UYfE@fedora>
References: <20261112014942.2946303-1-treapking@google.com>
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
In-Reply-To: <20261112014942.2946303-1-treapking@google.com>

Hi Pin-yen,
On Wed, Nov 11, 2026 at 05:46:18PM -0800, Pin-yen Lin wrote:
> The prio test intermittently fails in the arp_ip_target and
> ns_ip6_target variants:
> 
>   TEST: prio (active-backup ns_ip6_target primary_reselect 1)   [FAIL]
>   	Current active slave is eth0 but not eth2
> 
> The ARP/NS monitor marks a slave down when it has received nothing for
> too long. With arp_interval 100 and the default arp_missed_max, that is
> about 250ms for the active slave (eth1) and 350ms for a backup slave
> (eth0, eth2). Every 100ms, eth1 sends a probe: eth1 receives the reply,
> and eth0/eth2 receive a copy forwarded by the gateway bridge. Once eth1
> is down, its probes reach no one and no slave receives anything, so
> eth1 normally times out first and the new active slave is picked by
> prio:
> 
>   t=0    probe: eth1 gets the reply, eth0/eth2 get a copy
>   t=10   test sets eth1 down
>   t=300  monitor: eth1 idle 300ms -> down
>                   eth0/eth2 idle 300ms -> up, eth2 picked by prio
> 
> But the test takes eth1 down right after bond_check_connection(), whose
> ping replies only arrive on eth1:
> 
>   t=0    probe: eth1 gets the reply, eth0/eth2 get a copy
>   t=70   ping reply on eth1 only
>   t=85   test sets eth1 down
>   t=300  monitor: eth1 idle 230ms -> still up
>   t=400  monitor: eth1 idle 330ms -> down
>                   eth2 idle 400ms -> down too
> 
> eth2 can then no longer be picked. eth0 becomes the active slave if it
> happened to receive some other packet (e.g. an MLD report), otherwise
> whichever slave comes back first does. With primary_reselect 1 or 2,
> the bond keeps eth0 even after eth2 comes back.
> 
> Before taking the active slave down, wait two monitor intervals
> (200ms), so that at least one more probe is sent after the last ping
> reply and all slaves last received that probe. The miimon variants do
> not need the wait, but the extra delay is negligible.

I'm afraid the waiting time is too strict, especially with a debug kernel
since delays can happen.

Bjoern is also fixing[1] this issue by pinging a non-existent neighbor to
keep traffic flowing. Would you like to test whether that works for you?

[1] https://lore.kernel.org/netdev/20261104142018.552135-1-doebel@amazon.de/

Thanks
Hangbin

> 
> Hit in our CI on GCE VMs (4 of 51 runs); the test only uses veth. On
> the same VMs, 7 of 30 loops of the prio tests failed without this
> change, and 20 of 20 loops passed with it.
> 
> Fixes: 481b56e0391e ("selftests: bonding: re-format bond option tests")
> Signed-off-by: Pin-yen Lin <treapking@google.com>
> ---
> 
>  .../drivers/net/bonding/bond_options.sh       | 26 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/bonding/bond_options.sh b/tools/testing/selftests/drivers/net/bonding/bond_options.sh
> index 187b478d0ddf..16c1c2d97005 100755
> --- a/tools/testing/selftests/drivers/net/bonding/bond_options.sh
> +++ b/tools/testing/selftests/drivers/net/bonding/bond_options.sh
> @@ -13,6 +13,24 @@ ALL_TESTS="
>  
>  lib_dir=$(dirname "$0")
>  source ${lib_dir}/bond_topo_3d1c.sh
> +
> +# The ARP/NS monitor marks a slave down when it has received nothing for too
> +# long: ~250ms for the active slave and ~350ms for a backup slave with
> +# arp_interval 100. The backups only receive the copies of the active slave's
> +# probes that the gateway bridge forwards, but the active slave also gets the
> +# replies to the pings in bond_check_connection(). If the active slave goes
> +# down right after such a reply, it times out in the same monitor run as the
> +# backups, and the new active slave is then not picked by prio. Wait two
> +# monitor intervals, so that at least one more probe is sent and all slaves
> +# last received that probe.
> +bond_link_down()
> +{
> +	local slave=$1
> +
> +	sleep 0.2
> +	ip -n ${s_ns} link set "$slave" down
> +}
> +
>  c_maddr="33:33:ff:00:00:10"
>  g_maddr="33:33:ff:00:02:54"
>  
> @@ -97,12 +115,12 @@ prio_test()
>  	check_active_slave eth1
>  
>  	# active slave should be the higher prio slave
> -	ip -n ${s_ns} link set $active_slave down
> +	bond_link_down $active_slave
>  	check_active_slave eth2
>  	bond_check_connection "fail over"
>  
>  	# when only 1 slave is up
> -	ip -n ${s_ns} link set $active_slave down
> +	bond_link_down $active_slave
>  	check_active_slave eth0
>  	bond_check_connection "only 1 slave up"
>  
> @@ -134,7 +152,7 @@ prio_test()
>  			;;
>  		"2")
>  			check_active_slave "$pre_active_slave"
> -			ip -n ${s_ns} link set $active_slave down
> +			bond_link_down $active_slave
>  			bond_check_connection "pre_active slave down"
>  			check_active_slave "eth1"
>  			;;
> @@ -153,7 +171,7 @@ prio_test()
>  		check_err $? "eth3 prio is not -50"
>  		check_active_slave "eth1"
>  
> -		ip -n ${s_ns} link set $active_slave down
> +		bond_link_down $active_slave
>  		check_active_slave "eth0"
>  		bond_check_connection "change slave prio"
>  	fi
> -- 
> 2.56.1.703.gf848ed807c-goog
> 
> base-commit: 665b4149e91b781a71bce8637c3a4d7d64dba05f
