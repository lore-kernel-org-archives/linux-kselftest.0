Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079983;
	b=LixveXSSgmMJ/7lf+RsmHaMDXUmXUkUIBGrvpo+BnHvtBiRdTm1XTCPKDnrYDg7EfUeh
	 TMdgt5hEt+yf+T0+UgzYkGkrSu4OlV9o/WiDmAi+QLfvouR3NLp7n0znqI+NAWq9UvkqS
	 Snq1XR1jowkxu6oO1jNX3+cteHbV8QFP6K96fEbgAjXyc3H6k2p0lW/z/mhQKEHYlPfdZ
	 t5xuq9l7bxsPIaITXszDwyyO3ZfJ5jTLhW0g9nqH6F1s+FbCrWiZiE2nxdIRGvg7nmnKL
	 TLW9iu7P0vG5AnUzTkbIA2xUt4nygSxr3s+HfdVfvrcAWh/RSebBnNKdZqQtyJI21Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079983;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZgfM334JTLYV95P+o/xXAJhYa05J9zkqyuWENMt/Zo8=;
	b=lmQJiIqS++S/tPlFvr4Oe0E6KRW02Q3Ld0frMyXpvERvyrdc+1sX7jEnV/SKlLxujnHn
	 hU9Ao3bJeXbu6nfdQg0YQux+daWZav1Ai0mlceUcwtE92weWBAya3NVAIPzxS9VLkJzuE
	 R3dr6RSC3sHcx2oPRVShDmicPcUD5Jp7yVaiTKp/wSctFkhno4lgmkp4t01xCm73Ej3tI
	 +mRiEaQU+VtEAHtjUH2k5c2gNyfgAoHaJFn53OHGORgLHgtyNSogq5dk8hCsEHXsy0Gc0
	 YxIY3ecslkroU9MI8P8IbpHYci3p+zfFhYzW93sYA5pkoD5pft3/3Ij8JugQyg6eULw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QINnaWtj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11C9606A334;
	Thu, 19 Nov 2026 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QINnaWtj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05271F000C4;
	Thu, 19 Nov 2026 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079983;
	bh=ZgfM334JTLYV95P+o/xXAJhYa05J9zkqyuWENMt/Zo8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QINnaWtjGPEEthx1qTlDo3t9yxyTHftOcJVCu4shsdo800Lo80VpeEBh0w6eKY+ri
	 B5r6+D4g43Z5iN6SjEscQQC2JOjwsBHyW3p4IlPApFkiROyjEjs55JQa8M8Z5S6lUG
	 vqd6FU6SmsZ3UKhSl5Xa7XxKqEu2nlA+3rmkwCwbSFCZj35nJzYgaYJ4IS7fqfCAp2
	 WC7VG5R/2lWbysdICICGHCpD+mDZSvzQqs48Is3IKyZtHd/YQqf0z3YgWA+rZkwNu8
	 FOn+Wua+AkVIAQIe0w11zsqlVeMskp3Fj7ftKsguaIRqoHl2jnFrNTGJwvHCePpgA8
	 aIUm1781Fh7wg==
Subject: Re: [PATCH net-next 5/6] bonding: 3ad: Advertise Collecting only
 after collection is enabled
From: netdev-bot+sashiko@kernel.org
To: idosch@nvidia.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@kernel.org, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, petrm@nvidia.com, sridhar.samudrala@intel.com,
 jiri@resnulli.us, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, razor@blackwall.org
Date: Thu, 19 Nov 2026 09:19:42 +0000
Message-ID: <179507998243.3136.12068101065568780220@kernel.org>
In-Reply-To: <20261118083442.1061289-6-idosch@nvidia.com>
References: <20261118083442.1061289-6-idosch@nvidia.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In __update_lacpdu_from_port() (drivers/net/bonding/bond_3ad.c),
  the patch clears LACP_STATE_COLLECTING in lacpdu->actor_state when…
- [Low] While the Rx notification is pending, procfs ("details actor lacp
  pdu: port state"), sysfs ad_actor_oper_port_state and netlink…
- [Low] __update_lacpdu_from_port() masks only LACP_STATE_COLLECTING
  while the Rx notification is pending.

--

bonding: 3ad: Advertise Collecting only after collection is enabled

When coupled control is disabled, this commit clears the Collecting bit in
transmitted LACPDUs while the port's Rx state change notification is still
pending. Once the notification is delivered, ad_tx_machine() sets ntt so
that a new LACPDU advertising Collecting goes out.

> diff --git a/drivers/net/bonding/bond_3ad.c b/drivers/net/bonding/bond_3ad.c
> index d2a55f4d89791..61f6de803b667 100644
> --- a/drivers/net/bonding/bond_3ad.c
> +++ b/drivers/net/bonding/bond_3ad.c

[ ... ]

> @@ -903,6 +916,9 @@ static inline void __update_lacpdu_from_port(struct port *port)
>  	lacpdu->actor_port_priority = htons(port->actor_port_priority);
>  	lacpdu->actor_port = htons(port->actor_port_number);
>  	lacpdu->actor_state = port->actor_oper_port_state;
> +	/* Collection is only enabled once the Rx state change is notified */
> +	if (__port_rx_notify_pending(port))
> +		lacpdu->actor_state &= ~LACP_STATE_COLLECTING;

[Severity: Low]
This masks only Collecting. Can the transmitted actor_state have
Distributing set while Collecting is cleared?

Suppose rtnl_trylock() fails in bond_3ad_state_machine_handler() at the end
of the run that entered AD_MUX_COLLECTING. Then should_notify_rx stays set.
On the next tick, ad_mux_machine() can move to AD_MUX_DISTRIBUTING based
only on the partner's state:

	case AD_MUX_COLLECTING:
		if (!__port_move_to_attached_state(port)) {
			if ((port->sm_vars & AD_PORT_SELECTED) &&
			    (port->partner_oper.port_state & LACP_STATE_SYNCHRONIZATION) &&
			    (port->partner_oper.port_state & LACP_STATE_COLLECTING)) {
				port->sm_mux_state = AD_MUX_DISTRIBUTING;

Entering that state then does:

	case AD_MUX_DISTRIBUTING:
		port->actor_oper_port_state |= LACP_STATE_DISTRIBUTING;
		port->actor_oper_port_state |= LACP_STATE_SYNCHRONIZATION;
		ad_enable_collecting_distributing(port,
						  update_slave_arr);

As far as I can tell, the __enable_port() path does not clear
should_notify_rx, because the slave's Rx state is already enabled.

Any LACPDU sent before RTNL is obtained, such as the periodic one, would
then carry Distributing=1 and Collecting=0. The 802.1AX mux machine never
produces that combination.

Would it make sense to also mask LACP_STATE_DISTRIBUTING while the
notification is pending?

[Severity: Low]
Only the transmitted copy is masked here. While the notification is
pending, procfs, sysfs and netlink still report port->actor_oper_port_state
with Collecting set. For example, bond_info_show_slave() in bond_procfs.c
does:

	seq_puts(seq, "details actor lacp pdu:\n");
	...
	seq_printf(seq, "    port state: %d\n",
		   port->actor_oper_port_state);

The sysfs ad_actor_oper_port_state file and the netlink
IFLA_BOND_SLAVE_AD_ACTOR_OPER_PORT_STATE attribute are named after
actor_oper_port_state, so they report what their names say. The procfs
block, however, is labelled as the actor LACP PDU, and for a short time it
now shows a different value from the one on the wire.

Is this difference intended? If so, should the procfs label be adjusted or
the difference documented?

Later in this series, "selftests: bonding: Test that Collecting is
advertised after notification" adds test coverage for the transmitted
LACPDU. Its collecting_advertise() captures LACPDUs and checks that
Collecting is only advertised after the 0x1f notification. That test also
suggests the notification is meant to carry the unmasked state.

>  	slave_dbg(port->slave->bond->dev, port->slave->dev,
>  		  "update lacpdu: actor port state %x\n",
>  		  port->actor_oper_port_state);

[Severity: Low]
Should this debug message print lacpdu->actor_state now?

While the Rx notification is pending, the message prints
port->actor_oper_port_state with Collecting set (for example 0x1f). The
LACPDU on the wire carries 0x0f. Before this patch the two values were
always the same.

Printing lacpdu->actor_state, or both values, would keep the message in
line with what is sent.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118083442.1061289-1-idosch%40nvidia.com
