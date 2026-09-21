Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19449BD93;
	Mon, 21 Sep 2026 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996147; cv=none; b=n+FQiMGEJ08pJUGa73X2MDTgr/yZnj33rr+Tre0MpuiygrX44E8Lu54fKfGa9+Hz4mr1AMcUNlI01DjeQg3GA0oWKhoTzkHVpAzSxFzwOQegiQ8i2adZq9STRFSdG7dIOzsv4eeAaSseJR523LjhTVgXL9T4WNPaUTSexo/HHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996147; c=relaxed/simple;
	bh=ifOkwrmCxPO5sY/E09Yyp0OcBzzC1r9/BaN0dXIyDtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2uAF7wuUnC99+vduWTzjvW3WI/oSjWG5/D/BZkBjkYZsWOJxTI2RVPU6kTEOXlpIoaszKfrkqYEK6Wd/Lr9e1BjduOH3H2CM5ZBVVLGWloKx1Mx1obMqNxl9Q+DK01wmouHnz+TO8PEvdBcjU1Q8dftIj5UgUZnvyFBsk5JIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYE9wBYV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYE9wBYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07E51F000FF;
	Mon, 21 Sep 2026 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789996145;
	bh=B8gx0Q83Hru6sT6K+fPJFVxJySRvNozZjXezt+2+dPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PYE9wBYVav5ozpb8Ra9SuMbtAP/vMhlV3A1n+UIS3oqvk0oyFw3C8gDoFg1s7YNx2
	 5yjNnWuRdZMeS7DIGP5krvMTZDRoAqryl358VXxuHt8Ldp2R2eBuIEyVGPhX6eTLx+
	 xaRBYmDPLgJw5S2E0ZmZryonpQEsVu2toIj91YN2oad0PDSC2YqNlFC41GyH4dKgU2
	 DLpPJT22DbP76/AYPkrmG+lfqf8ZW/3cyaMsyfrR1mzmoP0HAzJL1OSEVVWSoU804b
	 1c7sliwL8FWxgQ0KDAQV/mbpCAMQQBIPcSuTnXb415be4CUxVKLMGoOOG91gYE9WBg
	 a0YFGEA9KSYsQ==
Date: Mon, 21 Sep 2026 14:09:01 +0100
From: Simon Horman <horms@kernel.org>
To: Edoardo Canepa <edoardo.canepa@canonical.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Xu Du <xudu@redhat.com>,
	Po-Hsu Lin <po-hsu.lin@canonical.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] selftests/net: run tun tests in a dedicated
 network namespace
Message-ID: <20260921130901.GP13925@horms.kernel.org>
References: <20260917111520.2614448-1-edoardo.canepa@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917111520.2614448-1-edoardo.canepa@canonical.com>

On Thu, Sep 17, 2026 at 01:15:20PM +0200, Edoardo Canepa wrote:
> The tun_vnet_udptnl fixture creates a fresh tap device, assigns it a
> fixed MAC address and installs the outer neighbor entry as
> NUD_PERMANENT.  On systems where systemd-udevd is running and a systemd
> .link file sets
> 
>     MACAddressPolicy=persistent
> 
> (the default shipped by systemd in 99-default.link, so this is what
> most systemd-based hosts inherit), systemd-udevd's net_setup_link
> builtin asynchronously sends an RTM_SETLINK to reassign the freshly
> created tap device's MAC to a machine-persistent value.  When that
> lands after the fixture has configured the device, both directions
> break:
> 
> - recv_gso_packet transmits through the tap, and the address change
>   flushes the neighbor entry the fixture installed:
> 
>     do_setlink
>     -> netif_set_mac_address
>        -> call_netdevice_notifiers(NETDEV_CHANGEADDR)
>           -> ndisc_netdev_event (arp_netdev_event for an IPv4 outer)
>              -> neigh_changeaddr
>                 -> neigh_flush_dev(tbl, dev, /* skip_perm = */ false)
> 
>   so the packet hits __neigh_create() and waits on neighbor resolution
>   that never completes.
> 
> - send_gso_packet writes frames addressed to the MAC the fixture
>   assigned.  Once the tap has a different address, eth_type_trans()
>   marks them PACKET_OTHERHOST and the IP receive path drops them.
> 
> Either way nothing arrives before the receive timeout, and the test
> fails with, for example:
> 
>   tun.c:947:send_gso_packet:Expected ret (0) == variant->data_size (1)
>   tun.c:948:send_gso_packet:Expected r_num_mss (0) == variant->r_num_mss (1)
>   tun.c:962:recv_gso_packet:Expected ret (0) == variant->data_size (1)
> 
> The failure is non-deterministic and reproduces on a plain
> systemd-based VM with no containers.
> 
> Fix by calling unshare(CLONE_NEWNET) from both fixture setups.  The
> harness runs each test in its own forked process, so every test gets a
> private network namespace that is torn down with it, and all tap and
> geneve devices are created in a namespace that systemd-udevd (running
> in the init netns) does not watch, so its RTM_SETLINK never fires
> against them.
> 
> Creating a network namespace needs CAP_SYS_ADMIN in the current user
> namespace and CONFIG_NET_NS=y, neither of which the tests required
> before.  Where they are unavailable the unshare() is reported with
> SKIP() rather than aborting, so the binary still emits a full TAP
> stream and a runner can tell "network namespaces unavailable" apart
> from a real tun/tap regression.
> 
> Verified on a plain systemd-based VM running the affected kernel.
> Without the fix, 1000 sequential invocations of
> 
>   tun -r tun_vnet_udptnl.4in6_nogsosz_1byte.recv_gso_packet
> 
> fail 10 times, and 2 out of 20 full runs of the test binary fail.  With
> the fix there are no failures in either case.
> 
> Reported-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> Closes: https://bugs.launchpad.net/bugs/2158217
> Fixes: 24e59f26eef2 ("selftest: tun: Add helpers for GSO over UDP tunnel")
> Assisted-by: LLM
> Signed-off-by: Edoardo Canepa <edoardo.canepa@canonical.com>
> ---
> v3:
>   - Drop the claim that a failure leaves the tap and geneve devices
>     behind.  The failing checks are EXPECT_EQ()s in the test body, so
>     FIXTURE_TEARDOWN still runs (Sashiko).
>   - Explain the send_gso_packet failure correctly: its frames are
>     dropped as PACKET_OTHERHOST once the tap's MAC changes.  The
>     neighbor flush only affects recv_gso_packet.
>   - Redo the measurements on a freshly booted host.  The v2 numbers
>     were taken in an unclean environment.  The v1 numbers were fine,
>     and the v2 entry saying otherwise was wrong.
>   - Go back to "Assisted-by: LLM", the current format in
>     Documentation/process/coding-assistants.rst.  v2 followed an older
>     copy of that document (Sashiko).
> v2: https://lore.kernel.org/netdev/20260914211921.3786609-1-edoardo.canepa@canonical.com/
>   - Add the unshare(CLONE_NEWNET) to FIXTURE_SETUP(tun) and
>     FIXTURE_SETUP(tun_vnet_udptnl) instead of replacing
>     TEST_HARNESS_MAIN with a hand-written main() (Jakub).
>   - Report an unshare() failure with SKIP() instead of aborting the
>     binary before the harness starts (Sashiko).
>   - Mention the new CAP_SYS_ADMIN / CONFIG_NET_NS prerequisite in the
>     commit message (Sashiko).
>   - Change the Assisted-by: format (reverted in v3).
>   - Redo the measurements (redone again in v3).
> v1: https://lore.kernel.org/netdev/20260905085318.3416670-1-edoardo.canepa@canonical.com/

Reviewed-by: Simon Horman <horms@kernel.org>

