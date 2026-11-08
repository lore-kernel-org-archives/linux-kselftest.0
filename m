Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150781;
	b=yr0rybJTMx/JddxbkW1to4WQYZRckVrbNiqgDhMSFH6YXsKhof4v8AxOLjj3hPkr+sJm
	 rhOeDekqe4z7mm7zO0xje3417b6CYUZVZT+zlq3zMd5+5fsjLvDAr/XXIwZDXT2gvfZGb
	 QcV7CLnAo7kp1OZ/m8Rpi/nZ8wNwUxg9Kl8sVrDgLFBjBZoXF4mXQg0tWE5r3nlYImyVl
	 ezpgOFaRrIXa76AUI9Mi01WugvNiPXw3eHUQipmDPRE4X2Omi21QIDwe6qSAgAO0U5jna
	 O60oAjFO5bayQxVv0W3yERW6z7mz0Z8bduD0SzPKDEID5YUFVJQm2f3b2ZXNIZnh95Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150781;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pDozBG3DKZrrV0VA63gacCvIsYzBdStab0Y4qutdH5I=;
	b=u8JfHUi5FZm3vAzkq3sQsvvNMVHFcMStPo+w304nrcmWh0hLlwZtrZ+QvuAM+9oSvpMW
	 WyP6+syyiqN87AtveGTzjtMbA8HbdcSWDWvdxk0ptItohz9vNJ+gnIuvbbCDsux25Mz1O
	 5tKcavo5vLzU+hZVgSBztV7VesHe2ynI5pVvc7wdDhQkOxBGB60Xh80uoHAIo2JW8gpvu
	 qYwA9+FnPuCfEIpVflLEVU40w3TFmVm/THorYsCAcvcbwyLzJUXOQxVGn5ereoyFQSX1g
	 kfBO+qAhW8QIvyB8E/r4hjrG4hlEpF2I2uC5nl/FfOj2P22F9GyH9uZKz5e9ZQ3ryjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkILvNxd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46063606A31C;
	Sun,  8 Nov 2026 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkILvNxd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D212A1F0089F;
	Sun,  8 Nov 2026 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794150780;
	bh=pDozBG3DKZrrV0VA63gacCvIsYzBdStab0Y4qutdH5I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RkILvNxdcAuP3m1VsG7WfUeqxeyGe9pWQiEVokHLf3VOA8LKq60tCATIxxjrO/1A4
	 Y2I44BYZ+WlrD5L/eYC4FaKAtw27HWDCCkVfXJb9uYYDDnkJC5E9UdQgEUK6+OPaiV
	 +SazROZNP/5JtMz3em1Z4LYU31nB7LccYUUq7+ppa2kfq+bHAFYNweLHkgpmFP9L2W
	 TXmvYGBy73Hnx/lhIvooj2v0io92Adquf2NtQUJDf9FTU5pdZGY8hKPeU4tadRqJqM
	 szkvyEpzL1zyAP57f9azZtH21+E2427KKNxuwux1mr3j8XxWjEIN31wrPC9Fn/r/x0
	 o1Fu1FOrSG1OA==
Subject:
 Re: [PATCH net] selftests: bonding: feed link monitor to deflake prio_test
From: netdev-bot+sashiko@kernel.org
To: doebel@amazon.de
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 liuhangbin@gmail.com, liali@redhat.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 08 Nov 2026 15:12:59 +0000
Message-ID: <179415077934.994134.13648548366874666986@kernel.org>
In-Reply-To: <20261104142018.552135-1-doebel@amazon.de>
References: <20261104142018.552135-1-doebel@amazon.de>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The commit message and the new comment in prio_test()
  (tools/testing/selftests/drivers/net/bonding/bond_options.sh:78-86)…
- [Low] prio_test() starts the background ping unconditionally.
- [Low] The new background `ip netns exec ${s_ns} ping -i 0.1 -W 1
  192.0.2.99 &` in prio_test() has no -c or -w, so it never exits on its…
- [Low] selftests: bonding: inaccurate Fixes tag for prio_test() link
  monitor race

--

selftests: bonding: feed link monitor to deflake prio_test

This patch starts a background ping to a non-existent neighbor
(192.0.2.99) in the server namespace for the duration of prio_test() in
bond_options.sh. The goal is to generate traffic so the arp/ns link
monitor stops declaring healthy slaves down between test steps, which
made failover checks fail intermittently under load.

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

[Severity: Low]
Is 42a8d4aaea84 the right commit for the Fixes tag? As far as I can
tell, that commit added option_prio.sh with arp_interval 1000, which
gives a monitor timeout of roughly 3.5 seconds. It had no
ns_ip6_target variant. It also ran ping -c5 before check_active_slave
on every failover step. The ~300ms idle window described in the
commit message doesn't seem to exist in that version of the test.

The failing configuration in the report is prio_ns() calling
prio_test() with arp_interval 100 and ns_ip6_target. That appears to
come from 481b56e0391e ("selftests: bonding: re-format bond option
tests"), which moved the prio tests into bond_options.sh.

Later, 45bf79bc56c4 ("selftests: bonding: reduce
garp_test/arp_validate test time") moved check_active_slave ahead of
bond_check_connection in the failover steps. That removed the traffic
that used to run just before each check.

Should the Fixes tag point at 481b56e0391e instead? Or at
45bf79bc56c4, if the reordering is what exposed the race? Stable
backports rely on this tag to pick target trees. Trees that have
42a8d4aaea84 but not 481b56e0391e have no bond_options.sh, so this
patch can't apply there anyway.

[Severity: High]
Does this ping change what the monitor sees? The comment and the commit
message describe a mechanism that doesn't match what the bonding and
neighbour code do.

First, is the bond really idle between steps? With arp_interval 100,
bond_activebackup_arp_mon() calls bond_ab_arp_probe() every 100ms. That
function already sends broadcast ARP/NS on the active slave:

drivers/net/bonding/bond_main.c:bond_ab_arp_probe() {
    ...
	if (curr_active_slave) {
		bond_send_validate(bond, curr_active_slave);
		return should_notify_rtnl;
	}
    ...
}

br0 floods these probes to the backup ports. With the default
arp_validate=none, bond_rcv_validate() refreshes last_rx for any frame
it receives:

			WRITE_ONCE(slave->last_rx, jiffies);

Since no validation is configured, "validate as RX activity" doesn't
apply here.

Second, does ping -i 0.1 produce steady ARP? For an unresolved
neighbour, __neigh_event_send() sends a single probe and arms the timer
at RETRANS_TIME. Echoes sent while the entry is INCOMPLETE are only
queued on arp_queue. After that, neigh_timer_handler() re-probes at:

		/* NUD_PROBE|NUD_INCOMPLETE */
		next = now + max(NEIGH_VAR(neigh->parms, RETRANS_TIME), HZ/100);

and arp_tbl defaults to:

	[NEIGH_VAR_RETRANS_TIME] = 1 * HZ,

That works out to about 1 ARP per second. The monitor itself sends 10
per second, and the detection windows are about 250-350ms.

Third, the ping does nothing for the active slave. slave->last_tx is
only updated by the bond's own probes in bond_arp_send() and
bond_ns_send(), not by ARP generated by the IP stack:

		slave_update_last_tx(slave);
		arp_xmit(skb);

Nothing answers these ARPs, so the active slave's last_rx doesn't get
refreshed either. bond_ab_arp_inspect() checks both values:

		last_tx = slave_last_tx(slave);
		if (bond_is_active_slave(slave) &&
		    (!bond_time_in_interval(bond, last_tx, bond->params.missed_max) ||
		     !bond_time_in_interval(bond, last_rx, bond->params.missed_max))) {

Finally, in the fail over step, "ip link set eth1 down" leaves eth1 as
curr_active_slave until the monitor declares it down. Until then, all
bond0 TX goes to eth1 and is dropped, including the ping's ARPs.

That means the backups get no RX in exactly the window where two checks
race: the active slave goes down after missed_max * delta, and the
backups after (missed_max + 1) * delta. Under load, monitor latency or
rtnl_trylock retries can still merge or reorder those passes, the same
as before the patch.

Is 0/100 against 2-4/100 enough to show the fix works? 0.98^100 is
about 13% and 0.97^100 is about 5%. So 0 failures in 100 runs is quite
plausible without the patch.

Could the root cause be looked at again, and the comment corrected so
the tree doesn't keep this explanation?

[Severity: Low]
Should the ping be started only for the arp_ip_target and ns_ip6_target
runs? prio_test() is also called from prio_miimon() for active-backup,
balance-tlb and balance-alb. miimon is carrier-based, so the monitor
starvation rationale doesn't apply to those runs.

In balance-alb, every ARP request the ping triggers goes through
bond_alb_xmit()->rlb_arp_xmit(). The ARPOP_REQUEST branch creates an
rx_hashtbl entry for 192.0.2.99 and resets the RLB update delay:

		tx_slave = rlb_choose_channel(skb, bond, arp);

		/* The ARP reply packets must be delayed so that
		 * they can cancel out the influence of the ARP request.
		 */
		bond->alb_info.rlb_update_delay_counter = RLB_UPDATE_DELAY;

bond_alb_monitor() only calls rlb_update_rx_clients() after that counter
has counted down to zero:

			if (bond_info->rlb_update_delay_counter) {
				--bond_info->rlb_update_delay_counter;
			} else {
				rlb_update_rx_clients(bond);

RLB_UPDATE_DELAY is 2 seconds, and the ping sends a new ARP request
about once a second, so the counter never gets to zero. The RLB client
updates that follow a slave failure are then held off for the whole
balance-alb prio run.

rlb_choose_channel() returns __rlb_next_rx_slave(), so the request can
also go out on a non-active slave carrying the bond MAC. That
contradicts "These egress on the active slave" in the new comment.

This changes what the balance-alb prio tests exercise, and the commit
message doesn't mention it.

>  	# set active_slave to primary eth1 specifically
>  	ip -n ${s_ns} link set bond0 type bond active_slave eth1
>  

[ ... ]

> @@ -157,6 +167,9 @@ prio_test()
>  		check_active_slave "eth0"
>  		bond_check_connection "change slave prio"
>  	fi
> +
> +	kill $ping_pid 2>/dev/null
> +	wait $ping_pid 2>/dev/null
>  }

[Severity: Low]
Can the background ping outlive the script? It has no -c or -w, so it
never exits by itself. ping_pid is a local variable in the function,
and this kill only runs when prio_test() returns normally.

The EXIT trap handler, cleanup() in bond_topo_2d1c.sh, doesn't kill
background jobs:

cleanup()
{
	pre_cleanup

	client_destroy
	server_destroy
	gateway_destroy
}

The ping gets orphaned if a signal reaches only the script's PID while
prio_test() is running, for example a manual kill or a harness that
signals only the main PID. It then runs forever and keeps s_ns alive
after ip netns del.

The kselftest runner's process-group timeout and Ctrl-C both reach the
ping, so the common paths are fine.

Would adding -w, or registering kill_process() from net/lib.sh through
defer or the trap, avoid this?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261104142018.552135-1-doebel%40amazon.de
