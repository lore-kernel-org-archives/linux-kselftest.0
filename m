Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389874;
	b=iQC9RfgqI5W/bZ8mHc7CgCOZLQDDDd9UIY9fmijFCTpJtwjHQZhzclfc786eTCzykSyw
	 7KK1dk4GYzZGG3xorB1yo/KJEGgfxCWPjYZYNk7G8ObnpBeSV2vqIzPJBPiFBgJNz32UT
	 SfSD7wnP6FPVdik+aKHgNKi3SuAea+A/db7H6o6IX1rfb7rzscBe2NHIC401icQ69CfMC
	 UIYQ38QOdVFi/7UchrOT9m6AVVENlLCfJlKtMUnyVcCfkzjrOr6fRNo++OT6CIaaGE/8z
	 PC0FQLnXErIOwWUSocO1joO8423Skl5ZPY0eQYQdPrQ45o3OclhJqMh/RY8sdUKNtsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389874;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PkJfKwkqKNE4ImiCuQKubmjkOE1XDfvLZ9rc4/zmoHU=;
	b=27KtWIYJTPumvkVA0KQKPz4EMS9C+lnifsq73o1Rufan23U4u8rK2TOVJhqHOgryJEFc
	 C7BIP9ec4Od3KeU0TalVaT00Z2hcbRGj9tKDuk26nG8Tnrh2e+plrVE1xnPxztmh8d7Hz
	 G+KYGCPzKBnEL8oZlzoCuzKkq88E7Qu4WQz4ZGsQ2VcO5vA6Zyprx2+UbfOMk5v2a4wl0
	 BnjMltfynLXFMQU0J2JlbqYFQY//rUQ/yhWRqvZM2n7ThRwxIrP31gWOuE96hJ0eMycNs
	 Sg2JA6PGAZ7yCElI3ZqRhVkneRHj/FGssodYy74PyGf7JcPMlAlEIXOBMZBg0jIegAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJC9HxML;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D413606A338;
	Wed, 11 Nov 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PJC9HxML
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA01E1F00A0C;
	Wed, 11 Nov 2026 09:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389873;
	bh=PkJfKwkqKNE4ImiCuQKubmjkOE1XDfvLZ9rc4/zmoHU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PJC9HxML0ZEOhuM6eIC49L6nzywHpT9Rj1sf0JsA0f8CO0CnuZ8yzDwG8O6ATyYfL
	 AevD6G+sQ2Mmovqqzuztd8/MKbvQLJikgfYVSisGWcUC1PLEjLe6wqtBrRRj+yPPHs
	 tJ1h9Q9vuqNzRBAFDvwapgKTk52jNjtfVKxTrLR5HjhqTSt7vPOKxyLgdaF0puf8t1
	 K2PjVg2OuRFmV1sigsMGzU3eNRXFmdgdRw0Cyn33LrKhiNhlfRv3rxSOI/AvnZh9b/
	 G3nb0ZVuPfnBb5dcDWaRUrrvUo4G2UKrrfgwintp3MlK+PQKZ1VfPOhKdQ75qLEVSQ
	 2fxtgQupFuYdQ==
Subject: Re: [PATCH net-next v3 10/14] selftests: dpll: add pin frequency test
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:52 +0000
Message-ID: <179438987253.2199510.13974311226677874539@kernel.org>
In-Reply-To: <20261109093523.931201-11-poros@redhat.com>
References: <20261109093523.931201-11-poros@redhat.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] test_pin_frequency_set_get() in
  tools/testing/selftests/drivers/dpll/dpll_features.sh only checks that…
- [Medium] test_pin_frequency_set_get() reprograms the frequency of
  PIN_TUNE_ID.

--

selftests: dpll: add pin frequency test

This adds test_pin_frequency_set_get() to dpll_features.sh. The test
takes a supported frequency other than the current one from an input
pin's frequency-supported list, sets it, reads it back and restores the
original value. It also adds a dpll_pin_set_frequency() helper to
dpll_lib.sh, which keeps the tool's error output in DPLL_LAST_ERR.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> index b4b1eff322a21..6649936c710e4 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh

[ ... ]

> @@ -237,6 +238,69 @@ test_pin_state_transitions()
>  	log_test "DPLL pin state transitions"
>  }
>  
> +test_pin_frequency_set_get()
> +{

[ ... ]

> +	before=$(dpll_pin_get_frequency "$PIN_TUNE_ID")
> +	if [ -z "$before" ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
> +		    "frequency not reported"
> +		return
> +	fi
> +	defer dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"

[Severity: Medium]
Can the original frequency always be written back here? The only check
on before is that it is not empty. The DPLL core refuses any value
outside the pin's frequency-supported ranges, and it does this before
it compares the value with the current frequency:

drivers/dpll/dpll_netlink.c:dpll_pin_freq_set() {
	...
	if (!dpll_pin_is_freq_supported(pin, freq)) {
		NL_SET_ERR_MSG_ATTR(extack, a, "frequency is not supported by the device");
		return -EINVAL;
	}
	...
}

zl3073x hits this case on purpose. It reads a sub-Hz reference back as
0 Hz and leaves 0 out of freq_supported:

drivers/dpll/zl3073x/prop.c:zl3073x_pin_props_get() {
	...
	/* Start with current frequency at index 0. A sub-Hz frequency is
	 * read back as 0 Hz and cannot be set, so it is not offered.
	 */
	j = 0;
	if (curr_freq) {
	...
}

Here is what happens on such a pin on a device the user provided:

- before=0 passes the -z check.
- The jq filter picks the first advertised frequency as target.
- Setting target succeeds and reprograms the hardware reference.
- The explicit restore and the deferred restore are both refused with
  EINVAL.

Wouldn't this leave the user's device on a frequency the test picked?
The commit message says the test "restores the original value".

The phase adjust test later in the series bails out before it schedules
the restore when the current value could not be written back. Would a
similar check fit here, one that confirms before lies inside an
advertised frequency-supported range before the pin is touched?

> +
> +	# Pick a supported frequency different from the current one. Both
> +	# ends of every supported range are candidates, so a pin with a
> +	# single range still has an alternative unless it is one value wide.
> +	target=$(dpll_pin_json "$PIN_TUNE_ID" | \
> +		 jq -r --argjson cur "$before" \
> +		    '[.["frequency-supported"][]? |
> +		      .["frequency-min"], .["frequency-max"] |
> +		      numbers | select(. != $cur)][0] // empty')

[ ... ]

> +	# A driver without a frequency setter or with constraints of its own
> +	# may refuse the candidate, a skip on a device the user provided, the
> +	# simulator accepts every advertised value.
> +	if ! dpll_pin_set_frequency "$PIN_TUNE_ID" "$target"; then

[Severity: Medium]
Is it safe to reprogram this pin's frequency based only on its state on
DPLL_DEV_ID? pick_tune_pin() counts a pin as spare when it is
disconnected or selectable on that one device:

tools/testing/selftests/drivers/dpll/dpll_features.sh:pick_tune_pin() {
	...
		state=$(dpll_pin_get_state "$DPLL_DEV_ID" "$pin_id")
		case "$state" in
		disconnected|selectable)
	...
}

State and priority are per parent device, but frequency belongs to the
pin itself. It is shared by every DPLL device the pin is registered
with.

On zl3073x, every channel gets the same dpll_pin for an input index
through dpll_pin_get(clock_id, index). The setter then writes the
chip-wide reference state:

drivers/dpll/zl3073x/dpll.c:zl3073x_dpll_input_pin_frequency_set() {
	...
	ref_id = zl3073x_input_pin_ref_get(pin->id);
	ref = *zl3073x_ref_state_get(zldev, ref_id);

	/* Update frequency */
	zl3073x_ref_freq_set(&ref, frequency);

	/* Commit reference state */
	return zl3073x_ref_state_set(zldev, ref_id, &ref);
}

Say the chosen input is selectable on the EEC channel but is the locked
reference of the PPS channel. Could the PPS channel then lose lock, go
into holdover or switch references until the restore runs? ice also
registers its inputs with both its EEC and PPS DPLLs. The test never
checks that the other channel locks again.

Should the pin be checked against all of its parent devices before this
test changes its frequency?

> +		reason=${DPLL_LAST_ERR%%$'\n'*}
> +		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
> +		    "cannot set frequency=$target${reason:+, $reason}"
> +		return
> +	fi

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
