Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031275208DF;
	Tue, 22 Sep 2026 22:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116698; cv=none; b=ud1zF/7HTDDXG3uzQ8QvQcCyFk66QlP9QO9CRauyBBqF1lEt1B5xbWM2y05JE1BjMnY6Kglu8IPjl9aJpYQvEgbX8b/sgwPLM4ccovcNcwCpQLAoAQhiZzNDqWmqLzsuJHYEyWnDrZt8u/mtfuVrpzEgzkIV9tJQi7GToVHO3TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116698; c=relaxed/simple;
	bh=bgVRM+Sz/usCyARpbRvdy1S3/hPkJtGO3LjaNf1NHwY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fhxptkczlpSE3ySjCzBnxfvaCgnrdeAuC+k4UFV8cKqrnzG6VyNTSTKgAa27xIGz4f3ZrXoUBvyFFTw9mvRU32MVDad0ybQ8LPm9bBnLF2Izg1zkyNvDaZ4AmmpIL/aWbv0LJHbs/XdLjO+WJI08ZJq6sLuQadGAofzxamNls/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONMonuLI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONMonuLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7C41F00893;
	Tue, 22 Sep 2026 22:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790116681;
	bh=ziZvqWcLQpHGEiHTKfh87VzJANRTxFv1NsOqsgcgL6s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ONMonuLIUzDEEK9OroHmvXY1YCg4Qpy0NeiOzCv2mOhBTC92Kuu7tljezvjLVb/gV
	 RcEqrYBNOFFmw3GOwSqDe//rfDWQhGQDVlcVP2CbSMZni93/3FGHD3V7l1QjogokiX
	 DEMldrRCON3Drk+uPWMAR0D57UB1JO0N2t8L+cmf1z9dFkNvVgUk0+9gdAoFmthVxH
	 eds9+1J+IrmWHLeMmsTSPR1q+Okzl4gSkCFIjFl6TVfxmUfo7XqZboWawXLSF2UpSt
	 wgw9a2NybK7+vbHNeO/nl/CTIekIVMu6ZGKkv2aWiH41Kcsl5HEZJS6bz+yHP/9Zyy
	 2Cj1ZqFrKrJlw==
Subject: Re: [PATCH net-next v3 2/2] selftests: net: test untracked NA
 recovery of FAILED neighbors
From: netdev-bot+sashiko@kernel.org
To: lfqlee314@gmail.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 rdunlap@infradead.org, netdev@vger.kernel.org, aajith@arista.com,
 roopa@nvidia.com, jhpark1013@gmail.com, corbet@lwn.net,
 skhan@linuxfoundation.org, shuah@kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Sep 2026 22:38:00 +0000
Message-ID: <179011668031.2160803.1030111847497325728@kernel.org>
In-Reply-To:
 <7285b55a1e29d2f04de4e3fe1e723a9724e0377e.1789734885.git.lfqlee314@gmail.com>
References:
 <7285b55a1e29d2f04de4e3fe1e723a9724e0377e.1789734885.git.lfqlee314@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Undisclosed fix of a pre-existing false-PASS defect, without a
  Fixes: tag.
- [Low] No `trap cleanup EXIT INT TERM` is registered, while the patch
  converts tcpdump from a foreground command into a backgrounded child…

Pre-existing issues:
- [Low] Claimed issue (validated as a pre-existing Low-severity
  robustness nit): in verify_ndisc(), the absent-entry branch (lines…

--

selftests: net: test untracked NA recovery of FAILED neighbors

This extends the accept_untracked_na selftest to seed a FAILED neighbour
entry before triggering an unsolicited NA, and checks the resulting state,
link-layer address and extern_learn marker for modes 1 and 2. It also
reworks the tcpdump handling so the capture is armed before the host link
comes up and is waited for before the neighbour table is inspected.

Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com

A few questions below.

> diff --git a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
> index 5db69dad0cfc..ba9e670b5149 100755
> --- a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
> +++ b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh

[ ... ]

> @@ -102,24 +115,39 @@ setup()
>  }
>  
>  start_tcpdump() {
> -	set -e
> -	tcpdump_stdout=`mktemp`
> -	tcpdump_stderr=`mktemp`
> +	tcpdump_stdout=$(mktemp) || return 1
> +	tcpdump_stderr=$(mktemp) || return 1
>  	${IP_ROUTER_EXEC} timeout 15s \
>                  tcpdump --immediate-mode -tpni ${ROUTER_INTF} -c 1 \
>                  "icmp6 && icmp6[0] == 136 && src ${HOST_ADDR}" \
> -                > ${tcpdump_stdout} 2> /dev/null
> -	set +e
> +                > "${tcpdump_stdout}" 2> "${tcpdump_stderr}" &
> +	tcpdump_pid=$!
> +
> +	slowwait 5 grep -q "listening on ${ROUTER_INTF}" "${tcpdump_stderr}"
> +}
> +
> +wait_tcpdump()
> +{
> +	local rc
> +
> +	wait "${tcpdump_pid}"
> +	rc=$?
> +	tcpdump_pid=
> +
> +	return "${rc}"
>  }
>  
>  cleanup_tcpdump()
>  {
> -	set -e
> -	[[ ! -z  ${tcpdump_stdout} ]] && rm -f ${tcpdump_stdout}
> -	[[ ! -z  ${tcpdump_stderr} ]] && rm -f ${tcpdump_stderr}
> +	if [ -n "${tcpdump_pid}" ]; then
> +		kill "${tcpdump_pid}" 2> /dev/null
> +		wait "${tcpdump_pid}" 2> /dev/null
> +	fi

[Severity: Low]
tcpdump is now a background child, and cleanup_tcpdump() is the only place
that kills and reaps it. Can that child be left running when the script
leaves through a path that never reaches cleanup()?

cleanup_tcpdump() is reached only from cleanup(), which runs at the tail of
test_unsolicited_na_combination() after log_test() returns:

	log_test "${rc}" 0 "${test_msg[*]}"
	cleanup

log_test() can exit first when the script is run with -p or -P and the
operator answers 'q':

	if [ "${PAUSE}" = "yes" ]; then
		echo
		echo "hit enter to continue, 'q' to quit"
		read a
		[ "$a" = "q" ] && exit 1
	fi

setup() also runs under set -e, so a failing sysctl there (for example
accept_untracked_na=2 on a kernel without mode 2) exits the shell directly.
There is no trap cleanup EXIT INT TERM anywhere in the file, so in those
cases the two namespaces from setup_ns and both mktemp files are left
behind, and if the failure happens between start_tcpdump() and
wait_tcpdump() (for instance the new slowwait 5 grep for "listening on"
timing out, or host_link_up failing) a live timeout 15s tcpdump keeps a
packet socket and a netns reference until its own timeout expires.

Would adding a trap that calls cleanup on EXIT, INT and TERM be reasonable
here?

> +	[ -n "${tcpdump_stdout}" ] && rm -f "${tcpdump_stdout}"
> +	[ -n "${tcpdump_stderr}" ] && rm -f "${tcpdump_stderr}"
>  	tcpdump_stdout=
>  	tcpdump_stderr=
> -	set +e
> +	tcpdump_pid=
>  }
>  
>  cleanup()

[ ... ]

> @@ -129,58 +157,145 @@ cleanup()

[ ... ]

> +	if [ -n "${expected_state}" ]; then
> +		neigh_show_output=$(${IP_ROUTER} neigh show \
> +			to "${HOST_ADDR}" dev "${ROUTER_INTF}")

[ ... ]

>  	else
> -		# Neighbour entry expected to be absent for all other cases
> +		neigh_show_output=$(${IP_ROUTER} neigh show \
> +			to "${HOST_ADDR}" dev "${ROUTER_INTF}")
>  		[[ -z ${neigh_show_output} ]]
>  	fi
>  }

[Severity: Low]
This isn't a problem introduced by this patch, but the absent-entry branch
of verify_ndisc() still discards the exit status of ip neigh show and only
tests that the output is empty. If the command itself fails, is the empty
output then reported as a pass without the neighbour table ever having been
read? The same pattern is present in the baseline version of the function,
so this is pre-existing; the new expected_state branch fails closed. Would
checking the exit status of the query in the else branch be worth folding
in while this function is being touched?

>  
>  test_unsolicited_na_common()
>  {

[ ... ]

> -	# Bring the link up, wait for the NA,
> -	# and add a delay to ensure neighbour processing is done.
> -	link_up
> -	start_tcpdump
> +	# Arm the capture before bringing up the host and starting DAD.
> +	router_link_up || return 1
> +	start_tcpdump || return 1
> +	host_link_up || return 1
> +
> +	# Closing tcpdump's packet socket calls synchronize_net(), so waiting
> +	# for it also waits for receive processing of the captured NA.
> +	wait_tcpdump || return 1
>  
>  	# Verify the neighbour table
> -	verify_ndisc $1 $2 $3
> +	verify_ndisc "$1" "$2" "$3" "$4" "${same_subnet}"
>  
>  }
>  
>  test_unsolicited_na_combination() {
> -	test_unsolicited_na_common $1 $2 $3
> +	local initial_state=${4:-absent}
> +	local same_subnet=${5:-1}
> +	local rc
> +
> +	test_unsolicited_na_common "$1" "$2" "$3" "${initial_state}" \
> +		"${same_subnet}"
> +	rc=$?
>  	test_msg=("test_unsolicited_na: "
>  		"drop_unsolicited_na=$1 "
>  		"accept_untracked_na=$2 "
>  		"forwarding=$3")
> -	log_test $? 0 "${test_msg[*]}"
> +	if [ "${initial_state}" = "failed" ]; then
> +		test_msg+=("initial_state=failed")
> +	fi
> +	if [ "$2" -eq 2 ]; then
> +		test_msg+=("same_subnet=${same_subnet}")
> +	fi
> +	log_test "${rc}" 0 "${test_msg[*]}"
>  	cleanup
>  }

[Severity: Medium]
The new rc=$? capture also repairs a reporting bug that existed before this
patch. In the baseline the sequence was:

	test_unsolicited_na_common $1 $2 $3
	test_msg=("test_unsolicited_na: "
		"drop_unsolicited_na=$1 "
		"accept_untracked_na=$2 "
		"forwarding=$3")
	log_test $? 0 "${test_msg[*]}"

The array assignment between the helper call and log_test sets $? to 0
(none of the assigned words contain a command substitution), so log_test
always received 0 and all eight existing combinations reported OK no matter
what verify_ndisc returned. Capturing rc immediately after
test_unsolicited_na_common() changes the pass/fail semantics of those eight
pre-existing cases so they can now actually fail.

The changelog describes only the new FAILED-neighbour coverage and does not
mention that the existing reporting was broken, and there is no Fixes: tag
(git blame points the log_test $? line at f9a2fb73318eb).

Would it make sense to split this into its own patch with a Fixes: tag, so
it can be applied and backported independently of the new mode 2 and
FAILED-state coverage, which needs kernel features not present in older
trees?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1789734885.git.lfqlee314%40gmail.com
