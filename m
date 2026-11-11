Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389875;
	b=1b9j+hXxjKEANkx+wQ4zETjeHCsdWg6Nfe4zhSJL5m3ja7JVJs6YCoSwiDeVgTI0okFX
	 uuTTdZgc8iGb8ET/iOeLsfvOdwHmYiIxM9ZsrhZPvNoSieGX1pLI2evZwk+LKytMDHvI+
	 Vi0k4mMIGl2f7Y0Gp9noxQOu9RInkijWjQni9pK+tnB4IZqBTr8zBuyJuRMirvTGlxWqU
	 cGBY6m2ZsZWua9kQrE1skvYDhuOYfLAT+LrS4D4eBwgRg7FLwt3mKlrUqmnl2DpvkWRfM
	 oqXsDsUSEB1opJu2IuVGMbE2aQiKhAB9YlsHLZALLpYXelBb87uiuWOHwjdPnZNZh0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389875;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+zqg+uj9kcQo+azk071I8gmi2T0sx8zHCk/mu15uxA0=;
	b=V9jsrk9BYn1PhxI9Fe8jXzSDrkhj8fCOaolbaNoNdhBaNRxjpca+tB1bUS5Xb9b2Vmg2
	 FttJY5oQNS7GJOFg5MHY0j74Q2bejbjM6q/Sg40yYMquyjSRujmygWs4qkyvPXWKPy5Dn
	 SsqY3rpGBeenC7wQvDzx83trGxzNEsfHUxBkcgiJgdfc8QImTJZEHTeDOCoyihYfwdtKn
	 E4DKN4G1Q2Yz/17KiGeZTO2Zx6YADRTbJLClpk7dWt4fT2VEF9C1jHWr9QI79X4+8OBXg
	 Tlx6fvYAv7fQ0yKfoCRuDJW9EEurava4k73+nuTwvxlSMQ5pt9FKnDTbYDI/Idt3RpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QC5wF2w/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE88760A2606;
	Wed, 11 Nov 2026 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QC5wF2w/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F231F00A05;
	Wed, 11 Nov 2026 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389875;
	bh=+zqg+uj9kcQo+azk071I8gmi2T0sx8zHCk/mu15uxA0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QC5wF2w/oTD7DOzHAwPtCsWvFqLksnxEHhs3rS45SeX4s2rIWgw12TJ5o449b06y7
	 OltsZQ9XXGquSnakexV3jl/s6oK/T/ttVTHVY7Uz+wQldjUa2q7e2dfSihhmeZiCrc
	 5Rve1NKIKe1uOv/ioUabxn4+hm7oIjggLn5rZUYK/cZspXJXlTf2VjhEiLQQb6YCGX
	 tU5KR1aMcz9v8r8WDtCbHNCo1nmn/jZn5REwY3RfjNwh30gWcoeTFtTSMYm5szQS8F
	 FfwRGkoFAiVE3vTUJ+zoKcQ/UVRN3Cci9DP6cUkpr1zkLG+PjXwZVyRq04+Ma5/r6s
	 hZ3+3ItvTVFuQ==
Subject:
 Re: [PATCH net-next v3 12/14] selftests: dpll: add pin phase adjust test
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:54 +0000
Message-ID: <179438987403.2199510.18272371580964161191@kernel.org>
In-Reply-To: <20261109093523.931201-13-poros@redhat.com>
References: <20261109093523.931201-13-poros@redhat.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/drivers/dpll/dpll_features.sh,
  test_pin_phase_adjust_set_get() refuses to schedule a restore it…

--

selftests: dpll: add pin phase adjust test

This adds test_pin_phase_adjust_set_get() to the dpll selftests. The test
picks a granularity multiple inside the pin's advertised phase adjust
range, sets it, reads it back and then restores the original value. It
bails out before scheduling the restore when the current value is not a
granularity multiple.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> index 6649936c710e4..b529b19e355db 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh

[ ... ]

> +	json=$(dpll_pin_json "$PIN_TUNE_ID")
> +	min=$(jq -r '.["phase-adjust-min"] // empty' <<< "$json")
> +	max=$(jq -r '.["phase-adjust-max"] // empty' <<< "$json")
> +	gran=$(jq -r '.["phase-adjust-gran"] // empty' <<< "$json")
> +	if [ -z "$min" ] || [ -z "$max" ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
> +		    "no adjust range"
> +		return
> +	fi
> +	# A current value that is not a granularity multiple could not be
> +	# written back, so bail out before the restore is scheduled.
> +	if [ -n "$gran" ] && [ $((before % gran)) -ne 0 ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
> +		    "current phase adjust not a granularity multiple"
> +		return
> +	fi
> +	[ -n "$gran" ] || gran=1
> +	defer dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"

[Severity: Medium]
Can the restore be refused when before lies outside [min, max]?

The granularity guard is the only check before the defer. The core also
checks the range, and it does that first, in dpll_pin_phase_adj_set():

drivers/dpll/dpll_netlink.c:dpll_pin_phase_adj_set() {
    ...
	phase_adj = nla_get_s32(phase_adj_attr);
	if (phase_adj > pin->prop.phase_range.max ||
	    phase_adj < pin->prop.phase_range.min) {
		NL_SET_ERR_MSG_ATTR(extack, phase_adj_attr,
				    "phase adjust value of out range");
		return -EINVAL;
	}
	if (pin->prop.phase_gran && phase_adj % (s32)pin->prop.phase_gran) {
    ...
}

So an out-of-range current value cannot be written back either, the same
as a value that is not a granularity multiple.

On such a pin, target is built inside [min, max] and the set succeeds.
After that, the explicit restore and the deferred one both fail with
-EINVAL. The pin on a user-supplied device then stays at the top (or
bottom) of the range, and the test reports a FAIL instead of a skip.

ice may hit this. ice_dpll_phase_range_set() derives the range from the
CGU abilities. The current value is read separately from firmware via
ice_aq_get_input_pin_cfg() in ice_dpll_pin_state_update(), and nothing
checks that the two agree. If the abilities report 0, the range is
[0, 0], and any nonzero firmware value is out of range.

Should the guard also bail out when before is less than min or greater
than max, before the restore is scheduled?

> +
> +	# Shell division truncates towards zero, so round the bounds towards
> +	# the inside of the range explicitly, which matters for negative ones.

[ ... ]

> +	dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"
> +	check_err $? "cannot restore phase-adjust"

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
