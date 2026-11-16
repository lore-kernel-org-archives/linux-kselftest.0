Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839409;
	b=Rb7oIW5e49+gWGaPkOLrt7bMJk2CMTDkf1scj+s+MKgLgWv/hVdJekrpsbO3/bydZemw
	 kK8vIykENmJjM8+K4PLu8zKpOrA0yfTEQ5jFX37sshCDpJxRnfp+apa+SPGOdBgglFvIR
	 ts1O7Fne2I6SgvPnZe3oSeESwmSEKMbVOsogTEUoWxo00Se2HHxbS+yhzPYlQBBNfxKbX
	 iClfWaQeBdw5OBWIHdGcqPpdM4tzF44HqEMh5EgOz7Jmvtk7Hq0G2i26W4Tc1h1Aonfge
	 qXgszR1VYv9zMnKvolq38DHPyWnUxdodlyk54/czhD6LFl2ckuimzpDa2fT0ziMwBWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839409;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Vn0CoXfZNedHELRWMAV/2rl0hRsK/nJm0PDmhlk7kvw=;
	b=rTVdzWZxU8EsA/AhmAfS0BzOlrvVFv6U1Zt8brA6X25XHMgy5FVfMbhLKDy/6XcKfnmN
	 648C9ljNlO6kWyEHVquOS5WcEMRW+G7+8EyYEosC1Ac22XR4+ZSDM36k0zB7Urkn0oL7F
	 OgcrLR5UvOzHQdo3u4nAZLrQyulbjdTGWUelNSbGFeZTPTTrjRxyIG5evYvV8rnIq50DG
	 3V6oX5bls2SZ+b/QlMvEJr1/teddimRpJX9o27irTuPMsWYAxRbkx4Hq3MyieJ+SSld+a
	 J8ZA2C9m5eOBjB55b5gbTiqUonW3ELRX2kPRL91rkiV0dp+EGWfBu+vRkp7lP1PCJhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GHu+g0NP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2080D606A335;
	Mon, 16 Nov 2026 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GHu+g0NP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEA81F000D2;
	Mon, 16 Nov 2026 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839409;
	bh=Vn0CoXfZNedHELRWMAV/2rl0hRsK/nJm0PDmhlk7kvw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GHu+g0NP6dHf1oVF30I/5L9AKWSKlhmJxzscd7xf4sijTpM4GFUC212H7hNGV5A5l
	 tM4gnVtVI0exXD+XYfZYfTXT61lvLQZ7+xzb2wOGO1AZNfXwKJNOyS9Yj2xvpsspPR
	 S/F/pqhTAEYexnlX7Y/YQzz1M2J3fadt/cHl5VS0fj9E6om0FudAI3THa/dCy4Dsno
	 i0Tr6k6MyibRrY3tk00pgHTzxMfy8/gDY6PJcRtT22CmeGnUUmJV189HWJjznUONCI
	 1plE5maNxVf9tOcjk3uSZjXJTk+8JfIU6P4Rru/Dk7uTA7GV3eiNU2TXj824pr8L1O
	 T+BLtirSND08Q==
Subject:
 Re: [PATCH net-next v4 11/14] dpll: dpllsim: Add support to adjust phase
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 14:30:07 +0000
Message-ID: <179483940736.3136.8014660218595686890@kernel.org>
In-Reply-To: <20261112130359.840795-12-poros@redhat.com>
References: <20261112130359.840795-12-poros@redhat.com>
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

- [Low] Documentation/driver-api/dpllsim.rst is not updated for the new
  phase-adjust feature, and the series never updates it later.

--

dpll: dpllsim: Add support to adjust phase

This adds phase adjust get and set callbacks to the dpllsim input and
output pin ops. Each pin advertises a 100 ps granularity and a symmetric
range that fits a 32-bit signed value. The stored value is reset to zero
on every live transition.

> diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
> index 0cce8fef232cd..0260bffd15700 100644
> --- a/drivers/dpll/dpllsim/dpll.c
> +++ b/drivers/dpll/dpllsim/dpll.c

[ ... ]

> @@ -197,6 +231,8 @@ static const struct dpll_pin_ops dpllsim_output_pin_ops = {
>  	.frequency_set = dpllsim_pin_frequency_set,
>  	.direction_get = dpllsim_pin_direction_get,
>  	.state_on_dpll_get = dpllsim_pin_state_get,
> +	.phase_adjust_get = dpllsim_pin_phase_adjust_get,
> +	.phase_adjust_set = dpllsim_pin_phase_adjust_set,
>  };
>  
>  static const struct dpll_pin_ops *
> @@ -212,6 +248,9 @@ static void dpllsim_pin_props(struct dpllsim_pin *pin,
>  {
>  	prop->type = pin->type;
>  	prop->board_label = config_item_name(&pin->item);
> +	prop->phase_range.min = -DPLLSIM_PHASE_ADJUST_MAX;
> +	prop->phase_range.max = DPLLSIM_PHASE_ADJUST_MAX;
> +	prop->phase_gran = DPLLSIM_PHASE_ADJUST_GRAN;
>  
>  	switch (pin->type) {
>  	case DPLL_PIN_TYPE_GNSS:
> @@ -275,6 +314,7 @@ static void dpllsim_pin_reset(struct dpllsim_pin *pin)
>  	pin->state = DPLL_PIN_STATE_DISCONNECTED;
>  	pin->frequency = pin->cfg_frequency;
>  	pin->prio = pin->cfg_prio;
> +	pin->phase_adjust = 0;
>  }

[Severity: Low]
This isn't a bug, but should Documentation/driver-api/dpllsim.rst be
updated for phase adjust? The later patches in the series don't touch it
either.

The doc paragraph about netlink-settable state only covers frequency and
priority:

    Every live transition starts from the configured values. A frequency or
    a priority set over netlink while the instance is live is reported back
    over netlink, it is not written to the ``frequency`` or ``prio``
    attribute and is gone once the instance is taken down.

Phase adjust has no configfs attribute, so it has no configured value.
dpllsim_pin_reset() always sets it back to 0.

The doc also lists the prio range and the frequency table for each pin
type. It doesn't mention any of these:

  - the advertised phase adjust range of -2147483600..2147483600 ps
  - the 100 ps granularity
  - the reset to 0 on each live transition
  - output pins accept phase adjust as well as input pins

Would a sentence or two covering these help users of the simulator?

The input pin state setter added earlier in the series is also missing
from that paragraph.

>  
>  /* Build sim->pins in registration order, the order the pins were created */

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112130359.840795-1-poros%40redhat.com
