Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839407;
	b=tW08+Ojcv+Ulsq0injmSsaUKL60q/AXaJlp2y/CZmzhZSfJPl5t6upXS4yypzT0Zk/69
	 65m7gEJc85dSrP7+X9dMzRAtr5jorNHvNSx7hhBlS6InkGrIT1O0us3pX0nBtd3rGi7At
	 JzDFMI9fSqRbSS35VpC6AuEx9YHEDr4xos+McKdnl6/Xzvv+PnpnvzxZBYmb1Du9oPM5Q
	 XAXJjN9PaBnWIW91+LRbMBxcDPC+dbrx+IV6OPEV15BZaDGYy4QycRIIujumcJKLB+1F0
	 RCY+N/enRZXAb+U1PiDmZbgXxjEW/T3by4fBoenRfhL2B3Uqb5P8fBwZ9WJF0c5ljYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839407;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VsvQOmy+WVg70rJS0fmQOllgfUN6zg5nW954YzZCliE=;
	b=5DqypqJaJnNLuEY+Ol+eMrgoo5j0wH/ZRlpjkR171AcNsOga/HpJMgtJsXLb7X2tAq0l
	 WamyfOxPHUme3WIqMzYnMyIG2f+9rI+XKBWYXonOyTl4qzBv0oLF0cK3WyCXMxscOzR9T
	 8QJGxxJqQael1eDgern/Zfbu6ID6e15K1SO4zePHmr+bY1k1Ik2cWW76L/tGbqR2or5KH
	 3lxnaCxbBdbyo5AI6Jsfky1MHbZGelhS5iDVATAnOCTJhbLlzawrUF9ezb9fwOS5m3b04
	 1sJ+5OeUxWBiPsV4dEBS2JfJ99ae6JPbLi9YBR6HAWGSugh5q4ZmdsUQf9+1xkDHOcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UtDT6H6U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F660606A336;
	Mon, 16 Nov 2026 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UtDT6H6U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6F81F000C4;
	Mon, 16 Nov 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839407;
	bh=VsvQOmy+WVg70rJS0fmQOllgfUN6zg5nW954YzZCliE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UtDT6H6UhxnZOHm3/9bTHdp56LUAwMUnGmnwGRc4TZG9q5EFs74bkohvgwc5pg7VD
	 r9iIrADxBW3Vd2S4QyggwdqsdGTVDm758CMkr44vNB3TZXpM6uSbsPmo8CjIC+UA2Y
	 yUEC4DvdJriFHGpcNAtRc2TGcGjUsCInZ3NhfwlNcNoDpH0J3PsRH0aNDPSc5j2W8R
	 3GOjGHgTItfT7zFpS/iP38sadFydIJnOw2935RNqk3ETyO47YAJ3L+qzF5RGG+Jgp+
	 edfG+Xpb5JTVBF7imYj0pgCyE8hJZZAEA1bn/39gK1BwuXZGWGAIrCC3B5piu2gWT7
	 pMDISa7r2+4fw==
Subject: Re: [PATCH net-next v4 10/14] selftests: dpll: add pin frequency test
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 14:30:05 +0000
Message-ID: <179483940555.3136.5523095972528283974@kernel.org>
In-Reply-To: <20261112130359.840795-11-poros@redhat.com>
References: <20261112130359.840795-11-poros@redhat.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] test_pin_frequency_set_get
  (tools/testing/selftests/drivers/dpll/dpll_features.sh) only re-checks…
- [Low] test_pin_frequency_set_get registers `defer dpll_restore
  dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"` before any frequency…
- [Low] pin_is_spare/pick_tune_pin do not look at reference-sync pairing.
- [Low] Two statements in the commit message do not match the code.

--

selftests: dpll: add pin frequency test

This adds test_pin_frequency_set_get() to dpll_features.sh. The test picks
a supported frequency of the spare input pin other than the current one,
sets it, reads it back and restores the original value. A new
dpll_pin_set_frequency() helper in dpll_lib.sh keeps the error output of
the tool in DPLL_LAST_ERR.

> constraints of its own refuses values the advertised ranges allow,
> zl3073x for instance wants the frequencies of an output pair to divide
> each other.

[Severity: Low]
Does this example apply to this test? The divisibility check is only in
zl3073x_dpll_output_pin_frequency_set():

    "OUT%uN freq must divide OUT%uP freq",

This test only changes PIN_TUNE_ID, which is taken from the input pins.

> A pin that reports no frequency or advertises a single frequency only
> is a skip on a device provided by the user and a failure on the device
> the script created, whose pins advertise several.

Is this accurate for the gnss pins of the created device?
dpllsim_pin_props() gives gnss pins a single 1 Hz range:

static struct dpll_pin_frequency dpllsim_freq_1pps[] = {
	DPLL_PIN_FREQUENCY_RANGE(1, 1),
};

dpllsim_setup_standard_device() creates gnss0 before ext0. The test passes
on the created device only because pick_tune_pin() ends up choosing ext0.
If that choice changed, the created device would fail with "no
alternative supported frequency".

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> index f7340bd89602f..ebb52c8526201 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> @@ -28,6 +28,7 @@ input_pins=()
>  ALL_TESTS="
>  	test_pin_state_transitions
>  	test_pin_priority_get_set
> +	test_pin_frequency_set_get
>  "

[ ... ]

> @@ -297,6 +298,95 @@ test_pin_state_transitions()
>  	log_test "DPLL pin state transitions"
>  }
>  
> +test_pin_frequency_set_get()
> +{
> +	local before target after reason json
> +
> +	RET=0
> +

[ ... ]

> +	# The core refuses a frequency outside the supported ranges, the
> +	# current one included, and a driver may report one it does not
> +	# offer, zl3073x reads a sub-Hz reference back as 0 Hz. Such a pin
> +	# could not be restored, so bail out before it is touched.
> +	if ! jq -e --argjson cur "$before" \
> +		'any(.["frequency-supported"][]?;
> +		     .["frequency-min"] <= $cur and
> +		     .["frequency-max"] >= $cur)' <<< "$json" &> /dev/null; then
> +		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
> +		    "current frequency is not a supported one"
> +		return
> +	fi
> +	defer dpll_restore dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"

[Severity: Low]
The restore is deferred here, before any frequency write has worked. The
commit message covers "A driver without a frequency setter refuses every
value with EOPNOTSUPP". On such a driver the target set below fails, the
test skips and returns, and then the deferred restore runs.

In dpll_pin_freq_set() the ops check comes before the no-op shortcut:

drivers/dpll/dpll_netlink.c:dpll_pin_freq_set() {
    ...
	if (!ops->frequency_set || !ops->frequency_get) {
		NL_SET_ERR_MSG(extack,
			       "frequency set not supported by the device");
		return -EOPNOTSUPP;
	}
    ...
	if (freq == old_freq)
		return 0;
    ...
}

So writing back the unchanged value fails as well. dpll_restore() then
logs "restore failed: dpll_pin_set_frequency ..." with the "frequency set
not supported by the device" reason, for a pin that was never changed.

All in-tree drivers currently pair frequency_get with frequency_set, so
this needs a driver that implements only frequency_get.

Could this do what test_pin_priority_get_set() does? That test writes the
current value back first and defers the restore only after that write
succeeds.

> +
> +	# Pick a supported frequency different from the current one. Both
> +	# ends of every supported range are candidates, so a pin with a
> +	# single range still has an alternative unless it is one value wide.

[ ... ]

> +	# A driver without a frequency setter or with constraints of its own
> +	# may refuse the candidate, a skip on a device the user provided, the
> +	# simulator accepts every advertised value.
> +	if ! dpll_pin_set_frequency "$PIN_TUNE_ID" "$target"; then

[Severity: Medium]
Can PIN_TUNE_ID have become the reference by the time this runs?

test_pin_priority_get_set() runs just before this test and gives the pin a
better priority (before - 1, 1 or 7). A qualified input with that priority
can win the automatic selection. A non-revertive device can stay on it
after the priority is put back.

test_pin_state_transitions() checks for exactly this:

	# The automatic selection may have taken the pin since it was
	# picked, it is the reference then and not to be touched.
	if [ "$mode" = automatic ] && [ "$before" = connected ]; then
		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
		    "spare input pin became the reference"

This test only relies on the pin_is_spare() check that pick_tune_pin()
does once when the script starts.

On zl3073x, zl3073x_dpll_input_pin_frequency_set() writes the new
frequency with zl3073x_ref_state_set(). That configuration is shared by
every channel the reference feeds, so a locked channel could lose lock or
go into holdover until the restore runs.

The commit message says "the pin the script picks must not be the
reference of any of them". Should the pin's state on each parent device
be checked again before this set, as test_pin_state_transitions() does?

[Severity: Low]
Could PIN_TUNE_ID be the reference-sync partner of the active reference?

On zl3073x, zl3073x_dpll_input_pin_ref_sync_set() checks the pair rules
only when the pair is enabled:

		if (sync_freq > 8000) {
			NL_SET_ERR_MSG(extack,
				       "sync frequency must be 8 kHz or less");

It also sets the priority of the sync partner to none on every channel. In
automatic mode that partner then reports disconnected. pin_is_spare() only
looks at state and operstate on the parent devices, so it treats the
partner as spare.

zl3073x_dpll_input_pin_frequency_set() and dpll_pin_freq_set() do not check
the ref-sync rules again. The test could therefore set the sync input to
an advertised endpoint above 8 kHz, for example 10 MHz instead of 1 Hz. It
would stay paired with the locked reference until the restore runs.

Should pin_is_spare() also treat a pin as not spare when it has a connected
reference-sync entry in the output of dpll pin show -j?

> +		reason=${DPLL_LAST_ERR%%$'\n'*}
> +		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
> +		    "cannot set frequency=$target${reason:+, $reason}"
> +		return
> +	fi

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112130359.840795-1-poros%40redhat.com
