Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389879;
	b=Ki4+B3ItuQmXy/N6Fwbs5FoDbHyWUziyArBniDac9UDy+UzhKQUOTBf8WfnwBygX0OeF
	 RVOZ9/UVRhvjopslYTvG/+SBHDMbhv8xK33w0X3GKOG0TjTdb+oaLT0zzinMxQV5D9N/C
	 Qdu5IVO5tcwgOkk35u7GENMRyG6wq3RuQn17gzZ6mSEOk2ajMf4xM+H9gg14qkSYKKgQQ
	 XOblPi9GWMGHo+hPTjxV/gzt7VjNLVnylndmf6KvPEotrdEOeyhr7u87H6BRe7ybNjN9q
	 apxMjftp8ExCkg29GE1BnKS1T23tQFYq6YnTTF/gYoJddd2lCJncWAzrDtGLKBQ2qGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389879;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BXmWGa5GpI8AotEk4GpASQZyzQY6QDF5+PiWYnJSL6o=;
	b=CMmWaVrIu19dBvhRFlmVdmHbz6GK7KrUMLDBt7el27t+YVW08cAl05bmxL8oy2yffPdR
	 chWn94+drqEYnRKSTFj/9q57LQuZN8lcIDK94ra2025NJKKKXdGsWEAx01BZrW0pLnHIB
	 TYXV9D/kJnBhOYKzpirl7deiNijHre63qL7h8TuT9wlhia40e1W4sIp2mg44JaQU/7rp4
	 ALDuiXACXtwS7Dj0+GL1tFRPwinN1sitiZy2Gft0Jklrr8OZL8/uGg/i/N2Sp3dhHa1Vy
	 5NZ92vfCNtv1Rvwr9cWLdlW4JRMPIzllIZltr+PS5QcwZGeH4tHfPMdYr0D/hy1UbFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MJrc+CN3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5A660A3818;
	Wed, 11 Nov 2026 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MJrc+CN3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50751F00A09;
	Wed, 11 Nov 2026 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389879;
	bh=BXmWGa5GpI8AotEk4GpASQZyzQY6QDF5+PiWYnJSL6o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MJrc+CN3thjLuEEMBMYZoav9Dn1rdhsbwfnJepybOj8NG4VzJgtGFfpxy10JSrs+x
	 IjSAi/Q+WOZJPpuc2aymeprIojy1fNVW4F6C+HseuxvhmW4SKTM4X/1oQhQCO9hCht
	 OG/mte1MuddBHp9UW7tneEv/u2PluBfQNy1oem6K/bRtV1kO0iemDqueTFx6wA076v
	 i0oW8HhC7DQugfIm5dXhmlj05F/eu3USRjJU6S/bq4rg0I7gKZ3jO0MxgYYu2/sB1w
	 dDc4FZFbJCxqGqBhQ7Y/OJLwGUfEtRySP9nbQoPOPK2Do3hEapJO3asoT9ipM8e9xn
	 Trs8wb5uAX7VA==
Subject:
 Re: [PATCH net-next v3 14/14] selftests: dpll: add reference leak tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 11 Nov 2026 09:37:57 +0000
Message-ID: <179438987744.2199510.9390854175096346888@kernel.org>
In-Reply-To: <20261109093523.931201-15-poros@redhat.com>
References: <20261109093523.931201-15-poros@redhat.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The snapshot taken right after the probe can record the probe
  device's own dead ref_tracker entries.
- [Low] The leak check treats any non-empty dpll_device@*/dpll_pin@*
  entry missing from the snapshot as a leak of this run.
- [Low] The two new final leak checks handle a leftover device
  differently.
- [Low] dpll_ref_tracker_probe() returns 1 whenever the deployed probe
  device produces no non-empty new entry.
- [Low] dpll_debugfs_available() mounts debugfs when /sys/kernel/debug is
  not a mountpoint and sets DPLL_MOUNTED_DEBUGFS=1.

--

selftests: dpll: add reference leak tests

This adds helpers to dpll_lib.sh that snapshot the ref_tracker debugfs
entries before a test creates dpllsim devices. A test then fails when an
entry that is not in the snapshot still holds references afterwards. A
throwaway probe device checks that the tracker works; the probe runs first
in dpll_stress.sh, which also gains a final leak check, and in the new
dpll_reftrack.sh.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> index 7a0bb144af150..87686bb53d355 100644
> --- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh

[ ... ]

> @@ -641,3 +658,215 @@ dpllsim_setup_standard_device()

[ ... ]

> +dpll_debugfs_available()
> +{
> +	if ! mountpoint -q "$DEBUGFS_DIR"; then
> +		mount -t debugfs none "$DEBUGFS_DIR" &> /dev/null &&
> +			DPLL_MOUNTED_DEBUGFS=1
> +	fi
> +	mountpoint -q "$DEBUGFS_DIR"
> +}

[Severity: Low]
The only sign that this script owns the mount is that debugfs was not
mounted when it checked. If no dpllsim device is left behind,
dpll_lib_cleanup() unmounts it at exit:

	[ "$DPLL_MOUNTED_DEBUGFS" -eq 1 ] && mounted+=("$DEBUGFS_DIR")
	...
	for dir in "${mounted[@]}"; do
		__dpll_lib_umount "$dir"
	done

During a long dpll_stress.sh run, another process (another selftest, a
tracing tool, a user) can find debugfs already mounted and start using it
without mounting it itself.

Would the umount at exit pull debugfs out from under that process? A plain
umount succeeds unless a file or cwd is held open at that moment, and the
other process would not remount it.

The configfs handling already works this way. This patch applies the same
pattern to debugfs, which is shared far more widely.

[ ... ]

> +__dpll_ref_tracker_new_entries()
> +{
> +	local file=$1
> +	local entry name content
> +
> +	for entry in "$DPLL_REF_TRACKER_DIR"/dpll_device@* \
> +		     "$DPLL_REF_TRACKER_DIR"/dpll_pin@*; do
> +		[ -f "$entry" ] || continue
> +		name=$(basename "$entry")
> +		grep -q "^$name " "$file" && continue
> +		content=$(cat "$entry" 2>/dev/null)
> +		[ -n "$content" ] || continue
> +		echo "Unreleased references in $name:"
> +		echo "$content"
> +	done
> +}

[Severity: Low]
The only attribution here is snapshot membership plus non-empty content.
What happens when another DPLL driver (ice, zl3073x, ptp_ocp, ...)
registers a new dpll_device or dpll_pin after the snapshot? This could come
from a deferred or async probe, a driver bind, a module reload, or a driver
re-allocating its pins during the long dpll_stress.sh run.

A live object of that driver always holds tracked references, so its entry
is non-empty and not in the snapshot.

Would test_basic_reftrack(), test_final_leak_check() and test_ref_leaks()
then wait BUSYWAIT_TIMEOUT and fail, blaming dpllsim for references it does
not own?

dpll_lib_lock() is an flock on /run/dpll-selftest/lock, so it only excludes
other dpll selftest scripts. The library comment only covers objects of
other drivers that already exist when the snapshot is taken.

[ ... ]

> +dpll_ref_tracker_probe()
> +{

[ ... ]

> +	if dpllsim_add_pin "$name" ext0 ext 10000000 input &&
> +	   dpllsim_deploy "$name"; then
> +		ret=1
> +		[ -n "$(__dpll_ref_tracker_new_entries "$file")" ] && ret=0
> +	fi

[Severity: Low]
Can this tell a kernel without CONFIG_DPLL_REFCNT_TRACKER apart from one
where the tracker is enabled but does not record anything?

dpll_device_alloc() and dpll_pin_alloc() call ref_tracker_dir_init()
unconditionally:

	ref_tracker_dir_init(&dpll->refcnt_tracker, 128, "dpll_device");

So the dpll_device@ and dpll_pin@ files exist whenever CONFIG_REF_TRACKER
and CONFIG_DEBUG_FS are set. Only dpll_device_tracker_alloc/free and
dpll_pin_tracker_alloc/free are under #ifdef CONFIG_DPLL_REFCNT_TRACKER, and
an empty dir->list prints nothing.

Suppose a regression makes the core stop calling ref_tracker_alloc(), or
pass a NULL tracker so that only no_tracker is bumped. The probe would then
return 1, and both scripts log:

	log_test_skip "DPLL ref_tracker probe" \
		      "CONFIG_DPLL_REFCNT_TRACKER not enabled"

This happens even though the selftest config sets
CONFIG_DPLL_REFCNT_TRACKER=y. Would such a regression show up as a SKIP
with a misleading reason instead of a FAIL?

> +
> +	if dpllsim_delete_device "$name"; then
> +		DPLLSIM_PROBE_DEVICE=""
> +	else
> +		log_info "cannot delete device $name"
> +		return 4
> +	fi
> +	if [ "$ret" -eq 0 ] &&
> +	   ! busywait "$BUSYWAIT_TIMEOUT" __dpll_ref_tracker_settled "$file" \
> +		      > /dev/null; then
> +		ret=3
> +	fi
> +	return "$ret"
> +}

[Severity: Medium]
Can the snapshot taken right after the probe record the probe device's own
dead ref_tracker entries?

The commit message says:

  The teardown of a device releases its references before the write to
  live returns, so the entries are expected to be gone at the first look

In lib/ref_tracker.c only the references go away synchronously.
ref_tracker_dir_exit() calls ref_tracker_debugfs_mark(), which only marks
the dir dead and schedules the reaper:

	__xa_set_mark(&debugfs_dentries, (unsigned long)dir, REF_TRACKER_DIR_DEAD);
	...
	schedule_work(&debugfs_reap_worker);

The dentry is removed later, in debugfs_reap_work(). Until then the file
still exists, and reading it returns -ENODATA from
ref_tracker_debugfs_show().

That allows this sequence:

dpllsim_delete_device(probe)
  dpll_device_put() -> ref_tracker_dir_exit(), kfree(dpll)
busywait __dpll_ref_tracker_settled
  cat of the dead entry fails, content is empty, entry is skipped
test_ref_tracker_probe()
  dpll_ref_tracker_snapshot "$REF_SNAPSHOT"
    [ -f "$entry" ] is still true, so the probe's names are recorded

The next test (test_basic_reftrack() or test_rapid_create_delete()) then
allocates a dpll_device right away. It can land on the probe's freed slab
slot, and the %p hash then gives the same entry name.

If the reaper has run by then, the new object's entry is in the snapshot,
and __dpll_ref_tracker_new_entries() skips it:

	grep -q "^$name " "$file" && continue

If the reaper still has not run, ref_tracker_dir_debugfs() returns early:

	/* No-op if already created */
	dentry = xa_load(&debugfs_dentries, (unsigned long)dir);
	if (dentry && !xa_is_err(dentry))
		return;

The reaper later removes the old dentry, so the new object never gets a
debugfs file at all.

In either case, would a leak in the first device created after the probe go
unreported?

Would it help to skip unreadable entries in dpll_ref_tracker_snapshot(), or
to wait after deleting the probe until its entries are gone from the
ref_tracker dir before taking the snapshot again?

[ ... ]

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> index 47b8f4bf55b26..198a50ed67873 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh

[ ... ]

> @@ -463,16 +524,36 @@ test_deploy_cycle()
>  	log_test "DPLL deploy/undeploy cycling"
>  }
>  
> +test_ref_leaks()
> +{
> +	RET=0
> +
> +	# The probe test found the tracker inactive or could not run.
> +	if [ "$REF_TRACKER" -eq 0 ]; then
> +		log_test_skip "DPLL stress ref_tracker check" \
> +			      "DPLL reference tracker not available"
> +		return
> +	fi
> +
> +	dpll_ref_tracker_check_leaks "$REF_SNAPSHOT"
> +	check_err $? "leaked DPLL references after stress"

[Severity: Low]
Should this skip when CREATED_DEVICES is not empty, the way
test_final_leak_check() in dpll_reftrack.sh does?

	# A device an earlier test could not remove still holds its
	# references, the failure to report is that one.
	if [ -n "$CREATED_DEVICE" ]; then
		log_test_skip "DPLL final ref_tracker check" \
			      "device from an earlier test still present"

dpllsim_delete_device() can fail in test_pin_state_flooding(),
test_max_devices() or test_deploy_cycle() because the undeploy failed. The
device then stays live and stays in CREATED_DEVICES.

It still holds its dpll_device_get(..., &sim->tracker) and
dpll_pin_get(..., &pin->tracker) references, so its entries are non-empty
and not in the snapshot.

cleanup() only removes those devices at exit. Wouldn't test_ref_leaks()
spin for BUSYWAIT_TIMEOUT and then report "leaked DPLL references after
stress" for references the device legitimately holds?

> +
> +	log_test "DPLL stress ref_tracker check"
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261109093523.931201-1-poros%40redhat.com
