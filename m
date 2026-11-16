Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839402;
	b=p8b8V6wfOoL30KxZ3tCJ9vil5eohI4Q5NW43PACVkDJNqw5L1K6Y8UMOoxfv64oxAclM
	 g0wfgtJ/9WDxLjlK0GZhRr0FHbEJCN4hk1Oa1L1hQqHBLLzlK0Oie0dc/pCGUKXGMW22l
	 yCjYbzWq9SO3xNzNZhCQrVdXSJ7OvvEL2h2kEwcy5Cfu8Z+vHGksYYyBbDzj+mWnHXkGb
	 KnCbLQDb64qn2jK3LJCRaW5VgPG3Ypt9bTP9Y4ridRQ5illb1lje18zoWA1cyEVsOcqGP
	 1LDyhaVjqj6BDa1ub2n84ryJ0BHMYytBtNmvLz7Yt+n75urC+rH+pX5NaAipdyVRIYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839402;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vZCWpscS/9vTvNDiA6NxPK37wejkIN0l6hD8ZRTgRUc=;
	b=GqCwTfkugknDH2s0KbvLMgZWWowqq/WMRfbarRBZPZnndOGi9z+fv0skeEwvBwPsqFtG
	 EQiyoCkVExPX5M4/+skMks9df6I8uzg/sQhxoucGAZpcphD+SoOZBwAPQRcdGFo6YawHH
	 hQJKovi9+Ff6rKlWgUQs3jlGNkwqk0jYAcLTt+r1oHEKvIQyVcXRmGzcAC6Z0RMPg/1yl
	 geGvYeDzrm1d/xwzydnyPGsAqtEoAdpQqQJqEiuzlg/nhPMazzzL7EqRYhKldKxHD6rKe
	 S9t5gREPK15ZE2jvvIUK6FydqwMPj83dZVWqWN8blCHm02tDZeYcK8n5Uyp/Twbv42w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtAl5hiT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184FD606A336;
	Mon, 16 Nov 2026 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtAl5hiT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D001F000C4;
	Mon, 16 Nov 2026 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839401;
	bh=vZCWpscS/9vTvNDiA6NxPK37wejkIN0l6hD8ZRTgRUc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JtAl5hiT0L0DlrW1ztmMoOvyAxeA9W8aTxEkRKPviPDXJ4jpHk9HHLg2Ax/tf1YzL
	 XkOh/WjvtEGW87BO5kaSwtQs81xv4318zAM980jo2fnTQMKHfVl7oJcBEzg9FwsT91
	 iPleYG1YGXTR9as1OV0jAAtQN/3ULK3qKTGYyxk3O/3YzJEAMSanGS4j0wCXPZ1fB8
	 O4lx4puF4NPCVxh8to6m090IuFUx9oxJAN8BmCsD59GRdtyZ7ZcF4pJ7ZZ3VRtJDJv
	 PxY8xWwneuSRwhpW8KEob91jbzGKl3aWOTSCrLG0PRnU2H2Hpzt1VLqPWdM31Q8IXR
	 AJIKnt7U1Wkdw==
Subject: Re: [PATCH net-next v4 02/14] selftests: dpll: add test library and
 device lifecycle tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 14:29:59 +0000
Message-ID: <179483939997.3136.11285041510598744878@kernel.org>
In-Reply-To: <20261112130359.840795-3-poros@redhat.com>
References: <20261112130359.840795-3-poros@redhat.com>
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

- [Medium] When dpllsim is built in (CONFIG_DPLLSIM=y), the selftests
  cannot find their own devices and report a hard FAIL where they should…
- [Low] A second signal can still abort the exit-trap teardown, despite
  the comment in cleanup().

--

selftests: dpll: add test library and device lifecycle tests

This adds a shell library for the DPLL selftests. It wraps the iproute2
dpll tool and the dpllsim configfs interface, and the patch also adds
dpll_basic.sh and dpll_stress.sh. The library finds simulated devices by
clock ID and module name, and each script takes a lock, mounts configfs
when needed and cleans up from an exit trap.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> new file mode 100644
> index 0000000000000..9fe7f2f62dd46
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh

[ ... ]

> +# $1: clock-id, $2: module name (optional)
> +dpll_device_get_id_by_clock_id()
> +{
> +	local clock_id=$1
> +	local module=${2:-}
> +	local out
> +
> +	out=$(dpll device show -j 2>/dev/null) || return 1
> +	jq -r --arg cid "$clock_id" --arg mod "$module" \
> +	   '[.device[]? |
> +	     select((.["clock-id"] | tostring) == $cid and
> +		    ($mod == "" or .["module-name"] == $mod))
> +	    ][0].id // empty' <<< "$out"
> +}

[Severity: Medium]
Does this module-name match work when dpllsim is built in?

DPLLSIM is a tristate. With CONFIG_DPLLSIM=y, THIS_MODULE is NULL, and
dpllsim registers its device with:

drivers/dpll/dpllsim/dpll.c:dpllsim_dev_deploy() {
    ...
	dpll = dpll_device_get(sim->clock_id, 0, THIS_MODULE, &sim->tracker);
    ...
}

The netlink reply then carries:

drivers/dpll/dpll_netlink.c:dpll_device_get_one() {
    ...
	if (nla_put_string(msg, DPLL_A_MODULE_NAME, module_name(dpll->module)))
    ...
}

module_name() returns "kernel" for a NULL module. With mod=dpllsim, the
select above never matches a device the script created.

dpllsim_available() still counts a built-in simulator as available. Once
/sys/kernel/config/dpllsim exists it returns 0, and it ignores the
modprobe result:

	[ -d "$DPLLSIM_CFG" ] && return 0

So the scripts create and deploy a device that their own lookup cannot
find:

In dpll_basic.sh, dpllsim_setup_standard_device() calls
dpll_device_wait_by_clock_id "$clock_id" dpllsim. busywait runs until
BUSYWAIT_TIMEOUT, and the script then prints "FAIL: cannot create dpllsim
device" and exits with ksft_fail.

In dpll_stress.sh, test_deploy_cycle() fails on its first iteration with
"device not on netlink".

The default branch of dpll_lib_init() has a related problem:

	select(.["module-name"] != "dpllsim")

This does not exclude a leftover built-in dpllsim device, so that device
would be tested as if it were hardware.

The later patches in the series (the pin flooding and many-devices tests)
still use the same module-name filter, so they do not fix this.

Could the lookups handle a built-in dpllsim, or should the scripts skip
when dpllsim is not a module?

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> new file mode 100755
> index 0000000000000..01d57ab0172b0
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh

[ ... ]

> +cleanup()
> +{
> +	local dev
> +
> +	# A second signal must not abort the teardown half way.
> +	trap '' INT TERM

[Severity: Low]
Can a second signal still abort the teardown here? The script sets up its
traps like this:

	trap cleanup EXIT
	trap 'exit 1' INT TERM

The INT/TERM handler stays "exit 1" until cleanup() itself runs
trap '' INT TERM, and here "local dev" runs before that.

If another INT or TERM is handled at that command boundary, exit 1 runs
inside the EXIT trap. bash does not run the EXIT trap a second time, so
the shell exits without running:

- the CREATED_DEVICES loop
- the DPLLSIM_CREATED_NAME delete
- dpll_lib_cleanup()

The simulated devices and the configfs mount from this run would then be
left behind.

dpll_basic.sh uses the same trap pattern. Its cleanup() runs the ignore
first, which makes the window smaller but does not remove it.

The window is still there at the end of the series. There, cleanup() in
dpll_stress.sh runs "local pid dev base" and "local pids=() shell_jobs=()"
before the ignore.

Would it be better to ignore the signals in the handler itself? For
example:

	trap 'trap "" INT TERM; exit 1' INT TERM

Or at least make the ignore the first statement of every cleanup()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112130359.840795-1-poros%40redhat.com
