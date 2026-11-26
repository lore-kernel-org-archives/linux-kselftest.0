Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704438;
	b=JehB1U67RWryZIckWQ5edJSWT2tPEU45G2PafSF7Noiy/BElTfngzMQtmaPAAyC+uwas
	 UvjnaQnaMNh4/FnmNMAYeVV8HOimJZGNTK3A1M8bV1UlM4dn/vSSa4ubTfnhm0jeYMFDU
	 XQ35mITBQWfhKNes/GJqL/DdGvD/9rLzOU13pTNRf5bEHCRFFGkNcdU/znS8HUqNsCBOJ
	 SlZrk4jip0EeGegK5nGIiXaUyNCiHo2+bbr3ikoFdRQ/aDbsoji39FB9ub74yVgXy6vj/
	 ZMlSpAVBenbxrk2I3Q1Z21674+9N3a6hCvwn3zNNFFGlxIq+957/2TYCabjeh4FGttw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704438;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/q/pFzvKWu2mEF9/DwcsF9YD9/DZAPV7fZSCS+XMqKU=;
	b=I9HbsfXmLCHEC6qHvnlq6ioN5E4ZyqhvCqBRY0UsBVm6b20FUa9+hmmUpO4btsTxdhLQ
	 heaXDGQslhxntp32g28w10Qhr326zviSRyBPqyz/YY0P5MDg7ILuUwNdA/TyexJtMPSjZ
	 D34h7T+Y89rQcrrZfwol1jLHVcOwxR5dylglt0lEc3Ci07kO4TfbuztWjJwsUXTMKQsJN
	 z/sEvUi/+ECMTvu7lQ+BYRH7nVybFyNAdzJHb7qtFCtpQ7QvyFd9/2S3wrcYqUQ4koF/N
	 jMhqkbnsY72MmkT2Ih+q3b0GLgmooJMipNjazEHuCltCe2kHjGnOF5O7e6mgQbKe68Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnusCb4W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4035606A31C;
	Thu, 26 Nov 2026 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnusCb4W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2621F000C0;
	Thu, 26 Nov 2026 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704438;
	bh=/q/pFzvKWu2mEF9/DwcsF9YD9/DZAPV7fZSCS+XMqKU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TnusCb4W4Q6qbGBNI/+jR7w8yDxVE4LJQfEBrhJ6cZFXGapUzlFTf3WMBxxMNbUeZ
	 7XJ/CuvWT5y24oUsLfgecaKlBERKAz1OzmvH50dDghi/kAdDc0zfT9mh8zFHgxnxJu
	 d4213BuLgwWQeuNAyBZprdzTrjEavQFzp1Diram+4u+iv6nTh1l8/GrXGMoVUHOMI9
	 1sPHXVNf29OWNBJH6tDfAM7PWd+sx8uzQvzorHEsGxE3CVabagg/fy2XvHRTynXB+N
	 Fc+8hJenVdWTNp/VftnqWgECRoEPV00Er7wPt4ljJzK42a8ezXl+OsKC368ooFspUy
	 4Mb6SuTqCNYoA==
Subject: Re: [PATCH net v9 2/2] selftests: net: test joining genetlink groups
 no family owns
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com,
 nicolas.dichtel@6wind.com, jacob.e.keller@intel.com, jiri@resnulli.us,
 fw@strlen.de, martineau@kernel.org, v3rdant.xiang@gmail.com,
 aliceryhl@google.com, linux-kernel@vger.kernel.org, nhorman@tuxdriver.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 26 Nov 2026 14:47:17 +0000
Message-ID: <179570443724.3135.6495722482046462156@kernel.org>
In-Reply-To: <20261125144514.2717012-3-anilkaushikwireless@gmail.com>
References: <20261125144514.2717012-3-anilkaushikwireless@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In bind_before_family()
  (tools/testing/selftests/net/nl_genl_mcast.py), the `finally:` block…
- [Low] _free_ids() in tools/testing/selftests/net/nl_genl_mcast.py
  decides it is in init_net by comparing…
- [Low] _members() in tools/testing/selftests/net/nl_genl_mcast.py calls
  sk.getsockopt(SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 64) and decodes…

--

selftests: net: test joining genetlink groups no family owns

This adds a Python selftest. It checks that Generic Netlink multicast
group IDs no family owns cannot be joined with setsockopt() or bind(). It
also checks that a socket bound to free IDs does not become a member of
the NET_DM groups once drop_monitor is loaded.

> diff --git a/tools/testing/selftests/net/nl_genl_mcast.py b/tools/testing/selftests/net/nl_genl_mcast.py
> new file mode 100755
> index 0000000000000..8bbe3d22225cf
> --- /dev/null
> +++ b/tools/testing/selftests/net/nl_genl_mcast.py

[ ... ]

> +# include/uapi/linux/nsfs.h
> +NET_NS_INIT_INO = 0xEFFFFFF9

[ ... ]

> +def _free_ids(ctrl):
> +    """Return the IDs in 1..32 that no family owns."""
> +    # Outside init_net, the dump skips the families that are not netnsok,
> +    # but their groups are still owned.
> +    if os.stat('/proc/self/ns/net').st_ino != NET_NS_INIT_INO:
> +        raise KsftSkipEx("not in the initial network namespace")

[Severity: Low]
Can this check ever match on kernels older than commit 9b0240b3ccc325
("netns: use stable inode number for initial mount ns")?

That commit added NET_NS_INIT_INO to include/uapi/linux/nsfs.h. Before
it, the ns.inum of init_net was a dynamically allocated proc inode number
(PROC_DYNAMIC_FIRST and up), so this comparison never matches.

join_free(), bind_mask() and bind_before_family() all call _free_ids()
first. On those kernels all three subtests would skip, even when run in
the initial network namespace. The printed reason, "not in the initial
network namespace", would also be wrong.

The companion fix "genetlink: Reject joining multicast groups no family
owns" has a Fixes: tag, so it is a likely backport candidate for stable
trees such as 6.12, 6.6, 6.1 and 5.15. If this test is backported with
it, the fix would never be exercised there.

The commit message explains why the fixed inode number is used, but it
does not mention this limitation. Would a fallback help here? For
example, the test could compare against the inode of /proc/1/ns/net when
the fixed value is not in use. Another option is a skip message that
states the actual condition.

[ ... ]

> +def _members(sk):
> +    buf = sk.getsockopt(SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 64)
> +    # An array of u32 in host byte order
> +    words = struct.unpack(f'={len(buf) // 4}I', buf)
> +    return sum(w << (32 * i) for i, w in enumerate(words))

[Severity: Low]
Could _members() decode uninitialised bytes when the socket has more
than 512 groups?

In netlink_getsockopt(), the NETLINK_LIST_MEMBERSHIPS case stops copying
once the user buffer is full. It then reports the full required size
anyway:

net/netlink/af_netlink.c:netlink_getsockopt() {
    ...
		opt->optlen = ALIGN(BITS_TO_BYTES(nlk->ngroups), sizeof(u32));
    ...
}

do_sock_getsockopt() in net/socket.c writes this value back to user
space without clamping it. CPython's socket.getsockopt() then resizes
the returned bytes object to that length. Everything past the 64 bytes
the kernel actually wrote is left uninitialised.

For a genetlink socket, nlk->ngroups follows mc_groups_longs *
BITS_PER_LONG, and that grows on demand in genl_allocate_reserve_groups()
and genl_validate_assign_mc_groups(). If it goes above 512, the
full-value ksft_eq() checks in join_free() and bind_mask() could fail
because of garbage high bits.

Would it be safer to decode only the first min(len(buf), 64) bytes, or
to size the buffer from the returned optlen?

[ ... ]

> +def bind_before_family(ctrl) -> None:
> +    """A free ID joined with bind() stays unjoined when a family takes it."""
> +    names = [fam['family-name'] for fam in ctrl.getfamily({}, dump=True)]
> +    if 'NET_DM' in names:
> +        raise KsftSkipEx("NET_DM is already registered")
> +
> +    free = _free_ids(ctrl)
> +    try:
> +        with _sock() as sk:
> +            sk.bind((0, sum(_bit(gid) for gid in free)))
> +
> +            # Looking up the family loads drop_monitor.
> +            try:
> +                ids = _groups(ctrl.getfamily({'family-name': 'NET_DM'}))
> +            except NlError as e:
> +                raise KsftSkipEx("drop_monitor is not available") from e

[ ... ]

> +    finally:
> +        # So that the next run can load it again
> +        cmd("modprobe -q -r drop_monitor", fail=False)

[Severity: Medium]
Can this finally block turn the "drop_monitor is not available" skip into
a failure?

With shell=None, cmd() in lib/py/utils.py splits the string into a list
and runs it through subprocess.Popen() without a shell. If modprobe is
not on PATH, Popen() raises FileNotFoundError. fail=False only ignores a
non-zero exit code, not a failure to start the command.

An exception raised in a finally block replaces the pending one. The
KsftSkipEx raised when getfamily() fails with NlError is then lost.
ksft_run() catches the FileNotFoundError under except BaseException and
counts the test as a failure, with a traceback.

Without modprobe, request_module() in the kernel would also fail. That
makes the NlError path the one taken in exactly this environment. The
cleanup also runs when the test never loaded drop_monitor.

modprobe may only be in /sbin or /usr/sbin, and the test may run with a
PATH that excludes them. In that case even the success path would end in
FileNotFoundError and be reported as a failure.

Would it help to run modprobe -r only after getfamily() succeeds, or to
catch OSError around the cleanup?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125144514.2717012-1-anilkaushikwireless%40gmail.com
