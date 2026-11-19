Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079985;
	b=ohTPlggGfHVqNPtWfJtkt7+x2G60aMb9bs1BJfLhvo8xWyEWfgSk41ONGqlxvaGG1ftK
	 oopdmv+eS554JwgtgkDiRNrYehTJZ/nVOKPMRKL8e2pyn7yPLIqXJgcJgEBnmXWR4zRyj
	 Xv0ONC/MLvVdxdmnJ+YNGI/xiRXes/n/cn7enxqLPujpMZk905C9pD9jUKCEteQEg4tA2
	 1+EVhoDPMfBJ0TZ911VrGYcBWAtre9NP7fcueku5N1o64rLsYlTdxFd1FARtSYOggvlLP
	 PWeqUx+bosQ6Nxt41Y2NAAOl94niLUBQ73XXEg/Q/JnOLOmfboJLE/kcsbWiOoTpu/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079985;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/+nlz1kvn+hsVTexx0cBJ2RIyKU+qYJzjO2caadmD4w=;
	b=SQb7SHmYuw7EAKWlQCnQ7XaAL2Bbmu4Ed56Xibf0wYJE9kB54KTch+ws1HcIETxP9JaA
	 9sYPU/iR4Le5nKXBfyKJUQQDu3Bc2nMbnMDrSZb/0JrD6FcBTCzjG9wdfRfmHhYyXCGn/
	 QVPk7SEKplb0wB9TS73hqyLKOczicURnAe2bz93QqU065O+mCrMSsv4CLmejXokx3CxmH
	 3bD6j/gcaHJrwTFAfMkN5WQ7BPwzJq1BEGZfiaXaZFKqXGlMLi4Y4dtXt5yxV9GuwOdHe
	 C39pq9RFV5IPJX/tMhGKxYuwFAQadmKQe1RRvGtxtOqbVrgf3Inz05nHenBXh4YYE9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M44Ev5+q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7C0606A33B;
	Thu, 19 Nov 2026 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M44Ev5+q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E0D1F000C9;
	Thu, 19 Nov 2026 09:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079984;
	bh=/+nlz1kvn+hsVTexx0cBJ2RIyKU+qYJzjO2caadmD4w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M44Ev5+qktf7Kppwo1JIKxNmDBQH62xpvXEyp9Pw8K1Y1i7em9yWJZtRGrMYS5S+s
	 hfLBFUIWqgqx2WsZM4fgilmwzOc/x1OBedEpgj5+xsW7pG4x9kXy8ZhGqM1LaI7SFj
	 oFPmpN70DKeBRuJ8BS2O9fRn4QA/gU9aO+l1mo0+Vv3KxQCqlV+KSw++PSHaMcFWYw
	 R7cMZbzEplmmVUrF/qZ2x7Ernq4y3kQYEYjmtWmZrQROSqRcSIscsoxa/Nycg0heM7
	 7ypwntP/B+7o3V2tO3BKGajNFhjyAf9zDLuI54l+YqU0Sr4MIrSHY5sx3MtJv+1D0I
	 om1XgwEEDurmw==
Subject: Re: [PATCH net-next 6/6] selftests: bonding: Test that Collecting is
 advertised after notification
From: netdev-bot+sashiko@kernel.org
To: idosch@nvidia.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@kernel.org, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, petrm@nvidia.com, sridhar.samudrala@intel.com,
 jiri@resnulli.us, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, razor@blackwall.org
Date: Thu, 19 Nov 2026 09:19:43 +0000
Message-ID: <179507998375.3136.1157162879264282901@kernel.org>
In-Reply-To: <20261118083442.1061289-7-idosch@nvidia.com>
References: <20261118083442.1061289-7-idosch@nvidia.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] collecting_advertise() in tools/testing/selftests/drivers/net/
  bonding/bond_lacp_independent_control.sh can take the wrong…

--

selftests: bonding: Test that Collecting is advertised after notification

This patch adds a collecting_advertise test to
bond_lacp_independent_control.sh. With coupled control disabled, the test
checks that the Collecting bit is only advertised in a transmitted LACPDU
after the Rx state change notification was emitted. It also switches the
partner to a slow LACP rate so that the port is not rate limited when it
enters COLLECTING state.

> diff --git a/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh b/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
> index a2b83b581e403..b86f39f31d0c3 100755
> --- a/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
> +++ b/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh

[ ... ]

> @@ -162,6 +167,50 @@ collecting_notify()
>  	log_test "Notifications in COLLECTING state"
>  }
>  
> +collecting_advertise()
> +{
> +	local lacpdu_ts notify_ts tmp_dir
> +
> +	RET=0
> +
> +	partner_state_clear 0x18
> +	defer tc filter del dev "$h1" ingress pref 1 handle 101 flower
> +	lacp_state_wait "$h1" 0x0f
> +	check_err $? "Port did not reach ATTACHED state"
> +
> +	tmp_dir=$(mktemp -d)
> +	defer rm -rf "$tmp_dir"
> +	ip -ts -o -d monitor link dev "$h1" > "$tmp_dir"/notify &
> +	defer kill_process $!

[ ... ]

> +	notify_ts=$(grep -m1 -w "ad_actor_oper_port_state $((0x1f))" \
> +		    "$tmp_dir"/notify | sed 's/^\[\([^]]*\)\].*/\1/')
> +	notify_ts=$(date -d "$notify_ts" +%s%6N)
> +	lacpdu_ts=$(head -n1 "$tmp_dir"/lacpdu | cut -d' ' -f1 | tr -d .)
> +	((lacpdu_ts > notify_ts))
> +	check_err $? "Collecting bit advertised before notification"

[Severity: Medium]

Can notify_ts in collecting_advertise() pick up the timestamp of an
unrelated link notification instead of the $h1 one?

The monitor runs as "ip -ts -o -d monitor link dev $h1". In iproute2,
accept_msg() in ipmonitor calls print_headers() for every RTM_NEWLINK.
With -ts, that prints "[<time>] " with no newline.

print_linkinfo() then returns early and prints nothing when
filter.ifindex is set and ifi->ifi_index != filter.ifindex, which is the
case for any device other than $h1. The timestamp of the filtered message
is therefore left at the start of the next printed line.

With -o, the matching line can then look like this:

    [ts_other] [ts_h1] N: $h1: ... ad_actor_oper_port_state 31 ...

The sed above takes the first bracket, ts_other. That timestamp is older
than the real $h1 notification.

Without "bonding: 3ad: Advertise Collecting only after collection is
enabled", the Collecting LACPDU goes out only a short time (at most about
one tick) before the notification. So any RTM_NEWLINK for another device
between the monitor start and the $h1 0x1f notification would make
notify_ts smaller than lacpdu_ts. In that case the check below passes even
though the bug is present:

    ((lacpdu_ts > notify_ts))

That window covers the sleep 1 plus the wait for the partner's next
LACPDU.

The test runs in the init netns, so link events on other host interfaces
can land in that window. Examples are NetworkManager or docker veths,
carrier changes, and IPv6 ifinfo notifications.

One option is to drop the dev filter and grep for the "$h1:" line, so
every printed line has its own timestamp. Another is to take the last
bracketed timestamp on the line instead of the first. Would either of
these make the check more robust?

> +
> +	log_test "Collecting advertised after notification"
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118083442.1061289-1-idosch%40nvidia.com
