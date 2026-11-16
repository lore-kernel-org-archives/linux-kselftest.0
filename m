Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839403;
	b=HhEBzG7p7DvMykdwbaVhkLKOXazp5OfgdWqbxF51Wf4aFJ/mkgVBa5O0WvSbGdqXcA2H
	 h6dOrUGIQfxz23hxgMYBzxKx5zIffhy3WaotwjtDDKMCL+N8UViCYrFRbr9ozmQaD8VTy
	 m5b3kY4SY+p66pC+JD6c8QO9lDRnw8yYdtgBtIFlDxrL53tLS6wTpRM+IZUxSBb0IDEe4
	 zbaTEcdkhNOS+uKGl/RzQ8r7g+g9ZsAx6wfoqTM+0Itp6x5TSnAtBVRQ+iT4c9uKXoXvt
	 PqLJzlYDFOrdc1qQJ0OB047OGmGbqA8nV9yjKfQoghlT3HBGSllGwk4PJFFyaQT2BRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839403;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gJdbhvwAZ0O20SAHJUB68mOzD7wOnYuiNIqynnq4AMM=;
	b=A11PPC+mmUJJZnPjuge69RiX1xIduU38cYDik5dijwRuVzbhsfNHO5fKjxNVVjd/ZB2E
	 9cAmAU2qqP8ouseqRkWJ5hQiU44X57sQm6uRKe39p3TkLqAhZgMOSpV3iN2WPndOvp861
	 vFPwdLIYNJYnU+2uaDU3rcFhcT3TwrxI5EZ8JIbz/0kftzHTUFHcTiCv7432vU6oHlGJD
	 GHSDlBNHt2tROoFLLHQp3GgE1O1Rs3LqfWgRIL5k/txgjw3QSY380K0LfD6u0iYrRl1sw
	 VYzhco5eHGMiFz3iPZZMGI4vpVRl9q98uDIRymmpiUJyLSx0EY/hZ7PbKR2B39cPDnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjxxjzdE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3D7606A32F;
	Mon, 16 Nov 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjxxjzdE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6034E1F000C4;
	Mon, 16 Nov 2026 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839403;
	bh=gJdbhvwAZ0O20SAHJUB68mOzD7wOnYuiNIqynnq4AMM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gjxxjzdEuNgkVzSbHZZQTiNk8ah4eHNyyktyPNwwgSgHm7kVC2bCbJVbsS3IEX8S1
	 HEIBFFK5DE0YAz6bz1+YMpa5Sr3QFK7wo83DrGgHs2RjpIbWsVOFwFZNOMLGeR3TFe
	 4m1sY8tOUXfWHcwoIOOBWECi7E7KiAHnPf84NW7xK3oOo8rx6+A+GNUWRWUxcw9d6P
	 MKNHSog3g0VHGGlqwqdq0LhgVu//bo6f/8zaCitHhm0YjkG6XcahxYtuEcKu9aKr2A
	 4Ea9HveprrGqPfe1r1MwMSE5v9mxxMjxolPsjqhblbrYMkcKd1/P4IR/pAwAxDYYo4
	 IiskcOHGAvUTA==
Subject: Re: [PATCH net-next v4 06/14] selftests: dpll: add pin state tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 14:30:01 +0000
Message-ID: <179483940186.3136.8507799107612530903@kernel.org>
In-Reply-To: <20261112130359.840795-7-poros@redhat.com>
References: <20261112130359.840795-7-poros@redhat.com>
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

Thank you for your contribution! Sashiko AI review found 9 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 5

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In test_pin_state_transitions, the guard against touching a
  pin that automatic selection has since locked onto only checks the…
- [Medium] In manual mode, test_pin_state_transitions finds the reference
  to restore with find_connected_pin(), which only searches input_pins.
- [Medium] pin_is_spare() and pick_tune_pin() never check the pin type,
  so zl3073x's internal NCO pseudo-input can be chosen as PIN_TUNE_ID.
- [Medium] test_pin_state_transitions assumes that 'manual' means one
  connected reference, and that reconnecting it restores the device.
- [Low] The commit message and the script header say the reference is
  never touched, but in manual mode the test takes the reference over on…
- [Low] Both state tests accept 'connected' as the readback after
  'selectable' was set in automatic mode, even on dpllsim devices the…
- [Low] In dpll_lib.sh, the comment on dpll_pin_set_supports says the
  keyword 'must stand on its own between blanks or brackets'.
- [Low] test_pin_state_transitions ignores the exit status of
  `mode=$(dpll_device_get_mode ...)` (line 98) and of…
- [Low] In manual mode, the deferred restore of PIN_TUNE_ID to `before`
  (line 144) still runs after the test body has already restored…

--

selftests: dpll: add pin state tests

This adds dpll_features.sh. Its test moves a spare input pin through the
states of the device mode and then restores it. It runs on a dpllsim
device it creates, or on a device the user names. It also adds a state
flooding test to dpll_stress.sh, plus library helpers for the pin state
setter, the device mode getter, deferred restores and a dpll tool
keyword check.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> new file mode 100755
> index 0000000000000..0a00a18bded2c
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> @@ -0,0 +1,339 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0

[ ... ]

> +# The tests reconfigure a spare input pin of the device and restore it
> +# afterwards, see pick_tune_pin. A pin the device uses as its reference
> +# is never picked, but on hardware a spare pin that carries a valid
> +# signal can still be selected while a test reconfigures it, so do not
> +# point the script at a device whose reference must not be disturbed.

[Severity: Low]
The header says a pin used as the reference is never picked. The commit
message says the pin is picked up front:

  "so that no test touches the reference the device is locked to"

Does that hold in manual mode? test_pin_state_transitions() uses:

	manual)
		states="connected disconnected"

Connecting PIN_TUNE_ID makes it the reference in place of the locked one.
Disconnecting it then leaves the device with no reference until ref_pin
is connected back. This happens on every manual mode run, whether or not
the spare pin carries a valid signal.

A later paragraph of the commit message says as much ("connecting the
pin makes it the reference ... connects it back at the end"), which
contradicts the earlier claim.

Could the header and the commit message say that manual mode switches the
reference away and back on purpose?

[ ... ]

> +find_connected_pin()
> +{
> +	local pin_id
> +
> +	for pin_id in "${input_pins[@]}"; do
> +		if [ "$(dpll_pin_get_state "$DPLL_DEV_ID" "$pin_id")" = \
> +		     connected ]; then
> +			echo "$pin_id"
> +			return
> +		fi
> +	done
> +}

[Severity: Medium]
Can this miss the manual mode reference? input_pins comes from
dpll_pin_find_by_direction(), which drops mux-typed pins:

	   '(.pin? // [.])[] | select(.type != "mux") |

This loop also ignores the exit status of dpll_pin_get_state(), so a
failed query looks like a pin that is not connected.

zl3073x supports manual mode, and zl3073x_pin_props_get() can give input
pins DPLL_PIN_TYPE_MUX from firmware properties. ice registers mux-typed
direct inputs as well.

If the reference is such a pin, or its state query fails, ref_pin stays
empty in test_pin_state_transitions():

		ref_pin=$(find_connected_pin)
		if [ -n "$ref_pin" ]; then
			defer dpll_restore dpll_pin_set_state "$DPLL_DEV_ID" \
			      "$ref_pin" connected
		fi

Then neither the deferred reconnect nor the one at the end of the test
runs. The loop still connects PIN_TUNE_ID, which displaces the real
reference, and then disconnects it. Only PIN_TUNE_ID goes back to
$before.

Would the device be left without its reference while the test reports a
pass?

[ ... ]

> +	mode=$(dpll_device_get_mode "$DPLL_DEV_ID")
> +	case "$mode" in
> +	automatic)
> +		states="disconnected selectable"
> +		;;
> +	manual)
> +		states="connected disconnected"
> +		;;

[Severity: Medium]
Does a mode of manual always mean one connected reference that can simply
be reconnected? zl3073x_dpll_mode_get() reports DPLL_MODE_MANUAL for the
freerun, holdover, NCO and reflock refsel modes.

In freerun or holdover every ref reads disconnected, so
find_connected_pin() returns nothing and ref_pin is empty. The connected
step then makes zl3073x_dpll_input_pin_state_on_dpll_set() select
PIN_TUNE_ID and switch to reflock:

	case ZL_DPLL_MODE_REFSEL_MODE_FREERUN:
	case ZL_DPLL_MODE_REFSEL_MODE_HOLDOVER:
		if (state == DPLL_PIN_STATE_CONNECTED) {
			/* Choose the pin as new selected reference */
			zl3073x_chan_ref_set(&chan, ref);
			/* Switch to reflock mode */

The disconnected step then picks holdover or freerun from the cached
lock_status. A channel that started in holdover can end in freerun, or
in a holdover that is now based on PIN_TUNE_ID.

The original refsel mode is never saved or restored. Every pin reads
disconnected again, so the test passes.

In NCO mode the NCO pin is the connected input and becomes ref_pin.
Connecting PIN_TUNE_ID leaves NCO mode, which steps the ToD and clears
the PPS TIE. Reconnecting the NCO pin re-enters NCO mode, and
nco_auto_read captures the current tracking offset, not the offset
userspace had programmed.

Should the test skip in manual mode when no regular input is connected,
or save and restore the refsel mode?

> +	*)
> +		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
> +		    "device mode '$mode' not handled"
> +		return
> +		;;
> +	esac
> +
> +	before=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
> +	if [ -z "$before" ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
> +		    "state not reported"
> +		return
> +	fi

[Severity: Low]
__dpll_device_field() and __dpll_pin_dev_field() return 1 when the dpll
tool fails. The status of the mode= and before= assignments is dropped
here, though. On a device the user provided, a failed query is then
logged as a skip, with "device mode '' not handled" or "state not
reported".

The commit message says "A pin that cannot be queried is a failure, not
a pin that is in use or lacks a capability". pin_is_spare() and
dpll_pin_has_capability() return 2 for exactly that case.

Should these two queries be reported as failures as well?

> +	# The automatic selection may have taken the pin since it was
> +	# picked, it is the reference then and not to be touched.
> +	if [ "$mode" = automatic ] && [ "$before" = connected ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
> +		    "spare input pin became the reference"
> +		return
> +	fi

[Severity: Medium]
Is the admin state enough to tell that the automatic selection took this
pin? Documentation/driver-api/dpll.rst says the pin state reflects the
administrative intent, while the operstate reflects what the hardware
actually does with the pin.

In automatic mode, zl3073x_dpll_input_pin_state_on_dpll_get() reports
selectable for the active ref too:

	case ZL_DPLL_MODE_REFSEL_MODE_AUTO:
		if (zl3073x_chan_ref_is_selectable(chan, ref))
			*state = DPLL_PIN_STATE_SELECTABLE;

pin_is_spare() already rejects .operstate == "active", but this check
does not. Suppose PIN_TUNE_ID becomes the active reference after
pick_tune_pin() ran. On zl3073x this check passes, and the loop sets the
pin to disconnected, which withdraws the reference the device is locked
to.

The loop comment ("the pin reports connected then") seems to rest on the
same assumption.

[ ... ]

> +	# Restore the original state even when the test aborts half way.
> +	defer dpll_restore dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
> +	      "$before"

[Severity: Low]
In manual mode, does this restore run a second time after the test body
has already put both pins back? On a successful run, the end of the test
sets PIN_TUNE_ID to $before and reconnects ref_pin:

	if [ -n "$ref_pin" ]; then
		dpll_pin_set_state "$DPLL_DEV_ID" "$ref_pin" connected

The deferred commands then run last in first out. PIN_TUNE_ID is set to
disconnected again while the channel is locked to ref_pin, and only
after that is ref_pin connected.

In zl3073x_dpll_input_pin_state_on_dpll_set(), DPLL_PIN_STATE_DISCONNECTED
in reflock mode switches the channel to holdover or freerun. It does not
check whether the pin is the selected ref:

		} else if (state == DPLL_PIN_STATE_DISCONNECTED) {
			/* Choose new mode based on lock status */
			switch (zldpll->lock_status) {

So the device loses its reference a second time. If the deferred
reconnect then fails, dpll_restore() only logs it, and the device stays
in holdover or freerun.

[ ... ]

> +pin_is_spare()
> +{
> +	local out
> +
> +	out=$(dpll pin show id "$2" -j 2>/dev/null) || return 2
> +	jq -e --argjson dev "$1" '
> +		(.pin[0]? // .) | [.["parent-device"][]?] |
> +		any(.[]; .["parent-id"] == $dev and
> +			 (.state == "disconnected" or
> +			  .state == "selectable")) and
> +		all(.[]; .state != "connected" and .operstate != "active")' \
> +		<<< "$out" &> /dev/null || return 1
> +}

[ ... ]

> +pick_tune_pin()
> +{
> +	local pin_id
> +
> +	PIN_TUNE_ID=""
> +	for pin_id in "${input_pins[@]}"; do
> +		pin_is_spare "$DPLL_DEV_ID" "$pin_id"

[ ... ]

> +		PIN_TUNE_ID=$pin_id
> +		[ "$pin_id" != "${input_pins[0]}" ] && return
> +	done
> +}

[Severity: Medium]
Can this pick the zl3073x NCO pseudo-input as PIN_TUNE_ID?

zl3073x_dpll_nco_pin_register() registers that pin with
DPLL_PIN_DIRECTION_INPUT, DPLL_PIN_TYPE_INT_NCO and
DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE, after all the ref pins. Outside
NCO mode it reports disconnected and standby, so pin_is_spare() accepts
it.

The NCO pin is dumped last. So when input_pins[0] is spare and no other
ref qualifies, pick_tune_pin() takes the NCO pin over the real spare
input.

In manual mode the test then connects the NCO pin, which enters NCO mode
with the nco_auto_read, tod_step_reset and tie_clear settings programmed
at registration. Disconnecting it makes
zl3073x_dpll_nco_pin_state_on_dpll_set() force freerun:

		/* Switch to freerun - holdover averaging was not
		 * updated during NCO mode.
		 */
		zl3073x_chan_mode_set(&chan,
				      ZL_DPLL_MODE_REFSEL_MODE_FREERUN);

In automatic mode, setting selectable on the NCO pin returns -EINVAL, so
on a user device the test skips and no real input gets exercised.

Should pin_is_spare() leave out pins of type int-nco? Later tests that
reuse PIN_TUNE_ID would inherit the same choice.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> index 2da8cbe8a883e..783db2a4dbc18 100644
> --- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh

[ ... ]

> +# Return 0 when the dpll tool knows the given "pin set" keyword, such as
> +# state or frequency. A test that sets something checks its keyword
> +# first and skips on a tool that is too old for it. Only the "pin set"
> +# usage is searched, a keyword that only "pin show" knows must not
> +# count, and the keyword must stand on its own between blanks or
> +# brackets, a hyphenated compound that contains it does not count.
> +dpll_pin_set_supports()
> +{
> +	local usage
> +
> +	usage=$(__dpll_usage_block pin set) || return 1
> +	grep -qE "(^|[[:space:][])$1([[:space:]]|$)" <<< "$usage"
> +}

[Severity: Low]
This isn't a bug, but the comment says the keyword must stand between
blanks or brackets. The regex accepts an opening bracket before the
keyword, but only a blank or the end of the line after it, so "state]"
would not match.

Every pin set keyword takes an argument, so this works in practice.
Should the trailing group also accept ], or should the comment be
adjusted?

[ ... ]

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> index b21325d8368fb..396d44c7bbe35 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh

[ ... ]

> +			# A device in automatic mode may pick the pin it
> +			# was offered as its reference, the pin reports
> +			# connected then.
> +			state=$(dpll_pin_get_state "$dev_id" "$pin_id")
> +			case "$state" in
> +			selectable|connected)
> +				;;

[Severity: Low]
Does accepting connected here hide a wrong readback on the simulator?

test_pin_state_flooding() only runs on a fresh dpllsim device.
dpllsim_pin_state_set() stores exactly the requested state, after
dpllsim_pin_state_valid() has refused connected in automatic mode.
Nothing in drivers/dpll/dpllsim/ writes DPLL_PIN_STATE_CONNECTED.

So a regression that stores connected when selectable was requested
would pass this test. test_pin_state_transitions() applies the same
automatic/selectable/connected exemption, even when DPLL_CREATED_DEVICE
is set.

Could this exemption apply only to devices the user provided?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112130359.840795-1-poros%40redhat.com
