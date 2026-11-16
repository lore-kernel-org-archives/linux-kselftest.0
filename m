Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839411;
	b=JiQhe8lAN4ITe/EVKIK7iiF8SgA+RT+hVA/HlOYfVfEYXWA5IxOtzptMAszhdpPEpYn2
	 1Q0Uvxt8X7U5rfSALk4xXyl+56+7oVhUyuZ7WJSffI6DCEYO7TL3+HJgVgB40FyJrrUvp
	 zWFphzpPUhjUxzvYlYVKlbXkZEPeGbcVtCo1YaM8Tz1dTnsGQ7ceKRAuuMlm3BFEoWGDp
	 c/R5vD3bWY43Ke8gFsoIuoopYJFxCQFLVg9q1yvjZrAOD5TW9VlI6xLuBvV++9DyVCM8f
	 P9nKI70l1Cp40QrmgmWWWotm+jVqJyE5MJhseAiepf7Ks5Hr9WDd1vJPNH36LibBIsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839411;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=B2QlDCVZlqCbIM0I8bDmo9isk+irTXGv5x32YCbuEHA=;
	b=r/21DJMQUJAWFQFNggjknTGUIlIEr+pPc3hPr9kSe8TPG6PBq/U8yf7HrbCTiLhOO5Na
	 wdLFNOecgLExmmSIXTD9eo/PUKMQBn+3YQubEFeVO385kc8aaPLaN8DlSQVplFAgM1Z3j
	 XBgA4sy2vXel6BmbHXBCRIROZ5EXf7krGydq7FARweZEvGJHAAPNPIc+U3OI0vSYn2vmV
	 vyQnyDN5/BgkqVpl4ytJcrhvQpuvsd4QyI164M+rUBsEUBrL2+Hze/7w7suKaQIbNgmKN
	 zsGyl7Y6CAxD741LyIvCaJNO94W597zDGgZUxlHpOEU9385zBNiGgmA1QiLB13mMbSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e4reIHyH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B21606A88D;
	Mon, 16 Nov 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e4reIHyH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C91F1F000C7;
	Mon, 16 Nov 2026 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839410;
	bh=B2QlDCVZlqCbIM0I8bDmo9isk+irTXGv5x32YCbuEHA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e4reIHyHzU0g+9pBhBs5oDHsNburBjVj4hQO236cXBrJoS2ek15qoy1yN3u8yLl8e
	 GN+zgENIqaxH5KP8a/2CXu8x1BIlvgh9duumZG0T03V0FOGY7vXoe3B+X20/Z3YhXS
	 nbAkdvgjKr03I5pXKGvoPqna8/pZDS5tbFuWQd/TPtBlQrBZo0cRq98ULvY4Hckepe
	 3jMYFB6Fkw4KPpnhbzk5Sw2FuSbD/WwQrLVwJD2O1ZhJQmrHW5e/ZgMk4RE0dVSDOu
	 pTAQHWYV5lz6XiSJtZ90O4F4Df8Mq2ZYDBwD1GLnF3huiPZMHFxbPyCqPm/BClAVEv
	 ofuMurU3mQk7Q==
Subject:
 Re: [PATCH net-next v4 12/14] selftests: dpll: add pin phase adjust test
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 14:30:09 +0000
Message-ID: <179483940916.3136.8713607811565145711@kernel.org>
In-Reply-To: <20261112130359.840795-13-poros@redhat.com>
References: <20261112130359.840795-13-poros@redhat.com>
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

- [Low] The phase-adjust round-trip test test_pin_phase_adjust_set_get
  (tools/testing/selftests/drivers/dpll/dpll_features.sh) only needs…

--

selftests: dpll: add pin phase adjust test

This adds test_pin_phase_adjust_set_get() to dpll_features.sh. The test
reads the phase adjust range and granularity a pin reports. It sets the
largest granularity multiple inside the range, or the smallest one if the
largest is already the current value, reads it back and restores the
original value.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
> index ebb52c8526201..7b7e077073db5 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh

[ ... ]

> +	[ -n "$gran" ] || gran=1
> +	defer dpll_restore dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"
> +
> +	# Shell division truncates towards zero, so round the bounds towards
> +	# the inside of the range explicitly, which matters for negative ones.
> +	target=$((max / gran * gran))
> +	[ "$target" -gt "$max" ] && target=$((target - gran))
> +	if [ "$target" = "$before" ]; then
> +		target=$((min / gran * gran))
> +		[ "$target" -lt "$min" ] && target=$((target + gran))
> +	fi

[Severity: Low]
Does the round trip need the end of the advertised range here? Any value
one granularity step away from before would test the same set/get path.

On zl3073x, zl3073x_pin_props_get() reports the full s32 range for every
pin, but sets a granularity only for output pins:

drivers/dpll/zl3073x/prop.c:zl3073x_pin_props_get() {
    ...
	props->dpll_props.phase_range.min = S32_MIN;
	props->dpll_props.phase_range.max = S32_MAX;
    ...
}

So on a zl3073x input pin the test uses gran=1 and target=2147483647 ps.
zl3073x_dpll_input_pin_phase_adjust_set() then writes about 2.1 ms of
compensation into the reference's phase offset register. ice behaves the
same way with its firmware maximum, through ice_dpll_phase_range_set().

PIN_TUNE_ID comes from pin_is_spare(), which also accepts a pin in the
selectable state:

	any(.[]; .["parent-id"] == $dev and
		 (.state == "disconnected" or
		  .state == "selectable")) and
	all(.[]; .state != "connected" and .operstate != "active")

In automatic mode the DPLL can switch to that reference by itself while
the test runs, for example on failover or a revertive switch. The PTP or
SyncE outputs would then be offset by milliseconds until the deferred
restore runs.

The script header already warns against pointing it at a device whose
reference must not be disturbed, and the value is restored right away.

Would a small step such as before + gran or before - gran, clamped to
[min, max], be enough here?

> +	if [ "$target" = "$before" ] || [ "$target" -gt "$max" ] ||
> +	   [ "$target" -lt "$min" ]; then
> +		log_test_skip "DPLL pin phase-adjust set/get" "range too narrow"
> +		return
> +	fi

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112130359.840795-1-poros%40redhat.com
