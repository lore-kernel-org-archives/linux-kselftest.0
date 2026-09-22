Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B6255931D;
	Tue, 22 Sep 2026 15:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089513; cv=none; b=XeLZXmIQqq51unsal8tuj4lGWOorVJh3+iVY95hDmK3fp7R/f6dhayptXMkk46NXjPFXajsVyCLYr8lSTnLMV2MKG1TFulbUYEC5NIo6Wl7CTqY0YMDcCS8SXHV/sYLc/VbfiLsTOIJRa5xECVmOWAl7rYF/jZgm6VuPbgWvjCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089513; c=relaxed/simple;
	bh=EQgiyEnJn4mJRRRGP6eMTdyR8DgN/5GHj1WNIYVxYJc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aJpQzxzJRNS3UGuvZZLlUnAU/8vYgoH37+ZiXzdhlBDsTBX1oAz+qiMScv+wTqAh+frfltbhF3zWc7EYLyvtga0d5PByyPG/XB2iINdkVT0gaASfusQagNHif3n1jOSMNW1RHYmsA04mzz04VnGbASu+xd5P6WP6xGuld7Kcklw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPr2FtpS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPr2FtpS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F3D1F00898;
	Tue, 22 Sep 2026 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089512;
	bh=uiL4g2GJHvl8HBc9EbIu4aQwRr7aDI69+23hfu5y4oI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lPr2FtpSVnQIyVdRvTz2hsOs0zMS7khrlgHaF+jCvimj7atUOfgJtJpOwlKxvNq+a
	 vSVKj58J2GdQaxVTPAG1Z4GKBq0n/ryy4zx81DHGIltBx+ExGyaeC2nuV05hJBEBVo
	 dMR86Mbar/EY2K9jXjgmgwrRaE/0W/zElolVLEGhYSdsx36P+t3OB6dF4lT8yJxcyi
	 elkAydBkW5OTedou0Xev7ejGa3JOzJc/0oTqMchH+iw4YisotuPQxbuX1+oQ1uUsgX
	 7wnvZJPFZhmS67P1Rvnn20pbMeaxwrl0ZYU8FMXX9UpZ9Xb/lJ9HtukreE7rIUZJtX
	 rRKXhKKqvuSKA==
Subject: Re: [PATCH net-next v5 2/2] selftests/net/openvswitch: add SCTP flow
 key test across conntrack NAT
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 22 Sep 2026 15:05:10 +0000
Message-ID: <179008951086.2160803.550424027687672394@kernel.org>
In-Reply-To: <20260918144647.2024095-3-houminxi@gmail.com>
References: <20260918144647.2024095-3-houminxi@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] test_sctp_nat_connect_v4()
  (tools/testing/selftests/net/openvswitch/openvswitch.sh, new lines…

--

selftests/net/openvswitch: add SCTP flow key test across conntrack NAT

This adds test_sctp_nat_connect_v4, which drives an SCTP association
through ct(commit,nat(dst=172.31.110.20:5555)),recirc and matches the
translated tuple after recirculation, so the SCTP branch of
ovs_nat_update_key() is actually exercised. The config fragment gains
CONFIG_NETFILTER_ADVANCED, CONFIG_NF_CT_PROTO_SCTP and CONFIG_NF_NAT.

One question below about listener teardown.

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index aa84fafc3201..21444657a040 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -1200,6 +1201,98 @@ test_nat_connect_v4 () {
>  	return 0
>  }
>  
> +# sctp_nat_connect_v4 test
> +#  - SCTP association crosses a ct(commit,nat(dst=ip:port)) DNAT
> +#  - post-recirc flows match the translated address and port, so the
> +#    SCTP branch of the post-NAT flow key update is load-bearing
> +test_sctp_nat_connect_v4 () {
> +	local t="test_sctp_nat_connect_v4"
> +	local payload="SCTP_NAT_DATA_OK"
> +	local rxfile="${ovs_base}/${t}/sctp-rx.txt"

[ ... ]

> +	ovs_netns_spawn_daemon "test_sctp_nat_connect_v4" "server" \
> +		socat -u -t 1 SCTP4-LISTEN:5555,fork \
> +		OPEN:"$rxfile",creat,append
> +	ovs_wait sctp_eps_has server 5555 || return 1
> +
> +	info "verify SCTP association across NAT"
> +	ovs_sbx "test_sctp_nat_connect_v4" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP4-CONNECT:192.168.0.20:4443" \
> +	    </dev/null || return 1

[Severity: Low]
This isn't a bug, but can a forked socat child outlive teardown here?

The listener in test_sctp_nat_connect_v4() is started with the fork
option, so socat forks one child per accepted association, while
ovs_netns_spawn_daemon() only records the pid of the backgrounded
ip netns exec:

tools/testing/selftests/net/openvswitch/openvswitch.sh:ovs_netns_spawn_daemon() {
	...
		ip netns exec $netns $*  >> $ovs_dir/stdout  2>> $ovs_dir/stderr &
	fi
	pid=$!
	ovs_sbx "$sbx" on_exit "kill -TERM $pid 2>/dev/null"
}

There is no process group kill and no wait, so a child still blocked
reading its SCTP socket is not signalled or reaped. run_test() then runs
ovs_exit_sig() followed immediately by rm -rf "$ovs_dir", and the
registered on_exit actions do ip netns del server, so such a child would
keep a reference on the server netns and an open descriptor on the
unlinked sctp-rx.txt until the association's retransmit/heartbeat timers
give up. The -t 1 option bounds the linger after EOF is seen, not the
wait for EOF itself.

This would show up when the client is killed by timeout 3, or when a
post-recirc flow is missing so the peer's SHUTDOWN/ABORT is dropped. On
the passing path the client closes stdin right away (</dev/null and the
here-string), so the child sees EOF and exits.

The same forking-listener plus single-pid SIGTERM pattern is already used
by test_sctp_connect_v4() and test_sctp_connect_v6() in this file, so
this may simply be the convention here. Would it be worth killing the
process group and waiting for the listener in ovs_netns_spawn_daemon()
instead, which would cover all three tests?

> +
> +	info "verify SCTP DATA chunk crosses NAT"
> +	ovs_sbx "test_sctp_nat_connect_v4" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP4-CONNECT:192.168.0.20:4443" \
> +	    <<< "$payload" || return 1
> +	ovs_wait grep -q "$payload" "$rxfile" \
> +	    || { info "server did not receive SCTP DATA payload"
> +	         return 1; }
> +
> +	info "done..."
> +	return 0
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918144647.2024095-1-houminxi%40gmail.com
