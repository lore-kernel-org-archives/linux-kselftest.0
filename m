Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F28238BF9C;
	Sat, 10 Oct 2026 06:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613311; cv=none; b=tNRR0QLNCjmQ/9yKo7WmeECzUykRQnWYt8E1gSH6HWYLQbrf2h0ekfbutdexpHLrCAEjJ2UBSF/rszkqLGGxaxfWaZdXFN5MyPkFuqs1bfVwrnk1TNrjTVdTvGUdTReTnNJtadsLWRhuB02sCO+bMn2l657iWUIItfhGHj4wh88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613311; c=relaxed/simple;
	bh=LfBId0NpV4JYwKXttWd/gW1DGjbz9AzQZNGyg5WMO3M=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YdpQF5/UqtAD9xxcsscIlNXzwsqnyZXlTmnk3yapqEq996gCy2Yv0AqxCmFK6rxdLne2jkXkKpf0jvSUKCg4hdHBeVds/C7qp7MJT8pno4on42Xh3ZP8UChTg6PV5eDEf7zXeAAk3DjkhqE3gA0EnrHViEiVWDYSUIwCPSrRBSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kynO/lWb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kynO/lWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFDA1F000FF;
	Sat, 10 Oct 2026 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791613306;
	bh=847et+PMHXdglL3C3DgpjO2pLPfbtwQBXGewoke51DE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kynO/lWbbvZF4ee5G4Rt8jhOsfbjKnYSEuwVxk1ETLrCFmpSV6+tvEFNIPwIe5MbQ
	 YI3SCjyuheBkyg4EEXEOOgM4CCecj+hZWEvEy3DUIVz2mPSUlgmlS8muDxlvTuHSWB
	 WVXgI9H/bzBFaSkTwNKUm+jmX3+1Lpjy8uGLtZKFS/GLFHZOIvBF2g1C4xSmD80JQR
	 +jXOoLhB9R7D91wIIYI1wG4tr0sW7MzTUVAzaHoo54IPBfyh0FjRcnY0czqx0cRFxy
	 T5ZCRNmfPueGd0h9saIV4z2rA/pIbWbYqg2lzh60L0Gc2s+CphFnFEd5VIv5IkX0Wb
	 jRvAulA68+CsQ==
Subject:
 Re: [PATCH net-next v3 2/3] netlink: specs: add genetlink-legacy spec for GTP
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: pablo@netfilter.org, laforge@gnumonks.org, donald.hunter@gmail.com,
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 06:21:45 +0000
Message-ID: <179161330514.434549.15194840463414359799@kernel.org>
In-Reply-To: <20261009060615.4177402-3-anilkaushikwireless@gmail.com>
References: <20261009060615.4177402-3-anilkaushikwireless@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The echoreq request attribute list in
  Documentation/netlink/specs/gtp.yaml (lines 159-165) is wrong.
- [Medium] The getpdp reply attribute list (&pdp-reply,
  Documentation/netlink/specs/gtp.yaml lines 138-149) leaves out link.
- [Medium] The spec declares the 'gtp' multicast group (lines 167-170),
  but no operation has a notify, event or mcgrp entry.
- [Low] The spec gives peer-addr6 and ms-addr6 'checks: exact-len: 16'
  (gtp.yaml lines 71-72 and 79-80).
- [Low] The delpdp request reuses the full newpdp attribute list
  ('request: *pdp-attrs', gtp.yaml line 120).
- [Low] The new spec has no CFLAGS_gtp entry in
  tools/net/ynl/Makefile.deps.
- [Low] The spec leaves out the top-level 'version' property, so the
  genetlink-legacy default of 1 applies (genetlink-legacy.yaml: 'Default…

--

netlink: specs: add genetlink-legacy spec for GTP

This commit adds a genetlink-legacy YAML spec for the existing GTP generic
netlink family. The spec covers the NEWPDP, DELPDP, GETPDP and ECHOREQ
commands, the GTPA_* attribute set and the "gtp" multicast group. It also
adds the new spec file to the GTP entry in MAINTAINERS.

> diff --git a/Documentation/netlink/specs/gtp.yaml b/Documentation/netlink/specs/gtp.yaml
> new file mode 100644
> index 0000000000000..7193f5e53a257
> --- /dev/null
> +++ b/Documentation/netlink/specs/gtp.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +---
> +name: gtp
> +
> +protocol: genetlink-legacy

[Severity: Low]
This spec has no version property, so the genetlink-legacy schema default
of 1 applies. The kernel registers the family with version 0:

drivers/net/gtp.c:
static struct genl_family gtp_genl_family __ro_after_init = {
	.name		= "gtp",
	.version	= 0,

The schema in Documentation/netlink/genetlink-legacy.yaml also says
"minimum: 1". That means the spec can't state the real value unless the
schema is relaxed.

The runtime effect seems limited. Both the C and Python ynl code hard-code
version 1 in requests, and the kernel does not check the request version.
The remaining problem is wrong metadata, such as a GTP_FAMILY_VERSION of 1
if uapi or kernel code were ever generated from this spec.

Should the spec record version 0, with the schema relaxed to allow it?

[ ... ]

> +      -
> +        name: peer-addr6
> +        type: binary
> +        checks:
> +          exact-len: 16
> +        byte-order: big-endian
> +        display-hint: ipv6
> +        doc: IPv6 address of the remote GSN peer (GGSN or SGSN).

[Severity: Low]
Does exact-len match the kernel policy? gtp_genl_policy has:

	[GTPA_PEER_ADDR6]	= { .len = sizeof(struct in6_addr), },
	[GTPA_MS_ADDR6]		= { .len = sizeof(struct in6_addr), },

These entries have no type, so they are NLA_UNSPEC, and .len is only a
minimum length. Every gtp op sets GENL_DONT_VALIDATE_STRICT, so the kernel
accepts attributes longer than 16 bytes. The spec describes those as
invalid.

Should this be min-len: 16 here and for ms-addr6? Alternatively, the
policy could switch to NLA_POLICY_EXACT_LEN.

[ ... ]

> +    -
> +      name: delpdp
> +      doc: Delete a PDP context.
> +      attribute-set: gtp
> +      dont-validate: [strict, dump]
> +      flags: [admin-perm]
> +      do:
> +        request: *pdp-attrs

[Severity: Low]
This reuses the full newpdp attribute list. The delete path is
gtp_genl_del_pdp()->gtp_find_pdp()->gtp_find_pdp_by_link()/gtp_find_dev(),
and it only reads link, net-ns-fd, family, ms-address, ms-addr6, version,
tid and i-tei.

peer-address, peer-addr6, flow and o-tei are ignored, but ynl will still
generate setters for them.

Would the lookup-only list used by the getpdp request be a better fit for
delpdp?

> +    -
> +      name: getpdp
> +      doc: Get or dump one or more PDP contexts.

[ ... ]

> +        reply: &pdp-reply
> +          attributes:
> +            - version
> +            - tid
> +            - peer-address
> +            - peer-addr6
> +            - ms-address
> +            - ms-addr6
> +            - flow
> +            - i-tei
> +            - o-tei
> +            - family
> +      dump:
> +        reply: *pdp-reply

[Severity: Medium]
Should link be part of this reply list? gtp_genl_fill_info() always emits
it:

	if (nla_put_u32(skb, GTPA_VERSION, pctx->gtp_version) ||
	    nla_put_u32(skb, GTPA_LINK, pctx->dev->ifindex) ||
	    nla_put_u8(skb, GTPA_FAMILY, pctx->af))

The C parser generated by ynl_gen_c only decodes the listed reply
attributes. That means link is dropped from getpdp do replies, from dump
entries and from NEWPDP/DELPDP notifications.

A dump walks every gtp device in the netns. A generated C client therefore
can't tell which device a context belongs to. It also can't build the
matching delpdp or getpdp request, because gtp_find_pdp() needs GTPA_LINK.

The Python ynl used by selftests decodes against the whole attribute set,
so it would not catch this.

> +    -
> +      name: echoreq
> +      doc: Send a GTP-U echo request to a peer.
> +      attribute-set: gtp
> +      dont-validate: [strict, dump]
> +      flags: [admin-perm]
> +      do:
> +        request:
> +          attributes:
> +            - link
> +            - version
> +            - peer-address
> +            - peer-addr6
> +            - family

[Severity: Medium]
Can a generated client ever get a successful echoreq with this list?
gtp_genl_send_echo_req() requires ms-address and uses it as the source
address:

	if (!info->attrs[GTPA_VERSION] ||
	    !info->attrs[GTPA_LINK] ||
	    !info->attrs[GTPA_PEER_ADDRESS] ||
	    !info->attrs[GTPA_MS_ADDRESS])
		return -EINVAL;
	...
	src_ip = nla_get_be32(info->attrs[GTPA_MS_ADDRESS]);

ynl_gen_c builds the request struct only from the op's listed attributes,
in RenderInfo:

	type_list = op[op_mode][op_dir]['attributes']

So the generated C echoreq request has no way to set ms-address, and
every call returns -EINVAL.

The handler looks up the device through gtp_find_dev(), which reads
GTPA_NET_NS_FD when it is present. net-ns-fd isn't listed either, so a
gtp device in another netns can't be targeted.

peer-addr6 and family are listed, but the handler never reads them because
echo requests are IPv4 only. A request with only an IPv6 peer in
peer-addr6 would still get -EINVAL.

Should this list be link, version, peer-address, ms-address and net-ns-fd?

> +
> +mcast-groups:
> +  list:
> +    -
> +      name: gtp

[Severity: Medium]
The gtp group is declared, but no operation has a notify or event entry
that describes what the kernel sends on it. The kernel multicasts three
kinds of message on GTP_GENL_MCGRP:

- GTP_CMD_NEWPDP from gtp_genl_new_pdp() via gtp_tunnel_notify()
- GTP_CMD_DELPDP from gtp_genl_del_pdp() via gtp_tunnel_notify(), both
  carrying the gtp_genl_fill_info() contents
- GTP_CMD_ECHOREQ when an echo response arrives, from
  gtp0_handle_echo_resp() and its GTPv1-U counterpart

The echo response case looks like this:

	ret = gtp_genl_fill_echo(msg, 0, 0, 0, GTP_CMD_ECHOREQ, echo);
	...
	return genlmsg_multicast_netns(&gtp_genl_family, dev_net(gtp->dev),
				       msg, 0, GTP_GENL_MCGRP, GFP_ATOMIC);

In tools/net/ynl/pyynl/lib/nlspec.py, SpecOperation marks an op as async
only when 'notify' or 'event' is present. YnlFamily.check_ntf() drops
everything else:

    if decoded.cmd() not in self.async_msg_ids:
        print("Unexpected msg id while checking for ntf", decoded)
        continue

A ynl client subscribed to gtp would throw away every notification. That
includes the echo response report, which is the only way to get the
result of an echoreq. ynl_gen_c also generates no notification parsers
for this family.

The notifications reuse the request command IDs, so describing them may
need explicit values or a schema change. Should the spec describe these
messages in some form?

[Severity: Low]
Is a tools/net/ynl/Makefile.deps entry needed for this new spec?
tools/net/ynl/generated/Makefile builds every spec under
Documentation/netlink/specs except those in GENS_UNSUP, so gtp-user.c is
now generated and compiled.

The generated code includes <linux/gtp.h>. The in-tree uapi directory is
only added with -idirafter, so the host's installed header is found first.
Hosts with older headers lack GTPA_PEER_ADDR6, GTPA_MS_ADDR6 and
GTPA_FAMILY, and very old ones also lack GTP_CMD_ECHOREQ. The ynl build
would fail on those hosts.

Other families handle this with an entry like:

CFLAGS_ovpn:=$(call get_hdr_inc,_LINUX_OVPN_H,ovpn.h)
CFLAGS_psp:=$(call get_hdr_inc,_LINUX_PSP_H,psp.h)

Would something like this be needed for gtp?

CFLAGS_gtp:=$(call get_hdr_inc,_LINUX_GTP_H_,gtp.h)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009060615.4177402-1-anilkaushikwireless%40gmail.com
