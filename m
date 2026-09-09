Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3E560AA0;
	Wed,  9 Sep 2026 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957772; cv=none; b=ADxTLZwtSK/bLoKfUdhzWCoVkmHTf+TAEIa4SWcj9RJ1h30YfrtJwrw4XQ57tdiGPGAW2F1RQw2M2/ajF1MkGKhpU4oem0PNYXSlCzFutmCPYyvAYi1O1qTttNVNOOOIcWAY932dJ/CQsbAuFtJOP2QzPKxT9ivVaXup2iShRl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957772; c=relaxed/simple;
	bh=WBb6uK6GC73BvRQY4tC7qJxxsD+tN2YtViErvIaOjak=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kGDsomLPFr3HgkNF/kLa0r2rsg2qW+bU1YfrYwV2cNOH1Car9NoXxZ3vinU7qUzyP+PlMV4BMFWCUe6CSNwyXe22m3oGP8ZatJdj8DqQUdLX1j5WioeccTPfRLT02d75fKxW/2ROdtSZ3M89l0ho2Uy7JS7EQCkir1Eiyps+lIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGSmw17m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGSmw17m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED631F00A3D;
	Wed,  9 Sep 2026 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957770;
	bh=6DTmSoOfHhYhSicAfri7x6hGkSsawCIPjIV+OB1MXR0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TGSmw17mdYw8qiUZSiRFwW57TPNQ7qzEohoY2bceZpUAqpFlm9TTUoXyzoFX3J/Gg
	 Zsm3+h5GBDUNODxbUyUCvL/rJulZ7JU1x7NF18Y3faefBJ4V/a1uNN3ynunKxOQLsy
	 WMX2HbjE5cj4UVE76ePZedVIkSp719By+9FH7/xiV75c4xfnHgy3qA2bQpVcyxck86
	 mPb0uni8yxEGbzEBH8B/E6oMzpYDQ/O4LTY9QWTkITD+neOVOn7WekqxXJ/S8nq4fK
	 9MTHYC+nBCiGAH2JrmvU8mjZ6R33T8U6DVOnXGbvPPtlgK48l2MYiWAsNhViiBaE15
	 fdZAQgUhOHelw==
Subject:
 Re: [PATCH 1/4] selftests: openvswitch: convert %-formatting to f-strings
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 dev@openvswitch.org, echaudro@redhat.com, edumazet@google.com,
 i.maximets@ovn.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org
Date: Wed, 09 Sep 2026 12:42:49 +0000
Message-ID: <178895776955.219967.320136497327402821@kernel.org>
In-Reply-To: <20260905104026.3776396-2-houminxi@gmail.com>
References: <20260905104026.3776396-2-houminxi@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 (1) · Low: 2 (1)

- [Low] Commit message overstates what the patch achieves: it claims
  "Convert all 86 instances of %-formatting to f-strings to fix C0209…
- [Low] The f-string conversion replaces C0209 warnings with a batch of
  new over-long source lines (C0301 / PEP8 79-column, kernel 80-column…

Pre-existing issues:
- [Medium] In `OvsFlow.ovs_flow_msg.dpstr()`
  (tools/testing/selftests/net/openvswitch/ovs-dpctl.py:2556) the fifth…
- [Low] The `del-flows` branch of `main()` in
  tools/testing/selftests/net/openvswitch/ovs-dpctl.py detects a missing…

--

selftests: openvswitch: convert %-formatting to f-strings

This converts %-formatting (and a few str.format() call sites) in
tools/testing/selftests/net/openvswitch/ovs-dpctl.py over to f-strings in
order to silence pylint C0209.  It is described as a pure warning cleanup
with no behavior change.

[Severity: Low]
The commit message says:

  "Convert all 86 instances of %-formatting to f-strings to fix
   C0209 pylint warnings."

Is "all" accurate here?  One literal %-format survives this commit, in
ovsactions.dpstr():

    try:
        print_str += datum.dpstr(more)
    except:
        print_str += "{ATTR: %s not decoded}" % field[0]

C0209 fires exactly on a literal string used with the % operator, so
pylint still reports it for this file after this patch.  This one does get
converted later in the series (in "selftests: openvswitch: add missing
docstrings in ovs-dpctl.py"), so would it make sense to reword the message
here rather than claim the file is C0209-clean?

The message also only mentions %-formatting, while the diff additionally
rewrites str.format() call sites (the UFID string, the sample probability
and the used_time print).  Could the count and the "all %-formatting"
wording be adjusted to match what the diff actually touches?

> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index 1615843c225e4..9cd0d8f0ab233 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py

[ ... ]

> @@ -413,14 +413,13 @@ class ovsactions(nla):
>          )
>  
>          def dpstr(self, more=False):
> -            args = "group=%d" % self.get_attr("OVS_PSAMPLE_ATTR_GROUP")
> +            args = f"group={int(self.get_attr('OVS_PSAMPLE_ATTR_GROUP'))}"
>  
>              cookie = self.get_attr("OVS_PSAMPLE_ATTR_COOKIE")
>              if cookie:
> -                args += ",cookie(%s)" % \
> -                        "".join(format(x, "02x") for x in cookie)
> +                args += f",cookie({''.join((format(x, '02x') for x in cookie))})"

[Severity: Low]
This conversion trades C0209 for C0301.  The cookie line in
ovsactions.psample.dpstr() was wrapped under 80 columns before via a line
continuation and is now over the limit.

The same happens in several other places touched by this patch, all of
which were within 79 columns before:

  - the NAT IP_MIN / IP_MAX prints in ovsactions.ovs_ct_attr.ovs_nat_attr.dpstr()
  - the emask print in ovsactions.ovs_ct_attr.dpstr()
  - the pid print in ovsactions.userspace.dpstr()
  - the three push_vlan() range-check messages in ovsactions.parse()
  - the tci / vid range-check messages in ovskey._parse_vlan_from_flowstr()
  - the encap() trailing-content message in ovskey._parse_encap_from_flowstr()
  - the port print in print_ovsdp_full()

The file goes from 5 to 16 lines longer than 79 columns.  Since the same
patch already uses intermediate locals elsewhere (val, pkts/nbytes,
mhit/mtotal), could those be used here too so no new long lines appear?

For reference, the later patch "selftests: openvswitch: suppress pylint
complexity warnings" concedes "10 remaining C0301 line-too-long warnings
(81-89 columns)" at the series tip, so these stay for the whole series.

>  
> -            return "psample(%s)" % args
> +            return f"psample({args})"

[ ... ]

> @@ -564,22 +557,18 @@ class ovsactions(nla):
>              if self.get_attr("OVS_CT_ATTR_FORCE_COMMIT") is not None:
>                  print_str += "force,"
>              if self.get_attr("OVS_CT_ATTR_EVENTMASK") is not None:
> -                print_str += "emask=0x%X," % self.get_attr(
> -                    "OVS_CT_ATTR_EVENTMASK"
> -                )
> +                print_str += f"emask=0x{self.get_attr('OVS_CT_ATTR_EVENTMASK'):X},"

[ ... ]

> @@ -767,32 +754,27 @@ class ovsactions(nla):
>                      if k == "vid":
>                          vid = int(v, 0)
>                          if vid < 0 or vid > 0xFFF:
>                              raise ValueError(
> -                                "push_vlan(): vid=%d out of "
> -                                "range (0-4095)" % vid)
> +                                f"push_vlan(): vid={int(vid)} out of range (0-4095)")
>                      elif k == "pcp":
>                          pcp = int(v, 0)
>                          if pcp < 0 or pcp > 7:
>                              raise ValueError(
> -                                "push_vlan(): pcp=%d out of "
> -                                "range (0-7)" % pcp)
> +                                f"push_vlan(): pcp={int(pcp)} out of range (0-7)")
>                      elif k == "tpid":
>                          tpid = int(v, 0)
>                          if tpid < 0 or tpid > 0xFFFF:
>                              raise ValueError(
> -                                "push_vlan(): tpid=0x%x out "
> -                                "of range (0-0xffff)" % tpid)
> +                                f"push_vlan(): tpid=0x{tpid:x} out of range (0-0xffff)")

[ ... ]

> @@ -2569,16 +2549,14 @@ class OvsFlow(GenericNetlinkSocket):
>              ufid = self.get_attr("OVS_FLOW_ATTR_UFID")
>              ufid_str = ""
>              if ufid is not None:
> -                ufid_str = (
> -                    "ufid:{:08x}-{:04x}-{:04x}-{:04x}-{:04x}{:08x}".format(
> -                        ufid[0],
> -                        ufid[1] >> 16,
> -                        ufid[1] & 0xFFFF,
> -                        ufid[2] >> 16,
> -                        ufid[2] & 0,
> -                        ufid[3],
> -                    )
> -                )
> +                u0 = ufid[0]
> +                u1h = ufid[1] >> 16
> +                u1l = ufid[1] & 0xFFFF
> +                u2h = ufid[2] >> 16
> +                u2l = ufid[2] & 0
                                ^^^

[Severity: Medium]
This isn't a bug introduced by this patch, but since the mask is being
lifted into a freshly written local, is the & 0 intentional?

Every sibling group in OvsFlow.ovs_flow_msg.dpstr() uses a real shift or
mask (ufid[1] >> 16, ufid[1] & 0xFFFF, ufid[2] >> 16), while u2l is
unconditionally zero, so the fifth group of the printed UFID always comes
out as 0000 and two flows differing only in the low half of ufid[2] print
an identical ufid: string under dump-flows -v.

The packing side in OvsFlow.ovs_flow_msg.parse() drops the same bits:

    uuidRawObj[5] & (0xFF << 32) >> 32,

Since >> binds tighter than &, this is uuidRawObj[5] & 0xFF, so only bits
0-7 of the UUID node field reach word 2.

openvswitch.sh test_flow_set installs a UFID with a nonzero fifth group:

	local fwd_flow="ufid:00000001-0002-0003-0004-000500060007"

but only asserts on the dumped action, so nothing in-tree catches this.
Would it be worth using 0xFFFF here (as a separate patch) instead of
carrying & 0 forward?  It is still present at the series tip.

> +                u3 = ufid[3]
> +                ufid_str = (f"ufid:{u0:08x}-{u1h:04x}-{u1l:04x}"
> +                            f"-{u2h:04x}-{u2l:04x}{u3:08x}")

[ ... ]

> @@ -3115,7 +3088,7 @@ def main(argv):
>      elif hasattr(args, "flsbr"):
>          rep = ovsdp.info(args.flsbr, 0)
>          if rep is None:
> -            print("DP '%s' not found." % args.flsbr)
> +            print(f"DP '{args.flsbr}' not found.")
>          ovsflow.del_flows(rep["dpifindex"])

[Severity: Low]
This is a pre-existing issue and not introduced by this patch, but while
this branch is being touched: is the missing return 1 here deliberate?

OvsDatapath.info() turns an ENODEV netlink reply into None:

    except NetlinkError as ne:
        if ne.code == errno.ENODEV:
            reply = None

so del-flows against a nonexistent datapath prints the message and then
falls into rep["dpifindex"], raising TypeError: 'NoneType' object is not
subscriptable.  The adjacent addif / delif / dumpdp / add-flow / mod-flow
branches all return 1 after the same check.  It is unchanged at the series
tip.

>  
>      return 0

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260905104026.3776396-1-houminxi%40gmail.com
