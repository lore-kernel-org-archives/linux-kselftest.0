Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389863;
	b=WxnKyMeHih4K4LdWOqCRl6TWzdKvvn1Nh+w/HVSoTae05s4DRk/eRg8TVbVnElmONtml
	 XiM+ar3eqQ5qWXGxE0ihSGFYORodkkktQvuxNXgutObeFjjam3dwg1fsTqfXBKFtH4zGc
	 cjXjxMfagRsL+aC2UKLdmOG98j9qelh8KA3sxo3WmXKKNvCRMrybMor6f9WsH4fexNlNc
	 vGtVPNtVSGL9C6WEqDlSg3oUa5jRDh1d5VuEj4nj1L/UFWfbkfIUThy52SiZEFPZEHy0M
	 S9Dte09ZfBAMykyL0gEQr0dFWup5pQalO4gYqoZGPldgXcWTRH//1CdjAr/Yqg8VpNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389863;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=upZY0h5R3b9m1D99jNMy9hgBQx3iVAzrnP2rSZ8fU+w=;
	b=5HQ2Ixlv2xjeVqzJ14vQZqJrvwoXqbtYWbXjc5G6s2TFnlY3p3vXwJGvfudYgy2hun1n
	 ZxO0neSN2k+g1Ta/arzLEsN+uTXKErV9JG5vqgenc5/MQZUBzIyjs2oGOrNL7d9mYp2fk
	 zwWBDPUYy68v0H/n3VvRRAITjAcBBblTDfuxDcIly50KQ89YFEWZd/XA87i5vw099KAq1
	 DlrX+RFeKh4rqMiIHUjvEFoUF3Wjc/+nymUrIJT0WqkSQ65QfTPixbXvPkJsGRVFhbvJq
	 YAhyE5Hs/9RIlwmriAASk48+PbDDReHsvzYYfALXVsNG8+wq2hxbxhp/h7PFiamKYKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvnYT5ab;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D113606A32A;
	Wed, 11 Nov 2026 09:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvnYT5ab
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB091F00A05;
	Wed, 11 Nov 2026 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389862;
	bh=upZY0h5R3b9m1D99jNMy9hgBQx3iVAzrnP2rSZ8fU+w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VvnYT5abRep/31KDuUYWPah1mbMY+/Hfm0PTiIJlIBE/yNGJXmWBGgxvLwVaeGWkX
	 tuOPCtZmcLzo+Z8aUc3OG3nWxKQC2YtHhQ/sNXpY2gyG1vr8DamWZ/ajBPyskoelDK
	 Vs6fQmORPMvzcmByaiv9UBtAqko6prM/lQWpD2rn47QOWXwXrMWrcUvDYkQF6DrBUE
	 P1AA6IWOTLiVI1Vpm9q3J9+BFEDBtuTkIAGFv0x+hd6jB3TWM3NuyAk5zdSzaodirt
	 iADc4xvp9migX7lDTZ5bZPkd1ghExh4sfg773ghw09ZoJqKSb/UGGXm5mGcrWp2muf
	 wMu0r8X/giZxQ==
Subject: Re: [PATCH net-next v3 02/14] selftests: dpll: add test library and
 device lifecycle tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:41 +0000
Message-ID: <179438986148.2199510.10852681781802327265@kernel.org>
In-Reply-To: <20261109093523.931201-3-poros@redhat.com>
References: <20261109093523.931201-3-poros@redhat.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 5

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In dpll_lib_init()
  (tools/testing/selftests/drivers/dpll/dpll_lib.sh), the DPLL_DRIVER…
- [Medium] dpll_basic.sh exits with ksft_skip whenever
  dpllsim_setup_standard_device() fails (`echo "SKIP: cannot create…
- [Low] Several comments in dpll_lib.sh do not match what the code does.
- [Low] DPLLSIM_CREATED_NAME is never initialized at the top level of
  dpll_lib.sh or by either script.
- [Low] dpllsim_create_device() sets DPLLSIM_CREATED_NAME=$name before
  mkdir, so the cleanup handler counts the device as created by this run.
- [Low] dpll_lib_cleanup() unmounts /sys/kernel/config whenever this run
  did the mount and no dpllsim item is left.
- [Low] In dpllsim_available(), the flag recording that this run mounted
  configfs is set only after the mount: `mount -t configfs none…

--

selftests: dpll: add test library and device lifecycle tests

This commit adds a shell library for DPLL selftests that wraps the
iproute2 dpll tool and the dpllsim configfs interface. It also adds
dpll_basic.sh, which checks mandatory device attributes against hardware
or a created dpllsim device, and dpll_stress.sh, which cycles dpllsim
devices through create/delete and register/unregister. The scripts take
a lock under /run and clean up from an exit trap.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_basic.sh b/tools/testing/selftests/drivers/dpll/dpll_basic.sh
> new file mode 100755
> index 0000000000000..827c389fe1aa3
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/dpll/dpll_basic.sh
> @@ -0,0 +1,94 @@

[ ... ]

> +cleanup()
> +{
> +	# A second signal must not abort the teardown half way.
> +	trap '' INT TERM
> +
> +	if [ -n "$CREATED_DEVICE" ]; then
> +		dpllsim_delete_device "$CREATED_DEVICE" ||
> +			log_info "cannot delete device $CREATED_DEVICE"
> +	fi
> +	# The device whose creation a signal interrupted is recorded by the
> +	# library alone, a double delete of a tracked one is harmless.
> +	if [ -n "$DPLLSIM_CREATED_NAME" ]; then
> +		dpllsim_delete_device "$DPLLSIM_CREATED_NAME" ||
> +			log_info "cannot delete device $DPLLSIM_CREATED_NAME"
> +	fi

[Severity: Low]
Is DPLLSIM_CREATED_NAME always empty here when this run never created a
device? It is only assigned inside dpllsim_create_device(). Neither
dpll_lib.sh nor the scripts initialize it at the top level, unlike
DPLLSIM_MOUNTED_CONFIGFS=0 and DPLL_LOCK_FD="" here, and
DPLL_CREATED_DEVICE="" and DPLLSIM_PROBE_DEVICE="" later in the series.

Bash imports environment variables as shell variables. If
DPLLSIM_CREATED_NAME is set in the inherited environment, this EXIT trap
undeploys and removes an existing $DPLLSIM_CFG/<name> device even on
paths that never create anything. Examples are a run against hardware,
the dpllsim_check_module() skip, or an early signal.

cleanup() in dpll_stress.sh has the same check, and the variable is
still uninitialized at the end of the series. Would a top-level
DPLLSIM_CREATED_NAME="" in dpll_lib.sh be enough?

> +	dpll_lib_cleanup
> +}

[ ... ]

> +if [ -z "$DPLL_DEV_ID" ]; then
> +	dpllsim_check_module
> +	if ! dpllsim_setup_standard_device; then
> +		echo "SKIP: cannot create dpllsim device"
> +		exit "$ksft_skip"
> +	fi

[Severity: Medium]
Should every failure of dpllsim_setup_standard_device() be reported as a
skip? That function returns 1 in three cases: the configfs mkdir fails,
the write of 1 to <dev>/live fails, or dpll_device_wait_by_clock_id()
times out.

The live write goes to dpllsim_dev_live_store(), which passes back the
DPLL core registration error:

drivers/dpll/dpllsim/core.c:dpllsim_dev_live_store() {
    ...
	err = dpllsim_dev_deploy(sim);
	if (err)
		return err;
    ...
}

The timeout means the registered device never showed up in the netlink
dump. Both are failures of the core and netlink paths this test covers.
dpll_stress.sh treats the same condition as a failure in
test_deploy_cycle():

	check_err 1 "device not on netlink (iteration $i)"

Could only environment problems be skipped here, with deploy and netlink
visibility failures reported as failures? This check is unchanged at the
end of the series.

> +	CREATED_DEVICE=$DPLLSIM_CREATED_NAME
> +	DPLL_DEV_ID=$DPLLSIM_DEV_ID
> +	DPLL_MODULE_NAME="dpllsim"
> +fi

[ ... ]

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> new file mode 100644
> index 0000000000000..8d46d4cff06c5
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> @@ -0,0 +1,348 @@

[ ... ]

> +dpll_lib_init()
> +{
> +	DPLL_MODULE_NAME=""
> +
> +	if [ -n "${DPLL_DEV_ID:-}" ]; then
> +		if ! dpll device show id "$DPLL_DEV_ID" &> /dev/null; then
> +			echo "SKIP: DPLL device \"$DPLL_DEV_ID\" not found"
> +			exit "$ksft_skip"
> +		fi
> +	elif [ "${DPLL_DRIVER:-}" = "dpllsim" ]; then
> +		DPLL_DEV_ID=""
> +	elif [ -n "${DPLL_DRIVER:-}" ]; then
> +		DPLL_DEV_ID=$(dpll device show -j 2>/dev/null | \
> +			      jq -r --arg mod "$DPLL_DRIVER" '[.device[]? |
> +				      select(.["module-name"] == $mod)
> +				     ][0].id // empty')
> +		if [ -z "$DPLL_DEV_ID" ]; then
> +			echo "SKIP: no DPLL device of driver \"$DPLL_DRIVER\""
> +			exit "$ksft_skip"
> +		fi
> +	else
> +		DPLL_DEV_ID=$(dpll device show -j 2>/dev/null | \
> +			      jq -r '[.device[]? |
> +				      select(.["module-name"] != "dpllsim")
> +				     ][0].id // empty')
> +	fi
> +
> +	if [ -n "$DPLL_DEV_ID" ]; then
> +		DPLL_MODULE_NAME=$(dpll_device_get_module "$DPLL_DEV_ID")
> +	fi
> +}

[Severity: Medium]
Can a failed dump be told apart from a dump with no matching device
here? Both the DPLL_DRIVER branch and the default branch use a pipeline,
and nothing sets pipefail, so the command substitution only returns the
status of jq.

If dpll device show -j fails, jq reads empty input, prints nothing and
exits 0, so DPLL_DEV_ID ends up empty.

With DPLL_DRIVER set to a hardware driver, the run then skips with "no
DPLL device of driver". With neither variable set, dpll_basic.sh decides
the host has no hardware and tests a dpllsim device instead:

dpll_basic.sh
  dpll_lib_init()
    dpll device show -j fails, jq prints nothing
    DPLL_DEV_ID is empty
  if [ -z "$DPLL_DEV_ID" ]; then
    dpllsim_check_module
    dpllsim_setup_standard_device

The commit message says:

  Every query runs the tool first and jq on what it printed, so that a
  failed query is told apart from a missing attribute.

The other helpers follow that with out=$(dpll ...) || return 1, but the
device selection path does not. The DPLL_MODULE_NAME lookup at the end
of dpll_lib_init() also ignores a failure of dpll_device_get_module().

This is unchanged at the end of the series. dpll_features.sh, added
later in the series, calls the same dpll_lib_init().

[ ... ]

> +# dpllsim_available mounts configfs when nothing else did, which is the
> +# one side effect the library has outside the dpllsim directory. Scripts
> +# call dpll_lib_cleanup last from their exit trap to undo it.
> +
> +DPLLSIM_MOUNTED_CONFIGFS=0
> +
> +dpllsim_available()
> +{
> +	[ -d "$DPLLSIM_CFG" ] && return 0
> +
> +	modprobe dpllsim &> /dev/null

[Severity: Low]
Is the "one side effect" comment above accurate? dpll_lib_run_dir() and
dpll_lib_lock() also create /run/dpll-selftest/ and its lock file, and
nothing removes them.

This modprobe is not recorded either, and dpll_lib_cleanup() never
unloads the module. A run on a system where dpllsim was not loaded
therefore leaves it loaded.

A few other comments also don't match the code. The file header says:

  # devices. Sourcing this file has no side effects; call
  # dpll_lib_check_prereqs and dpll_lib_init explicitly.

dpll_lib_lock is also required, though, and dpll_stress.sh never calls
dpll_lib_init.

dpllsim_setup_standard_device() has:

  # shellcheck disable=SC2120 # the argument is optional

but the function uses no positional parameter.

The comment on dpllsim_alloc_clock_id() about per-worker id ranges
refers to workers that don't exist in this patch. That part is resolved
later in the series by "selftests: dpll: add concurrency stress tests".

At the end of the series, the header, the SC2120 directive and the side
effect comment are still there. The side effect comment now reads "which
are the only side effects the library has outside the dpllsim
directory", and it still leaves out the /run files and the module load.

> +	if ! mountpoint -q "$CONFIGFS_DIR"; then
> +		mount -t configfs none "$CONFIGFS_DIR" &> /dev/null &&
> +			DPLLSIM_MOUNTED_CONFIGFS=1

[Severity: Low]
Can a signal leave configfs mounted while DPLLSIM_MOUNTED_CONFIGFS is
still 0? Both scripts install trap cleanup EXIT and trap 'exit 1' INT
TERM before dpllsim_check_module().

A SIGTERM or SIGINT that arrives while mount runs is handled after mount
returns, before the right-hand side of the && list runs:

  mount -t configfs ... succeeds
  pending trap: exit 1
    cleanup()
      dpll_lib_cleanup()
        [ "$DPLLSIM_MOUNTED_CONFIGFS" -eq 1 ] || return 0

dpllsim_create_device() records its name before mkdir for this reason.
The mount flag doesn't get the same ordering, so "a timeout imposed by
the harness still cleans up" doesn't hold for the mount. The same
pattern is used for debugfs (DPLL_MOUNTED_DEBUGFS) later in the series.

> +	fi
> +	[ -d "$DPLLSIM_CFG" ]
> +}
> +
> +# Unmount configfs again when dpllsim_available mounted it. Call after
> +# the devices of the script are gone. A dpllsim device the script could
> +# not remove keeps the mount, so that what is left can be looked at.
> +dpll_lib_cleanup()
> +{
> +	local dev_path name
> +
> +	[ "$DPLLSIM_MOUNTED_CONFIGFS" -eq 1 ] || return 0
> +	DPLLSIM_MOUNTED_CONFIGFS=0
> +
> +	for dev_path in "$DPLLSIM_CFG"/*/; do
> +		[ -d "$dev_path" ] || continue
> +		name=$(basename "$dev_path")
> +		log_info "device $name left behind, $CONFIGFS_DIR kept mounted"
> +		return
> +	done
> +	umount "$CONFIGFS_DIR" 2>/dev/null ||
> +		log_info "cannot unmount $CONFIGFS_DIR"

[Severity: Low]
Could this unmount configfs while another test is using it? The loop
above only looks at $DPLLSIM_CFG/*/. The flock in dpll_lib_lock() only
orders dpll selftests against each other.

Other configfs users, such as the gpio-sim, netconsole or USB gadget
tests, use the same check-then-mount pattern without a lock. Say one of
them starts while a dpll script holds the mount:

- It sees configfs already mounted and skips its own mount.
- It starts using /sys/kernel/config/<subsys>.
- This umount succeeds as long as that test has no open file or cwd in
  the mount, and its paths disappear in the middle of the test.

dpll_lib.sh seems to be the only selftest that unmounts configfs. Later
in the series, "selftests: dpll: add reference leak tests" applies the
same mount and unmount handling to debugfs.

> +}

[ ... ]

> +dpllsim_create_device()
> +{
> +	local name=$1
> +	local clock_id=$2
> +	local dev_path="$DPLLSIM_CFG/$name"
> +
> +	# Record the name before the directory exists, so that a cleanup
> +	# run by a signal between the two still finds it.
> +	DPLLSIM_CREATED_NAME=$name
> +	if ! mkdir "$dev_path" 2>/dev/null; then
> +		DPLLSIM_CREATED_NAME=""
> +		return 1
> +	fi

[Severity: Low]
What happens when mkdir fails because a directory of that name already
exists? Leftover devices can exist: dpll_lib_cleanup() deliberately
keeps devices it could not remove, and the probe added later in the
series retries on exactly that case.

A SIGTERM or SIGINT that arrives while mkdir runs is handled after mkdir
returns, before DPLLSIM_CREATED_NAME is cleared:

  DPLLSIM_CREATED_NAME=$name
  mkdir "$dev_path" fails with EEXIST
  pending trap: exit 1
    cleanup()
      dpllsim_delete_device "$DPLLSIM_CREATED_NAME"

In that case, cleanup() undeploys and removes a device this run did not
create.

> +	if ! echo "$clock_id" 2>/dev/null > "$dev_path/clock_id"; then
> +		rmdir "$dev_path" 2>/dev/null
> +		DPLLSIM_CREATED_NAME=""
> +		return 1
> +	fi
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
