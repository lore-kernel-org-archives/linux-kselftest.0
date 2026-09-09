Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E6255931D;
	Wed,  9 Sep 2026 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957774; cv=none; b=q0BXf5vVOpVREOX9NPfe8ydiYXzJyp1GdYrKbyoUgpz9lhoI4WzTTdExFCG0P9U13/oIdVFwz5Q5TlvrEkrPutEZauvGZ9t1m4rSNyJ0eCNeTKYbqU2OszhGsw++IJuBcFTgKo1z9RPKXe6NBwBkWtlC3qu6/1Kx37DLnvwt+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957774; c=relaxed/simple;
	bh=4Qw/cEF/6vzWwoTqTEV0lPg8qMuKkaDtLKc+B8vyAck=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FeQXrWEREYW2tQ3lTrlkxGD8znhc93aaWvQAFlkr7MNISDljPZjGrtUmYQMbLiFb3QbbE0Cf+RPTFUqEbdSTWyREsPHkBbnDEq6k8ISLcm7MY0964309wHwKPHEasmKts8EdmQlQ35RNa0KJVyROxVfkMoHXFCHWhOmIRsmPAtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR1EkWOJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR1EkWOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652CF1F00A3A;
	Wed,  9 Sep 2026 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957772;
	bh=ZCeD/ci0csTf1k0l4vx1bXkLyiFOEHf/IrAS3VxisBQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NR1EkWOJbQRO7UnDWH0ggifSSjWtgN27z+//UnNbwuTHdG1/gu/KjiVituyFTP6mQ
	 HZd2rBE/3k5JBgJ/SXpnezMMe70FHYPYPeluWF7mPsK0adeWPINkTPDsMbjZSfBtOf
	 mau+mXoEAvPztjBtm8tiGl88f5m/dLjvNXoxh+eWCR5NgInvJqk1qDBACFelmQQEjl
	 wx5fVC3y1o+iobMWOalgFjOTant9TsrrRybUKyZ32Hcas7ocpvM9BBjvH9ZYfPJbZn
	 o1iat3mRUjsbAARQ5OeD0i5VELGYhKIULMLyEJK/DI/aFDJSFod3Z+n8vIOfeKA4sh
	 eGQjIggmEWNeA==
Subject: Re: [PATCH 2/4] selftests: openvswitch: fix misc pylint warnings in
 ovs-dpctl.py
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 dev@openvswitch.org, echaudro@redhat.com, edumazet@google.com,
 i.maximets@ovn.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org
Date: Wed, 09 Sep 2026 12:42:50 +0000
Message-ID: <178895777098.219967.14129897919670426089@kernel.org>
In-Reply-To: <20260905104026.3776396-3-houminxi@gmail.com>
References: <20260905104026.3776396-3-houminxi@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 (2) · Low: 0

- [Medium] Commit message / diff mismatch: the changelog of "selftests:
  openvswitch: fix misc pylint warnings in ovs-dpctl.py" lists "W0702:…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but the loop
  this patch rewrites hides it: OvsDatapath.create()…
- [Medium] This problem wasn't introduced by this patch, but: the UFID
  codec in ovs-dpctl.py neither encodes nor prints the requested UUID…

--

selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py

This patch applies a set of mechanical pylint cleanups to
tools/testing/selftests/net/openvswitch/ovs-dpctl.py: dropping an unused
import, flattening elif-after-return, dropping superfluous parentheses and
lambdas, and renaming or removing unused variables.  No behaviour change is
intended.

A few questions below, mostly about the changelog and about two spots the
cleanups touch or pass over.

> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index 9cd0d8f0ab233..6a02810fe4eaf 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py

[ ... ]

>       - W0611: remove unused import struct
>       - W0702: replace bare except with except Exception

[Severity: Medium]
Is this W0702 line accurate for this patch?  I don't see a hunk here that
touches a bare except.  At this commit the handler in ovsactions.dpstr() is
still byte-identical to the baseline:

tools/testing/selftests/net/openvswitch/ovs-dpctl.py:ovsactions.dpstr() {
    ...
                else:
                    try:
                        print_str += datum.dpstr(more)
                    except:
                        print_str += "{ATTR: %s not decoded}" % field[0]
    ...
}

So pylint still reports W0702 for this file after the patch is applied, and
the handler still swallows KeyboardInterrupt and SystemExit while formatting
actions on the dump path main() -> ovsflow.dump() -> ovs_flow_msg.dpstr() ->
ovsactions.dpstr().

The except: -> except Exception: conversion actually appears in the next
patch of the series, "selftests: openvswitch: add missing docstrings in
ovs-dpctl.py", whose own changelog only mentions docstrings.  Should that
hunk move back here, or should this bullet be dropped?

Separately, the two int() removals in the push_vlan error strings below are
real hunks of this patch but are not listed in the changelog.  Worth adding a
bullet for them?

[ ... ]

> @@ -761,12 +756,12 @@ class ovsactions(nla):
>                          vid = int(v, 0)
>                          if vid < 0 or vid > 0xFFF:
>                              raise ValueError(
> -                                f"push_vlan(): vid={int(vid)} out of range (0-4095)")
> +                                f"push_vlan(): vid={vid} out of range (0-4095)")
>                      elif k == "pcp":
>                          pcp = int(v, 0)
>                          if pcp < 0 or pcp > 7:
>                              raise ValueError(
> -                                f"push_vlan(): pcp={int(pcp)} out of range (0-7)")
> +                                f"push_vlan(): pcp={pcp} out of range (0-7)")
>                      elif k == "tpid":
>                          tpid = int(v, 0)
>                          if tpid < 0 or tpid > 0xFFFF:

[ ... ]

> @@ -2304,7 +2296,7 @@ class OvsDatapath(GenericNetlinkSocket):
>  
>              nproc = multiprocessing.cpu_count()
>              procarray = []
> -            for i in range(1, nproc):
> +            for _ in range(1, nproc):
>                  procarray += [int(p.epid)]
>              msg["attrs"].append(["OVS_DP_ATTR_UPCALL_PID", procarray])

[Severity: Medium]
This isn't a bug introduced by this patch, but the rename does remove the one
lint signal pointing at this loop.  Was the W0612 warning here telling us the
range bound is wrong rather than that the index is unused?

OvsDatapath.create() sets OVS_DP_F_DISPATCH_UPCALL_PER_CPU and then builds
nproc-1 copies of the same epid, which is an empty list on a single-CPU host.
The index was never used to pick a per-CPU socket, so range(nproc) looks like
what was meant.

The array is also appended under OVS_DP_ATTR_UPCALL_PID, which the kernel
declares as a single u32:

net/openvswitch/datapath.c:
	[OVS_DP_ATTR_UPCALL_PID] = { .type = NLA_U32 },

and consumes as the local vport portid:

	parms.upcall_portids = a[OVS_DP_ATTR_UPCALL_PID];

Per-CPU dispatch pids are installed only from a[OVS_DP_ATTR_PER_CPU_PIDS].
ovs-dpctl.py declares OVS_DP_ATTR_PER_CPU_PIDS in dp_cmd_msg.nla_map but
never appends it to a message, so does the per-CPU upcall dispatch path ever
actually get programmed by openvswitch.sh?

OVS_DP_CMD_NEW uses GENL_DONT_VALIDATE_STRICT, so the oversized attribute is
accepted; on a one-CPU host the list is empty and the NLA_U32 length check
should reject the message, while create() only swallows EEXIST.

[ ... ]

> @@ -3068,7 +3062,7 @@ def main(argv):
>              return 1
>          rep = ovsflow.dump(rep["dpifindex"])
>          for flow in rep:
> -            print(flow.dpstr(True if args.verbose > 0 else False))
> +            print(flow.dpstr(args.verbose > 0))

[Severity: Medium]
This is a pre-existing issue and untouched by this patch, but since this hunk
is the dump printing path: does the UFID codec in this file round-trip the
UUID it was given?

In OvsFlow.ovs_flow_msg.parse() the third word is built as:

                        uuidRawObj[3] << 24
                        | uuidRawObj[4] << 16
                        | uuidRawObj[5] & (0xFF << 32) >> 32,

Python binds >> tighter than &, so the last term is node & 0xFF rather than
node >> 32.  For the UUID used by openvswitch.sh test_flow_set,
ufid:00000001-0002-0003-0004-000500060007, the word comes out 0x00040007
instead of 0x00040005, so the UFID installed in the kernel differs from the
one requested on the command line.

The matching field is printed in OvsFlow.ovs_flow_msg.dpstr() from:

                u2l = ufid[2] & 0

which is always zero, so the fifth UUID group always renders as 0000.  Should
that mask be 0xFFFF?

test_flow_set only greps the dump output for actions:drop, so neither the
encode nor the print side is checked by the test.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260905104026.3776396-1-houminxi%40gmail.com
