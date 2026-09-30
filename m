Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CA3A7F6B;
	Wed, 30 Sep 2026 03:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740347; cv=none; b=GQg7FkgNM/StJDlkJNEHndtTC1xPYWX/OX9M3mDfa8/f+d73v+jK9wvRDuKSU/Ai969K5ZLR5xiU/05dFtOrF/P3mtsYk6ahg87Sal+ECGj3QWh2oTVhXHXIQfGm2FDv010hp6W5dY5syWS5ooi7Y3boFsHh01NOXjlnCg0BbBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740347; c=relaxed/simple;
	bh=Dt4d97eoZ3PePb00AqToCh4LH/TJ6gYFh1uBYT89e1w=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gebp5Mx9IbQImBdUd63P+DHjiEgxTdxtCfc4ZZwJdcysz/4NkyoAmzs77s9wYP6meZMAc1iIF7c5KYLVFAFjiY9XzgbdWazY1Rbqipi4fOQSZRoHNMEfD1c03OBusIXWG8+nwZEob0y0cGyF3XfxnJGyNwQiiYHHlo2kV6hWajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i502RT8F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i502RT8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004641F00893;
	Wed, 30 Sep 2026 03:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790740345;
	bh=m8GGQZLYt5tT8UjtiPcT9CBqG/2fsE9LqgB57R5mlao=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=i502RT8FEEMwPFFdCGnU+451TtRr1ZorrvlpUK0k2vCJF+j61MEyhB3ge8vgtrkoN
	 GkAWIKmXwlrXGMG+zlpLvQK21FfbMZPOIfEOn6qniHLfePSwjr4NarswW8P0NxBwX3
	 R7eZPWi9MXAN5fdD+f8pP9+T6urjBpVWKQftKPP90sa/JbKu4om/DlBr7N1tUr6IZG
	 TOOkZP+YOIY3Q4rFZ5HEoKgztDUVKJ5ZYgYG1qcoLCwcVLup4hek+cwEe/VVY9aDJX
	 EHi7/f/+bRIzcTOzJDbiY5mlSNB2VHDuK1jk21hb/vsMqOewyyDCGy28NetgEd8wjR
	 NK2mn+bjybxAw==
Subject: Re: [PATCH net-next v3 6/6] selftests: net: test the vxlan vnifilter
 request limit and dump replay
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 03:52:24 +0000
Message-ID: <179074034453.434549.18329009232307431760@kernel.org>
In-Reply-To: <20260927215209.2581830-7-alishmery18@gmail.com>
References: <20260927215209.2581830-7-alishmery18@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] No test rejects a VNI because its START is outside the 24-bit
  space, even though the commit message says the bound is "exercised…
- [Low] In vxlan_vnifilter_dump_replay()
  (test_vxlan_vnifiltering.sh:469-471), two run_cmd calls populate the…
- [Low] vxlan_vnifilter_dump_replay() only compares the source dump with
  the destination dump.
- [Low] Every absence and "installed nothing" check in
  vxlan_vnifilter_api() (lines 389, 393, 399, 403, 428, 432) runs…

--

selftests: net: test the vxlan vnifilter request limit and dump replay

This extends test_vxlan_vnifiltering.sh to cover the vnifilter request-size
limit, the 24-bit VNI range, and symmetric add/delete caps. It adds a new
vxlan_vnifilter_dump_replay() test that builds a run twice the limit,
replays the dumped ranges into a second device, and compares the two dumps.
It also adds veth-host and the test netns to cleanup().

> diff --git a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
> index 8deacc565afa1..f48bc861bb88e 100755
> --- a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
> +++ b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh

[ ... ]

> @@ -371,6 +373,116 @@ vxlan_vnifilter_api()

[ ... ]

> +	# The rejected oversized add must install nothing. Assert the range is
> +	# absent first: vxlan_vni_add() folds an already-present VNI into the
> +	# update path and returns 0, so a later probe cannot tell "installed
> +	# nothing" from "installed part" unless it started absent.
> +	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 20000"
> +	log_test $? 1 "VNI 20000 absent before the oversized add"
> +	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 20000-24096"
> +	log_test $? 255 "Cannot add a request over the maximum VNI count"
> +	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 20000"
> +	log_test $? 1 "The rejected oversized add installed nothing"

[Severity: Low]
Can these absence checks pass without looking at the device at all?

run_cmd() does this:

	out=$(eval $cmd $stderr)
	rc=$?

That returns the status of the last command in the pipeline, which is
grep. The script does not set pipefail.

Suppose bridge vni show fails or prints nothing, for example because of a
regression in the dump path. grep -qw 20000 then exits 1 on empty input,
and log_test $? 1 reports OK.

The same pattern is used for every absence and "installed nothing" check
in vxlan_vnifilter_api(), for VNIs 20000, 30000 and 55000.

Could the dump status be checked on its own, or pipefail be enabled for
these commands?

[ ... ]

> +	# The VXLAN header carries 24 bits. The bound is on both endpoints, so a
> +	# range whose END alone leaves the space is rejected too.
> +	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 16777215"
> +	log_test $? 0 "Add the highest VNI the header can carry"
> +	run_cmd "bridge -netns $testns vni del dev vxlan-ext1 vni 16777215"
> +	log_test $? 0 "Delete the highest VNI the header can carry"
> +	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 16777215-16777216"
> +	log_test $? 255 "Cannot add a range whose END leaves the 24-bit space"
> +	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 100-4294967295"
> +	log_test $? 255 "Cannot add a range whose END wraps past the 24-bit space"
> +}

[Severity: Low]
The commit message says:

    and the 24-bit bound exercised through END,
    not only START.

Does any case here reject a VNI because its START is out of range? START
only appears as an accepted value (vni 16777215). Both rejected cases go
out of range through END only.

The 100-4294967295 case also seems to be rejected by the request cap
whatever the policy says. In vxlan_vnifilter_check_msg():

		vnis += vni_end - vni_start + 1;
		if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {

The span is far over 4096, so this returns -EINVAL whether or not the
NLA_POLICY_FULL_RANGE entries in vni_filter_entry_policy exist. So only
16777215-16777216 tests the 24-bit policy.

The case the series' "reject VNIs outside the 24-bit space" patch is
mainly about, a lone START=0xffffffff, has no test. That request has
vnis == 1, so the cap accepts it. Only the START policy then keeps
vxlan_vni_add_del() out of this endless loop:

	for (v = start_vni; v <= end_vni; v++) {

Would a case such as vni 16777216 expecting 255 be worth adding? It
covers START without risking a hang if it regresses.

> +
> +# A device may hold a contiguous run longer than one request's limit, built
> +# from several requests. The dump coalesces it, so the dump must break the run
> +# into entries each no larger than the limit, or the configuration it reports
> +# cannot be replayed. Install such a run, then feed every range the dump
> +# reports back into a second device and require all to be accepted.
> +vxlan_vnifilter_dump_replay()
> +{

[ ... ]

> +	# 8192 contiguous VNIs sharing the default remote: one run, twice the
> +	# limit, installed in two accepted requests.
> +	run_cmd "bridge -netns $testns vni add dev vxlan-src vni 10000-14095"
> +	run_cmd "bridge -netns $testns vni add dev vxlan-src vni 14096-18191"
> +	log_test $? 0 "dump/replay: populate a run larger than the limit"

[Severity: Low]
Is the exit status of the first add ever checked? The second run_cmd
overwrites $?, so log_test only sees the 14096-18191 add.

If the first add fails and the second succeeds, vxlan-src holds only
14096-18191. That is exactly 4096 VNIs, and it dumps as one entry the
input path accepts, with or without this clamp in
vxlan_vnifilter_dump_dev():

		    vnirange(vbegin, v) < VXLAN_VNI_FILTER_MSG_MAX &&

Replay then succeeds and the two dumps match, so all three dump/replay
checks report OK without testing the clamp.

This also applies when the test runs alone with
-t vxlan_vnifilter_dump_replay. In that case the API test's max-size add
check does not run first.

Could each add get its own log_test?

> +
> +	for range in $(bridge -netns $testns vni show dev vxlan-src | \
> +		       grep -oE '[0-9]+-[0-9]+|[0-9]{2,}'); do
> +		bridge -netns $testns vni add dev vxlan-dst vni "$range" \
> +			2>/dev/null || rc=$?
> +	done
> +	log_test $rc 0 "dump/replay: every dumped entry is accepted on replay"
> +
> +	src_ranges=$(bridge -netns $testns vni show dev vxlan-src | \
> +		     grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' | sort)
> +	dst_ranges=$(bridge -netns $testns vni show dev vxlan-dst | \
> +		     grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' | sort)
> +	[ -n "$src_ranges" ] && [ "$src_ranges" = "$dst_ranges" ]
> +	log_test $? 0 "dump/replay: source and destination dump the same ranges"

[Severity: Low]
Would this comparison catch a dump that drops part of the run? Both sides
come from the same vxlan_vnifilter_dump_dev(), and neither is compared
with the 10000-18191 range that was installed.

Suppose the clamp regressed so the dump stopped at the first limit
boundary and reported only 10000-14095, with no new entry starting at
14096. The replay loop would install 10000-14095 on vxlan-dst, and both
dumps would print 10000-14095.

Both the "every dumped entry is accepted on replay" and "source and
destination dump the same ranges" checks would pass, even though half
the configuration was missing from the dump.

Could src_ranges also be compared against the expected
10000-14095 14096-18191?

>  }
>  
>  # Sanity test vnifilter datapath

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927215209.2581830-1-alishmery18%40gmail.com
