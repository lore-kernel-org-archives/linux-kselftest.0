Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389877;
	b=DrB2BHgjBUTPAozqAjwneGrvlSl1Dnd0mCaMaGEY5u/DpA+VBAG5Pfec85r2YAyHsQVR
	 EgKu3eFovEBYCrdUP2sbuFai4T2sioR4KIF/Q4C3s++9JPU00lMaMEVLsgQF7CcW2Fl58
	 Obg6NZeMFLVl+N992WpJbAHNXA9sW1LsO/bcl1iyAF+F7eMZki4Y//tO1JyRgl+M9uYnd
	 Mjk25VvFcjIfeHowUqyQH1Tj20Vs/fPtpnLsnS642ZR7MWU/aYHzLWCM1vVq8xTs0rePK
	 6NOSXyZI8i45g3BQWtIGE2DpZhHaS7i+0SvSFKfQf102lOSTaljp4bYxSX48YQ+oXIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389877;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kVFdLeWHhFiDEphbw9qjX1+kPhQJB3mSR5y2mW+n61s=;
	b=RJm4zHfTDs8+9mHjOYXn4A6v6GPVM5O9SwkDJMUzvPcsUJANM84GA7aTgh9Z+YUzJ6gd
	 G7N6zcOYJ//KCsR1X84O5+X/wYADQXEbZ0VZzpCj2s65N+8mGTQrBsiHKWFi+h/EswObL
	 0Fk57NjTjeDXlRKO21NYvOANIS8Pg7uTvPT88JznysjTO+L3Qnyp5h1S/q51Cx/+wrNEp
	 JIQsUhkwpgYCtRTg3DYkwcgz+3HuTcpCmmzQ+cPvsmOMTkjfhWP738Jm+zKm4My1Dl88u
	 McKzxhHE1l0m3VxVPuNomlxhoWPqdwru2V7qAkfnLqGTHa3EubOdORSMTq9IY08E2iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isZdn2xH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D01606A33B;
	Wed, 11 Nov 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isZdn2xH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403A01F00A09;
	Wed, 11 Nov 2026 09:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389877;
	bh=kVFdLeWHhFiDEphbw9qjX1+kPhQJB3mSR5y2mW+n61s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=isZdn2xHG8FFCkFzBKP7Je2xR7XC6hO0vrf/wMAdZFOIVJPrDK2uXIyjr0g7Rj4XO
	 sYLSkCiExrQmpgLpRG1fRX0tB9Itq/527QLDGwYjXlVxs2Zyr5UvvlZ2A3L50aHtLV
	 7IsekMX/VmC65scyu/ND4+ug1AkiB8NPPftrdQng8t3iSlt6sWWXhGt9kbWVE8N28G
	 enclRfAlz0KSZyKAbehONuy88xhWurBcMrB5aGt/fOeuD/ezHgoKuu/wcAe1tPDpnJ
	 o2OCz5IVvD1WxCL9gvlTZxkvpjt6uFShcDsp8flzCzTbtnZEAp4m2mSRvYqOALox7i
	 a/knECC+ggNxg==
Subject:
 Re: [PATCH net-next v3 13/14] selftests: dpll: add concurrency stress tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:55 +0000
Message-ID: <179438987581.2199510.17652993019541756821@kernel.org>
In-Reply-To: <20261109093523.931201-14-poros@redhat.com>
References: <20261109093523.931201-14-poros@redhat.com>
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

- [Medium] In tools/testing/selftests/drivers/dpll/dpll_stress.sh,
  cleanup() can send SIGTERM and then SIGKILL to PIDs that bash has…
- [Low] test_max_devices() in
  tools/testing/selftests/drivers/dpll/dpll_stress.sh reports itself as…
- [Low] cleanup() in tools/testing/selftests/drivers/dpll/dpll_stress.sh
  signals only the PID of each worker subshell, never the external…

--

selftests: dpll: add concurrency stress tests

This adds two tests to dpll_stress.sh. One registers and unregisters
dpllsim devices from several background workers at once. The other
keeps several devices with many pins live and checks that each one is
visible on netlink.

The workers clean up from their own exit trap, and cleanup() stops
recorded workers and shell jobs before it removes their devices by name.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> index 3806fda2e2dfe..47b8f4bf55b26 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh

[ ... ]

> @@ -39,18 +50,103 @@ untrack_device()

[ ... ]

>  cleanup()
>  {
> -	local dev
> +	local pid dev base
> +	local pids=() shell_jobs=()

[ ... ]

> +	mapfile -t shell_jobs < <(jobs -p)
> +	mapfile -t pids < <(printf '%s\n' "${BACKGROUND_PIDS[@]}" \
> +				   "${shell_jobs[@]}" | grep . | sort -u)
> +	for pid in "${pids[@]}"; do
> +		kill "$pid" 2>/dev/null
> +	done
> +	# Give the workers a few seconds to run their exit traps, then
> +	# force the survivors and give those a few seconds to die. The
> +	# kernel cannot recycle the pid of a child until it is reaped,
> +	# which the wait below does, so the forced kill cannot hit a
> +	# process that reused one. A worker stuck in the kernel does not
> +	# die of the forced kill before whatever it waits for returns, so
> +	# only the workers that are gone are waited for, which reaps them,
> +	# and the teardown goes on without the rest. The removal of what
> +	# such a worker left behind can then fail or race with it, which
> +	# is logged like any other failed removal.
> +	pids_gone "${pids[@]}"
> +	for pid in "${pids[@]}"; do
> +		kill -KILL "$pid" 2>/dev/null
> +	done

[Severity: Medium]
Does bash really leave the pid unreaped until the wait below? Bash reaps
exited background children itself. It does this from its SIGCHLD handler
and from waitpid(-1) whenever it waits for a foreground command. It keeps
their status in its bgpids table for a later wait.

pids_gone() runs seq, $(sed ...) and sleep 0.1 on every pass. A worker
that exits after the SIGTERM can therefore be reaped, and its pid freed,
before this loop sends SIGKILL to every entry of pids[]. The loop does
not check pid_running() first.

test_concurrent_workers() makes the window wider:

	for pid in "${BACKGROUND_PIDS[@]}"; do
		wait "$pid" || failed=1
	done
	BACKGROUND_PIDS=()

Workers that finish early are reaped right away, but they stay in
BACKGROUND_PIDS until the last wait returns. Suppose a harness timeout or
Ctrl-C arrives while the parent is still waiting on a slower worker.
cleanup() then sends SIGTERM and later SIGKILL, as root, to those stale
pids.

If one of those pids was handed out again after a pid-space wrap, could
this kill an unrelated process?

pid_running() relies on kill -0 and /proc/<pid>/stat, so a reused pid
also looks like a live worker. In that case pids_gone() would spin for
the full five seconds and log a false "worker N did not exit".

> +	pids_gone "${pids[@]}"
> +	for pid in "${pids[@]}"; do
> +		if pid_running "$pid"; then
> +			log_info "worker $pid did not exit, giving up"
> +		else
> +			wait "$pid" 2>/dev/null
> +		fi
> +	done
> +
>  	defer_scopes_cleanup
>  	for dev in "${CREATED_DEVICES[@]}"; do
>  		dpllsim_delete_device "$dev" ||
>  			log_info "cannot delete device $dev"
>  	done
> +	for base in "${WORKER_BASES[@]}"; do
> +		delete_worker_devices "$base"
> +	done

[Severity: Low]
Does the forced kill above reach the external helpers that a worker runs?
In dpll_lib.sh, dpllsim_create_device() and dpllsim_add_pin() create the
configfs entries with an external mkdir. dpllsim_delete_device() removes
them with an external rmdir.

The commit message describes a worker "stuck in the kernel". Take the
case where a worker's mkdir blocks in configfs. Bash holds back the
worker's TERM trap until the foreground child returns. kill -KILL then
kills only the subshell, and the mkdir child keeps running as an orphan.

The second pids_gone() and pid_running() check only the subshell pid.
The worker therefore counts as gone and is reaped, and "worker $pid did
not exit, giving up" is never logged.

cleanup() then runs delete_worker_devices() and dpll_lib_cleanup() while
the orphan is still busy. If its mkdir completes afterwards, can a
dpllsim device or pin directory appear after the last removal pass and
be leaked?

The in-flight mkdir would also keep the configfs mount busy, so the
unmount in dpll_lib_cleanup() may fail.

This seems to contradict this part of the commit message:

  "whatever a killed worker left behind can be removed by name, at the
  end of the test and from the cleanup handler"

Would it help to start each worker in its own process group and signal
the whole group, or to track the helper processes?

[ ... ]

> @@ -194,6 +367,50 @@ test_pin_state_flooding()
>  	log_test "DPLL pin state flooding"
>  }
>  
> +test_max_devices()
> +{

[ ... ]

> +	# Every created device must be visible on netlink.
> +	visible=0
> +	for clock_id in "${clock_ids[@]}"; do
> +		if dpll_device_wait_by_clock_id "$clock_id" dpllsim \
> +		   > /dev/null; then
> +			visible=$((visible + 1))
> +		fi
> +	done

[ ... ]

> +	log_test "DPLL maximum devices ($STRESS_DEVICES devices)"
> +}

[Severity: Low]
This isn't a bug, but is "maximum devices" the right name for this test?
dpllsim has no limit on the number of devices. Its only per-device limit
is DPLLSIM_MAX_PINS:

drivers/dpll/dpllsim/core.c:dpllsim_pins_make_item() {
    ...
	if (list_count_nodes(&sim->pin_list) >= DPLLSIM_MAX_PINS)
		return ERR_PTR(-ENOSPC);
    ...
}

By default the test creates 5 devices with 10 pins each. It never
reaches that limit, and it never checks that a pin beyond the limit is
rejected. The comment above STRESS_PINS_PER_DEVICE mentions the 128 pin
limit, but the default is well below it.

The visibility check also only looks up the devices with
dpll_device_wait_by_clock_id(). It does not check their pins, so the
test would still pass if the pins of these many-pin devices did not
appear on netlink.

Could the test be renamed, or extended to cover the pin limit and to
check that the pins are visible?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
