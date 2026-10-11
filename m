Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EE43A5452;
	Sun, 11 Oct 2026 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791717647; cv=none; b=rD95Ym1B34KErG1PG6qGftcDYFlFd0VsxfsPyEUHwvdP9F54nl6al6dnhteaFeNASegZeEAJJi4edsjErKtTrNHZlLXQTmQ/Pa+6AE/dFGV3bQjVn2YFZi3gYxX5NHAqMnw8Ti7O/AD6etGq4PcIyNv6KQ8w7AcKZcaj4QbeJ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791717647; c=relaxed/simple;
	bh=93anWR0QRvC1TPZtlQpGbUarjuCPa7VNWdnnkkw+QyM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jrsN6Kl+qyHO/jLPK8Pw6A04dqZZaubdiSdEDNfGSdRdBVVY2t1atQSpTktfMUGC1DDZuhaEvlN82OKWAaDQ4+8ir73XDSL9D2pYuY0PO6Wrn1HDwO2/Pipkc1FLUNvwsTvzujRatPUy8u1ia8dxYRr0rME+r5ZesszEJAgLsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4VSJLp4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4VSJLp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570B11F0089B;
	Sun, 11 Oct 2026 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791717643;
	bh=iSs83iSREzQg06O1RKEiD9nw1lQO3OyXcoZLEwK7/aU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H4VSJLp4NCAzsS6Khs5FpeZiNFLBUHJcb/hfuanyUxuknyM15LR+wUoyMsBF86EnH
	 wGbqrd1aNt1RHNKzdgkiJBtwabasFdPzdNDcELdcWUqVyTkshDOMHYpS0OiyUmqlVf
	 jOSsnjnRc12PcpAqRYtfxeZUAzxzPoqt8CdLMdSETS9yjfz4A3PWJbCopnKdf4VYDZ
	 YTqgHDd9ZKat0q78nnhi7SsAunEFOzrSeU3Opmy3dau1KFCVFAW2GvbMyQ+OWM31lk
	 b8OL2s5Cd6Wh6Woym6yb5VKxHhEAOkieYyqAidkDYdQ67yZFD76MFpI1khzTtkhNmQ
	 ABJ18wK4X9uvQ==
Subject:
 Re: [PATCH net-next v4 2/3] netlink: specs: add genetlink-legacy spec for GTP
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: pablo@netfilter.org, laforge@gnumonks.org, donald.hunter@gmail.com,
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 11 Oct 2026 11:20:41 +0000
Message-ID: <179171764187.434549.3465200115197033124@kernel.org>
In-Reply-To: <20261010105740.223992-3-anilkaushikwireless@gmail.com>
References: <20261010105740.223992-3-anilkaushikwireless@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The spec in Documentation/netlink/specs/gtp.yaml lists the
  "gtp" multicast group (lines 168-171), but it never says what the…
- [Medium] Adding gtp.yaml pulls a new compile unit, gtp-user.o, into the
  tools/net/ynl library build.
- [Low] drivers/net/gtp.c registers gtp_genl_family with `.version = 0`
  (line 2483).
- [Low] gtp.yaml declares `checks: exact-len: 16` for peer-addr6 and ms-
  addr6 (lines 71-72 and 79-80).
- [Low] gtp.yaml documents ms-address only as "IPv4 address of the mobile
  subscriber served by the context." (line 48).
- [Low] gtp.yaml documents ms-addr6 as "IPv6 address of the mobile
  subscriber served by the context." (line 83), and its exact-len: 16…

--

netlink: specs: add genetlink-legacy spec for GTP

This adds a genetlink-legacy YAML spec for the existing GTP generic
netlink family. It covers the NEWPDP, DELPDP, GETPDP and ECHOREQ
commands, the GTPA_* attribute set and the "gtp" multicast group. The
spec is also added to the GTP entry in MAINTAINERS.

> diff --git a/Documentation/netlink/specs/gtp.yaml b/Documentation/netlink/specs/gtp.yaml
> new file mode 100644
> index 0000000000000..2c61c4353c89a
> --- /dev/null
> +++ b/Documentation/netlink/specs/gtp.yaml
> @@ -0,0 +1,171 @@
> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> +---
> +name: gtp
> +
> +protocol: genetlink-legacy

[Severity: Low]
Should the spec state the family's real version? With no version key, the
genetlink-legacy schema default of 1 applies. The kernel registers the
family as version 0:

drivers/net/gtp.c:
static struct genl_family gtp_genl_family __ro_after_init = {
	.name		= "gtp",
	.version	= 0,

Documentation/netlink/genetlink-legacy.yaml documents "Default is 1" and
sets minimum: 1, so the spec can't say version: 0 unless the schema
changes.

Nothing fails at runtime. ynl hard-codes version 1 in requests and the
genetlink core doesn't check it. Still, the spec gives a different version
from the one the kernel reports in CTRL_ATTR_VERSION and in message
headers.

Could the schema minimum be relaxed so version: 0 can be added? If not,
could the mismatch be documented?

[ ... ]

> +      -
> +        name: ms-address
> +        type: u32
> +        byte-order: big-endian
> +        display-hint: ipv4
> +        doc: IPv4 address of the mobile subscriber served by the context.

[Severity: Low]
Is this description right for echoreq, which also lists ms-address in its
request? gtp_genl_send_echo_req() uses the attribute as the outer IPv4
source address:

	dst_ip = nla_get_be32(info->attrs[GTPA_PEER_ADDRESS]);
	src_ip = nla_get_be32(info->attrs[GTPA_MS_ADDRESS]);
	...
	rt = ip4_route_output_gtp(&fl4, sk, dst_ip, src_ip);
	if (IS_ERR(rt)) {
		...
		return -ENODEV;
	}

So the value is the local GSN tunnel endpoint, not a subscriber address.
The echo response notification works the same way: gtp0_handle_echo_resp_ip()
fills ms-address from the local address (iph->daddr).

A user who follows the spec and passes the subscriber's IPv4 address gets
a route lookup with a non-local source, and the command returns -ENODEV.

Could the attribute doc, or the echoreq operation doc, mention this legacy
overloading?

[ ... ]

> +      -
> +        name: peer-addr6
> +        type: binary
> +        checks:
> +          exact-len: 16

[Severity: Low]
Does the kernel actually enforce an exact length here? gtp_genl_policy
has:

	[GTPA_PEER_ADDR6]	= { .len = sizeof(struct in6_addr), },
	[GTPA_MS_ADDR6]		= { .len = sizeof(struct in6_addr), },

Neither entry sets .type, so both are NLA_UNSPEC. For NLA_UNSPEC,
validate_nla() only checks attrlen < pt->len, which is a minimum length.
Every gtp op also sets GENL_DONT_VALIDATE_STRICT. As a result the kernel
accepts longer attributes, and nla_get_in6_addr() reads the first 16
bytes.

Should the spec say min-len: 16 instead? The other option is to tighten
the kernel policy to NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)). The
same question applies to ms-addr6 below.

[ ... ]

> +      -
> +        name: ms-addr6
> +        type: binary
> +        checks:
> +          exact-len: 16
> +        byte-order: big-endian
> +        display-hint: ipv6
> +        doc: IPv6 address of the mobile subscriber served by the context.

[Severity: Low]
The driver treats ms-addr6 as a /64 prefix whose lower 64 bits must be
zero. ipv6_pdp_fill() rejects NEWPDP otherwise:

	pctx->ms.addr6 = nla_get_in6_addr(info->attrs[GTPA_MS_ADDR6]);
	if (pctx->ms.addr6.s6_addr32[2] ||
	    pctx->ms.addr6.s6_addr32[3])
		return false;

gtp_find_pdp_by_link() applies the same check and returns -EADDRNOTAVAIL
for GETPDP and DELPDP lookups:

		if (addr.s6_addr32[2] ||
		    addr.s6_addr32[3])
			return ERR_PTR(-EADDRNOTAVAIL);

The current text suggests a full subscriber IPv6 address. A context can't
be created, queried or deleted with one.

Could the doc say this attribute carries the subscriber's /64 prefix with
the low 64 bits zeroed?

> +      -
> +        name: family
> +        type: u8
> +        doc: Address family (AF_INET or AF_INET6) of the context addresses.

[Severity: Medium]
Will this spec break the tools/net/ynl build on hosts with older uapi
headers?

tools/net/ynl/generated/Makefile builds every spec except conntrack and
nftables, so gtp-user.c is now generated and compiled. It includes
<linux/gtp.h> and is built with:

	-I../lib/ -idirafter $(UAPI_PATH)

Because of -idirafter, the installed /usr/include/linux/gtp.h takes
precedence over include/uapi/linux/gtp.h. The only way around that is a
CFLAGS_gtp entry in tools/net/ynl/Makefile.deps, and there isn't one.
Later patches in the series don't seem to add one either.

GTPA_PEER_ADDR6, GTPA_MS_ADDR6, GTPA_FAMILY and GTP_CMD_ECHOREQ are
fairly recent. On hosts with 5.x or 6.1-era linux-libc-dev, the generated
code would refer to undefined enumerators. The policy array sized by
GTPA_MAX would also be too small, and make -C tools/net/ynl would fail.

Would adding something like this to Makefile.deps fix it?

CFLAGS_gtp:=$(call get_hdr_inc,_LINUX_GTP_H_,gtp.h)

The guard name assumes headers_install strips _UAPI from
_UAPI_LINUX_GTP_H_.

[ ... ]

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
> +            - ms-address
> +            - net-ns-fd
> +
> +mcast-groups:
> +  list:
> +    -
> +      name: gtp

[Severity: Medium]
The gtp multicast group is declared, but which messages go out on it? No
operation has notify, event or mcgrp. The driver multicasts three kinds of
message on GTP_GENL_MCGRP. The first two come from these paths:

gtp_genl_new_pdp()->gtp_tunnel_notify(pctx, GTP_CMD_NEWPDP, GFP_KERNEL)
gtp_genl_del_pdp()->gtp_tunnel_notify(pctx, GTP_CMD_DELPDP, GFP_ATOMIC)

gtp_genl_fill_info() builds both, so they carry the same content as the
getpdp reply.

The third is the echo response. gtp0_handle_echo_resp() and the GTPv1-U
handler both send it:

	ret = gtp_genl_fill_echo(msg, 0, 0, 0, GTP_CMD_ECHOREQ, echo);
	...
	return genlmsg_multicast_netns(&gtp_genl_family, dev_net(gtp->dev),
				       msg, 0, GTP_GENL_MCGRP, GFP_ATOMIC);

It carries version, peer-address and ms-address. The echoreq doit,
gtp_genl_send_echo_req(), only ACKs, so this multicast is the only way
user space learns the echo result.

nlspec only treats ops with notify or event as asynchronous, so
async_msg_ids is empty for gtp. After ntf_subscribe('gtp'), check_ntf() in
ynl.py prints "Unexpected msg id while checking for ntf". It then drops
every PDP add, PDP delete and echo response.

ynl_gen_c doesn't generate notification parsers for these messages
either, and the rendered docs don't mention them. The commit message says
the spec describes "the existing family", but this part of the uAPI is
missing.

Could newpdp and delpdp notifications be described by reusing the getpdp
reply (notify: getpdp, mcgrp: gtp)? The echo response could be an event
with version, peer-address and ms-address that keeps the legacy command
value. Otherwise, could the spec say explicitly that notifications are not
covered?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261010105740.223992-1-anilkaushikwireless%40gmail.com
