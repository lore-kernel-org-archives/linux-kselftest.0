Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C7E1DDC37;
	Wed,  9 Sep 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957777; cv=none; b=Im9W8RQ+GU1LPWXuk3DDkpow+DC7kxHCaOcXkCf2hG2nq53ZNxSO02YVFlvSU2p8dHL1++en3ggJ5k9CGq5PE2T56GqguIQPh385FgG+tMonl0XpQNRMDSRgXDQoyiteE5MvKVZzeY9KjbkGz6FXRYcrx0oeANApVy6YYRXaoHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957777; c=relaxed/simple;
	bh=bi96cR2MbkjCxENpmuXx2IGtS0oTleBROA7ts9a+KYU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ucjc4QlWJvyxUtJ3BNnVAj+ghUA9atkWbSerzJgm1Byi7MGC7++U6zHNiAiBmg0bMdVLXeFqhbehwji3RqX5LwuSQX7nxXS46/0W0jGl3rGjUqHctuIZfO2XoPlNnGLRfpWtsOEJIbGUscCKcjjUWc8rGnXBI9nTo0SAXCC5SBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSSVrAre; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSSVrAre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412BD1F00A3A;
	Wed,  9 Sep 2026 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957775;
	bh=ikJtf8AGAZQE/o0BEx3Jt+E1xqpjR1+NOsBnOVGV+zY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HSSVrAreFKyEIyVDz5d5h0NhJQa5U17Xm5sdF6CzQ2gzzvtcydF32r6dzQaaU8479
	 PpUjwf+1dAwdvMz7lk+BtzNEYLHAM/69W5imaUYSHDhS0QyCn40J2zKzERSOidncJN
	 Rs7v3c2R04icw+vKD2JO8XGJp0L16DRAUM9ngWpI8kUbEiFN8gtvpmY5JCWskIeZud
	 BjZ0+MujG2cbeHotAu0fVuF6EiJuUWYIj3P9+fHugOq/UuUEtkeKRwuKg/VXHntZ7A
	 +vZBKJKAEQxufSwDS/anvU6tEK6PFbG9jd3znT0pMuxVLRrzWiMfS83yTFYRWa+IjH
	 OL94rb3m5tD7w==
Subject:
 Re: [PATCH 4/4] selftests: openvswitch: suppress pylint complexity warnings
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 dev@openvswitch.org, echaudro@redhat.com, edumazet@google.com,
 i.maximets@ovn.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org
Date: Wed, 09 Sep 2026 12:42:53 +0000
Message-ID: <178895777380.219967.10666141690600175241@kernel.org>
In-Reply-To: <20260905104026.3776396-5-houminxi@gmail.com>
References: <20260905104026.3776396-5-houminxi@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 1

- [Medium] Commit message mischaracterizes the change: the subject says
  "complexity warnings" and the body claims all suppressed warnings are…
- [Medium] The docstrings added by this series' commit "selftests:
  openvswitch: add missing docstrings in ovs-dpctl.py" document the…
- [Low] The file-wide `broad-exception-caught` (W0718) disable suppresses
  a warning that this patch series itself created, not a pyroute2…

--

selftests: openvswitch: suppress pylint complexity warnings

This adds a block of file-level pylint disable comments to
tools/testing/selftests/net/openvswitch/ovs-dpctl.py, covering 16 message
names.  The commit message attributes all of them to pyroute2 framework
constraints and reports a resulting score of 9.93/10.  A few questions
about the scope of the suppression and about docstrings added earlier in
this series follow.

> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index 5b29aeb4b50e2..5948471ffe63c 100644
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
> +# pylint: disable=non-parent-init-called,super-init-not-called

[Severity: Medium]
Does the commit message match what this block actually does?  The subject
says "complexity warnings" and the body says the warnings are "caused by
pyroute2 framework constraints that cannot be fixed without restructuring
the netlink attribute hierarchy", but only too-many-ancestors,
non-parent-init-called, super-init-not-called and partly invalid-name come
from subclassing pyroute2 nla/genlmsg.

The complexity metrics come from this script's own functions, not from
pyroute2.  main() is a roughly 200-line if/elif chain, and
ovsactions.parse(), ovskey.parse() and ovskey.dpstr() are similarly large:

    def main(argv):
        """Entry point for ovs-dpctl utility."""
        nlmsg_atoms.encap_ovskey = encap_ovskey
        ...

Those are reachable by ordinary refactoring, so is "cannot be fixed"
accurate for too-many-branches, too-many-locals, too-many-statements,
too-many-return-statements, too-many-nested-blocks, too-many-arguments and
too-many-positional-arguments?

Separately, no-member and not-callable are correctness checks (misspelled
attribute, calling a non-callable).  Disabling them for the whole 3190-line
file means pylint will no longer flag an attribute typo or an API misuse
anywhere in this file for any future edit.  Could those two be scoped to the
specific pyroute2 dynamic-attribute sites instead?

The file already shows the narrow form working:

    class dec_ttl(nla):  # pylint: disable=invalid-name
        """Nested OVS_DEC_TTL_ATTR_* sub-attributes."""

That inline disable is now dead, since invalid-name is disabled file-wide by
this patch.  Should it be dropped, or should the file-wide invalid-name be
dropped in favour of per-site disables?

[Severity: Low]
On the broad-exception-caught entry specifically: was that warning created by
this series rather than by pyroute2?  At the baseline commit 9eab111e there is
no "except Exception" in the file at all; it had a bare "except:".  An earlier
commit in this series converted it, and the result is the only W0718 site in
the file:

    try:
        print_str += datum.dpstr(more)
    except Exception:
        print_str += f"{{ATTR: {field[0]} not decoded}}"

Since that is a single call site in ovsactions.dpstr(), would an inline
disable on that line, or catching a narrower set such as
"except (KeyError, TypeError, ValueError)", be preferable to a file-wide
disable?

Also, could the commit message mention that this warning came from the
series itself instead of attributing it to pyroute2?

[Severity: Medium]
Not about this hunk, but while looking at the file for the pylint scope
question: the docstrings added by the earlier series commit "selftests:
openvswitch: add missing docstrings in ovs-dpctl.py" appear to be shifted by
one definition, so each one describes a neighbouring member.

In OvsDatapath:

    def info(self, dpname, ifindex=0):
        """Create a new datapath."""
        msg["cmd"] = OVS_DP_CMD_GET

    def create(self, dpname, shouldUpcall=False, versionStr=None, p=OvsPacket()):
        """Destroy a datapath."""
        msg["cmd"] = OVS_DP_CMD_NEW

    def destroy(self, dpname):
        """Look up a datapath by name."""
        msg["cmd"] = OVS_DP_CMD_DEL

Should destroy(), which sends OVS_DP_CMD_DEL, be documented as a lookup?

The same shift runs through five OvsVport methods: info() sends
OVS_VPORT_CMD_GET but says "Create a new vport.", attach() sends
OVS_VPORT_CMD_NEW but says "Get info about a vport.", reset_upcall() sends
OVS_VPORT_CMD_SET but says "Attach a vport to a datapath.", detach() sends
OVS_VPORT_CMD_DEL but says "Reset a vport.", and upcall_handler(), which only
forwards to the packet handler, says "Remove a vport from a datapath."

The OvsFlow upcall helpers are affected too:

    def miss(self, packetmsg):
        """Dump all flows for a datapath."""
        ...
        print(f"MISS upcall[{int(seq)}/{pktpres}]: {keystr}", flush=True)

    def execute(self, packetmsg):
        """Delete a flow from a datapath."""
        print("userspace execute command", flush=True)

    def action(self, packetmsg):
        """Add a flow to a datapath."""
        print("userspace action command", flush=True)

And the psample side:

    class psample_sample(genlmsg):
        """psample generic netlink event handler."""
        ...
        def dpstr(self):
            """Start receiving psample events."""

    class PsampleEvent(EventSocket):
        ...
        def read_samples(self):
            """Set the psample group to listen on."""
            print("listening for psample events", flush=True)
            while True:

The nested field structs show it as well: vportstats, whose fields are
rx_packets/tx_packets/..., is documented as "Tunnel options attributes.",
flowstats (packets/bytes) as "Flow key/mask/actions message.", dpstats
(hit/missed/lost/flows) as "Datapath info message." and megaflowstats as
"Datapath statistics."

Given that the shift covers at least 18 members, would it make sense to
re-audit all 88 added docstrings rather than fixing them one at a time?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260905104026.3776396-1-houminxi%40gmail.com
