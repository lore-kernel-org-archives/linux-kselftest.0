Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389867;
	b=hjf/wyO4OrT+j1Zk4E/ZCM4AC8hNgjw3PPCthOlxxfjL+YIdEyhDW5VDoWQzaPlmHyTK
	 5ALKUgMXbciCdI+cR15gP13zxTO04hWy1Q1lfrAPcHVvoEAOnO5XSclT1r0tI2IhEHTFf
	 ITQh3x+zPNiJfsUpJmq8EYYuABFo0PlW5J/ch+1k60RT5yQU3C50e3XgjZ9UCoSENwNq8
	 8Ned9To55GhGylQdmIle6xOdCTplbk8dQTpn9RvAW6YBBs0Yii2v2A5rYV95aIA6c6m7l
	 OT9ibrrGO0wJ+vYd10vd0DbnKP4nxZXyOnIR4FyUD8AYhJP3Vz5VLZCiKVYYeRUSEzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389867;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=w9xNQKUsVJNje8yYiEffIdHGZ1ku8poOAkXc+c/W+uY=;
	b=tiz0WBRBWUv7on/8B4jwCJReZp+0pcwqv5TJKMfIjiT7MeII8G1IFcaWU56ZkAcYbLFB
	 EOtVcY/baMqqV4H8FwYjUC/mOKyB4nmmhfHUNCTKNbXTU7VBWj+6ZJ0XGc5fBFWsDXDxI
	 hBICskrL6huIPWJtA92EMbRZnqYu0aolGxu6YqvmNLi35ocv4s4m8KsUBVGReN8aTomST
	 PFZWGlS3q24Ei9HG0tOLQYcdEAHi4PDvwY8kccBrPcQCJP/vxPUK3bGqtmQfxekZPgwxa
	 W1atR/NL4s6bjqpHOYBaHgzSca7b40H+b+Xoz05jstoIe4aBgZw+poXIT44yozsroxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=acKa4CJU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4781606A336;
	Wed, 11 Nov 2026 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=acKa4CJU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68F41F00A05;
	Wed, 11 Nov 2026 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389867;
	bh=w9xNQKUsVJNje8yYiEffIdHGZ1ku8poOAkXc+c/W+uY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=acKa4CJUR9+e4tS+WTYxBHQRRQ3IvlV4PHl86RPYR0cqK/MvB8ktswXO7xjiW5Dvj
	 osdAvUfvvedVLkTX4HvxNnGkhgQV8qe7H2P7PoYhk4Rg818ItjVom+yFNE0IItK2wy
	 Utje2bH4/0DfTKVAWEq4roxZ/VpQKQUeySoipockWdTjo+/5wVf+YD7Dm4NWdgvo5x
	 bWN97eEwDitMmjW5QcfXe6Ql98iRLeazhGhv5zx+LtSgXr5J/vzIPypP/GCo8jaj/d
	 u1G7IbSrL5kpT8W6NFLQlE+XKQ9oJ52VEhZ7MjMhe9vNNm75/eHf3YbM180zbTFCfk
	 0BTGUA+MjJ8Mw==
Subject: Re: [PATCH net-next v3 06/14] selftests: dpll: add pin state tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:46 +0000
Message-ID: <179438986626.2199510.1050451900916212431@kernel.org>
In-Reply-To: <20261109093523.931201-7-poros@redhat.com>
References: <20261109093523.931201-7-poros@redhat.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In manual mode, test_pin_state_transitions()
  (tools/testing/selftests/drivers/dpll/dpll_features.sh) leaves the…
- [Medium] In automatic mode, test_pin_state_transitions() runs the pin
  through states="disconnected selectable".
- [Medium] When a state set inside the loop of
  test_pin_state_transitions() (lines 116-129) is refused, the test…
- [Medium] dpll_features.sh assumes that a pin whose state is not
  'connected' cannot be the reference the device is locked to.
- [Low] The header of dpll_features.sh (lines 6-9) says that when
  DPLL_DEV_ID or DPLL_DRIVER is set, 'the simulator-only tests then skip…
- [Low] The commit message says the script picks 'the first input pin
  that is not connected on the device'.
- [Low] In test_pin_state_flooding() (dpll_stress.sh), the only readback
  check cannot catch a simulator whose state setter does nothing.

--

selftests: dpll: add pin state tests

This adds dpll_features.sh. It moves a spare input pin through the pin
states of the device mode and checks each readback, either on a dpllsim
device it creates or on a device chosen through DPLL_DEV_ID or
DPLL_DRIVER. The stress script gains a pin state flooding test, and
dpll_lib.sh gains a state setter, a device mode getter and a check for
the pin set keywords the dpll tool supports.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> new file mode 100755
> index 0000000000000..874007411bc5e
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> @@ -0,0 +1,256 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# DPLL device and pin feature tests. Exercises individual dpll_device_ops
> +# and dpll_pin_ops callbacks, verifying get/set roundtrips through the
> +# netlink interface. By default a dpllsim device with a known pin layout
> +# is created; set DPLL_DEV_ID or DPLL_DRIVER to run against an existing
> +# device instead, the simulator-only tests then skip unless that device
> +# is a dpllsim one.

[Severity: Low]
Is this description accurate? Nothing in the script seems to skip based
on whether the device is a dpllsim one.

The only simulator-specific check in test_pin_state_transitions()
depends on DPLL_CREATED_DEVICE, not on the module name:

	if [ "$mode" = automatic ] && [ -n "$DPLL_CREATED_DEVICE" ]; then

So a dpllsim device passed through DPLL_DEV_ID silently loses that
check, and no skip line is logged.

Also, dpll_lib_init() clears DPLL_DEV_ID when DPLL_DRIVER=dpllsim:

	elif [ "${DPLL_DRIVER:-}" = "dpllsim" ]; then
		DPLL_DEV_ID=""

So that setting always creates a new simulator device instead of running
against an existing one. The header is still the same at the end of the
series.

[ ... ]

> +	before=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
> +	if [ -z "$before" ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
> +		    "state not reported"
> +		return
> +	fi
> +	# Restore the original state even when the test aborts half way.
> +	defer dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"
> +
> +	# In manual mode connecting the pin makes it the reference and
> +	# takes that over from the pin connected so far, so that one is
> +	# connected back at the end, after the restore above has
> +	# disconnected the test pin again. In automatic mode the pin is not
> +	# connected, see how PIN_TUNE_ID is picked, and the test never
> +	# connects it, the device keeps the reference it locked to.
> +	ref_pin=""
> +	if [ "$mode" = manual ]; then
> +		ref_pin=$(find_connected_pin)
> +		if [ -n "$ref_pin" ]; then
> +			defer dpll_pin_set_state "$DPLL_DEV_ID" "$ref_pin" \
> +			      connected
> +		fi
> +	fi

[Severity: Medium]
Do these two deferred commands run in the order the comment describes?

defer_scope_pop() in net/lib/sh/defer.sh runs deferred jobs in reverse
order, last in first out:

	for ((defer_ix=$(__defer__ndefers d); defer_ix-->0; )); do
		__defer__run d $defer_ix
	done

tests_run() wraps every test in in_defer_scope(), so both commands run
after every test, including one that passed. In manual mode the
sequence would be:

  test body restores PIN_TUNE_ID to $before and reconnects $ref_pin
  test body finds $ref_pin connected, log_test reports a pass
  defer_scope_pop() -> dpll_pin_set_state ... "$ref_pin" connected
  defer_scope_pop() -> dpll_pin_set_state ... "$PIN_TUNE_ID" disconnected

On zl3073x, ZL_DPLL_MODE_REFSEL_MODE_REFLOCK is reported as manual
mode. In that mode, zl3073x_dpll_input_pin_state_on_dpll_set() handles a
disconnect request on any input pin by leaving the reference:

	case ZL_DPLL_MODE_REFSEL_MODE_REFLOCK:
		...
		} else if (state == DPLL_PIN_STATE_DISCONNECTED) {
			/* Choose new mode based on lock status */
			switch (zldpll->lock_status) {
			...
				mode = ZL_DPLL_MODE_REFSEL_MODE_FREERUN;

The dpll core does not skip a set that matches the current state.

Could this last deferred disconnect of the test pin leave the device in
holdover or freerun after the test has already reported a pass?

That would also contradict the commit message:

  "connects it back at the end and checks that it is the reference
  again"

An interrupted run has the same ordering problem. The reconnect of
$ref_pin runs while PIN_TUNE_ID may still be the selected reference,
and PIN_TUNE_ID is disconnected afterwards.

Would registering the $ref_pin defer before the PIN_TUNE_ID one give
the intended order? This code is still the same at the end of the
series.

[ ... ]

> +	for state in $states; do
> +		if ! dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
> +					"$state"; then
> +			reason=${DPLL_LAST_ERR%%$'\n'*}
> +			dpll_log_test_skip_or_fail \
> +			    "DPLL pin state transitions" \
> +			    "cannot set pin state to $state${reason:+, $reason}"
> +			return
> +		fi

[Severity: Medium]
Can this skip hide a failure that an earlier iteration recorded?

Suppose the first state is set but reads back differently, so check_err
records a failure. If the second set is then refused on a user-provided
device, dpll_log_test_skip_or_fail() calls log_test_skip(), which does:

	RET=$ksft_skip retmsg= log_test "$@"

The test then reports a skip and the earlier failure message is lost.

The restore path further down guards against this with
[ "$RET" -eq 0 ], and the comment above the loop says "a skip would
hide the earlier one". The loop path has no such check.

> +		after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
> +		if [ "$after" != "$state" ]; then
> +			check_err 1 "pin not $state, state '$after'"
> +		fi
> +	done

[Severity: Medium]
In automatic mode, can the selectable step change the reference the
device is locked to?

When PIN_TUNE_ID starts out disconnected, setting it selectable puts it
back into hardware selection with its configured priority. ice enables
the input in ice_dpll_input_state_set():

	bool enable = state == DPLL_PIN_STATE_SELECTABLE;

zl3073x restores pin->prio in the hardware priority table.

If the pin outranks the current reference and has a valid signal, the
DPLL would switch to it. The restore to disconnected would then switch
it back.

The commit message says the pin is picked "so that no test touches the
reference the device is locked to". However, pick_tune_pin() only looks
at the state, not at priority or operstate.

On ice, ice_dpll_pin_state_update() reports the active input as
connected:

	pin->state[pf->dplls.eec.dpll_idx] =
		pin->pin == pf->dplls.eec.active_input ?
		DPLL_PIN_STATE_CONNECTED :
		DPLL_PIN_STATE_SELECTABLE;

Would this readback then fail with "pin not selectable, state
'connected'", depending on how the board's priorities are set up?

[ ... ]

> +# PIN_TUNE_ID is the input pin the tests reconfigure. It must not be the
> +# reference the device is locked to, so it is the first input pin that
> +# is not connected on the device. When the first dumped input pin and
> +# another one both qualify the other one is taken, so that the first
> +# pin, the one a simulated device locks to once it is selectable, is
> +# left alone. Tests that need the pin skip when there is none rather
> +# than reconfiguring the reference.
> +pick_tune_pin()
> +{
> +	local pin_id state
> +
> +	PIN_TUNE_ID=""
> +	for pin_id in "${input_pins[@]}"; do
> +		state=$(dpll_pin_get_state "$DPLL_DEV_ID" "$pin_id")
> +		case "$state" in
> +		disconnected|selectable)
> +			;;
> +		*)
> +			continue
> +			;;
> +		esac

[Severity: Medium]
On zl3073x, could this pick the reference the device is locked to?

In automatic mode, zl3073x_dpll_input_pin_state_on_dpll_get() never
reports connected:

	case ZL_DPLL_MODE_REFSEL_MODE_AUTO:
		if (zl3073x_chan_ref_is_selectable(chan, ref))
			*state = DPLL_PIN_STATE_SELECTABLE;
		else
			*state = DPLL_PIN_STATE_DISCONNECTED;

So the active reference reads as selectable and passes this filter.
pick_tune_pin() prefers a qualifying pin other than input_pins[0], so it
would pick the locked reference whenever that reference is not the first
dumped pin.

test_pin_state_transitions() then sets the pin disconnected. The
ZL_DPLL_MODE_REFSEL_MODE_AUTO branch of
zl3073x_dpll_input_pin_state_on_dpll_set() handles that like this:

			/* Set pin priority to none in HW */
			zl3073x_chan_ref_prio_set(&chan, ref,
						  ZL_DPLL_REF_PRIO_NONE);

That drops the active reference.

Devices that do report the active input as connected have a related
gap. The state is checked only once here, before any test runs.
test_pin_state_transitions() reads $before again but does not reject
connected in automatic mode. A hardware reselection between
pick_tune_pin() and the test would therefore go unnoticed.

Would checking the pin operstate (active or standby), and checking again
right before the first set, avoid touching the locked reference? This
code is still the same at the end of the series.

> +		PIN_TUNE_ID=$pin_id
> +		[ "$pin_id" != "${input_pins[0]}" ] && return
> +	done
> +}

[Severity: Low]
This isn't a bug, but the commit message and the comment above
pick_tune_pin() don't match this code.

The commit message says the script picks:

  "the first input pin that is not connected on the device"

This early return, however, prefers any qualifying pin other than
input_pins[0].

The comment explains that choice with "the one a simulated device locks
to once it is selectable". dpllsim_pin_state_set() only stores the
state, though:

	sim_pin->state = state;
	return 0;

Nothing in dpllsim selects a reference or changes the lock status from
its initial unlocked value.

Could the comment and the commit message be updated?

[ ... ]

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> index b21325d8368fb..526cb113807f7 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh

[ ... ]

> @@ -133,6 +135,62 @@ test_rapid_create_delete()
>  	log_test "DPLL rapid create/delete ($STRESS_ITERATIONS iterations)"
>  }
>  
> +test_pin_state_flooding()
> +{
> +	local clock_id name dev_id pin_id i last state fails=0
> +	# The states of automatic mode, the mode the simulator runs in
> +	local states=(disconnected selectable)

[ ... ]

> +			for i in $(seq 1 50); do
> +				last=${states[i % 2]}
> +				dpll_pin_set_state "$dev_id" "$pin_id" \
> +						   "$last" ||
> +					fails=$((fails + 1))
> +			done
> +			if [ "$fails" -gt 0 ]; then
> +				check_err 1 "$fails of 50 state changes failed"
> +			fi
> +			state=$(dpll_pin_get_state "$dev_id" "$pin_id")
> +			if [ "$state" != "$last" ]; then
> +				check_err 1 \
> +				    "state expected '$last', got '$state'"
> +			fi

[Severity: Low]
Can this readback catch a state setter that does nothing? With i running
from 1 to 50, the last request is states[50 % 2], which is disconnected.

dpllsim_pin_reset() initialises every pin to that same state:

	pin->state = DPLL_PIN_STATE_DISCONNECTED;

On a freshly created device, a state_on_dpll_set that returned 0 without
storing anything would still pass. The fails counter only catches
non-zero returns. The test is still the same at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
