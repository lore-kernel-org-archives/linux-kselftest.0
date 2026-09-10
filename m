Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9E54528D;
	Thu, 10 Sep 2026 17:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060936; cv=none; b=lhgndTFspzUwxEiqXRn8hVmaoYKnFFiLEiyYG/kBwqRcDSyEDjCzvlOBzmP6jYnbZd5IHLkLiQexyIyNEBK9iWwGW5xemC8EaB2VItiZuLy+TM6DLp+9V+sy3O/OQsjaTu2y8WGscwAX22Ebu0uyojmL8mFbdFk774gTVQkneAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060936; c=relaxed/simple;
	bh=bRqeQ3BiRKih66NRyLdryg5ULxCFBPpdK7e/6MR5XuY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R9Q1hafjIK4r5iL6GhG5uwnno3lA8P2swaH/Wfp5MXMrj6osTbAyczIUmP8pp+zllFEQ4AnI3HdvQ1phKf6HtFsC1BxtyY6e4BO6Ptrwne0RJBBXFJuZXyGuqbnteBMYw1oNbFeakKgsioq03KwY/byZLoy9CLHszmaS9qtexOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYTSZVVY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYTSZVVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA75B1F00898;
	Thu, 10 Sep 2026 17:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789060925;
	bh=s9O6J70NLYYWYnbw3NIyTFqgKPKPh2yRftC6NreoHq0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kYTSZVVY0iLY/luoQbPy9ZC/SAb2KbmA8Yt8UXiZlBtup5wD7NJm1nOErSCg1zJQ/
	 TDpECn6/2h1sFiZl7dvc6AueuaLJ1iuZtM0EBOPm7mIV2heiD/0tZfERHK6sQDvsRF
	 7WLRr8QeuFjMKpgXb8Boo+tYsdzH4aWxOXPy1mpJDlXWSNF8rbWBi2eHLtYPhxkIqu
	 xrH7gdhuK4uMUS0/yebV6gHNSQTtnNGOKxbiMM0vivCBIHjFC91EaRcG9UnIQsj4G+
	 3kKgSQOlBKFAXc0n81B6wCRhmIUWP0Q7+9ZkxGW+vIhpkGazvtovetdmSXqIrpE9qe
	 rFg0yBgeq+K1Q==
Subject: Re: [PATCH net-next v3 4/4] selftests: openvswitch: suppress pylint
 complexity warnings
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 17:22:04 +0000
Message-ID: <178906092420.219967.14313598876360832725@kernel.org>
In-Reply-To: <20260908171859.1967327-5-houminxi@gmail.com>
References: <20260908171859.1967327-5-houminxi@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)

- [Medium] Commit message mischaracterizes the change: the subject and
  body claim the patch suppresses "complexity and structural warnings"…

Pre-existing issues:
- [Low] Latent inheritance-declaration inconsistency now permanently
  masked: `ovskey.ovs_key_ct_tuple_ipv6` is declared `class…

--

selftests: openvswitch: suppress pylint complexity warnings

This adds a block of module-level pylint disable directives to the top of
tools/testing/selftests/net/openvswitch/ovs-dpctl.py.  The commit message
describes them as complexity and structural suppressions matching the large
netlink message classes in the tool.

> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index dc88cb1b20c1..7ea0d5204401 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> @@ -1,6 +1,14 @@
>  #!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  """OVS datapath control utility for kernel selftests."""
> +# pylint: disable=invalid-name,too-many-lines
> +# pylint: disable=too-many-ancestors,too-many-arguments
> +# pylint: disable=too-many-positional-arguments,too-many-branches
> +# pylint: disable=too-many-locals,too-many-statements
> +# pylint: disable=too-many-return-statements,too-many-nested-blocks
> +# pylint: disable=unused-argument,broad-exception-caught
> +# pylint: disable=no-member,not-callable

[Severity: Medium]
Does the commit message match what these lines actually do?  The subject says
"suppress pylint complexity warnings" and the body says the disables "cover
complexity and structural warnings", but only the too-many-* entries are
complexity checks.

no-member (E1101) and not-callable (E1102) are pylint error-category
diagnostics, and invalid-name (C0103), unused-argument (W0613),
broad-exception-caught (W0718), non-parent-init-called (W0233) and
super-init-not-called (W0231) are unrelated convention/warning checks.

Because these are module-scope directives they apply to the whole file
(roughly 3200 lines), so a misspelled attribute access or a call on a
non-callable anywhere in ovs-dpctl.py can no longer be reported.  This lands
alongside other patches that rewrite format strings and control flow in the
same file.

Could the message spell out that error-class checks are being turned off
file-wide, or could no-member/not-callable be narrowed to the specific
classes that need them?

Also, invalid-name is now disabled module-wide, which makes the pre-existing
inline suppression in ovsactions dead code:

    class dec_ttl(nla):  # pylint: disable=invalid-name

Should that inline disable be dropped in the same patch so there is only one
suppression scope in the file?

> +# pylint: disable=non-parent-init-called,super-init-not-called

[Severity: Low]
This isn't a bug introduced by this patch, but disabling
non-parent-init-called module-wide removes the only automated signal for an
existing inconsistency in ovskey.

ovskey.ovs_key_ct_tuple_ipv6 is declared with nla as its base:

    class ovs_key_ct_tuple_ipv6(nla):
        """IPv6 conntrack tuple key (OVS_KEY_ATTR_CT_TUPLE_IPV6)."""

but its __init__ initializes through a class that is not in its ancestry:

            ovskey.ovs_key_proto.__init__(
                self,
                "ct_tuple6",
                ...

Its ABI peer does derive from ovs_key_proto:

    class ovs_key_ct_tuple_ipv4(ovs_key_proto):

Nothing appears to misbehave today: ovs_key_proto.__init__ only sets
self.proto_str and forwards to nla.__init__, which is a real ancestor, and
neither ct_tuple4 nor ct_tuple6 appears in the ovskey.parse() or
ovskey.dpstr() dispatch tables, so the ovs_key_proto.parse()/dpstr() methods
that ovs_key_ct_tuple_ipv6 does not inherit are never called.

Would it be worth fixing the declared base class to ovs_key_proto rather
than silencing the check that flags it?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908171859.1967327-1-houminxi%40gmail.com
