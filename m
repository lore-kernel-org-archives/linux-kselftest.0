Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D9731326A;
	Fri, 14 Aug 2026 01:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670863; cv=none; b=R/mjio0fiaf5DtyHu0E0Bd9C+/VoVztCWhhFHNDv6KNWRNDFRUD7oiXKRCDPooQbThxsahYe18uEJBaH21KQ98LnYDHdfCFe9hUV2SLStI4iY7viJ/Dr6qnvIlMHwbLtVbz0J++rKMEhdGfgehAulu7MYu6EPo+i+GeFQhHPm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670863; c=relaxed/simple;
	bh=pTiI2wNMiQmOTgjJNUuaYEinlN1Fu9eYGSIRcpAVeBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPkht0P0PSH1RqKfkgeolS16dJN6aW8nXj7fV3vWigsoddVgp4IwbWg1P24fYlDtFMyoXnl1dxcTzQyXmA+owbe5lr8KQwBCL8HRzp7pI4So5OaUc65BKfrOJuOSGVdn26zUpcJplmmzfU03tIzyFLQXiUtNgj1PNDt6YYsuzOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6zOSjUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6zOSjUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A1E1F00A3D;
	Fri, 14 Aug 2026 01:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786670861;
	bh=pZxhR9R1fzLzqe+y89NuLU1mxGB49oS7ysxZBBtcX2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K6zOSjUCudVL07zORDJGtmP6TFvyHSZV+zOd6HS570p1ArLngUe9+74d8J2bABVjF
	 NjACDgZ/84Pu3dnbjql+/P/WaR/OCnm84Hy9jUhDGqsfWLNXk/7FoJ/r7iol8VQFdS
	 OMn6TzDZaELWpLnwc0P+nOMph/7LpKr9S7oChONWsExYmi50AwcClYZn8ix058EB9J
	 ONVfI3H4UJb7hJ+ufBM/oUo05PFGf5N1AJsgL8im/e5JT6UtSVwDrQyol1+SAuZExt
	 qjk4u2hin55GD7xJNB7fEUW7SuOMFYXsDMyvg120f6xOS4qWu6KdqlxSH05DSUjZOo
	 DZ+avt925C5+w==
From: Jakub Kicinski <kuba@kernel.org>
To: xiexinet@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	ali@iusegentoo.com,
	qingfang.deng@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 3/3] selftests: net: hsr: add shared-mutation regression test
Date: Thu, 13 Aug 2026 18:27:40 -0700
Message-ID: <20260814012740.2806069-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808004525.1551-4-xiexinet@gmail.com>
References: <20260808004525.1551-4-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
selftests: net: hsr: add shared-mutation regression test

This adds tools/testing/selftests/net/hsr/hsr_shared_mutation.sh, which
runs two subtests: a PRP subtest that delays one slave with netem and
checks the LAN-ID nibble of captured frames, and an HSR RedBox subtest
that checks the source MAC seen on the master and on the interlink.  The
two subtest results are combined with ksft_status_merge().

A few questions on the new script below.

> diff --git a/tools/testing/selftests/net/hsr/Makefile b/tools/testing/selftests/net/hsr/Makefile
> index 31fb9326cf53..87fe34951b8b 100644
> --- a/tools/testing/selftests/net/hsr/Makefile
> +++ b/tools/testing/selftests/net/hsr/Makefile
> @@ -5,6 +5,7 @@ top_srcdir = ../../../../..
>  TEST_PROGS := \
>  	hsr_ping.sh \
>  	hsr_redbox.sh \
> +	hsr_shared_mutation.sh \
>  	link_faults.sh \
>  	prp_ping.sh \
>  # end of TEST_PROGS
> diff --git a/tools/testing/selftests/net/hsr/hsr_shared_mutation.sh b/tools/testing/selftests/net/hsr/hsr_shared_mutation.sh
> new file mode 100755
> index 000000000000..0b8b8791190d
> --- /dev/null
> +++ b/tools/testing/selftests/net/hsr/hsr_shared_mutation.sh
> @@ -0,0 +1,242 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Verify that per-egress mutations of shared skb data are private:
> +#
> +# F2 (path/LAN ID): on an affected kernel the second slave's LAN-ID write
> +# lands in the first slave's still-queued clone; with a netem delay on
> +# slave A, injected frames leave A carrying B's LAN ID.

[ ... ]

> +	if ! nsx ip link add name prp0 type hsr slave1 vA slave2 vB \
> +		supervision 45 proto 1 2>/dev/null; then
> +		echo "SKIP: HSR/PRP not supported by this kernel"
> +		return $ksft_skip
> +	fi

[Severity: Low]

The header calls this subtest "F2 (path/LAN ID)" and the changelog says
"Add regression coverage for both shared-data corruptions", but is any
path ID actually checked anywhere in the script?

This link is created with proto 1, so only the PRP path is exercised,
and the checks below only decode the PRP RCT LAN-ID nibble.  That covers
prp_create_tagged_frame()'s frame->skb_prp branch.

The sibling branches in hsr_create_tagged_frame() are not touched by
either subtest:

net/hsr/hsr_forward.c:hsr_create_tagged_frame() {
	if (frame->skb_hsr) {
		skb = hsr_clone_private(frame->skb_hsr);
		...
	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
		return hsr_clone_private(frame->skb_std);
	...
}

Would it be worth adding an HSR-tagged (proto 0, version 1) case with
captures on the slave peers so those branches are covered too?

> +	nsx python3 /dev/stdin "$DUR" <<'PYF2'
> +import socket, struct, select, sys, time

[ ... ]

> +tx = socket.socket(socket.AF_PACKET, socket.SOCK_RAW); tx.bind(("prp0", 0))
> +sA = socket.socket(socket.AF_PACKET, socket.SOCK_RAW,
> +        socket.ntohs(0x0003))
> +sA.bind(("vAp", 0))

[Severity: Low]

Every other capability this script needs is probed and turned into a
skip: ip/tc/python3 via require(), sch_netem via the tc qdisc probe, and
HSR/PRP plus HSR RedBox via the ip link add probes.  AF_PACKET is the
exception.

tools/testing/selftests/net/hsr/config lists only:

CONFIG_BRIDGE=y
CONFIG_HSR=y
CONFIG_IPV6=y
CONFIG_NET_SCH_NETEM=m
CONFIG_VETH=y
CONFIG_VLAN_8021Q=m

and CONFIG_PACKET in net/packet/Kconfig is a plain tristate with no
default y.  On a kernel built from this fragment, socket(AF_PACKET, ...)
raises OSError(EAFNOSUPPORT), python3 exits 1, run_f2() returns 1 and
the merge reports a hard FAIL rather than a skip.

Should CONFIG_PACKET be added to the hsr config fragment?

[ ... ]

> +m_src = i_src = None
> +end = time.time() + 4
> +while time.time() < end and (m_src is None or i_src is None):
> +    r, _, _ = select.select([sm, si], [], [], 0.3)
> +    for s in r:
> +        pkt = s.recv(65535)
> +        # exact flow: dst, post-strip EtherType, exact payload, min length;
> +        # h_source is the asserted value and must NOT be filtered on
> +        if (len(pkt) < 60 or pkt[:6] != MCAST or pkt[12:14] != b"\x08\x00"
> +                or pkt[14:14 + len(PAY)] != PAY):
> +            continue
> +        if s is sm and m_src is None:
> +            m_src = pkt[6:12]
> +        elif s is si and i_src is None:
> +            i_src = pkt[6:12]

[ ... ]

> +if i_src != RB:
> +    print("FAIL: interlink did not carry the RedBox MAC")
> +    sys.exit(1)
> +if m_src != NODE:
> +    print("FAIL: master received %s instead of the node MAC "
> +          "(shared-mutation corruption)"
> +          % (m_src.hex() if m_src else "nothing"))
> +    sys.exit(1)

[Severity: Low]

The capture loop above also exits when the four second deadline expires,
leaving i_src as None.  Since None != RB is true, does that make a
missed vIp capture report as "interlink did not carry the RedBox MAC"?

The m_src check that follows is the assertion this subtest exists for -
it detects hsr_xmit()'s ether_addr_copy(eth_hdr(skb)->h_source,
hsr->macaddress_redbox) landing in the master clone - and it is skipped
because the i_src check already called sys.exit(1).

run_f2 has a "nothing arrived" guard:

if len(a) < 150 or len(b) < 150:
    print("FAIL: too few injected frames captured (A=%d B=%d, sent 200)"
          % (len(a), len(b)))

Could F1 get an equivalent explicit check for m_src is None / i_src is
None before the value comparisons, so a timeout is distinguishable from
a wrong MAC?

> +print("PASS: master kept node MAC, interlink kept RedBox MAC")
> +sys.exit(0)
> +PYF1
> +}
> +
> +rc=0
> +
> +run_f2
> +ret=$?
> +rc=$(ksft_status_merge "$rc" "$ret")
> +
> +run_f1
> +ret=$?
> +rc=$(ksft_status_merge "$rc" "$ret")
> +
> +if [ "$rc" -eq 0 ]; then
> +	echo "hsr_shared_mutation: per-egress mutation isolation (F1+F2) [ OK ]"

[Severity: Medium]

The changelog says the results are merged "so packet-socket pressure or
a skip cannot hide a failure".  Does the merge hold for statuses that
are not one of the kselftest constants?

Both run_f2() and run_f1() end with nsx python3 /dev/stdin, so ret is
the raw exit status of ip netns exec python3.  A signal-killed
interpreter gives 128+N (137 for a SIGKILL/OOM, 139 for SIGSEGV), and an
ip netns exec failure gives 255.

ksft_status_merge() only ranks four values:

tools/testing/selftests/net/lib.sh:
ksft_status_merge()
{
	local a=$1; shift
	local b=$1; shift

	__ksft_status_merge "$a" "$b" \
		$ksft_pass $ksft_xfail $ksft_skip $ksft_fail
}

__ksft_status_merge()
{
	...
	for i in "$@"; do
		weights[$i]=$((weight++))
	done

	if [[ ${weights[$a]} -ge ${weights[$b]} ]]; then
		echo "$a"

With ret=137, ${weights[137]} expands to the empty string, which bash
evaluates as 0 inside [[ ]], so 0 -ge 0 succeeds and the function echoes
a, i.e. 0.  rc stays 0, the branch above prints "[ OK ]" and exit "$rc"
returns 0 for a subtest that was killed mid-run.

(If instead the empty operand aborts the conditional, the command
substitution produces no output, rc becomes empty, and both
[ "$rc" -eq 0 ] and [ "$rc" -eq "$ksft_skip" ] error out with exit ""
not propagating a failure either.)

Would normalising ret to $ksft_fail for anything outside
0/$ksft_xfail/$ksft_skip/$ksft_fail before merging address this?

> +elif [ "$rc" -eq "$ksft_skip" ]; then
> +	echo "hsr_shared_mutation: subtests skipped (capabilities missing)"
> +else
> +	echo "hsr_shared_mutation: per-egress mutation isolation [ FAIL ]" \
> +		"rc=$rc" 1>&2
> +fi
> +exit "$rc"
