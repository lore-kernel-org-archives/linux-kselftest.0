Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839412;
	b=qOkfg/wA0rTCHEgwWOjiH0+Qmrbu2uMQAx1FF2HxP+2mPhxdeRdCMgc8jjneiEOBKYjF
	 mfKdWVzThirGMkDJeuqJS02fNeK5z9iLC1/4yGElj3nGUkLYNPPvxxisZkGZo1aRY12g7
	 jDX04svLT2kJnCeb7GFE/lctwW+NfCJPGwiab9JK92JxN+zDDMDCyzKHk03KkXrlY8NXj
	 jvAL0CQ541RFbE2apRIfJlAKi+Hfb3oRqiRyK7kIgt+97iEGVOgSx4wtfx3VGvk0gs9zZ
	 Uli0+VD/3LahkoC90a3/8i13avG5hoShu17DDORHHA4A1lqKsTsUlGEsxZ9NJaiudZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839412;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=srRlVwk9lBJVIEpctIRrC3iPgdIcKtJ/p/8zkMOs+Nk=;
	b=L1wKJ6pO19ynv4VA48i842C6qGCIXcCaVIICOjXG0wX9M2wsFxYIyPYkP+h35IvpiSzv
	 nqbLv/40zY3YNL9m6dXD10gjd1u6rap8tenfmgouvbjNc13Y+EGbSYG46MPMmGJqJc953
	 f6oiv93hEgFHr6HxDptJ2Q6EmSQt7nv7TI9OvHQBz8MeRt+8dZxayoCPwWHMNUvCvg9an
	 ZwwudwQ9PuQUleR+pT72F1FqD3AA9yEtPm+xHuusqY47neDtdig0YSEjxZYYmChxn5ee4
	 3qerfLaqutYUNX4aMmazw24dCMiBMNZ2n1s/KVVqU8w6c2lqbaVlGHDkpmS6beKz4VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GGevwkOR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB66606A886;
	Mon, 16 Nov 2026 14:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GGevwkOR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8F61F000C7;
	Mon, 16 Nov 2026 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839412;
	bh=srRlVwk9lBJVIEpctIRrC3iPgdIcKtJ/p/8zkMOs+Nk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GGevwkOR2sb61fIURNDHNk0sJ5KrbRmHH2ZnXh/2NWZzRlRsSxyQRtijKaBNZFLeG
	 bd6m3yEEZFrG7AdDEnQml8fLujSFtTDIfrR0GDv6AHQQaEuoZajCZXcNf5ByTGOoqh
	 hGUSdCS3a/lFmlTU7FUg9/GIXQI9yhG5MgIFfcFl19iV0RRHhBMnQV/v8AZrOaGkXK
	 t9o7F362YG+A0kA5H49HSU7Kwhvtnb1DxXvU53+0p8/ncL1Rkl5xpr/NTRtywADCg2
	 5YZVVEEuIyzq5NNeKNZGP3A0wuSynk4nOr7uvRbIFsh7UcKmpigzZVW27eVYUbxma4
	 8YFlLePQzKNlw==
Subject:
 Re: [PATCH net-next v4 13/14] selftests: dpll: add concurrency stress tests
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, ivecera@redhat.com, jiri@nvidia.com,
 corbet@lwn.net, skhan@linuxfoundation.org, shuah@kernel.org,
 rdunlap@infradead.org, jani.nikula@intel.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 16 Nov 2026 14:30:10 +0000
Message-ID: <179483941092.3136.2707903628491620214@kernel.org>
In-Reply-To: <20261112130359.840795-14-poros@redhat.com>
References: <20261112130359.840795-14-poros@redhat.com>
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

- [Low] In tools/testing/selftests/drivers/dpll/dpll_stress.sh,
  concurrent_worker() installs worker_exit as its EXIT trap (line 281)…
- [Low] delete_worker_devices() (dpll_stress.sh:56-66) calls
  dpllsim_delete_device on every name…
- [Low] test_concurrent_workers() clears WORKER_BASES unconditionally
  (dpll_stress.sh:322) after the end-of-test sweep.

--

selftests: dpll: add concurrency stress tests

This adds test_concurrent_workers and test_many_devices to dpll_stress.sh.
Each worker runs in a subshell, gets its own reserved range of clock-ids,
and removes the device it has in flight from an exit trap. The parent
removes worker devices by name at the end of the test and from cleanup().

> diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> index 1745643955da1..2abfacc43b48b 100755
> --- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
> +++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh

[ ... ]

> @@ -39,18 +50,111 @@ untrack_device()
>  	CREATED_DEVICES=("${remaining[@]}")
>  }
>  
> +# Remove whatever a worker started from the given base clock-id left
> +# behind, which is the device in flight when the worker had to be killed.
> +# A device that does not exist counts as deleted.
> +delete_worker_devices()
> +{
> +	local base=$1
> +	local i name
> +
> +	for i in $(seq 1 "$STRESS_WORKER_ITERATIONS"); do
> +		name="st$((base + i))"
> +		dpllsim_delete_device "$name" ||
> +			log_info "cannot delete device $name"
> +	done
> +}

[Severity: Low]
Can this sweep remove a device that this run never created?

dpllsim_create_device() in dpll_lib.sh refuses to take over an existing
directory:

	# A directory of that name was left behind by something else and
	# must never be recorded as a device of this run.
	[ -e "$dev_path" ] && return 1

Clock-ids start at 96000 + RANDOM, so the st<N> left behind by an earlier
failed run can fall inside a worker's range. dpll_lib_cleanup() keeps
configfs mounted on purpose in that case.

When that happens, the worker's create fails and it only counts a failure.
Then delete_worker_devices(), called from test_concurrent_workers() and
from cleanup() for every base in WORKER_BASES, undeploys and removes that
leftover device and its pins by name anyway.

Should the sweep only cover names a worker actually created, or skip
names that already existed before the worker started?

[ ... ]

> +# Create and delete STRESS_WORKER_ITERATIONS devices with clock-ids
> +# following the given base, in a subshell. Each worker derives its own
> +# unique clock-ids from a range reserved for it, so its devices can never
> +# be confused with those of another worker or of the parent. The parent
> +# records the base of every worker, so that the device a killed worker
> +# left behind can be removed by name.
> +concurrent_worker()
> +{
> +	# The workers inherit the state of the generator from the parent
> +	# and would draw the same pin layouts, so reseed it with the pid of
> +	# the subshell first.
> +	RANDOM=$BASHPID
> +	local base=$1
> +	local i name failed=0
> +
> +	trap worker_exit EXIT
> +	trap 'exit 143' TERM
> +	trap 'exit 130' INT

[Severity: Low]
Is DPLLSIM_CREATED_NAME still set to the parent's value when this trap is
armed?

The subshell forked by "concurrent_worker "$base" &" gets a copy of the
parent's DPLLSIM_CREATED_NAME. After test_rapid_create_delete() the
parent's copy still names its last device, because nothing clears it
after the successful delete.

The worker only overwrites it once dpllsim_create_device() gets past the
"[ -e "$dev_path" ] && return 1" check. There are two ways it can reach
worker_exit() with the inherited name:

  - cleanup() sends SIGTERM before the worker's first create
  - every create in the worker fails at the -e check

In both cases worker_exit() runs:

	if [ -n "$DPLLSIM_CREATED_NAME" ]; then
		dpllsim_delete_device "$DPLLSIM_CREATED_NAME"

and that acts on a parent device outside the worker's reserved range.
This conflicts with the comment above, which says a worker's devices "can
never be confused with those of another worker or of the parent".

Would setting DPLLSIM_CREATED_NAME="" at the start of concurrent_worker(),
before the EXIT trap is installed, close this gap?

> +
> +	for i in $(seq 1 "$STRESS_WORKER_ITERATIONS"); do
> +		if ! create_stress_device $((base + i)) 3; then
> +			failed=$((failed + 1))
> +			continue
> +		fi
> +		name=$DPLLSIM_CREATED_NAME
> +		dpllsim_delete_device "$name" ||
> +			failed=$((failed + 1))
> +	done
> +
> +	[ "$failed" -eq 0 ]
> +}
> +
> +test_concurrent_workers()
> +{

[ ... ]

> +	check_err "$failed" "some concurrent workers failed"
> +
> +	for base in "${WORKER_BASES[@]}"; do
> +		delete_worker_devices "$base"
> +	done
> +	WORKER_BASES=()

[Severity: Low]
What happens to a worker device that this sweep fails to remove?

delete_worker_devices() only passes a failed dpllsim_delete_device() to
log_info and does not return the failure. WORKER_BASES is then cleared
unconditionally.

After that the device is not in CREATED_DEVICES, not in WORKER_BASES, and
not in the parent's DPLLSIM_CREATED_NAME, so cleanup() never tries to
remove it again.

The other tests in this file, test_many_devices() for example, keep the
device tracked when removal fails:

	if dpllsim_delete_device "$i"; then
		untrack_device "$i"
	else
		check_err 1 "cannot delete device $i"
	fi

Should the base of a worker whose devices were not all removed stay in
WORKER_BASES, with the failure reported through check_err?

> +
> +	log_test "DPLL concurrent workers ($STRESS_CONCURRENT_PROCS processes)"
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112130359.840795-1-poros%40redhat.com
