Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389866;
	b=bnLbTIBSvS/9st7RE+3ONWOBKogH3ukeJsF+eej/iQfZnASrr832BGCUB+t8yco93w/6
	 vWnMNgCCW3RNo3caWdw3P9oCnMPtr0GBGozKh+v/HAsgCaw2zk4v7IINf5vl6JrWsiWH7
	 vi+aCkppBiTY/Szqsy8WK8hDoukEA3nbzB/CqwdrGlyj4L5QCXGWQNDiKcDJADEyZ2ye4
	 IvaIdY3GK9LEiFSGQmqmc2SJOG3PnUSEn0iuHzSIYMkS6towzUv8rub6n6tewQbqjs2VJ
	 jSQx3Rg9QTo/NDfmbS1cFt0KuFC9sd1S20mG/w+5Lxslf/FGlqYm6T+iqnVDYwRbP0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389866;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7mRIPrrWym9nHtfwltiGFQkt9EoedI3hHVAO9jrL20U=;
	b=kz3EzPPRGCYf3FMFdPItUAqeQ66RFnat/84ULkt0MHURwcqVdCYwgJ7gJIHlQDgLrIyr
	 LabEidBwFE2vrOA+KycYCmHYvz4/KaFoJaRa5TNz3asqM/RDQqnUSYIUjAA9fVR/jEvAb
	 3sroXaq7OXBCz6OTeKqwOI4n7Txooir/2YQzuT6M+UhNM0yuDez6wfUQzuJDiImWDWuvi
	 W+tyVHMKvy4gVNDYqqCLgF1OgsaEbdLH9Dp6ABKuQHoNUeYaEo4EPtHSEPcyIXXWhKWOp
	 7xhlyWZ+u2MUiUv11c2J1FZvBThmg+1HFRB+fvhyNhQIRXmJl106F/R+0lC639qAJew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HltODuFj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6506A606A33B;
	Wed, 11 Nov 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HltODuFj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E921F00A0D;
	Wed, 11 Nov 2026 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389866;
	bh=7mRIPrrWym9nHtfwltiGFQkt9EoedI3hHVAO9jrL20U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HltODuFj6Fe6gW9Wv9RMdWkVvJHhsWoo4CGUFRUzEPNG/Aop10MLlDnqVD9ArnPb9
	 JNCZLczrVU0x1IerkDpxpJobexLeY8AX4oXlO6JE1cjOyFaCbU6HklYwDp+zH9ubSl
	 GnOPLl4JDD+5rJR1wYqkH+kAqeQKLTNnIyzDexKv0/BLxNeYQere2oqvVXteHEt7aW
	 Y/ltsl3zHQRLLDnR6RjG9RJdqJNILA99H5/xXtfulCadvGUUsbXvSpfgJLqYL1ZGgV
	 qei/J0slxtIxCRIZ48YaK2utOG4dAd4wWabyXs7X07czDFVWseIz0VUcHIkHFK23Yp
	 8Eye/LXhw/5jw==
Subject: Re: [PATCH net-next v3 04/14] selftests: dpll: add pin enumeration
 and property tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:44 +0000
Message-ID: <179438986463.2199510.16200117375791840074@kernel.org>
In-Reply-To: <20261109093523.931201-5-poros@redhat.com>
References: <20261109093523.931201-5-poros@redhat.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In dpll_basic.sh, a failed pin dump is reported as SKIP
  instead of FAIL on hardware or user-selected DPLL devices.
- [Low] The comment in check_pin_properties (dpll_basic.sh line 106) says
  'The parent-device nest is not present for all pin types'.

--

selftests: dpll: add pin enumeration and property tests

This adds pin query helpers and dpllsim_add_pin() to the dpll selftest
library and gives the standard dpllsim device three pins. dpll_basic.sh
gains pin enumeration, pin property and pin state tests. The stress
script now creates its devices with a random set of pins.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_basic.sh b/tools/testing/selftests/drivers/dpll/dpll_basic.sh
> index 827c389fe1aa3..eb5de2e22081e 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_basic.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_basic.sh

[ ... ]

> @@ -43,6 +65,114 @@ test_device_properties()
>  	log_test "DPLL device properties"
>  }
>  
> +test_pin_enumeration()
> +{
> +	local pin_ids
> +
> +	RET=0
> +
> +	mapfile -t pin_ids < <(dpll_pin_get_ids "$DPLL_DEV_ID")
> +	if [ "${#pin_ids[@]}" -eq 0 ]; then
> +		dpll_log_test_skip_or_fail "DPLL pin enumeration" \
> +		    "no pins found"
> +		return
> +	fi

[Severity: Medium]
Can a failed pin dump get reported as a skip here?

dpll_pin_get_ids() returns 1 when the tool fails:

	out=$(dpll pin show -j 2>/dev/null) || return 1

The exit status of a process substitution is lost, though, and mapfile
itself succeeds. So a failed query leaves pin_ids empty, which looks the
same as a device with no pins.

test_pin_properties() uses the same pattern:

	mapfile -t pin_ids < <(dpll_pin_get_ids "$DPLL_DEV_ID")

test_pin_state() has the same problem. pipefail is not enabled there, so
the pipeline returns the status of head:

	pin_id=$(dpll_pin_find_by_direction "$DPLL_DEV_ID" input | head -1)

All three then call dpll_log_test_skip_or_fail(), which calls
log_test_skip whenever DPLL_CREATED_DEVICE is empty. That happens for the
hardware device dpll_lib_init() picks by default, for a device chosen
through DPLL_DRIVER and for one set with DPLL_DEV_ID.

On such a device, would a pin dump that fails because of a driver or
netlink regression be logged as a skip with "no pins found" or "no input
pin", and not as a failure? On the created dpllsim device the test still
fails, but it gives "no pins found" as the reason and does not say that
the query failed.

The commit message says:

    every pin query runs the tool first and jq on what it printed, so
    that a query which fails returns the status of the tool instead of
    the empty output a missing attribute produces too

None of these callers seem to check that status.

> +	check_pin_ids "${pin_ids[@]}"
> +
> +	log_test "DPLL pin enumeration (${#pin_ids[@]} pins)"
> +}
> +
> +check_pin_properties()
> +{

[ ... ]

> +	# The parent-device nest is not present for all pin types, but when
> +	# the device under test is in it, that entry must carry the
> +	# direction. A pin can be registered on more than one device, so
> +	# match on parent-id instead of taking the first entry.

[Severity: Low]
This isn't a bug, but is the first sentence of this comment accurate? In
the DPLL core, whether the parent-device nest is present depends on how
the pin was registered, not on its type:

drivers/dpll/dpll_netlink.c:dpll_cmd_pin_get_one() {
    ...
	if (xa_empty(&pin->parent_refs))
		ret = dpll_msg_add_pin_dplls(msg, pin, extack);
	else
		ret = dpll_msg_add_pin_parents(msg, pin, ref, extack);
    ...
}

A pin registered directly on a device always gets parent-device nests,
MUX pins included. A pin registered on a parent pin gets parent-pin nests
instead, whatever its type.

The comment above dpll_pin_get_ids() in dpll_lib.sh gets this right
("pins registered on those pins (MUX children)"). Could this comment say
the same thing, that the nest is missing for pins registered on a parent
pin? The check itself is not affected.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
