Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389864;
	b=t+13rcobSq4IfZFhmEoGg7eHm6tsdTF7R1DC6J7tjtID9T+qSWuGkhuB0i9jyUOskZbH
	 /vcIU20EyiWwY758yR/Cl8RwBC9UTdb8yZQSZ0Q/41nwAVa+Y86LCoOd4/Pj3my961VJf
	 WBZ7lavQ+ePe/GubI4QmhHDcp00iKSG2t2VyrNZVpjM67EHD8jXpW/r2W0WVUqDvekRRS
	 THpie/0jQyqBQzH5FMjFjwtcIkV6YlB1jBt9F1ob/sIfij8A74phLIyZVyl+pDXW8dshh
	 wIj8CpCL//pr3rZndCVotPKeVsgJT8Axgj5PIs/rgZ3WM8UkZ/Um74TD+Y9IynxxGUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389864;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LnEy2gNwwGZed6zexISpJOpe9S/xWai8iYl6gzy6RkA=;
	b=QmQPzG6Uh4++svWumMjrSeTDNcvDzI+wBPgc5Mt1EeEgHD+ctqCrEoNbV63c8J1hhokL
	 5y+UreKaOIOHglfe7Hj8m/cZxgjcX2/pE5cEPgOTSPdc3BAlB+uPB9mVEG6Mo1yaBxg8H
	 s2hNanDXtpwanlqxgkamwhX0qpDuPvTeeW9xVbg8x6U+lb889VnfHggXclS00ipK415lp
	 DO1QaB7h9JsP+zPUu2OC2LY3FVZnQKXcYG2hXcLMCa29AZHwZ2vF0ig9YkkzIPymm/xuz
	 Nv/dpYNcWv1WvpQXEOb29nb9vngvaXu8zNDxsLZCpiO4HqFW7zbzBUMKYwZ/7JsuRQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIBNwc4Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95458606A33B;
	Wed, 11 Nov 2026 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIBNwc4Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2231F00A05;
	Wed, 11 Nov 2026 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389864;
	bh=LnEy2gNwwGZed6zexISpJOpe9S/xWai8iYl6gzy6RkA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DIBNwc4ZxNN676gnsmn5Ie0PZeAn7ydmsFwDNMKCknauMS5hMeX2IfRUo6bkLtRtM
	 jJdEoxOWzcmQwjaDQtOUAa2ff6RI2zBYki/44laiiSPhv1vjikn7hGX5opFCozDWph
	 yLNkNInLHHQPwQl3VJlEhezKKkxTtg+CihWaRUVjOxazUEDGycjxdU8anXOm8DCoSb
	 ryHbMJiYW3TNx+V2DN+X9ky/L8l5uwZVvJMsO0klsdMKy0F9K2vNb2p81TmqsWNbxl
	 i73pYwrbSKROELjWY10dH66x10TsNEd1cRlXl7ZHd0nPVVYNl4AzVG0iyv1EoEygVX
	 qEsCKBO7NmPWA==
Subject: Re: [PATCH net-next v3 03/14] dpll: dpllsim: Add configurable pins
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:42 +0000
Message-ID: <179438986299.2199510.5672761213435189612@kernel.org>
In-Reply-To: <20261109093523.931201-4-poros@redhat.com>
References: <20261109093523.931201-4-poros@redhat.com>
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

- [Low] A pin mkdir or rmdir that runs alongside `live=1` on the same
  instance makes the live transition fail with -ENOENT.
- [Low] Two pin-creation limits are visible to users but not documented.
- [Low] dpllsim.rst describes the pin frequency attribute only as 'must
  be supported by the pin type (default 0, which is rejected)' and never…
- [Low] Concern: dpllsim_pin_types[] maps only 5 of the 6 values of enum
  dpll_pin_type and leaves out DPLL_PIN_TYPE_INT_NCO, so a simulated pin…

--

dpll: dpllsim: Add configurable pins

This patch lets a dpllsim device instance carry configurable pins. Each
pin is a configfs directory under pins/ with type, frequency and direction
attributes. At live=1 the pins are validated, ordered, obtained and
registered with the DPLL subsystem after the device, and while the
instance is live the pin items are held with
configfs_depend_item_unlocked().

> diff --git a/drivers/dpll/dpllsim/core.c b/drivers/dpll/dpllsim/core.c
> index 0772f409d013b..97b3cf48772e7 100644
> --- a/drivers/dpll/dpllsim/core.c
> +++ b/drivers/dpll/dpllsim/core.c

[ ... ]

> +static struct config_item *dpllsim_pins_make_item(struct config_group *group,
> +						  const char *name)
> +{
> +	struct dpllsim_dev *sim = container_of(group, struct dpllsim_dev,
> +					       pins_group);
> +	struct dpllsim_pin *pin;
> +
> +	lockdep_assert_held(&dpllsim_subsys.su_mutex);
> +
> +	if (dpllsim_dev_frozen(sim))
> +		return ERR_PTR(-EBUSY);
> +	if (list_count_nodes(&sim->pin_list) >= DPLLSIM_MAX_PINS)
> +		return ERR_PTR(-ENOSPC);

[Severity: Low]
Should these two mkdir limits be described in
Documentation/driver-api/dpllsim.rst?

Once the instance is frozen, mkdir of a new pin fails with EBUSY. Once
the instance has DPLLSIM_MAX_PINS (128) pins, it fails with ENOSPC. The
documentation only says:

    Structural attributes return EBUSY while the instance is live
    and pins of a live instance cannot be removed.

It doesn't say that pins can't be added to a live instance, and it
doesn't mention the 128 pin cap. The commit message also says an instance
can carry "an arbitrary set of them".

Separately, a pin with an invalid frequency or direction makes live=1
fail with a bare -EINVAL from dpllsim_order_pins():

	list_for_each_entry(pin, &sim->pin_list, list) {
		if (!dpllsim_pin_frequency_valid(pin) ||
		    !dpllsim_pin_direction_valid(pin))
			return -EINVAL;

Nothing tells the user which pin was rejected. Could that be reported?

> +
> +	pin = kzalloc_obj(*pin);

[ ... ]

> +/* Pin mkdir and rmdir run under the subsystem mutex like live transitions */
> +static void dpllsim_pins_drop_item(struct config_group *group,
> +				   struct config_item *item)
> +{
> +	list_del(&to_dpllsim_pin(item)->list);
> +	config_item_put(item);
> +}

[ ... ]

> +static int dpllsim_dev_depend_pins(struct dpllsim_dev *sim)
> +{
> +	struct dpllsim_pin *pin;
> +	int err;
> +
> +	list_for_each_entry(pin, &sim->pin_list, list) {
> +		err = configfs_depend_item_unlocked(&dpllsim_subsys,
> +						    &pin->item);

[Severity: Low]
Can a pin mkdir or rmdir that runs at the same time as "echo 1 > live" on
the same instance make this return -ENOENT?

The comments above dpllsim_pins_drop_item() and dpllsim_dev_live_store()
say the subsystem mutex excludes pin mkdir and rmdir. However, configfs
only holds su_mutex around the make_item() and drop_item() callbacks.

For mkdir, dpllsim_pins_make_item() adds the pin to sim->pin_list under
su_mutex. The dirent is only attached and readied after the mutex has
been dropped:

fs/configfs/dir.c:configfs_mkdir() {
    ...
	mutex_unlock(&subsys->su_mutex);
    ...
		ret = configfs_attach_item(item, dentry, frag);
    ...
		configfs_dir_set_ready(dentry->d_fsdata);
    ...
}

Suppose dpllsim_dev_live_store() takes su_mutex inside that window.
dpllsim_dev_depend_pins() then finds the half-created pin on pin_list.
configfs_depend_prep() doesn't find it, either because there is no
dirent yet or because it skips CONFIGFS_USET_CREATING entries. So
live=1 fails with -ENOENT.

rmdir has the same window. configfs_rmdir() marks the item as dropping
in configfs_detach_prep() and detaches the dirent without su_mutex. Only
after that does it take su_mutex for
client_drop_item()->dpllsim_pins_drop_item(), which does the list_del():

fs/configfs/dir.c:configfs_rmdir() {
    ...
			ret = configfs_detach_prep(sd, &wait);
    ...
		configfs_detach_item(dentry);

		mutex_lock(&subsys->su_mutex);
    ...
	client_drop_item(parent_item, item);
	mutex_unlock(&subsys->su_mutex);
    ...
}

A live=1 in between still sees the pin on pin_list, and the depend fails
with -ENOENT.

Nothing is corrupted and a retry succeeds. Should the comments be
corrected, or should a pin that is still being created or removed be
handled here?

> +		if (err) {
> +			dpllsim_dev_undepend_pins(sim, pin);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}

[ ... ]

> diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
> index ae2c8fcf238c6..a1d5921fb8d01 100644
> --- a/drivers/dpll/dpllsim/dpll.c
> +++ b/drivers/dpll/dpllsim/dpll.c

[ ... ]

> +static void dpllsim_pin_props(struct dpllsim_pin *pin,
> +			      struct dpll_pin_properties *prop)
> +{
> +	prop->type = pin->type;
> +	prop->board_label = config_item_name(&pin->item);
> +
> +	switch (pin->type) {
> +	case DPLL_PIN_TYPE_GNSS:
> +		prop->freq_supported = dpllsim_freq_1pps;
> +		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_1pps);
> +		break;
> +	case DPLL_PIN_TYPE_INT_OSCILLATOR:
> +		prop->freq_supported = dpllsim_freq_int_osc;
> +		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_int_osc);
> +		break;
> +	case DPLL_PIN_TYPE_MUX:
> +	case DPLL_PIN_TYPE_SYNCE_ETH_PORT:
> +		prop->freq_supported = dpllsim_freq_synce;
> +		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_synce);
> +		break;
> +	default:
> +		prop->freq_supported = dpllsim_freq_ext;
> +		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_ext);
> +		break;
> +	}
> +}

[Severity: Low]
Should dpllsim.rst list the frequencies each pin type accepts? The
frequency row only says:

    Frequency in Hz, must be supported by the pin type
    (default 0, which is rejected)

dpllsim_pin_frequency_valid() accepts only the fixed tables chosen here:

    gnss: 1 Hz
    int-oscillator: 25 MHz
    synce-eth-port and mux: 1.544, 2.048, 10 and 25 MHz
    ext: 1 Hz and 10, 19.44, 25, 77.76, 125, 156.25 MHz

The documentation also doesn't say that mux uses the SyncE table.

freq-supported can only be seen over netlink after live=1 has succeeded.
An unsupported frequency makes live=1 fail with a bare -EINVAL that
names neither the pin nor the value.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
