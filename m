Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AD237CD33;
	Sat, 10 Oct 2026 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613310; cv=none; b=X+I0UhCgPJWcgSX32/w9nXifjFfzimD2Wbc/BaZAWZjbNUdq96cMOGdKRK2+MuFW2Ex9mKA4DD5BcLLrF75Oj48efPk+YRjicIS9Y7kjDH4mf5TkmEk3yFtul61UoHaQ7Zc/sHiDUwrnpjpbc/X1qOEiiUzP9iBi4qI9u0P/Sws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613310; c=relaxed/simple;
	bh=tbUJWeponWEHaBlz51aGOx26ToVVeCc4B2JZCZGaqMk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M1avy9ba8sLIyHgSb9ODsTomcLgpTmS05SyrdC9YfzOlgSlTpONFr8LDq4CO4YsmRsv/7dyF04R8m5n5cA0GoH0+CIjYeogu1XSWNGiWXi/XLoXl2X3m8GJG1t6pPIAhsBTbWkd1EPJgi+8muEmSn3EdvTn1akpPG3LZlON2zeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWQyhtN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWQyhtN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EA21F00893;
	Sat, 10 Oct 2026 06:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791613308;
	bh=+oqNHryUFynMf7AFicaYDQ4gVv7GHnBVjWXA33yLCIk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hWQyhtN5+FNOwB0OKHrQkaBIjlz/ABF6LY60aEtQe4JOO7RdjtlPeB2kkVqdwkYXU
	 pdbFEG86f9tnUCNZLtppJgsDlZnUFsCJurauPCTX3M9QKy3BkrQyKH93ko4C28E2CG
	 GrvW9DKgtcFqFDhnpDZ0BJTXEyc1buL5m+blFwj+neDn0ufuU7z9J/pANNn5W1nquj
	 EM2VHLFIsbJZ5+kfP4eHN7uZ3yqtZDJaUQMVL9FdxIpYQjCVT6TW9PbBErfRKU5/Jd
	 +kaDQRnmWT/gGIHQYXbAIos8D5mtAiGJGJs4I3IyNSp1TmMXxmMN8mh6PXFdMxW0Ln
	 eyt5wl8Ol5GaA==
Subject: Re: [PATCH net-next v3 3/3] selftests: net: add a test for the gtp
 netlink family
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: pablo@netfilter.org, laforge@gnumonks.org, donald.hunter@gmail.com,
 kuba@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 06:21:46 +0000
Message-ID: <179161330683.434549.12632469070516169474@kernel.org>
In-Reply-To: <20261009060615.4177402-4-anilkaushikwireless@gmail.com>
References: <20261009060615.4177402-4-anilkaushikwireless@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new test aborts with a traceback instead of running or
  skipping whenever the 'gtp' genl family is not already registered.
- [Medium] The `echoreq` operation in
  Documentation/netlink/specs/gtp.yaml (lines 159-165) declares its…
- [Low] del_unknown_pdp() in tools/testing/selftests/net/gtp.py uses
  `with ksft_raises(NlError)` without checking the errno, so any netlink…
- [Low] The getpdp `&pdp-reply` attribute set in
  Documentation/netlink/specs/gtp.yaml (lines 138-149, used by getpdp do…

--

selftests: net: add a test for the gtp netlink family

This adds a Python selftest that drives the gtp generic netlink family
through its ynl spec. It covers newpdp, getpdp and delpdp, a two-context
dump, and a delete of an unknown context. It also adds a GtpFamily ynl
wrapper, CONFIG_GTP=m in the net selftest config, and Makefile and
MAINTAINERS entries.

> diff --git a/tools/testing/selftests/net/gtp.py b/tools/testing/selftests/net/gtp.py
> new file mode 100755
> index 0000000000000..fcc9bf57a663f
> --- /dev/null
> +++ b/tools/testing/selftests/net/gtp.py
> @@ -0,0 +1,85 @@

[ ... ]

> +def add_del_pdp(gtp, ns) -> None:
> +    """Add a PDP context, query it, then delete it.
> +
> +    The query must return the context with the TEIDs and addresses
> +    it was created with, and it must be gone after the delete.
> +    """
> +    link = _add_gtp_dev(ns)
> +
> +    gtp.newpdp({"link": link, "version": 1,
> +                "i-tei": 0x100, "o-tei": 0x200,
> +                "ms-address": "10.0.0.1", "peer-address": "192.0.2.1"})
> +
> +    pdp = [c for c in gtp.getpdp({}, dump=True) if c.get("i-tei") == 0x100]

[Severity: Low]
This dump is decoded with Documentation/netlink/specs/gtp.yaml. That spec
was added earlier in this series by "netlink: specs: add genetlink-legacy
spec for GTP", and its getpdp reply leaves out link:

        reply: &pdp-reply
          attributes:
            - version
            - tid
            - peer-address
            - peer-addr6
            - ms-address
            - ms-addr6
            - flow
            - i-tei
            - o-tei
            - family

But gtp_genl_fill_info() always emits it, in every getpdp reply, dump entry
and notification:

	if (nla_put_u32(skb, GTPA_VERSION, pctx->gtp_version) ||
	    nla_put_u32(skb, GTPA_LINK, pctx->dev->ifindex) ||
	    nla_put_u8(skb, GTPA_FAMILY, pctx->af))

Should link be added to the reply attributes? Without it, consumers
generated from the spec can't tell which gtp device a dumped context
belongs to.

On a related note, this filter matches only on i-tei, not on the link the
test just created.

> +    ksft_eq(len(pdp), 1)
> +    ksft_eq(pdp[0]["o-tei"], 0x200)
> +    ksft_eq(pdp[0]["ms-address"], "10.0.0.1")
> +    ksft_eq(pdp[0]["peer-address"], "192.0.2.1")
> +
> +    gtp.delpdp({"link": link, "version": 1,
> +                "i-tei": 0x100, "ms-address": "10.0.0.1"})
> +    ksft_not_in(0x100, _iteis(gtp.getpdp({}, dump=True)))

[ ... ]

> +def del_unknown_pdp(gtp, ns) -> None:
> +    """Deleting a context that was never added must fail."""
> +    link = _add_gtp_dev(ns)
> +    with ksft_raises(NlError):
> +        gtp.delpdp({"link": link, "version": 1,
> +                    "i-tei": 0x999, "ms-address": "10.9.9.9"})

[Severity: Low]
Should this check the errno too? ksft_raises(NlError) accepts any netlink
error. For example, -EINVAL or -ENODEV from gtp_find_pdp_by_link() or
gtp_genl_del_pdp() would also pass. The real lookup miss in gtp_find_pdp()
is -ENOENT.

Also, both delpdp requests in this test send ms-address, and
gtp_find_pdp_by_link() checks that before the TEI branch:

drivers/net/gtp.c:gtp_find_pdp_by_link() {
    ...
	if (nla[GTPA_MS_ADDRESS]) {
		__be32 ip = nla_get_be32(nla[GTPA_MS_ADDRESS]);
		if (family != AF_INET)
			return ERR_PTR(-EINVAL);
		return ipv4_pdp_find(gtp, ip);
    ...
}

That means the i-tei values passed to delpdp are ignored, and delete by
TEI through gtp1_pdp_find() is never tested.

With the current kernel this request does return -ENOENT, so the test
passes for the right reason today. It just checks less than the docstring
suggests.

> +
> +
> +def main() -> None:
> +    """Run the PDP context tests in a temporary netns."""
> +    with NetNS() as ns:
> +        with NetNSEnter(str(ns)):
> +            gtp = GtpFamily()
> +        ksft_run([add_del_pdp, add_two_pdp, del_unknown_pdp], args=(gtp, ns))

[Severity: Medium]
Can GtpFamily() succeed here if gtp.ko isn't loaded yet?

GtpFamily() -> YnlFamily.__init__() -> GenlProtocol('gtp') looks up the
family id with _genl_load_families(). That sends CTRL_CMD_GETFAMILY with
NLM_F_DUMP, which the kernel answers from ctrl_dumpfamily(). Only the
non-dump ctrl_getfamily() path autoloads the module:

net/netlink/genetlink.c:ctrl_getfamily() {
    ...
	request_module("net-pf-%d-proto-%d-family-%s",
		       PF_NETLINK, NETLINK_GENERIC, name);
    ...
}

This patch adds CONFIG_GTP=m to the selftest config. On a fresh boot with
that config, the "gtp" family isn't registered yet, so
genl_family_name_to_id['gtp'] raises KeyError. YnlFamily.__init__()
turns that into:

    YnlException(f"Family '{self.yaml['name']}' not supported by the kernel")

That exception isn't a KsftSkipEx and is raised outside ksft_run(). Won't
the whole script abort with a traceback before any case runs?

gtp.ko would only be autoloaded later, through the rtnl link alias, when
_add_gtp_dev() runs "ip link add gtp0 type gtp". For the same reason, with
CONFIG_GTP unset the KsftSkipEx in _add_gtp_dev() is never reached, and the
test fails instead of skipping.

Would it work to create the gtp device, or otherwise load the module,
before constructing GtpFamily(), and to treat a missing family as a skip?

> +    ksft_exit()
> +
> +
> +if __name__ == "__main__":
> +    main()

[ ... ]

> diff --git a/tools/testing/selftests/net/lib/py/ynl.py b/tools/testing/selftests/net/lib/py/ynl.py
> index 08deff756f29b..7edb749710231 100644
> --- a/tools/testing/selftests/net/lib/py/ynl.py
> +++ b/tools/testing/selftests/net/lib/py/ynl.py

[ ... ]

> @@ -85,3 +85,9 @@ class PSPFamily(YnlFamily):
>      def __init__(self, recv_size=0):
>          super().__init__((SPEC_PATH / Path('psp.yaml')).as_posix(),
>                           schema='', recv_size=recv_size)
> +
> +
> +class GtpFamily(YnlFamily):
> +    def __init__(self, recv_size=0):
> +        super().__init__((SPEC_PATH / Path('gtp.yaml')).as_posix(),
> +                         schema='', recv_size=recv_size)

[Severity: Medium]
This wrapper loads the gtp.yaml added earlier in this series by
"netlink: specs: add genetlink-legacy spec for GTP". Does that spec's
echoreq request match the driver? The spec lists:

        request:
          attributes:
            - link
            - version
            - peer-address
            - peer-addr6
            - family

gtp_genl_send_echo_req() requires GTPA_MS_ADDRESS, which isn't listed:

	if (!info->attrs[GTPA_VERSION] ||
	    !info->attrs[GTPA_LINK] ||
	    !info->attrs[GTPA_PEER_ADDRESS] ||
	    !info->attrs[GTPA_MS_ADDRESS])
		return -EINVAL;

The handler is also IPv4-only and never reads GTPA_PEER_ADDR6 or
GTPA_FAMILY.

A client generated from the spec would never send ms-address, so its
echoreq would always fail with -EINVAL.

That spec commit says it is "derived directly from include/uapi/linux/gtp.h
and the gtp_genl_policy / gtp_genl_ops tables in drivers/net/gtp.c". That
doesn't seem to hold for echoreq.

Should ms-address be added to the echoreq request, and peer-addr6 and
family removed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009060615.4177402-1-anilkaushikwireless%40gmail.com
