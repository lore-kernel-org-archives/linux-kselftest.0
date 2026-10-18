Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654C44B9221;
	Sun, 18 Oct 2026 13:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329397; cv=none; b=ifxpRr3m9k6ira1aj11v5IZ0fyqltVRe76TeoS61ka8YvbFa6ekK528fHyU4MurMUv0fdQtPoLZ15sxBFghe0y7pTW5xEz7gmYBACk1wIqctG3zLY64vRCoALj+EysSOny5WY4+h0hGuNN/5KtiNNTFc/2OpiWDuXejHblxK1Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329397; c=relaxed/simple;
	bh=7SONenFz0VX6VfgFhhgS6ItUrvfAMVhNTv7y80LrKbE=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C9vv6WcSJZ0UyTNRP/pZ/9qXxy2X4G/AihGvEaBIeyRBBuQDuJiuBbJuGiuSUOOSlyxH6uZ1sGO9lcp65xXaFCQpeZYkTl0jiLXCrgalA4Ntkt78kEcHzttVKretbafdmIeOzosMjuNNG1j2iIKkh2t6FwOyGEkpQ0L5hfWchtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evTqrPOu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evTqrPOu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8935A1F000C5;
	Sun, 18 Oct 2026 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792329396;
	bh=yPfxwYavMEPqVnPZXTuepLeeedqkC9HKHNpd77Ks81Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=evTqrPOujd5dB94DzqLRaoi0n5Yb3Ia9tOY9B+b8Qj1KCDXWfDuJ/niJQIpHk0Mbk
	 YQ6xiBwXfe26gM8URgvQx9VGk4rZPZesd42rJLHMBbs/Zfpi+Am1+XtCclrWUmlq06
	 QM+cCH1lA0Gw9CG+zkrWPdKCkIu5grZ+1aS5A1o6+eUwKkANy9RElDBmG4FFZ6trv+
	 gQxsLwd8C86j9tuH7wxZKn2sEzUXMKd1J948tA/ZtEJsYrXV6Tg+XiVYLuW5Y+mVn9
	 KQdgbrthtNfOjNvCHCOGMdN4En5Yv6o5cm0YDfU2Slt5CYLC14NsuGEU+2SBLt1C2g
	 M/OPiLJrSRdig==
Subject: Re: [PATCH net-next v4 7/7] selftests: net: test the vxlan vnifilter
 request limit and dump replay
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 13:16:35 +0000
Message-ID: <179232939511.3135.8638231822029471558@kernel.org>
In-Reply-To: <20261014123814.388557-8-alishmery18@gmail.com>
References: <20261014123814.388557-8-alishmery18@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 4 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In vxlan_vnifilter_dump_replay()
  (tools/testing/selftests/net/test_vxlan_vnifiltering.sh), the exit…
- [Low] Each new 'absent before' / 'installed nothing' probe in
  vxlan_vnifilter_api() runs `bridge -netns $testns vni show dev vxlan-…
- [Low] vxlan_vnifilter_dump_replay() replays the dump one range at a
  time, each in its own `bridge vni add` (lines 457-460), using ranges…
- [Low] The 24-bit bound cases in vxlan_vnifilter_api() do not isolate
  the START half of vni_filter_entry_policy, and one case cannot tell…
- [Low] In vxlan_vnifilter_dump_replay(), the replay result variable `rc`
  is overwritten by run_cmd() before the replay loop.

Pre-existing issues:
- [Low] The comment on VXLAN_VNI_FILTER_MSG_MAX in
  drivers/net/vxlan/vxlan_vnifilter.c (lines 20-24) still says 'A later…

--

selftests: net: test the vxlan vnifilter request limit and dump replay

This extends test_vxlan_vnifiltering.sh to cover the per-request VNI cap
on add and delete and the 24-bit VNI bound. It also adds a dump/replay
test that builds a contiguous run twice the limit and replays the dumped
ranges into a second device. The cleanup() handler now also removes
veth-host and the test netns.

> diff --git a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
> index 6fb5af013dacf..bb35e89d2d036 100755
> --- a/tools/testing/selftests/net/test_vxlan_vnifiltering.sh
> +++ b/tools/testing/selftests/net/test_vxlan_vnifiltering.sh

[ ... ]

> @@ -347,6 +349,121 @@ vxlan_vnifilter_api()
>  	# change vxlan vnifilter flag
>  	run_cmd "ip -netns $testns link set dev vxlan-ext1 type vxlan external novnifilter"
>  	log_test $? 2 "Cannot unset vnifilter flag on a device"
> +
> +	# A single request may add at most 4096 VNIs. bridge(8) puts one
> +	# VXLAN_VNIFILTER_ENTRY per comma-separated item into a single message,
> +	# so both the single-entry and the multi-entry paths are reachable here.

[Severity: Low]
This problem was not introduced by this patch, but the comment on
VXLAN_VNI_FILTER_MSG_MAX in drivers/net/vxlan/vxlan_vnifilter.c still
describes the request cap as future work:

drivers/net/vxlan/vxlan_vnifilter.c:
 * dump emits stays within what the input path will accept on replay. A later
 * patch bounds a single RTM_NEWTUNNEL/RTM_DELTUNNEL request to the same number.
 */
#define VXLAN_VNI_FILTER_MSG_MAX	4096

That cap is already in the tree. vxlan_vnifilter_process() calls
vxlan_vnifilter_check_msg() before it applies any entry:

	err = vxlan_vnifilter_check_msg(nlh, extack);
	if (err)
		return err;

Could the "A later patch" sentence be updated, since this selftest is
exercising that cap?

> +
> +	# The largest accepted add, and one VNI more rejected.
> +	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 10000-14095"
> +	log_test $? 0 "Add a request of the maximum VNI count"
> +
> +	# The rejected oversized add must install nothing. Assert the range is
> +	# absent first: vxlan_vni_add() folds an already-present VNI into the
> +	# update path and returns 0, so a later probe cannot tell "installed
> +	# nothing" from "installed part" unless it started absent.
> +	run_cmd "bridge -netns $testns vni show dev vxlan-ext1 | grep -qw 20000"
> +	log_test $? 1 "VNI 20000 absent before the oversized add"

[Severity: Low]
Can this probe pass when bridge vni show itself fails?

run_cmd() evaluates the whole pipeline and returns its status:

	out=$(eval $cmd $stderr)
	rc=$?

That status comes from grep. Neither this script nor lib.sh sets
pipefail. If bridge vni show fails, grep reads no input and exits 1, which
is the value log_test expects.

The same pattern is used for each of the "absent before" and "installed
nothing" probes for 20000, 30000 and 55000. That means these probes cannot
tell a VNI that is absent from a show that failed.

The src_ranges and dst_ranges captures in vxlan_vnifilter_dump_replay() also
drop the exit status of bridge.

Would it make sense to check the exit status of bridge vni show on its own,
or to set pipefail for these probes?

> +	run_cmd "bridge -netns $testns vni add dev vxlan-ext1 vni 20000-24096"
> +	log_test $? 255 "Cannot add a request over the maximum VNI count"

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

[Severity: Low]
Does the 100-4294967295 case depend on the END range policy? Its span is
4294967196 VNIs, so vxlan_vnifilter_check_msg() would reject it with
-EINVAL even if the END bound in vni_filter_entry_policy were removed:

	vnis += vni_end - vni_start + 1;
	if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {

The test comment ("The bound is on both endpoints") and the commit message
("exercised through END, not only START") suggest that an out-of-range
START is tested. No such case exists here or elsewhere under
tools/testing/selftests.

A single VNI such as 16777216 has no END attribute. That gives a span of
one, so check_msg accepts it, and only the START policy keeps it out of
vxlan_vni_add_del():

	[VXLAN_VNIFILTER_ENTRY_START] = NLA_POLICY_FULL_RANGE(NLA_U32,
							      &vni_filter_vni_range),

If START=END=0xffffffff ever got past that policy, this loop would wrap
under rtnl_lock:

	for (v = start_vni; v <= end_vni; v++) {

Could a case like "vni add ... vni 16777216" be added so a regression in
the START bound is caught?

> +}
> +
> +# A device may hold a contiguous run longer than one request's limit, built
> +# from several requests. The dump coalesces it, so the dump must break the run
> +# into entries each no larger than the limit, or the configuration it reports
> +# cannot be replayed. Install such a run, then feed every range the dump
> +# reports back into a second device and require all to be accepted.
> +vxlan_vnifilter_dump_replay()
> +{
> +	local opts="external vnifilter local 172.16.0.1 dev veth-testns"
> +	local range rc=0 src_ranges dst_ranges

[ ... ]

> +	# 8192 contiguous VNIs sharing the default remote: one run, twice the
> +	# limit, installed in two accepted requests.
> +	run_cmd "bridge -netns $testns vni add dev vxlan-src vni 10000-14095"
> +	run_cmd "bridge -netns $testns vni add dev vxlan-src vni 14096-18191"
> +	log_test $? 0 "dump/replay: populate a run larger than the limit"

[Severity: Medium]
Is the status of the first populate command lost here? The $? passed to
log_test is only the status of the 14096-18191 add.

If the 10000-14095 add fails, vxlan-src holds exactly 4096 VNIs. In that
case vxlan_vnifilter_dump_dev() never reaches the clamp:

	if (!dump_stats && vnirange(vend, v) == 1 &&
	    vnirange(vbegin, v) < VXLAN_VNI_FILTER_MSG_MAX &&

The dump is then a single limit-sized entry. The non-empty check, the
replay loop and the src/dst comparison all pass, whether or not the dump
clamp exists.

The v4 note says the non-empty check was added so the replay case cannot
pass vacuously, but this path still does.

There is a related gap. src_ranges is never compared against the expected
split (10000-14095 and 14096-18191). Both the replay input and the expected
result come from the same source dump.

A resume regression in vxlan_vnifilter_dump_dev() could drop or repeat VNIs
at the 4096 boundary, or lose the second message:

	if (!err && vbegin) {
		if (vnis + vnirange(vbegin, vend) + 1 > VXLAN_VNI_FILTER_MSG_MAX)
			err = -EMSGSIZE;

Wouldn't that produce the same wrong ranges on both devices and still
pass?

Could each populate command get its own log_test, and could src_ranges be
checked against the literal expected ranges?

> +
> +	# Assert the dump is non-empty before replaying it, so an empty or
> +	# failed dump cannot let the replay check below pass without testing
> +	# anything.
> +	src_ranges=$(bridge -netns $testns vni show dev vxlan-src | \
> +		     grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' | sort)
> +	test -n "$src_ranges"
> +	log_test $? 0 "dump/replay: source dump is non-empty"
> +
> +	for range in $src_ranges; do
> +		bridge -netns $testns vni add dev vxlan-dst vni "$range" \
> +			2>/dev/null || rc=$?
> +	done

[Severity: Low]
This loop replays one range per bridge vni add, using ranges parsed from
the text output of bridge vni show. That output loses netlink message
boundaries, so the per-message VNI budget in vxlan_vnifilter_dump_dev() is
never tested:

	if (vnis + sz > VXLAN_VNI_FILTER_MSG_MAX) {
		err = -EMSGSIZE;
		break;
	}

vxlan_vnifilter_check_msg() caps the sum across all entries in a request.
Suppose that budget were removed and the merge clamp kept. The 8192-VNI
run would be dumped as 10000-14095 and 14096-18191 in one message, and that
message would be rejected if replayed as a single request.

Each range would still replay on its own here, the dumps would match, and
the test would pass. Is the per-message half of the dump guarantee meant
to be covered by this test?

> +	log_test $rc 0 "dump/replay: every dumped entry is accepted on replay"

[Severity: Low]
Can rc be non-zero here even when every replay add succeeded?

run_cmd() assigns rc=$? without declaring it local. Because bash scoping is
dynamic, that assignment writes to the local rc in
vxlan_vnifilter_dump_replay(). After the 14096-18191 populate run_cmd, rc
holds that command's exit status.

The replay loop only assigns rc when an add fails. So if the populate
failed, this line also reports FAIL even when all replays succeeded, and
the rc=0 initializer has no effect.

Would resetting rc=0 just before the loop, or using a separate variable,
avoid this?

> +
> +	dst_ranges=$(bridge -netns $testns vni show dev vxlan-dst | \
> +		     grep -oE '[0-9]+-[0-9]+|[0-9]{2,}' | sort)
> +	[ "$src_ranges" = "$dst_ranges" ]
> +	log_test $? 0 "dump/replay: source and destination dump the same ranges"
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014123814.388557-1-alishmery18%40gmail.com
