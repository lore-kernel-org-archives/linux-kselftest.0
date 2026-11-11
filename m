Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389869;
	b=t8wo6TDEE5QV8h/0Wlu1Jg87RtTMRZ0KPtzQ1RU5X0xP1Oa4rcO8qsI/bEpsmnoSC19i
	 hNl/DLair4uVosti6/6OIfSVVQrFG0izdrGScwq7QfYLDFJj8ARALSE+77oxWD96Qhuhl
	 WrmtDhfy0QYFwY+ll8jc+DFTwsGAIG93R6aS3AZhMZyH3N2DftCFiKXbJsmW1vULnix+M
	 0VtrIsnSGed137/rzDP7Jlfup1Nl3QX01vj0IhNT6plcTfrswT0VDXhx50VheO8l3T+y0
	 RFyud8Eilr2tpZlje3iIWCRSWa+ZyaDfV5jmjJhLVPNNsqwTo4eoTsuhvTsw7cqwi+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389869;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7cU38DoVjW3VyYZPHW4NAYGDfjUuJ2rdWA3h6vVFBbk=;
	b=mhYdyT8By3/LKRkEObzWNpK2IZJXTTreJxtOngHfqyRDWvAS15gmIjS862sisgce03vS
	 VNWKoUAbv7sIfGGvParvQ74/MpfsMyGNkUOvrs0KcKGwdS7xm6WtXyZdTRbZUtpXsbplg
	 nZ4jaTIvRt9pJgxe8RvK2uXVOuadbdCi8CdfUa9XqVqhyAbYjZ1C9KS5yLyyzwJ0IZrLl
	 Q6ZFiQVpLEID2lziYjcR455FARNvNvcoEF+n0CEXuhyaQpAmfNqLQdDLMVm6xKFkCY6iC
	 20mDccb0ySQt1Vv5o2DahlIcUD3fBSWJyB/HYUpzbtJXmfTxjL5j4odiKeQtuRExxuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FC8vOu0a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB366606A336;
	Wed, 11 Nov 2026 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FC8vOu0a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCB21F00A0D;
	Wed, 11 Nov 2026 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389869;
	bh=7cU38DoVjW3VyYZPHW4NAYGDfjUuJ2rdWA3h6vVFBbk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FC8vOu0a+yZAK4AvhhIbauSPdakVlkaMBIR4gUH7DOdkQmIEz8q9q9EltXZkx7FLV
	 qvzMziGNJQOBSiAeo8BRehMxpX/6udZyrV9b2862WoWgJPyub6kmWvkc0pRYbkV+t4
	 41ZdZwSwyJm56w6dmr0d4Z8N3fHHXpP1CkL4wYClF4J+SiIFAu0HCTJBOyPth1PbG/
	 AmA4Og2tCWB605JXQd8RuIcjP58RnlKF/MxYRDKmdRYs/rBkBmBMb/tFEEM5XVeQgS
	 2HVJnXDwJFHNEPBX4ZWzeznoB93oK0lqO82E8izNymNnPLA6ZLqmHVEo3hJn1XBYqh
	 CHq8JIrb03j6g==
Subject: Re: [PATCH net-next v3 07/14] dpll: dpllsim: Add support to get/set
 priority on input pins
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:47 +0000
Message-ID: <179438986776.2199510.9356026341300258964@kernel.org>
In-Reply-To: <20261109093523.931201-8-poros@redhat.com>
References: <20261109093523.931201-8-poros@redhat.com>
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

- [Low] One field, `pin->prio`, holds both the configfs setting and the
  live value.
- [Low] Documentation/driver-api/dpllsim.rst (line 39) describes the new
  `prio` attribute as 'Priority 0-255 used for automatic reference…

--

dpll: dpllsim: Add support to get/set priority on input pins

This commit adds prio_get and prio_set callbacks for dpllsim input pins
and advertises the priority-can-change capability. It also adds a prio
configfs attribute that sets the initial priority before the device goes
live. Going live is rejected when an output pin has a non-default
priority.

> diff --git a/Documentation/driver-api/dpllsim.rst b/Documentation/driver-api/dpllsim.rst
> index e7c5ee93392c2..5109d67325f14 100644
> --- a/Documentation/driver-api/dpllsim.rst
> +++ b/Documentation/driver-api/dpllsim.rst
> @@ -36,6 +36,9 @@ Pin directory ``/sys/kernel/config/dpllsim/<dev>/pins/<pin>/``:
>                 (default 0, which is rejected)
>  ``direction``  ``input`` or ``output`` (default ``input``), a ``mux`` pin
>                 must be an input
> +``prio``       Priority 0-255 used for automatic reference selection,
> +               input pins only, output pins must keep the default
> +               (default 128)

[Severity: Low]
Is "used for automatic reference selection" accurate for dpllsim at this
point?

As far as I can tell, only dpllsim_pin_prio_get(), dpllsim_pin_prio_valid()
and dpllsim_pin_prio_show() read pin->prio. The device ops have no
selection logic:

static const struct dpll_device_ops dpllsim_dpll_ops = {
	.mode_get = dpllsim_mode_get,
	.lock_status_get = dpllsim_lock_status_get,
};

sim->lock_status stays at the DPLL_LOCK_STATUS_UNLOCKED value set in
dpllsim_make_group(). Nothing changes a pin's state based on its priority.

The example further down sets gnss0 prio 0 and ext0 prio 1 as if that sets
up a reference order. The selftest library comment in
dpllsim_setup_standard_device() ("gnss0: ... prio 0 (active reference)")
gives the same impression.

The commit message says priorities "will drive the automatic reference
selection once the simulation loop exists". I couldn't find a later patch
in the series that adds that loop.

Could the documentation say that the priority is currently only stored and
reported back?

[ ... ]

> diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
> index 794020d0c112e..5e36059609761 100644
> --- a/drivers/dpll/dpllsim/dpll.c
> +++ b/drivers/dpll/dpllsim/dpll.c

[ ... ]

> +static int dpllsim_pin_prio_set(const struct dpll_pin *pin, void *pin_priv,
> +				const struct dpll_device *dpll,
> +				void *dpll_priv, u32 prio,
> +				struct netlink_ext_ack *extack)
> +{
> +	struct dpllsim_pin *sim_pin = pin_priv;
> +
> +	if (prio > DPLLSIM_PIN_PRIO_MAX) {
> +		NL_SET_ERR_MSG_FMT(extack, "Pin priority must be in range 0-%u",
> +				   DPLLSIM_PIN_PRIO_MAX);
> +		return -EINVAL;
> +	}
> +
> +	guard(mutex)(&sim_pin->dev->lock);
> +	sim_pin->prio = prio;

[Severity: Low]
Should the netlink setter write to the same field that holds the
priority configured through configfs?

dpllsim_pins_make_item() and dpllsim_pin_prio_store() set pin->prio, and
this function writes it at runtime. On each live=1, dpllsim_order_pins()
calls dpllsim_pin_reset(), which resets ops and state but not prio:

static void dpllsim_pin_reset(struct dpllsim_pin *pin)
{
	pin->ops = dpllsim_pin_select_ops(pin);
	pin->state = DPLL_PIN_STATE_DISCONNECTED;
}

dpllsim_dev_undeploy() doesn't restore the configured value either.

Consider this sequence:

  echo 1 > pins/ext0/prio
  echo 1 > live
  dpll pin set ... prio 200
  echo 0 > live
  echo 1 > live

The second deployment starts with prio 200. Reading pins/ext0/prio through
dpllsim_pin_prio_show() also returns 200, which was never written through
configfs.

There is a second case. Take an input pin whose prio was changed over
netlink to something other than 128. Then write 0 to live, write output
to direction, and write 1 to live. The live write fails with EINVAL from
dpllsim_order_pins(), because of a priority that was only set at runtime:

static bool dpllsim_pin_prio_valid(const struct dpllsim_pin *pin)
{
	return pin->direction == DPLL_PIN_DIRECTION_INPUT ||
	       pin->prio == DPLLSIM_DEFAULT_PIN_PRIO;
}

The commit message describes the attribute as setting the initial priority
"so that a test can lay out the reference order before the device goes
live". Neither the commit message nor dpllsim.rst says that netlink
changes carry into later deployments and replace that layout.

The later commit "dpll: dpllsim: Add support to set frequency on pins"
takes the same shared-field approach for frequency. No later patch in the
series separates the configured and runtime prio or resets it.

Would it make sense to keep the configured priority separate and copy it
into the runtime value in dpllsim_pin_reset()?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
