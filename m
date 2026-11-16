Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839405;
	b=ZlLdnCfgaCIVoTKm32fQyjPgqnR6QEoWMOELx4LXfkt9btMCYRkJavurYx2UB5Rlkm58
	 B9zvU5Mnf8dmAQtRj8C6+En9OiKey1QJSzH0IzAwKQXzYw9DO9i2Lb1R971A5pmOGc2mg
	 2A2EgxkSmfKX5xLR8W/EYrYKarAVbNaegCj0k04860yefCTP0+V7R2XjU0egkxme+B8Gv
	 KUeKXzJyvDJgg1uwpm6j74n1NRkn5K/df+PFcoQti0FPSW1PsC67SaWNpwf7vJlAeUMVB
	 liQzwDBR5PNpX71uXUsBaTWGQXBmPvosNKZ7y6Y/ydtDl9hgP22xTOefgvSe2ObJXdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839405;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Djq3RZOWfZKIt3UCC39UNmXjeYuoOEudxGZrjWZ7UEk=;
	b=q1J6NYlijmM0a829AAQDbS8HoyhcSO9Nc/kaLeRfRYl7FrRIU5r48m+/3jz6RE9V96An
	 o+SOAAkhf3IVpvQaWK1mUYQ/MPFU+tzIzPAvOI4q75jHSuR+srtX8t9MQBTnmbw9LNN3F
	 uvNFVu/zoHy3UmX6xTv579YFMYLA9HtmR9TJSXouf9xfwv0jDO/vg64dlx0jay0XbLDW8
	 JIiiRmedNoxwKrZ47HXDIhxMuYx1LrYKlaDRCQHEHYtkJni0gScyWw6kBi1vcttBfzYKb
	 mqIH9qbyiONGNntPaGgyBbfRCppH2eQWeNKd4G1dfydrcfpW2ttdxG43pANxzkW9kUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpBlD6Ok;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C6E606A887;
	Mon, 16 Nov 2026 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpBlD6Ok
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5311F000C4;
	Mon, 16 Nov 2026 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839405;
	bh=Djq3RZOWfZKIt3UCC39UNmXjeYuoOEudxGZrjWZ7UEk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QpBlD6Okka+nV7d1i9Wv1zODJ5InbxFC8/AR2fXDUp1DPQoxNed4pPzd+RHkKdoko
	 H5O0v9rUBMImneLfKeUig1C8afA36Ky0FD+Up1m3DzjccZzvN8IwYtE2+D/nQL47i2
	 rdd6V6bi030gLjU2kijhiMdMNzoBrUmQ6PjEL0nC7BvzZio4wmJPldVjpKf6vldpi+
	 yVmc7EHWMq3ENHt+1VgFSRybPU8fVMdCfOTw9J6MGtR1JApKYthMuZGqTgk3X09DY1
	 NstE6MsnQtnoI4L0w13enEtVIbl8izlM07FaedU1azbTfxTlRMVotTMSpBg4uZyEaP
	 EBwfEluuWu1tQ==
Subject: Re: [PATCH net-next v4 08/14] selftests: dpll: add pin priority test
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 14:30:03 +0000
Message-ID: <179483940380.3136.1462332477683774177@kernel.org>
In-Reply-To: <20261112130359.840795-9-poros@redhat.com>
References: <20261112130359.840795-9-poros@redhat.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In test_pin_priority_get_set
  (tools/testing/selftests/drivers/dpll/dpll_features.sh), the candidate…
- [Low] test_pin_priority_get_set (dpll_features.sh, line 93) ignores the
  exit status of dpll_pin_get_prio: `before=$(dpll_pin_get_prio…
- [Low] Part of the commit message rationale is out of date after v4.

--

selftests: dpll: add pin priority test

This adds test_pin_priority_get_set() to dpll_features.sh. The test writes
the current priority of a spare input pin back, sets a new priority from a
list of candidates, reads it back and restores the original. The
dpllsim_add_pin helper gains an optional priority argument, and the
standard and stress simulator devices now set priorities on their input
pins.

> The range of priorities a device accepts is
> not advertised over netlink, so the test tries one below the current
> value and then the small values every driver accepts, since a large
> current value may mark an unused pin outside the settable range, as the
> ice driver does with 255. A driver may still refuse all of them for a

[Severity: Low]
Is this rationale still accurate after the v4 change? In v4,
test_pin_priority_get_set() first writes the current value back, and
returns if the device refuses it:

    if ! dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"; then
        ...
        return
    fi

So a current value outside the settable range, such as 255 on ice, ends
the test before the candidate loop runs. The fallback to 1 and 7 now
matters only when before is 0, or when the device accepts its current
value back but refuses before - 1.

Also, "the small values every driver accepts" is followed by "A driver may
still refuse all of them". These two statements contradict each other.

> The standard device lays its inputs out as gnss0 with priority 0 and
> ext0 with priority 1, and the stress devices get random priorities on
> their input pins.

create_stress_device() gives ext0 a fixed priority of 1, and
test_deploy_cycle() uses the fixed values 0 and 1. Could the message say
that only the extra input pins of the stress device get random
priorities?

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> index 0a00a18bded2c..f7340bd89602f 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh

[ ... ]

> @@ -70,6 +71,79 @@ pin_tune_capable()
>  	return 1
>  }
>  
> +test_pin_priority_get_set()
> +{

[ ... ]

> +	pin_tune_capable priority-can-change "DPLL pin priority set/get" \
> +			 "priority cannot change" || return
> +
> +	before=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
> +	if [ -z "$before" ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
> +		    "prio not reported"
> +		return
> +	fi

[Severity: Low]
Should the exit status of dpll_pin_get_prio() be checked here? When the
dpll tool fails, __dpll_pin_dev_field() returns 1 with empty output:

    out=$(dpll pin show id "$pin_id" -j 2>/dev/null) || return 1

So a failed query and a pin with no prio in its parent-device nest both
end up as "prio not reported". On a device provided by the user, that is
logged as a skip, not a failure.

pin_tune_capable(), just above, already tells a failed query apart from a
missing capability. The later frequency and phase adjust tests in the
series also make that distinction for their getters.

> +	# A device may report a priority it does not accept back, one that
> +	# marks an unused pin for instance, and the pin could not be
> +	# restored then. Writing the current value changes nothing, so
> +	# that is tried before the pin is touched.

[ ... ]

> +	# The accepted range is not advertised, so try one below the current
> +	# value and then small values, a refusal of all of them is a skip on
> +	# a device the user provided, the simulator accepts every value
> +	# tried here.
> +	target=""
> +	for candidate in $((before - 1)) 1 7; do
> +		[ "$candidate" -ge 0 ] && [ "$candidate" != "$before" ] ||
> +			continue
> +		if dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
> +				     "$candidate"; then
> +			target=$candidate
> +			break
> +		fi
> +		reason=${DPLL_LAST_ERR%%$'\n'*}
> +	done
> +	if [ -z "$target" ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
> +		    "cannot set a new prio${reason:+, $reason}"
> +		return
> +	fi
> +	after=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
> +	if [ "$after" != "$target" ]; then
> +		check_err 1 "priority expected $target, got '$after'"
> +	fi

[Severity: Medium]
Can this candidate order make the device switch its reference in
automatic mode? pin_is_spare() accepts a pin whose state is selectable:

    (.state == "disconnected" or
     .state == "selectable")) and

A lower number means a higher priority. Both before - 1 and then 1 move
the spare pin toward or above the current reference.

For example, take a reference at prio 2 and a spare pin at prio 3. Then
before - 1 ties with the reference, and 1 puts the spare pin above it.

Candidate 7 is tried whenever before is not 7. So when before < 7, it
lowers the priority instead.

After the set, only the prio is read back and the pin state is not
checked. A reference switch on hardware (ice, or zl3073x when the ref is
selectable) would go unnoticed.

On a non-revertive device, the switch can remain after the deferred
restore, and the restore still reports success.

There is also no re-check like the one in test_pin_state_transitions():

    if [ "$mode" = automatic ] && [ "$before" = connected ]; then
        dpll_log_test_skip_or_fail "DPLL pin state transitions" \
            "spare input pin became the reference"
        return
    fi

test_pin_state_transitions() runs first. Through its
automatic/selectable/connected exception, it accepts the pin being left
connected.

Could test_pin_priority_get_set() then change the priority of what is now
the device's reference? When before < 7, it would lower that priority
with 7.

The script header warns that a spare pin with a valid signal can still be
selected. Would it make sense to try values that lower the priority
first, or to check the pin state before and after the set?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112130359.840795-1-poros%40redhat.com
