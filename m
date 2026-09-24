Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7054746AD;
	Thu, 24 Sep 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248339; cv=none; b=aXeq7hRpn7vAiMxQrPyJ0dSeOpFf5w/YeUqLIYRth81FXyrEC4lxPFo+CvhY972y7v/RsSgVwjSZ69ozlc5mD/FJwQsK5VCI32ctWMfpmV2RNT6jg3T6j4BczZlDSWhmuqmxfJUonXZ0a+zIDTH+bDHUILlySsBQHD6H5Kq9tjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248339; c=relaxed/simple;
	bh=7CEdV4xJxBycFQAIl+cB8WXuXeXfUfzd0dSjQy0nLHk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AOLocqVSDajUtRd35ToZpmo7bRZFv6Lj8fd3cLbJFRkHRDiCTqVwWHqIUF7+JRqi/l1taVwArwBD8vPoOB7oc1Y2UbZNkEMNLk3ZAbMa2C6Z7cdBbBvKL0fz94dqQABKYB2kMh0axRmWTcRm/AQvNCIKGX7rx9wDfIGg+ukl7bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jy8NrXLl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jy8NrXLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAA81F000FF;
	Thu, 24 Sep 2026 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790248338;
	bh=gtVtBDeZopRdm+Os/+sPdloL64YT17QzD2qYpHX5M6w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jy8NrXLl99fj+eqLvANFQzPeixUvbGmIJPrZtxHm8mmmgGV0RuPfZXZ0XjRBja1Th
	 JnIdy2+qrqoNj0mRlw3zA/YRI9r+m3TurzikT055A0v9O55MjdWc00eKJbOzzLFBdY
	 o0vah80c3lO4VAv3pLznaYPC0rmvlo12x3IoR8U5vYHpPliL6O7bfQgSXTpP+iAVd5
	 AH2MlYGilZGQP4IwF19qDhMWqOf9vt6Qk5tjr2FemGLOkGpx7lq24NU62ShGDthn/L
	 KYZeRGUZ1DjN/pcxH+D7zbxqC9HgkoPClb0flzrF8LZ4TrJu4OOSU4HQkbN77DIkDc
	 EFAy/OLXhDOXw==
Subject:
 Re: [PATCH net-next] selftests: drv-net: add BIG TCP coverage to TSO test
From: netdev-bot+sashiko@kernel.org
To: narcisav.kernel@gmail.com
Cc: netdev@vger.kernel.org, kuba@kernel.org, daniel.zahka@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, shuah@kernel.org, pvorel@suse.cz,
 pavan.chebbi@broadcom.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 24 Sep 2026 11:12:16 +0000
Message-ID: <179024833698.2160803.15870095496520127538@kernel.org>
In-Reply-To: <20260921201145.49875-1-narcisav.kernel@gmail.com>
References: <20260921201145.49875-1-narcisav.kernel@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Late skip decisions in the new BIG TCP cases convert already-
  recorded failures into a SKIP and silently drop the remaining test…
- [Medium] `run_big_tcp_stream()` (tso.py:207-244) claims (test name
  `big_tcp_*`, docstring "so the frags exceed 64kB", commit message…
- [Low] The new module-level constants hardcode architecture-specific
  UAPI values as fallbacks: `MAP_HUGETLB = getattr(mmap, "MAP_HUGETLB",…
- [Low] `setup_hugepage()` (tso.py:65-80) performs an unsynchronized
  read-modify-write of the system-wide `/proc/sys/vm/nr_hugepages` (read…
- [Low] `sock_send_zerocopy()` (tso.py:139-141) unmaps the hugepage
  buffer on exit of the `with mmap_large_buffer() as tx_buf:` block and…

--

selftests: drv-net: add BIG TCP coverage to TSO test

Adds two new tso.py cases (big_tcp_ipv4, big_tcp_ipv6) that raise
gso_max_size/gso_ipv4_max_size to the device's tso_max_size and then run
the existing stream tests, plus an extra MSG_ZEROCOPY send out of a
hugepage-backed buffer. A few questions on the new helpers below.

> diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
> index 67f6c9ca9a647..176ddf97fabb9 100755
> --- a/tools/testing/selftests/drivers/net/hw/tso.py
> +++ b/tools/testing/selftests/drivers/net/hw/tso.py
> @@ -4,6 +4,7 @@
>  """A simple test for TSO."""
>  
>  import fcntl
> +import mmap
>  import socket
>  import struct
>  import termios
> @@ -15,6 +16,87 @@ from lib.py import EthtoolFamily, NetdevFamily, NetDrvEpEnv
>  from lib.py import bkg, cmd, defer, ethtool, ip, rand_port, wait_port_listen
>  
>  
> +MAP_HUGETLB = getattr(mmap, "MAP_HUGETLB", 0x40000)
> +MSG_ZEROCOPY = getattr(socket, "MSG_ZEROCOPY", 0x4000000)
> +SO_ZEROCOPY = getattr(socket, "SO_ZEROCOPY", 60)

[Severity: Low]
Are these numeric fallbacks architecture independent? CPython's mmap
module does not export MAP_HUGETLB, so the fallback is the normal path
rather than an exception, and the two values are not the same everywhere:

arch/mips/include/uapi/asm/mman.h:
    #define MAP_STACK       0x40000
    #define MAP_HUGETLB     0x80000

arch/alpha/include/uapi/asm/mman.h:
    #define MAP_HUGETLB     0x100000        /* create a huge page mapping */

So on mips 0x40000 is MAP_STACK, which mmap() accepts and ignores, and the
mapping in mmap_large_buffer() silently succeeds without any hugepage, so
no skip is raised and no large frag can be produced.

Same question for SO_ZEROCOPY:

arch/sparc/include/uapi/asm/socket.h:
    #define SO_ZEROCOPY             0x003e

arch/parisc/include/uapi/asm/socket.h:
    #define SO_ZEROCOPY             0x4035

setsockopt(SOL_SOCKET, 60, 1) would then set some other option, and the
send would quietly fall back to copying. Would requiring the attribute and
raising KsftSkipEx when it is missing be more robust than guessing a value?

> +
> +GSO_LEGACY_MAX_SIZE = 65536

[ ... ]

> +def setup_hugepage():
> +    """Reserve one hugepage, and put the pool back afterwards."""
> +    if hugepages_free() >= 1:
> +        return
> +
> +    try:
> +        with open(NR_HUGEPAGES, encoding="utf-8") as sysctl:
> +            old_count = int(sysctl.read())
> +        set_nr_hugepages(old_count + 1)
> +    except OSError as error:
> +        raise KsftSkipEx(f"Unable to reserve a hugepage: {error}") from error
> +
> +    defer(set_nr_hugepages, old_count)
> +
> +    if hugepages_free() < 1:
> +        raise KsftSkipEx("Unable to reserve a hugepage")

[Severity: Low]
Can this clobber the global hugepage pool of another user? The read of
old_count and the write of old_count + 1 on /proc/sys/vm/nr_hugepages are
not atomic, and the deferred restore writes an absolute value.

If something else grows the pool between the read here and the deferred
set_nr_hugepages(old_count), the restore shrinks the pool back below what
the other writer asked for. Two concurrent instances of this test both
reading N and both writing N + 1 also end up adding a single page, so one
of them skips.

The early return path makes no reservation at all, so the free page
observed by hugepages_free() can be consumed by anyone before
mmap_large_buffer() issues the MAP_HUGETLB mmap, which shows up as a skip
rather than as lost coverage. Would a private hugetlbfs mount, a flock, or
a cgroup reservation be a better fit here?

> +
> +
> +def mmap_large_buffer():
> +    """Allocate a buffer backed by one huge page."""
> +    size = default_huge_page_size()
> +
> +    setup_hugepage()
> +
> +    try:
> +        return mmap.mmap(-1, size,
> +                         flags=mmap.MAP_PRIVATE |
> +                               mmap.MAP_ANONYMOUS |
> +                               MAP_HUGETLB,
> +                         prot=mmap.PROT_READ)
> +    except OSError as e:
> +        raise KsftSkipEx(f"Unable to allocate a {size >> 20}MB hugepage "
> +                         f"buffer: {e}") from e
> +
> +
>  def sock_wait_drain(sock, max_wait=1000):
>      """Wait for all pending write data on the socket to get ACKed."""
>      for _ in range(max_wait):
> @@ -33,6 +115,32 @@ def tcp_sock_get_retrans(sock):
>      return struct.unpack("I", info[100:104])[0]
>  
>  
> +def setup_big_tcp(cfg):
> +    """Lift the GSO ceiling to what the device advertises for TSO."""
> +    if cfg.dev["tso_max_size"] <= GSO_LEGACY_MAX_SIZE:
> +        raise KsftSkipEx("Device does not support BIG TCP")
> +
> +    ip(f"link set dev {cfg.ifname} "
> +       f"gso_max_size {cfg.dev['tso_max_size']} "
> +       f"gso_ipv4_max_size {cfg.dev['tso_max_size']}")
> +
> +    defer(ip, f"link set dev {cfg.ifname} "
> +              f"gso_max_size {cfg.dev['gso_max_size']} "
> +              f"gso_ipv4_max_size {cfg.dev['gso_ipv4_max_size']}")
> +
> +
> +def sock_send_zerocopy(sock):
> +    """Send with MSG_ZEROCOPY, return the bytes queued."""
> +    try:
> +        sock.setsockopt(socket.SOL_SOCKET, SO_ZEROCOPY, 1)
> +    except OSError as e:
> +        raise KsftSkipEx(f"SO_ZEROCOPY not supported: {e}") from e
> +
> +    with mmap_large_buffer() as tx_buf:
> +        sock.sendall(tx_buf, MSG_ZEROCOPY)
> +        return len(tx_buf)

[Severity: Low]
Should the MSG_ERRQUEUE completions be drained before the with block
unmaps tx_buf and the caller closes the socket?

MSG_ZEROCOPY can be turned into a copying send without any error from
sendall():

net/ipv4/tcp.c:tcp_sendmsg_locked() {
    ...
            if (sk->sk_route_caps & NETIF_F_SG)
                    zc = MSG_ZEROCOPY;
            else
                    uarg_to_msgzc(uarg)->zerocopy = 0;
    ...
}

The only user-visible indicator of that fallback is
SO_EE_CODE_ZEROCOPY_COPIED on the error queue, which this test never
reads, so a copying send is indistinguishable from a real zerocopy send
here.

Note the hugepage pinning itself does not look like a problem: the queued
skbs keep the pages referenced across munmap, and the deferred pool shrink
is absorbed by hugetlb surplus accounting.

> +
> +
>  def run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso):
>      cfg.require_cmd("socat", local=False, remote=True)
>  
> @@ -96,6 +204,46 @@ def run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso):
>                          500, comment="Number of LSO wire-packets with LSO disabled")
>  
>  
> +def run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6):
> +    """Send with MSG_ZEROCOPY out of a huge page, so the frags exceed 64kB."""
> +    cfg.require_cmd("socat", local=False, remote=True)
> +
> +    # No clamping, as it would keep the frags under 64kB
> +    port = rand_port()
> +    listen_opts = f"{port},reuseport"
> +    listen_cmd = f"socat -{ipver} -t 2 -u TCP-LISTEN:{listen_opts} /dev/null,ignoreeof"

[ ... ]

> +        sent = sock_send_zerocopy(sock)
> +        sock_wait_drain(sock)
> +
> +        drops = tx_dropped(cfg.ifname) - drops_old
> +        retrans = tcp_sock_get_retrans(sock) - retrans_old
> +        sock.close()
> +
> +        ksft_eq(drops, 0, comment="Driver TX drops during BIG TCP send")
> +
> +        # Same best effort bound as the plain stream.
> +        total_lso_wire = sent * 0.90 // cfg.dev["mtu"]
> +        ksft_lt(retrans, total_lso_wire / 16)

[Severity: Medium]
Can these two checks pass without any frag larger than 64kB ever being
built? The docstring says "so the frags exceed 64kB" and the commit
message says the send is there "to produce skb fragments larger than
65536", but nothing here observes the frag size, the GSO counters, or the
zerocopy completions.

setup_big_tcp() only lifts the GSO ceiling and gates on tso_max_size, while
the per-skb size is bounded further:

net/ipv4/tcp.c:tcp_xmit_size_goal() {
    ...
        new_size_goal = tcp_bound_to_half_wnd(tp, sk->sk_gso_max_size);
    ...
            tp->gso_segs = min_t(u16, new_size_goal / mss_now,
                                 sk->sk_gso_max_segs);
    ...
}

So a device with tso_max_size above 65536 but a modest tso_max_segs (say
32 * 1448, roughly 46kB), or a peer advertising a small window, keeps every
frag below 64kB and both cases still report ok. Should setup_big_tcp() also
look at tso_max_segs, and should the peer window be arranged given the
comment says the clamp was dropped on purpose?

Unlike run_one_stream(), this path also samples no qstats
(tx-hw-gso-packets / tx-hw-gso-wire-packets), so the two invocations of
run_big_tcp_stream() cannot tell the software-GSO phase from the
hardware-TSO phase. The payload is a PROT_READ zero mapping sent to
socat ... /dev/null, so there is no content check either.

> +
> +
>  def build_tunnel(cfg, outer_ipver, tun_info):
>      local_v4  = NetDrvEpEnv.nsim_v4_pfx + "1"
>      local_v6  = NetDrvEpEnv.nsim_v6_pfx + "1"
> @@ -147,6 +295,11 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
>          if feature not in cfg.hw_features:
>              raise KsftSkipEx(f"Device does not support {feature}")
>  
> +        # Run non-tunnel test cases under the BIG TCP limits too.
> +        big_tcp = "big_tcp" in name
> +        if big_tcp:
> +            setup_big_tcp(cfg)
> +

[Severity: Medium]
Should the hugepage and SO_ZEROCOPY preconditions be probed here, next to
setup_big_tcp(), rather than in the middle of the test?

As written, the order inside f() is setup_big_tcp() -> ethtool -K feature
off -> run_one_stream(should_lso=False) -> run_big_tcp_stream(). The
remaining preconditions are only evaluated once run_big_tcp_stream() is
reached, and each raises KsftSkipEx:

  sock_send_zerocopy()  -> "SO_ZEROCOPY not supported"
  mmap_large_buffer()   -> "Unable to allocate a ...MB hugepage buffer"
  setup_hugepage()      -> "Unable to reserve a hugepage"

By then run_one_stream() has already recorded results, and ksft_run()
buckets the case as a skip regardless:

tools/testing/selftests/net/lib/py/ksft.py:ksft_run() {
    ...
        except KsftSkipEx as e:
            comment = "SKIP " + str(e)
            cnt_key = 'skip'
    ...
        if not cnt_key:
            cnt_key = 'pass' if KSFT_RESULT else 'fail'
    ...
}

Since cnt_key is already set, a case whose earlier phase set KSFT_RESULT
to False is reported with "# SKIP" and counted under skip. The LSO-enabled
half (ethtool -K feature on, run_one_stream(should_lso=True) and the second
run_big_tcp_stream()) is also never run, yet the case looks like a clean
skip. A host with no writable or growable hugepage pool hits this on every
run.

>          ipver = outer_ipver
>          if tun:
>              remote_v4, remote_v6 = build_tunnel(cfg, ipver, tun)
> @@ -159,6 +312,9 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
>          ethtool(f"-K {cfg.ifname} {feature} off")
>          run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso=False)
>  
> +        if big_tcp:
> +            run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6)
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921201145.49875-1-narcisav.kernel%40gmail.com
