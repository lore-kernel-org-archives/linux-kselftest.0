Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839414;
	b=kcIYR6Tg1SXEMaup08nHQhWZWVFsP2idtadom3JzLCU8y94Guo8DmmUuLi1vDW/CuEu6
	 h7gnIDSs2GHsK1rBPsXG8AkIbo/P38lbHNap9lj2gQWzlnp9NKv+xo8e3HqZLtQCPM2Yy
	 OydAFNXo4qKLhLdHdIh1qbxhsw3lDCii2I8KzzoeUKZLU8vZRRWugOMXSPWrCAYeaZAel
	 ZSfTv71Y8PY/lV3U4FQ8dJjffjAWpxlroHXCwowFISDDVEHVx3n4Ut0fQk8yhGR0GLMrg
	 T0XFCCY4b3X7lBNLxHm3ZUEF1DSb2A/+tB1D9DdVptq6RTOj4wMemmmeuYreX2TXddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839414;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+BYISqJgVTO4D/mBSao7kY8cXNaRGFqyhtYFu/YGE4U=;
	b=nx5ZrP61LeXEseFJ0vuV/eOkConLodM+r9V5pZ7XezzB2Oqxq0x5hPUoMvsttxDT+Jyt
	 RT1OxKCRXK0r4hSzA+PsgVi4Mw3O2Q9cQ4JaxtIMZBGMQV1loPAC9VV3arN1hPV5BC3Xv
	 0HNOfl6bznbI4EZsIZAvGZhV12tadqizZVA/w0ZdSQavu69pqfJNSFVOFoRsG0dY6v8y1
	 /CRUYTV+LA7pwgwpGmr9wkD32SoO7FS+2ljkZsxVT8VLwJF4c536O8Xh+ogno+H9zW1bS
	 3xGbjICgCcN0Ye/m1EDcmqg60/LdQRYU/N5XtUIbaTOlM7+MVotmNadgWGhXjPmnCCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWwC1Itp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611E2606A31C;
	Mon, 16 Nov 2026 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWwC1Itp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BEC1F000C5;
	Mon, 16 Nov 2026 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839414;
	bh=+BYISqJgVTO4D/mBSao7kY8cXNaRGFqyhtYFu/YGE4U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KWwC1ItpS3oA4LYlPhs6mkQ7D1VA/XfZX9Ph87nmPNA35VNu3RydvFktVk+pWymDp
	 2hiZNu8mk1NiftJibr9AkjJyPv8CuzIUIdZsN4jN/h5OVxVpEhv1RrmO/JbE+R4z3r
	 PIC9LyV6B75Jp8RS1O++V2+vNk/h+E6ocGoNR/rJ/7N3uNd6ojq2rpy2Ries6r8Q2J
	 /cXGybSsd5z+bOrcEEck2h9A3+X/ygmEpff/f/BzMH0bCDRx7o/l6TZgjP5tNJt2+u
	 73RC/foFeWotnEdhIZTumDHQIB5d+EQ44vzO1dtGHIuHQSErq7ygRDMLz/+w98L+eG
	 w9eg61VXNDZnQ==
Subject:
 Re: [PATCH net-next v4 14/14] selftests: dpll: add reference leak tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 14:30:12 +0000
Message-ID: <179483941260.3136.7562799631907157285@kernel.org>
In-Reply-To: <20261112130359.840795-15-poros@redhat.com>
References: <20261112130359.840795-15-poros@redhat.com>
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

- [Low] The commit message says the stress script's final leak check "is
  skipped when an earlier test left a device behind", but the skip only…
- [Low] In dpll_reftrack.sh, test_basic_reftrack carries on to
  dpll_ref_tracker_check_leaks after destroy_device has failed.
- [Low] The leak check can miss a leaking object because of the
  asynchronous ref_tracker reap work.
- [Low] __dpll_ref_tracker_new_entries counts a new entry as a leak only
  if reading it returns content (`[ -n "$content" ] || continue`,…

--

selftests: dpll: add reference leak tests

This patch adds helpers to dpll_lib.sh that snapshot the DPLL ref_tracker
debugfs entries and report non-empty entries that are not in the
snapshot as leaks. A throwaway dpllsim device probes whether the tracker
works. The new dpll_reftrack.sh uses the helpers, dpll_stress.sh gains a
final leak check, and the selftest config enables
CONFIG_DPLL_REFCNT_TRACKER and the options it needs.

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> index 1dfe15943f343..f7bfe046edf93 100644
> --- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh

[ ... ]

> @@ -719,3 +736,254 @@ dpllsim_setup_standard_device()
>  		return 1
>  	fi
>  }
> +
> +##############################################################################
> +# ref_tracker leak checking
> +#
> +# With CONFIG_DPLL_REFCNT_TRACKER=y the DPLL core creates regular files
> +# named dpll_device@<ptr> / dpll_pin@<ptr> under the ref_tracker debugfs
> +# dir. Reading one prints the stack traces of currently unreleased
> +# references; an empty (or removed) file means no leaks.

[Severity: Low]
Does "an empty (or removed) file means no leaks" match how ref_tracker
behaves?

In lib/ref_tracker.c, ref_tracker_dir_exit() marks the dir
REF_TRACKER_DIR_DEAD before the object is freed. From then until the reap
work removes the file, ref_tracker_debugfs_show() returns -ENODATA:

    if (!xa_load(&debugfs_dentries, index) ||
        xa_get_mark(&debugfs_dentries, index, REF_TRACKER_DIR_DEAD)) {
        xa_unlock_irqrestore(&debugfs_dentries, flags);
        return -ENODATA;
    }

That means a file that reads back successfully but empty belongs to an
object that is still alive. __ref_tracker_dir_pr_ostream() prints nothing
when dir->list is empty. That happens when the refcount is held through
no_tracker or untracked holds, or after an imbalance where the tracker
was freed but the refcount was not dropped.

__dpll_ref_tracker_new_entries() below treats a readable empty entry the
same as an unreadable one:

    content=$(cat "$entry" 2>/dev/null)
    [ -n "$content" ] || continue

Could that kind of object leak pass both dpll_reftrack.sh and the final
check in dpll_stress.sh? No in-tree caller seems to pass a NULL tracker
today, so this is about catching a future regression.

Counting every readable entry that is not in the snapshot as a leak
would close the gap. Entries waiting for the reap would still be skipped.

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

[Severity: Low]
Can the asynchronous reap in ref_tracker cause this check to miss a
leaking object?

__dpll_device_put() calls ref_tracker_dir_exit() and then kfree(dpll)
straight away:

    ref_tracker_dir_exit(&dpll->refcnt_tracker);
    kfree(dpll);

ref_tracker_dir_exit() only sets REF_TRACKER_DIR_DEAD and schedules
debugfs_reap_worker. Suppose dpll_device_alloc() returns the same address
before the reap work runs. Then
ref_tracker_dir_init()->ref_tracker_dir_debugfs() finds the old dentry
and creates no file:

    /* No-op if already created */
    dentry = xa_load(&debugfs_dentries, (unsigned long)dir);
    if (dentry && !xa_is_err(dentry))
        return;

Reads of the old file then return -ENODATA, even though a live object
now owns that address. Once the reap work runs, the file is removed, and
the new object has no entry at all.

The cat above fails quietly and the entry is skipped. A leak in that
object would then never show up in test_ref_leaks() or
test_final_leak_check(). In test_concurrent_workers(), several processes
create and delete devices in tight loops, which gives exactly this
free-then-allocate pattern.

ref_tracker_dir_debugfs() was already missing the DEAD check before this
patch, but the new leak check depends on that function and inherits the
blind spot. The commit message lists the other limitations it accepts.
Should this one be listed there too?

> +		echo "Unreleased references in $name:"
> +		echo "$content"
> +	done
> +}

[ ... ]

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_reftrack.sh b/tools/testing/selftests/drivers/dpll/dpll_reftrack.sh
> new file mode 100755
> index 0000000000000..f2871b5ad8472
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/dpll/dpll_reftrack.sh
> @@ -0,0 +1,190 @@

[ ... ]

> +test_basic_reftrack()
> +{
> +	RET=0
> +

[ ... ]

> +	CREATED_DEVICE=$DPLLSIM_CREATED_NAME
> +
> +	destroy_device
> +	check_err $? "cannot delete device $CREATED_DEVICE"
> +
> +	if ! dpll_device_wait_gone_by_clock_id "$DPLLSIM_CLOCK_ID" dpllsim; then
> +		check_err 1 "device still on netlink after delete"
> +	fi
> +
> +	dpll_ref_tracker_check_leaks "$REF_SNAPSHOT"
> +	check_err $? "leaked references after device removal"

[Severity: Low]
If destroy_device() fails, should test_basic_reftrack() still go on to
dpll_ref_tracker_check_leaks()?

When the undeploy fails, the device is still registered, so its normal
references show up as new, non-empty entries. The check then waits the
full BUSYWAIT_TIMEOUT and prints "References not released within ... ms"
with stack traces for a device that is still live.

test_final_leak_check() and test_ref_leaks() skip on purpose in this
situation ("the failure to report is that one"). retmsg keeps the first
message, so it still shows the delete failure. The leak dump and the
delay still happen, though.

A separate point: test_final_leak_check() runs the same check against the
same snapshot, and nothing is created or destroyed in between.
__dpll_ref_tracker_note_changed() only rewrites lines that are already in
the snapshot. So a real leak found by test_basic_reftrack() would be
reported again by test_final_leak_check(), after another
BUSYWAIT_TIMEOUT.

What is the second check meant to catch that the first one does not?

[ ... ]

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> index 2abfacc43b48b..226e2767ee897 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh

[ ... ]

> @@ -496,16 +563,44 @@ test_deploy_cycle()
>  	log_test "DPLL deploy/undeploy cycling"
>  }
>  
> +test_ref_leaks()
> +{
> +	RET=0
> +

[ ... ]

> +	# A device an earlier test could not remove still holds its
> +	# references, the failure to report is that one.
> +	if [ "${#CREATED_DEVICES[@]}" -gt 0 ]; then
> +		log_test_skip "DPLL stress ref_tracker check" \
> +			      "device from an earlier test still present"
> +		return
> +	fi

[Severity: Low]
The commit message says the final leak check "is skipped when an earlier
test left a device behind". Is every leftover device actually in
CREATED_DEVICES?

The workers in test_concurrent_workers() run in subshells and never call
track_device(). delete_worker_devices() only logs a failed delete:

    dpllsim_delete_device "$name" ||
        log_info "cannot delete device $name"

After that, test_concurrent_workers() clears the list whatever the
result was:

    for base in "${WORKER_BASES[@]}"; do
        delete_worker_devices "$base"
    done
    WORKER_BASES=()

dpllsim_setup_standard_device() and create_stress_device() also roll back
with dpllsim_delete_device() and ignore its result:

    if ! DPLLSIM_DEV_ID=$(dpll_device_wait_by_clock_id "$clock_id" \
                              dpllsim); then
        dpllsim_delete_device "$name"
        return 1
    fi

If that undeploy fails, DPLLSIM_CREATED_NAME is the only record of the
live device. test_final_leak_check() in dpll_reftrack.sh has the same
gap. It checks only CREATED_DEVICE, and that is set only after
dpllsim_setup_standard_device() succeeds.

In these cases dpll_ref_tracker_check_leaks() waits out BUSYWAIT_TIMEOUT.
It then reports the device's ordinary references as "leaked DPLL
references after stress" or "leaked DPLL references at end of test".

dpll_lib_cleanup() in this patch finds leftovers by scanning
"$DPLLSIM_CFG"/*/. Would the same scan work for these skips?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112130359.840795-1-poros%40redhat.com
