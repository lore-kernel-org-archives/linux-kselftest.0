Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2FF3F58E8;
	Wed, 23 Sep 2026 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195017; cv=none; b=rJyo7h1eJh9HMnKxXl4QJkG7QhSnUsKr2b19uUAlAtKueM8/PFZXxirR1CPWXqulXoK/mKTDnit7m06Yg2s1Ew2BpK7H3MBua8GH5AYscMpQKcJsAGwzyJXsVHQZFwrfbgNWLxIDhCkWDyvTZsz34bnIr8tAplZHo8q0avCeR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195017; c=relaxed/simple;
	bh=N3ZtQzKMoF3t3mjzucPKwU7WpmStxEm6lmVi7hsw5pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiDnEjg8vffraSPcv5+yHAmhOGhH5ZkLAd2tjSmzBv/MpHn1Eda8gLBbZrreNVBeZZOkkuyRO++iw4mjfPH2/F6jC3t8vilzYc1TsjEiWHJ36TcGCd9j8CKTYw9ljoeiYXw75nOIhQA1kt1NTopHn5INFkF6Cdkmg0k83dusImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vKgZQ+68; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3sEAlWav; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=z6E9OOdj; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=SLDbMTC1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vKgZQ+68";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3sEAlWav";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="z6E9OOdj";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="SLDbMTC1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DC3FB1FFA4;
	Wed, 23 Sep 2026 20:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1790195001;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3txnbGXjnEMcg6Tno2syRovR7ra61zaqYc6U6PNPcNQ=;
	b=vKgZQ+68d+onAg5VOUJixIXtms4eXf+hza8Qn3xv/AvsNgyCtxmQp18M6XHL3Z9JY8m7xM
	8SNJ13ig30VoYFWMk0wy0bUfxrVD8Rac3m936gOPjIo3YKcJ8bH397E3qdFYtRAfQPwYu0
	TTqYIA+6kmZltcISt5Lf5s+3uBgats0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1790195001;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3txnbGXjnEMcg6Tno2syRovR7ra61zaqYc6U6PNPcNQ=;
	b=3sEAlWavfBWdcIItajuaFaync5u0jBk+q3AKoXwL2HfwRu/iNbi1c7+QFRj3T7GB9CmYLq
	4LPbJu3/2n6/iBAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1790194996;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3txnbGXjnEMcg6Tno2syRovR7ra61zaqYc6U6PNPcNQ=;
	b=z6E9OOdjcpH2C2T8Rpt182pYh6dsDlwjw7HApaUSh+V21JuNeWiTu+a5xZuGFEN3U2BYLu
	tj+69PiplLD4eGKBo1hcXPsnVVwY/M94HJKLYr3A8LvI0JREzQZqhzJZ3vErkv/r65rtJZ
	AaZvmYa5lbBo8VBGel3UmLsNGcN8x7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1790194996;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3txnbGXjnEMcg6Tno2syRovR7ra61zaqYc6U6PNPcNQ=;
	b=SLDbMTC1RdHneptx0VcM/nsqdHn4285bwd15Wonz6ZaaUMeo1Lrs3UUbANafD7dollNxsB
	v9aTOBc6qjs8OADQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 088FC13354;
	Wed, 23 Sep 2026 20:23:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZHICMjM1tGpMYwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 23 Sep 2026 20:23:15 +0000
Date: Wed, 23 Sep 2026 22:23:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, daniel.zahka@gmail.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Ricardo B. Marliere" <rbm@suse.com>,
	Sebastian Chlad <sebastian.chlad@suse.com>
Subject: Re: [PATCH net-next] selftests: drv-net: add BIG TCP coverage to TSO
 test
Message-ID: <20260923202314.GA177730@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260921201145.49875-1-narcisav.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921201145.49875-1-narcisav.kernel@gmail.com>
X-Spam-Level: 
X-Spam-Score: -2.00
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,broadcom.com,suse.com];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lib.py:url,imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:replyto];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]

Hi Narcisa,

[ Cc Ricardo and Sebastian ]

> Add IPv4 and IPv6 test cases that exercise GSO packets under BIG TCP
> size limits.

> 1..2
> ok 1 tso.big_tcp_ipv4
> ok 2 tso.big_tcp_ipv6

> Both of them run the existing tx-tcp-segmentation
> and tx-tcp6-segmentation tests at the increased TSO maximum.

> Additionally, reserve a hugepage and transmit its content using
> MSG_ZEROCOPY to produce skb fragments larger than 65536.
> Check that the number of retransmissions represents a small
> percentage of the total packets sent. Record the number of drops
> before and after the send to catch issues with large frag
> handling during segmentation.

> Signed-off-by: Narcisa Vasile <narcisav.kernel@gmail.com>

LGTM, but I'm not really an expert on network drivers testing.

Acked-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> ---
>  tools/testing/selftests/drivers/net/hw/tso.py | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)

> diff --git a/tools/testing/selftests/drivers/net/hw/tso.py b/tools/testing/selftests/drivers/net/hw/tso.py
> index 67f6c9ca9a64..176ddf97fabb 100755
> --- a/tools/testing/selftests/drivers/net/hw/tso.py
> +++ b/tools/testing/selftests/drivers/net/hw/tso.py
> @@ -4,6 +4,7 @@
>  """A simple test for TSO."""

>  import fcntl
> +import mmap
>  import socket
>  import struct
>  import termios
> @@ -15,6 +16,87 @@ from lib.py import EthtoolFamily, NetdevFamily, NetDrvEpEnv
>  from lib.py import bkg, cmd, defer, ethtool, ip, rand_port, wait_port_listen


> +MAP_HUGETLB = getattr(mmap, "MAP_HUGETLB", 0x40000)
> +MSG_ZEROCOPY = getattr(socket, "MSG_ZEROCOPY", 0x4000000)
> +SO_ZEROCOPY = getattr(socket, "SO_ZEROCOPY", 60)
> +
> +GSO_LEGACY_MAX_SIZE = 65536
> +
> +# Pool of the default hugepage size, the one /proc/meminfo reports on.
> +NR_HUGEPAGES = "/proc/sys/vm/nr_hugepages"
> +
> +
> +def default_huge_page_size():
> +    """Return the hugepage size in bytes"""
> +    try:
> +        with open("/proc/meminfo", encoding="utf-8") as meminfo:
> +            for line in meminfo:
> +                if line.startswith("Hugepagesize:"):
> +                    return int(line.split()[1]) * 1024
> +    except OSError:
> +        pass
> +
> +    return 2 * 1024 * 1024
> +
> +
> +def hugepages_free():
> +    """Return the number of unused hugepages of the default size."""
> +    try:
> +        with open("/proc/meminfo", encoding="utf-8") as meminfo:
> +            for line in meminfo:
> +                if line.startswith("HugePages_Free:"):
> +                    return int(line.split()[1])
> +    except OSError:
> +        pass
> +    return 0
> +
> +
> +def set_nr_hugepages(count):
> +    with open(NR_HUGEPAGES, "w", encoding="utf-8") as sysctl:
> +        sysctl.write(f"{count}\n")
> +
> +
> +def tx_dropped(ifname):
> +    with open(f"/sys/class/net/{ifname}/statistics/tx_dropped",
> +              encoding="utf-8") as counter:
> +        return int(counter.read())
> +
> +
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
> +
> +
>  def run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso):
>      cfg.require_cmd("socat", local=False, remote=True)

> @@ -96,6 +204,46 @@ def run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso):
>                          500, comment="Number of LSO wire-packets with LSO disabled")


> +def run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6):
> +    """Send with MSG_ZEROCOPY out of a huge page, so the frags exceed 64kB."""
> +    cfg.require_cmd("socat", local=False, remote=True)
> +
> +    # No clamping, as it would keep the frags under 64kB
> +    port = rand_port()
> +    listen_opts = f"{port},reuseport"
> +    listen_cmd = f"socat -{ipver} -t 2 -u TCP-LISTEN:{listen_opts} /dev/null,ignoreeof"
> +
> +    with bkg(listen_cmd, host=cfg.remote, exit_wait=True):
> +        wait_port_listen(port, host=cfg.remote)
> +
> +        if ipver == "4":
> +            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> +            sock.connect((remote_v4, port))
> +        else:
> +            sock = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
> +            sock.connect((remote_v6, port))
> +
> +        # Small send to make sure the connection is working.
> +        sock.send("ping".encode())
> +        sock_wait_drain(sock)
> +
> +        retrans_old = tcp_sock_get_retrans(sock)
> +        drops_old = tx_dropped(cfg.ifname)
> +
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
> +
> +
>  def build_tunnel(cfg, outer_ipver, tun_info):
>      local_v4  = NetDrvEpEnv.nsim_v4_pfx + "1"
>      local_v6  = NetDrvEpEnv.nsim_v6_pfx + "1"
> @@ -147,6 +295,11 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
>          if feature not in cfg.hw_features:
>              raise KsftSkipEx(f"Device does not support {feature}")

> +        # Run non-tunnel test cases under the BIG TCP limits too.
> +        big_tcp = "big_tcp" in name
> +        if big_tcp:
> +            setup_big_tcp(cfg)
> +
>          ipver = outer_ipver
>          if tun:
>              remote_v4, remote_v6 = build_tunnel(cfg, ipver, tun)
> @@ -159,6 +312,9 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
>          ethtool(f"-K {cfg.ifname} {feature} off")
>          run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso=False)

> +        if big_tcp:
> +            run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6)
> +
>          ethtool(f"-K {cfg.ifname} tx-gso-partial off")
>          ethtool(f"-K {cfg.ifname} tx-tcp-mangleid-segmentation off")
>          if feature in cfg.partial_features:
> @@ -171,6 +327,9 @@ def test_builder(name, cfg, outer_ipver, feature, tun=None, inner_ipver=None):
>          ethtool(f"-K {cfg.ifname} {feature} on")
>          run_one_stream(cfg, ipver, remote_v4, remote_v6, should_lso=True)

> +        if big_tcp:
> +            run_big_tcp_stream(cfg, ipver, remote_v4, remote_v6)
> +
>      f.__name__ = name + ((outer_ipver + "_") if tun else "") + "ipv" + inner_ipver
>      return f

> @@ -230,6 +389,8 @@ def main() -> None:
>              # name,       v4/v6  ethtool_feature               tun:(type, args, inner ip versions)
>              ("",           "4", "tx-tcp-segmentation",         None),
>              ("",           "6", "tx-tcp6-segmentation",        None),
> +            ("big_tcp_",   "4", "tx-tcp-segmentation",         None),
> +            ("big_tcp_",   "6", "tx-tcp6-segmentation",        None),
>              ("vxlan",      "4", "tx-udp_tnl-segmentation",     ("vxlan", "id 100 dstport 4789 noudpcsum", ("4", "6"))),
>              ("vxlan",      "6", "tx-udp_tnl-segmentation",     ("vxlan", "id 100 dstport 4789 udp6zerocsumtx udp6zerocsumrx", ("4", "6"))),
>              ("vxlan_csum", "", "tx-udp_tnl-csum-segmentation", ("vxlan", "id 100 dstport 4789 udpcsum", ("4", "6"))),
