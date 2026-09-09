Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038F5632B3;
	Wed,  9 Sep 2026 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957775; cv=none; b=nQa54Jg+FaHZkqMiwVznF9p5IRg1B6pd6IPyjPF5AReceVPiYCPmCp6tr3alaZPJXfbKgg1gZTgbGXpt0JfSMNTe+N/LFyJ+OSNbV4AmWHYbb94mWuBlZ7u7hjQ/0xKJvXFE5N+fNdihaErgWiqvPfHhPcuiaC3KmWg9UkIFfb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957775; c=relaxed/simple;
	bh=Px4D38osfWdjAEUuGOVT/R9xB73Teb18OAwXq2qmIgw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PKGyOwvZY/8esGc1AHOkVKZGfznHj/IXopeKShCRcxG0lTw/BAFlD0NIRIT6gtmdPCsyNNzsx2hpDj7NPbP9KNvbrEdz2VNd6zU6w6fPKa29qRCDS/WB907HxZ6qhv9atBCppfq5+PZmCzBWM24SZe8+dG8J6M1+DIWTIEaAw04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKoaA4jS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKoaA4jS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DF51F00A3E;
	Wed,  9 Sep 2026 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957773;
	bh=LXP2YMgj8tp143oKK8BlPB/6FctzL+wF7y5dCW3aC4o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mKoaA4jSkiygZ/yTevIaZlH/jyvYYb/LID5h3yTktfUfG5XmuLyEvjChEIDV94Cw0
	 awBIXU/8V6NHrvxbQU7J5GchuWs7TSlax60Zhs/wAWb3SQN5G5BTSjjuws8huSdDQO
	 EwjJAYalW+JEVdn7qGE8sGU2uK3Fnc7q7nsSlDwU6AFoNig+CMJOBW9atnWRLsV0hO
	 IloZc88aZzya4P/pRXCXoR93CE9xe+q+hePBmfoofnGBmMyJkdv6t/g7OFLU+oFWm1
	 dw3P9VxMnJ60g2+NSgPZ27w4aiSvdxpRMv9W2V52zTFowOFPy8iyopH/UXlCHuybnM
	 AEBqcVlYcGWhQ==
Subject: Re: [PATCH 3/4] selftests: openvswitch: add missing docstrings in
 ovs-dpctl.py
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 dev@openvswitch.org, echaudro@redhat.com, edumazet@google.com,
 i.maximets@ovn.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org
Date: Wed, 09 Sep 2026 12:42:52 +0000
Message-ID: <178895777227.219967.10285249031265134414@kernel.org>
In-Reply-To: <20260905104026.3776396-4-houminxi@gmail.com>
References: <20260905104026.3776396-4-houminxi@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 1 (1) · Low: 1

- [High] Roughly 19 of the newly added docstrings in
  tools/testing/selftests/net/openvswitch/ovs-dpctl.py describe a…
- [Medium] The commit message states the patch only adds one-line
  docstrings to fix C0114/C0115/C0116, but the diff also contains…
- [Low] Four lines are renamed from snake_case `parsed_len` to camelCase
  `parsedLen` (in `ovsactions.sample.parse()` at lines 483-484 and in…

Pre-existing issues:
- [Medium] In `OvsFlow.ovs_flow_msg.dpstr()` the UFID formatting computes
  `u2l = ufid[2] & 0`, which is unconditionally 0, so the fifth printed…

--

selftests: openvswitch: add missing docstrings in ovs-dpctl.py

This adds one-line docstrings to the module, classes and methods of
tools/testing/selftests/net/openvswitch/ovs-dpctl.py to silence pylint
C0114, C0115 and C0116.  Along with the docstrings the patch also renames
a nested netlink attribute class, renames two locals, narrows one except
clause and adds two staticmethod decorators.

> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index 6a02810fe4eaf..5b29aeb4b50e2 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py

[ ... ]

> @@ -372,7 +387,7 @@ class ovsactions(nla):
>          ("OVS_ACTION_ATTR_PUSH_MPLS", "none"),
>          ("OVS_ACTION_ATTR_POP_MPLS", "flag"),
>          ("OVS_ACTION_ATTR_SET_MASKED", "ovskey"),
> -        ("OVS_ACTION_ATTR_CT", "ctact"),
> +        ("OVS_ACTION_ATTR_CT", "CtAct"),

[Severity: Medium]
The changelog says the patch only adds one-line docstrings to fix C0114,
C0115 and C0116, but this hunk renames the nested pyroute2 attribute class
ovsactions.ctact to ovsactions.CtAct, including the decoder type string in
nla_map and both construction sites in ovsactions.parse()
(ovsactions.CtAct() in the "ct(" branch and ovsactions.CtAct.natattr() in
the nested "nat" branch).  Should the rename be split into its own patch,
or at least described in the changelog?

The rename also makes this file inconsistent: every other nested class
referenced from an nla_map here (ovskey, dpstats, megaflowstats,
vportstats, flowstats, natattr) stays lower case.

Three more undisclosed changes come with the same patch:

  - the bare except in ovsactions.dpstr() becomes except Exception, and
    the "%" format becomes an f-string, which is the W0702 and C0209 work
    that the two earlier patches in the series already claim in their own
    changelogs
  - @staticmethod is added to OvsVport.type_to_str() and
    OvsVport.str_to_type(), changing how those two helpers bind
  - an extra blank line is inserted in OvsVport.ovs_vport_msg before
    class vportstats

[ ... ]

> @@ -456,10 +477,11 @@ class ovsactions(nla):
>              return f"sample({','.join(args)})"
>  
>          def parse(self, actstr):
> +            """Parse sample attributes from dpctl string."""
>              def parse_nested_actions(actstr):
>                  subacts = ovsactions()
> -                parsed_len = subacts.parse(actstr)
> -                return subacts, actstr[parsed_len :]
> +                parsedLen = subacts.parse(actstr)
> +                return subacts, actstr[parsedLen :]

[Severity: Low]
This isn't a bug, but the snake_case local parsed_len is renamed to
camelCase parsedLen here in ovsactions.sample.parse() and again in the
"dec_ttl(le_1(" branch of ovsactions.parse().  The rename is not mentioned
in the changelog and is unrelated to the docstring work.

For completeness: this does not leave a pylint C0103 behind, because the
final patch in the series adds a file scope
"# pylint: disable=invalid-name,too-many-lines", and the baseline already
used parsedLen in the "clone(" branch, so the file becomes internally
consistent.

>  
>              def percent_to_rate(percent):
>                  percent = float(percent.strip('%'))
> @@ -476,7 +498,8 @@ class ovsactions(nla):
>  
>              return actstr
>  
> -    class ctact(nla):
> +    class CtAct(nla):
> +        """Conntrack action attributes."""
>          nla_flags = NLA_F_NESTED
>  
>          nla_map = (

[ ... ]

> @@ -669,12 +699,13 @@ class ovsactions(nla):
>                  else:
>                      try:
>                          print_str += datum.dpstr(more)
> -                    except:
> -                        print_str += "{ATTR: %s not decoded}" % field[0]
> +                    except Exception:
> +                        print_str += f"{{ATTR: {field[0]} not decoded}}"

[ ... ]

> @@ -824,7 +855,7 @@ class ovsactions(nla):
>              elif parse_starts_block(actstr, "ct(", False):
>                  parencount += 1
>                  actstr = actstr[len("ct(") :]
> -                ctact = ovsactions.ctact()
> +                ctact = ovsactions.CtAct()

[ ... ]

> @@ -1009,6 +1041,7 @@ class ovskey(nla):
>      )
>  
>      class ovs_key_proto(nla):
> +        """Protocol key fields (ethertype)."""
>          fields = (
>              ("src", "!H"),
>              ("dst", "!H"),

[Severity: High]
Does ovs_key_proto carry an ethertype?  Its fields and fields_map only
hold src and dst as "!H", and ovs_key_tcp, ovs_key_udp and ovs_key_sctp
inherit it for L4 ports.  Should the docstring describe the generic
src/dst port base class instead?

>From here on the added descriptions look shifted by one definition, so a
number of them document the neighbouring definition rather than the one
they are attached to.  The remaining cases are noted below.

[ ... ]

> @@ -2191,6 +2246,7 @@ class OvsPacket(GenericNetlinkSocket):
>          self.bind(OVS_PACKET_FAMILY, OvsPacket.ovs_packet_msg)
>  
>      def upcall_handler(self, up=None):
> +        """Execute a packet on the datapath."""
>          print("listening on upcall packet handler:", self.epid)
>          while True:
>              try:

[Severity: High]
Does OvsPacket.upcall_handler() execute a packet?  The body is a blocking
"while True: self.get()" receive and dispatch loop and never sends
OVS_PACKET_CMD_EXECUTE.

[ ... ]

> @@ -2232,6 +2289,7 @@ class OvsDatapath(GenericNetlinkSocket):
>          )
>  
>          class dpstats(nla):
> +            """Datapath info message."""
>              fields = (
>                  ("hit", "=Q"),
>                  ("missed", "=Q"),
> @@ -2240,6 +2298,7 @@ class OvsDatapath(GenericNetlinkSocket):
>              )
>  
>          class megaflowstats(nla):
> +            """Datapath statistics."""
>              fields = (
>                  ("mask_hit", "=Q"),
>                  ("masks", "=I"),

[Severity: High]
Are these two descriptions swapped?  dpstats holds hit/missed/lost/flows,
which are statistics rather than an info message, and megaflowstats holds
the megaflow specific mask_hit/masks/cache_hits rather than the generic
datapath statistics.

> @@ -2253,6 +2312,7 @@ class OvsDatapath(GenericNetlinkSocket):
>          self.bind(OVS_DATAPATH_FAMILY, OvsDatapath.dp_cmd_msg)
>  
>      def info(self, dpname, ifindex=0):
> +        """Create a new datapath."""
>          msg = OvsDatapath.dp_cmd_msg()
>          msg["cmd"] = OVS_DP_CMD_GET
>          msg["version"] = OVS_DATAPATH_VERSION
> @@ -2276,6 +2336,7 @@ class OvsDatapath(GenericNetlinkSocket):
>      def create(
>          self, dpname, shouldUpcall=False, versionStr=None, p=OvsPacket()
>      ):
> +        """Destroy a datapath."""
>          msg = OvsDatapath.dp_cmd_msg()
>          msg["cmd"] = OVS_DP_CMD_NEW
>          if versionStr is None:
> @@ -2317,6 +2378,7 @@ class OvsDatapath(GenericNetlinkSocket):
>          return reply
>  
>      def destroy(self, dpname):
> +        """Look up a datapath by name."""
>          msg = OvsDatapath.dp_cmd_msg()
>          msg["cmd"] = OVS_DP_CMD_DEL
>          msg["version"] = OVS_DATAPATH_VERSION

[Severity: High]
These three descriptions do not match the commands the bodies build:

  OvsDatapath.info()     msg["cmd"] = OVS_DP_CMD_GET  -> "Create a new datapath."
  OvsDatapath.create()   msg["cmd"] = OVS_DP_CMD_NEW  -> "Destroy a datapath."
  OvsDatapath.destroy()  msg["cmd"] = OVS_DP_CMD_DEL  -> "Look up a datapath by name."

Can the docstrings be moved back onto the methods they describe?  As
written, a reader extending these selftests is told that create() destroys
a datapath and that destroy() is a harmless lookup.

pylint C0115 and C0116 are satisfied by any non-empty string, so no tool
will flag these.

> @@ -2356,7 +2420,9 @@ class OvsVport(GenericNetlinkSocket):
>              ("OVS_VPORT_ATTR_NETNSID", "uint32"),
>          )
>  
> +
>          class vportstats(nla):
> +            """Tunnel options attributes."""
>              fields = (
>                  ("rx_packets", "=Q"),
>                  ("tx_packets", "=Q"),

[Severity: High]
vportstats decodes OVS_VPORT_ATTR_STATS and holds rx/tx packets, bytes,
errors and dropped counters.  Should this say vport statistics rather than
tunnel options?

[ ... ]

> @@ -2390,6 +2460,7 @@ class OvsVport(GenericNetlinkSocket):
>          self.upcall_packet = packet
>  
>      def info(self, vport_name, dpifindex=0, portno=None):
> +        """Create a new vport."""
>          msg = OvsVport.ovs_vport_msg()
>  
>          msg["cmd"] = OVS_VPORT_CMD_GET
> @@ -2415,6 +2486,7 @@ class OvsVport(GenericNetlinkSocket):
>          return reply
>  
>      def attach(self, dpindex, vport_ifname, ptype, dport):
> +        """Get info about a vport."""
>          msg = OvsVport.ovs_vport_msg()
>  
>          msg["cmd"] = OVS_VPORT_CMD_NEW
> @@ -2468,6 +2540,7 @@ class OvsVport(GenericNetlinkSocket):
>          return reply
>  
>      def reset_upcall(self, dpindex, vport_ifname, p=None):
> +        """Attach a vport to a datapath."""
>          msg = OvsVport.ovs_vport_msg()
>  
>          msg["cmd"] = OVS_VPORT_CMD_SET
> @@ -2493,6 +2566,7 @@ class OvsVport(GenericNetlinkSocket):
>          return reply
>  
>      def detach(self, dpindex, vport_ifname):
> +        """Reset a vport."""
>          msg = OvsVport.ovs_vport_msg()
>  
>          msg["cmd"] = OVS_VPORT_CMD_DEL
> @@ -2514,11 +2588,14 @@ class OvsVport(GenericNetlinkSocket):
>          return reply
>  
>      def upcall_handler(self, handler=None):
> +        """Remove a vport from a datapath."""
>          self.upcall_packet.upcall_handler(handler)

[Severity: High]
The same one definition shift appears across all five vport helpers:

  OvsVport.info()           OVS_VPORT_CMD_GET -> "Create a new vport."
  OvsVport.attach()         OVS_VPORT_CMD_NEW -> "Get info about a vport."
  OvsVport.reset_upcall()   OVS_VPORT_CMD_SET -> "Attach a vport to a datapath."
  OvsVport.detach()         OVS_VPORT_CMD_DEL -> "Reset a vport."
  OvsVport.upcall_handler() delegates to the packet upcall loop ->
                            "Remove a vport from a datapath."

> @@ -2534,12 +2611,14 @@ class OvsFlow(GenericNetlinkSocket):
>          )
>  
>          class flowstats(nla):
> +            """Flow key/mask/actions message."""
>              fields = (
>                  ("packets", "=Q"),
>                  ("bytes", "=Q"),
>              )

[Severity: High]
flowstats decodes OVS_FLOW_ATTR_STATS and only holds packets and bytes.
Is the key/mask/actions description meant for the enclosing
ovs_flow_msg instead?

>  
>          def dpstr(self, more=False):
> +            """Format flow as dpctl string."""
>              ufid = self.get_attr("OVS_FLOW_ATTR_UFID")
>              ufid_str = ""
>              if ufid is not None:

[Severity: Medium]
This isn't a bug introduced by this patch, but while looking at the
docstring added to OvsFlow.ovs_flow_msg.dpstr() the UFID formatting just
below masks with 0:

    u1l = ufid[1] & 0xFFFF
    u2h = ufid[2] >> 16
    u2l = ufid[2] & 0
    u3 = ufid[3]
    ufid_str = (f"ufid:{u0:08x}-{u1h:04x}-{u1l:04x}"
                f"-{u2h:04x}-{u2l:04x}{u3:08x}")

Should u2l be "ufid[2] & 0xFFFF" like the sibling u1l line?  As written the
fifth group of the printed UFID is always 0000, so a UFID printed by
dump-flows cannot be matched back to the kernel flow.

The same "ufid[2] & 0," is present in the baseline inside the older
.format() call, and the u0/u1h/u1l/u2h/u2l/u3 temporaries were introduced
by the earlier f-string conversion patch in this series, so this commit
only added the docstring here.

[ ... ]

> @@ -2770,6 +2850,7 @@ class OvsFlow(GenericNetlinkSocket):
>          return rep
>  
>      def miss(self, packetmsg):
> +        """Dump all flows for a datapath."""
>          seq = packetmsg["header"]["sequence_number"]
>          keystr = "(none)"
>          key_field = packetmsg.get_attr("OVS_PACKET_ATTR_KEY")
> @@ -2782,13 +2863,16 @@ class OvsFlow(GenericNetlinkSocket):
>          print(f"MISS upcall[{int(seq)}/{pktpres}]: {keystr}", flush=True)
>  
>      def execute(self, packetmsg):
> +        """Delete a flow from a datapath."""
>          print("userspace execute command", flush=True)
>  
>      def action(self, packetmsg):
> +        """Add a flow to a datapath."""
>          print("userspace action command", flush=True)

[Severity: High]
OvsFlow.miss(), OvsFlow.execute() and OvsFlow.action() are upcall
callbacks that only print a line; none of them touches the flow table.
Do the dump, delete and add descriptions belong on OvsFlow.dump(),
OvsFlow.del_flows() and OvsFlow.add_flow()?

>  
>  
>  class psample_sample(genlmsg):
> +    """psample generic netlink event handler."""
>      nla_map = (
>          ("PSAMPLE_ATTR_IIFINDEX", "none"),
>          ("PSAMPLE_ATTR_OIFINDEX", "none"),
> @@ -2809,6 +2893,7 @@ class psample_sample(genlmsg):
>      )
>  
>      def dpstr(self):
> +        """Start receiving psample events."""
>          fields = []
>          data = ""
>          for (attr, value) in self["attrs"]:

[ ... ]

> @@ -2835,11 +2921,13 @@ class psample_msg(Marshal):
>  
>  
>  class PsampleEvent(EventSocket):
> +    """psample event listener."""
>      genl_family = "psample"
>      mcast_groups = ["packets"]
>      marshal_class = psample_msg
>  
>      def read_samples(self):
> +        """Set the psample group to listen on."""
>          print("listening for psample events", flush=True)
>          while True:
>              try:

[Severity: High]
These two look swapped as well: psample_sample.dpstr() builds and returns
a formatted string, while PsampleEvent.read_samples() is the receive loop
that starts consuming psample events and does not set any group.

Counting the cases above, roughly nineteen of the added docstrings describe
a different definition than the one they annotate.  Checking the rest of
the series, the following patch only adds file scope pylint disables, so
these descriptions are still in place at the end of the range
(c4f118a1c0c71574519379960d46bd12779c6c9c).

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260905104026.3776396-1-houminxi%40gmail.com
