Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389871;
	b=FIgeeYIqJMUifOu8xH2RNhiy8gSiceFjKZV6BTVaCK6mO6A3VH0krjkolfj1/T8Y50gx
	 0Oh48A/eq63MdXEGwCbH43Zqn3sywly8qK4++hATYDN03tbRPurhapAiWzXQo7zTJiBXG
	 /+0he/L58+D9sy5V9EqeL5SUxuhzYNYh2jAfo7psD9+sItm6+tH8SV+sUmHvUQDK9F1Wr
	 ppYfIRaC3gZPMLgbOugqVpnXoTL56PQqsj8ZQSaArp/I+nTe1kU20tw0b7Dzvu58q4IuG
	 +VT09tGTBtDm1O7QqPuzLf1gtE++xHNRXIZk0vmLFZ8qNuvqZymv3M8INspodXs/aAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389871;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ER4yqahQ5ZFgcMtry2SA5Dt9v7EW2BpAfsXeWQFD2tQ=;
	b=T/nvvN2fzQtEyUjIdUUlROaBKa1rn1dCGwmFXmGCOEUxSjMMvw/TbRmhUlJHtBy6uEed
	 9OJwEhaL65Wwe+2/LF8MW0ubUXPCrgmaQX0Te9BDSZFRU621ZvrKaEQlKJcO5n6RWIUJc
	 8tdHHyl0nYwAVfApBD1iUao9X7zWyxPwjpHKt+7l+DN3whq3JGfZYJpRZw6ZuS9LSErKa
	 c9z7E8FQTnnD8SttE1DX0vzlxXGMmtZY7sl+f3IeDANt9cZpQfBxAbnLXi4WATNqLPqdf
	 /l6AkmSqt8aMxJFTauc7/SgNyku6rvUxa4r9wcHNHy2ottaSqdGI3Od+cJQkR6kXGLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zu4khBmu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445D8606A33F;
	Wed, 11 Nov 2026 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zu4khBmu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B621F00A07;
	Wed, 11 Nov 2026 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389870;
	bh=ER4yqahQ5ZFgcMtry2SA5Dt9v7EW2BpAfsXeWQFD2tQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Zu4khBmuMJDijZq7jx13joav4HI5ulOVDzOq9anNIkEwcNtX15NtHh7V8HDcDcYnq
	 BxaT8gvfLkqhhvcZOaJyyBTqYXH+ezOThjRmARxjCEbjORK8FSdcZufeu1IdK2cCDR
	 ktl6HUih3vHT6zFByEP91/x8eYlAEkCuO5UoqSAixQLcw/t9im3TBjC5bXoA4kYXMU
	 Af3fkaIjWUiVDkylSGfBPU+zWHVW14u+Oq5yG5JVi7tPxmd+Bg1vsZryV0xkaY0ts0
	 0uOX86iR10urw3RQVfL2GBRnoRvz6qJymfuvPLTTs1nViM/hb2GwYcyAXFJlQp1Q7j
	 BJsMv2vtXyLBg==
Subject: Re: [PATCH net-next v3 08/14] selftests: dpll: add pin priority test
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:49 +0000
Message-ID: <179438986953.2199510.11828052858797872845@kernel.org>
In-Reply-To: <20261109093523.931201-9-poros@redhat.com>
References: <20261109093523.931201-9-poros@redhat.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] pick_tune_pin() says PIN_TUNE_ID "must not be the reference
  the device is locked to" and that tests skip "rather than…
- [Medium] The candidate loop in test_pin_priority_get_set() is built for
  the case the commit message describes: "a large current value may mark…
- [Low] The comment in test_pin_priority_get_set()
  (tools/testing/selftests/drivers/dpll/dpll_features.sh) and the commit…
- [Low] This patch adds a layout comment above
  dpllsim_setup_standard_device() in…

--

selftests: dpll: add pin priority test

This adds test_pin_priority_get_set() to dpll_features.sh. The test sets a
new priority on a spare input pin, reads it back and restores the original
value. dpllsim_add_pin() gains an optional priority argument, and the
standard and stress simulator devices now set priorities on their input
pins.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> index 874007411bc5e..b4b1eff322a21 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh

[ ... ]

> +	before=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
> +	if [ -z "$before" ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
> +		    "prio not reported"
> +		return
> +	fi
> +	defer dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"
> +
> +	# The accepted range is not advertised, so try one below the current
> +	# value and then small values, a refusal of all of them is a skip on
> +	# a device the user provided, the simulator accepts every priority.

[Severity: Low]
Is "the simulator accepts every priority" accurate? The commit message makes
the same claim. However, dpllsim_pin_prio_set() rejects anything above
DPLLSIM_PIN_PRIO_MAX, which is 255 in dpllsim.h:

drivers/dpll/dpllsim/dpll.c:dpllsim_pin_prio_set() {
    ...
	if (prio > DPLLSIM_PIN_PRIO_MAX) {
		NL_SET_ERR_MSG_FMT(extack, "Pin priority must be in range 0-%u",
				   DPLLSIM_PIN_PRIO_MAX);
		return -EINVAL;
	}
    ...
}

The configfs store dpllsim_pin_prio_store() applies the same limit.

The test still works today. Since before is capped at 255, the candidates
(before - 1, 1 and 7) are always in range.

This comment is the reason a refusal on the created device is a failure and
not a skip. Could it say "every priority in 0-255" or "every value tried
here"? The comment is still the same at the end of the series.

> +	target=""
> +	for candidate in $((before - 1)) 1 7; do
> +		[ "$candidate" -ge 0 ] && [ "$candidate" != "$before" ] ||
> +			continue
> +		if dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
> +				     "$candidate"; then

[Severity: Medium]
Can this make a user-provided device switch its reference?

The comment above pick_tune_pin() says PIN_TUNE_ID "must not be the
reference the device is locked to". It also says tests skip "rather than
reconfiguring the reference". But pick_tune_pin() accepts selectable pins:

	case "$state" in
	disconnected|selectable)
		;;

In automatic mode, a selectable input takes part in reference selection by
priority. This loop gives that pin a higher priority (a smaller value). It
never compares the new value with the priority of the current reference.

On a device set through DPLL_DEV_ID or DPLL_DRIVER, the new priority reaches
hardware straight away. zl3073x_dpll_input_pin_prio_set() writes REF_PRIO
through zl3073x_chan_state_set() when zl3073x_chan_ref_is_selectable()
holds. ice_dpll_hw_input_prio_set() sends it to the CGU firmware through
ice_aq_set_cgu_ref_prio().

Take a device in automatic, revertive mode with a valid signal on the spare
input. If before - 1 ties the locked reference's priority, or if 1 or 7
beats it, could the DPLL switch to the spare pin? Restoring the priority
could then switch it back. Each switch can disturb outputs feeding SyncE or
PTP.

Would it work to pick a target that does not outrank the connected
reference? Other options are to change the priority only on disconnected
pins, or to skip in automatic mode on user-provided devices.

> +			target=$candidate
> +			break
> +		fi
> +		reason=${DPLL_LAST_ERR%%$'\n'*}
> +	done

[ ... ]

> +	dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"
> +	check_err $? "cannot restore pin priority"

[Severity: Medium]
What happens here in the case the candidate loop is built for? The commit
message says:

  since a large current value may mark an unused pin outside the settable
  range, as the ice driver does with 255.

In that case before itself cannot be set. Suppose before - 1 (254) is
refused and then 1 or 7 is accepted. The pin's hardware priority has
changed, and this restore to before would be refused for the same reason.

The test would then report a failure, not a skip, on a user-provided
device. The deferred restore sends the same value, so it also fails, and
without any message. The unused input stays at priority 1 or 7 on the
user's hardware, and in automatic mode it could then be picked as a
reference.

ice_dpll_input_prio_set() and ice_dpll_hw_input_prio_set() do no range
check of their own. They pass (u8)prio to firmware, so only firmware
decides whether 255 can be written back.

test_pin_state_transitions() treats a refused restore as a skip when RET is
0, but this test does not. Should it first check that before can be set,
for example by writing it back once, before trying a different value? The
code is still the same at the end of the series.

> +	after=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
> +	if [ "$after" != "$before" ]; then
> +		check_err 1 "priority not restored, got '$after'"
> +	fi

[ ... ]

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> index 63c70a4aaab6e..6fe707c2609c5 100644
> --- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh

[ ... ]

> @@ -559,8 +579,8 @@ dpllsim_alloc_clock_id()
>  # Create a device with the standard 3-pin layout, deploy it and resolve
>  # the netlink device id. Sets DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and
>  # DPLLSIM_DEV_ID.
> -#   gnss0: GNSS, 1 Hz, input
> -#   ext0: EXT, 10 MHz, input
> +#   gnss0: GNSS, 1 Hz, input, prio 0 (active reference)

[Severity: Low]
Is "(active reference)" correct for the simulator? It does not seem to ever
select or lock to a reference.

dpllsim_pin_reset() starts every pin disconnected:

	pin->ops = dpllsim_pin_select_ops(pin);
	pin->state = DPLL_PIN_STATE_DISCONNECTED;

dpllsim_pin_prio_set() only stores sim_pin->prio, and nothing else reads
it. sim->lock_status is set once to DPLL_LOCK_STATUS_UNLOCKED in core.c and
never changes.

The device is always in automatic mode. dpllsim_pin_state_set() accepts
only disconnected and selectable there, so no pin is ever connected.

So gnss0 never becomes the active reference, and its prio 0 does not affect
which pin is used. That includes the tie test_pin_priority_get_set() can
create by setting ext0 to 0. The comment is still the same at the end of
the series, and no later patch adds selection by priority.

> +#   ext0: EXT, 10 MHz, input, prio 1
>  #   out0: EXT, 10 MHz, output

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
