Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846822;
	b=UtIgWK5wyvHg2yf3EPN1XhN41cX9g/5k5HRD2mM2o3Wy6jg/AKLIEvk9En3Sy0wBZy1I
	 UtIZDEkpSkxP1755qtQRSkBKPpF4TuCsRQ3PR9mqmtIcVtCcE6q7AJGsCQtAXt7irHSP3
	 UQzrTsaHhT6UW1M48Eo03NRbCzVh/hmbceAcO4OQiC1l5YIHS/PYomnVsH78z60ULeKSf
	 zmr3PgL1eDnIPIgO0SOWfl/qP/uFJyMUv+aLOrfYBSmiL8o3XOCPT1FcfTxowiMYRMeih
	 kAeNPolZNkE3H1fhbaViSGWU5u3XN3e+f//1xHFAvsD6Uw3/ybqlUoiTzeZ/fpxp19Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846822;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ptEMg+KJOwEQxzXZlbSM1Cg78ADzSAlRdEto8HI8C4s=;
	b=ZghV99B8dDKwPWlyjJcW1dTwRVHXwA2zU9+yyu0+AK8mkWRJCa5ZUrI0MmjPYLhFmWwZ
	 5t8I9FgdsG8uVF7Xy7bP8YWoUfaUoP+vIDyoe62+AVm1XLjwqyqTooce+p4/QuJWK05as
	 VpwiTwFIvI90TaqQma4Hklvw95Td39l7LYFjgLmKrVNuNd0gnHRwnzbetVbTuX1yS0qDS
	 B0EylFahzqgmiLU14Ffa7q3HJLqnIAuhuTVXIh2mtSgtNGWAzzjuWUnwBq1ANCzhLFhl6
	 DHggReLVNnymgCq+U3/B/fWU+NOwiwyS44DmqxV9B14ePugTGQsHpoAILxrN7YOMqVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBXNVCXH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0343606A32A;
	Mon, 16 Nov 2026 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBXNVCXH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2291F000CA;
	Mon, 16 Nov 2026 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846822;
	bh=ptEMg+KJOwEQxzXZlbSM1Cg78ADzSAlRdEto8HI8C4s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MBXNVCXHIglAnQW2QvHh3jGLdu0vNUc/pjWPLfkook1pjVadTNW8dM4g4o2M8WfI6
	 xo5LDfFdejGY0ykzXQTokGIiiLif5qgiUb/neqaNkxRx1OttIcONIXTOZtMHR5+mTR
	 7nZ4Di3UnR/o8760pXLaAn0jALDOenvKNIIyYoyGmXcsR0FwIJoHJ9sbswT39+4iob
	 3kW+dScoOqcJSwLV4qGLcUGDtMf1smceRxL4Hqekw5swuS9VIiLPEBJlxXbisE8xXE
	 KXVv2sUjFyq00grGnn3Gjh05iP8Gm+/c5QpCPv8IStnDqDcHDWirdGlALfEnXfSRf4
	 CVAoFZnT5dVEw==
Subject: Re: [PATCH net v4 2/2] selftests/net/openvswitch: check that a failed
 set keeps the features
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 16:33:41 +0000
Message-ID: <179484682148.3136.16392010517799748029@kernel.org>
In-Reply-To: <20261115163134.3202677-3-houminxi@gmail.com>
References: <20261115163134.3202677-3-houminxi@gmail.com>
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

- [Low] The patch adds `exec 9>&1` and `ovs_fail()` so that a FAIL prints
  its reason on the real stdout.
- [Low] ovs_dp_features_check's comment says "A show that fails and a
  datapath that reports other features are different faults, so they…
- [Low] The patch runs `exec 9>&1` once at the top level of
  openvswitch.sh (line 52) and never closes it.

--

selftests/net/openvswitch: check that a failed set keeps the features

This adds a set-dp command to ovs-dpctl.py that sends OVS_DP_CMD_SET. It
also adds two openvswitch.sh tests checking that a rejected set (dispatch
bit with an empty per-cpu-pids) leaves the datapath features unchanged.
The second test covers the recirc bit and skips when the kernel answers
EOPNOTSUPP.

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 21444657a0404..559c25d510998 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -44,6 +46,11 @@ info() {
>  	[ $VERBOSE = 0 ] || echo $*
>  }
>  
> +# ovs_sbx sends everything a command prints to debug.log, and a failing run
> +# deletes that file. Keep a handle on the real stdout so a failure reason
> +# still reaches the CI log.
> +exec 9>&1

[Severity: Low]
fd 9 stays open for the whole life of the script, and bash does not mark
it close-on-exec. That means every background daemon now inherits it.
This includes the upcall listener started by ovs_add_if -u and the
daemons started by ovs_netns_spawn_daemon():

	$*  >> $ovs_dir/stdout  2>> $ovs_dir/stderr &

These spawns redirect only fds 1 and 2.

Under the kselftest runner, fd 1, and so fd 9, is the write end of the
pipe into tap_prefix in run_one() in kselftest/runner.sh. tap_prefix
reads until EOF:

	(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
		tap_prefix >&4) 3>&1) |
		(read xs; exit $xs)) 4>>"$logfile"

If a daemon outlives the script, could this pipeline block until that
daemon exits?

One way a daemon could outlive the script is the retry branch in
run_test(). It removes the sandbox without running ovs_exit_sig:

	elif [ $ret -eq 2 ]; then
		rm -rf test_${tname}
		run_test "$1" "$2"

I could not find a current test that returns 2 after spawning a daemon,
so this needs such a leak to happen. Daemons may also already inherit
the runner's fds 3 and 4, which limits how much fd 9 adds.

fd 9 is only needed for the new >&9 diagnostics. Would it be better to
close it on the background spawns with 9>&-, or to open it only where
it is used?

[ ... ]

> +ovs_dp_features_check() {
> +	local out
> +
> +	# A show that fails and a datapath that reports other features are
> +	# different faults, so they return different statuses. ovs-dpctl prints
> +	# the value with %X, so convert before comparing.
> +	out=$(python3 $ovs_base/ovs-dpctl.py show "$1") || {
> +		printf '# could not read the datapath %s\n' "$1" >&9
> +		return 2
> +	}
> +	printf '%s\n' "$out" |
> +		grep -q "features: 0x$(printf '%X' "$2")\$"
> +}

[Severity: Low]
Can the return 2 path be reached when the datapath is missing? The show
branch of main() in ovs-dpctl.py only prints a message, and main() then
returns 0:

        if not found:
            msg = "No DP found"
            if args.showdp is not None:
                msg += ":'%s'" % args.showdp
            print(msg)

When OVS_DP_ATTR_USER_FEATURES is missing, print_ovsdp_full() leaves
out the features line and the exit status is still 0:

    if user_features is not None:
        print("  features: 0x%X" % user_features)

In both cases show exits 0, grep fails and the helper returns 1.
ovs_dp_features_expect() then prints the test-specific reason, for
example "the outdated new request did not drop the features", and not
"could not read the datapath". The "No DP found" text captured in $out
is thrown away.

[ ... ]

> +test_dp_features_recirc() {
> +	local t="test_dp_features_recirc"
> +	local dp="dpfeat1"
> +
> +	sbx_add "$t" || return $?
> +	ovs_add_dp "$t" "$dp" || return 1
> +
> +	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 || return 1
> +
> +	# 4 is OVS_DP_F_TC_RECIRC_SHARING. The kernel takes the bit only when
> +	# the tc skb extension is compiled in.
> +	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 4 &> /dev/null
> +	rc=$?
> +	if [ $rc -ne 0 ]; then
> +		eopnotsupp=$(ovs_errno EOPNOTSUPP) || return 1
> +		if [ $rc -eq "$eopnotsupp" ]; then
> +			# info() only writes debug.log, which CI does not keep.
> +			printf "# tc skb extension is not compiled in,"
> +			printf " skipping recirc\n"
> +			ovs_exit_sig
> +			return $ksft_skip
> +		fi
> +		info "the recirc set failed with $rc"
> +		return 1

[Severity: Low]
Should this be ovs_fail and not info()? With the default VERBOSE=0,
info() only appends to debug.log, and run_test() deletes $ovs_dir after
a FAIL:

	ovs_exit_sig
	[ "${PAUSE_ON_FAIL}" = "yes" ] || rm -rf "$ovs_dir"

So if the recirc set fails with anything other than EOPNOTSUPP, CI gets
a bare [FAIL] with no reason. The comment a few lines up says the same
thing about info().

The set-dp steps that only do "|| return 1" have the same gap. One is
the --features 0 step above. In test_dp_features() there are the
--features 0 steps and the --features 8 set before the outdated add-dp:

	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 || return 1

ovs_sbx sends the "set failed: ..." or "DP ... not found." output from
ovs-dpctl.py to debug.log, so these failures also reach CI with no
reason.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115163134.3202677-1-houminxi%40gmail.com
