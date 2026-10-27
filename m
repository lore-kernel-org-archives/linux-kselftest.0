Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793061820;
	b=gmZ5J/re60CR5pFgzbcf0WgPZRtkl/kFENXlITVEbrCF9cQnjX0Tez8RAgsLb6vQejnM
	 glXHil8CnFFYXDd7BukZf6IWFoTihSIXZrMRyfrizMbsOl+yLyLq6aMsrBn7KXGtQqZDz
	 C9eSX75UghFkIy18bfrMZyp1tYEfJ558ljBpl4DPS8qSwb2iMFqPDuXm/zKgf6xOIttbK
	 fIqyQBjGEX+ynAeJlvqdRgnKyx7gzHdT6cjqnoln2N81xGLNF48kGKWKqR/R74MtBZqy+
	 YHHVJ+DUmKfuscsyZA6GH6At31ITB2uKUZTVBOq/zBv0Wsxikx2RXVIUDVSsYHBHjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793061820;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ufkWr3vrPK2wLYgntP0R8vZ/bEKhfdE0seUCNPriU9A=;
	b=pZZQ1R4Qs++l4Pmtzw9bbA8d0R8PpEvt1RsiOnE8P4+jYy7OJPGiaiC378BeMjE3pZ4N
	 Zy+OuLrytHh6XkZjNL+yPEK583qIHCSXqrhnTkpzvZvC6Kr0rPBcjdxC62WrdXUqxsdfK
	 aE3KJQTUkoRd9gJqAWhhvVRzNcs5hfrrPXyTGkkqgQCgXYSCv+8osTANMAZyUgeiBZmkC
	 8IWVgZkxuTyYE8RtLy2A983p+Qqgr8HWJDokWT/ZRtmNkgJ1FKRx7Y1DYIUH3ycBCrR5E
	 setAjw4X0It0L0QXunBTVwa1gxHfauQdgBJNJ614cZ35E3H7e1vOU0DlQKPbjLqyDtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKkgd0UR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6151E606A31A;
	Tue, 27 Oct 2026 00:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKkgd0UR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712161F01825;
	Tue, 27 Oct 2026 00:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793061818;
	bh=ufkWr3vrPK2wLYgntP0R8vZ/bEKhfdE0seUCNPriU9A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MKkgd0URntwrfHrOYk0KJsVBkLfkOseX76HFwRPodfuC6KaP7deV/kMzwwhO2uD2G
	 RIP+CVZ/NctB6oK3qz+ztNCrV+aiWBtwBW4BL9VCkgV4Fcr9fTNVp6iQstG8fofnEn
	 JZQ/2ENHJ9Vgj1y3F8/Dq8MANUeOxHL6hv2S85V5KChEEmyNco2BpPY/wMjl/r0GQb
	 rG47lYsDhHXBJD0o5/sswVfLpcUW1Jlorm3001n6i3NpogLRjEKTx1kb2xQm98fBvh
	 +uI1WPwqJKh+vuDrnmYZjXQvX2yizN79BqS+vmpiF3ZUqRbQl3rJ1TjDvwkDJmdrpz
	 qCDQVXdbTG2UQ==
Date: Mon, 26 Oct 2026 17:43:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rishikesh Jethwani <rjethwani@purestorage.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] selftests: net: add TLS 1.2 hardware offload
 tests
Message-ID: <20261026174337.404cb718@kernel.org>
In-Reply-To: <20261020181147.939575-2-rjethwani@purestorage.com>
References: <20261020181147.939575-1-rjethwani@purestorage.com>
	<20261020181147.939575-2-rjethwani@purestorage.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 12:11:45 -0600 Rishikesh Jethwani wrote:
> Add a two-node kTLS hardware offload test. A C helper runs on both
> endpoints and installs fixed AES-GCM keys, so no handshake is needed.
> The DUT runs the TLS client and the peer echoes everything back. The
> test covers AES-GCM-128/256, IPv4/IPv6, and small, large and random
> echo payloads.
> 
> Each enabled DUT direction must use HW offload: the TlsTxDevice and
> TlsRxDevice MIB counters must grow and, where the driver exposes them,
> so must the NIC's TLS crypto and context counters. The peer, and any
> DUT direction without HW offload enabled, may use SW kTLS. Neither
> side may see a TlsDecryptError.
> 
> Add handshake and alert regression cases for the push_pending_record
> fix. They install TLS_RX after TLS_TX, buffer "AAAA" with MSG_MORE and
> send "BBBB" with a TLS_SET_RECORD_TYPE cmsg. The peer must receive an
> application data record "AAAA" followed by a "BBBB" record of the
> requested type, each with MSG_EOR, and then EOF. These cases require
> DUT TX offload and work with the DUT's RX in either HW or SW.
> 
> Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
> ---
>  MAINTAINERS                                   |   2 +
>  .../testing/selftests/drivers/net/README.rst  |  22 +
>  .../selftests/drivers/net/hw/.gitignore       |   1 +
>  .../testing/selftests/drivers/net/hw/Makefile |   4 +
>  tools/testing/selftests/drivers/net/hw/config |   2 +
>  .../selftests/drivers/net/hw/tls_hw_offload.c | 886 ++++++++++++++++++
>  .../drivers/net/hw/tls_hw_offload.py          | 402 ++++++++
>  7 files changed, 1319 insertions(+)
>  create mode 100644 tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
>  create mode 100755 tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00b440be0d46..771cd3161a05 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19269,6 +19269,8 @@ F:	Documentation/networking/tls*
>  F:	include/net/tls.h
>  F:	include/uapi/linux/tls.h
>  F:	net/tls/
> +F:	tools/testing/selftests/drivers/net/hw/tls_hw_offload.c
> +F:	tools/testing/selftests/drivers/net/hw/tls_hw_offload.py

let's do

F:	tools/testing/selftests/drivers/net/hw/tls*

>  F:	tools/testing/selftests/net/tls.c
>  
>  NETWORKING [SOCKETS]
> diff --git a/tools/testing/selftests/drivers/net/README.rst b/tools/testing/selftests/drivers/net/README.rst
> index c6bed9a985bc..94c6aeecfe2f 100644
> --- a/tools/testing/selftests/drivers/net/README.rst
> +++ b/tools/testing/selftests/drivers/net/README.rst
> @@ -188,6 +188,28 @@ The tests have a handful of dependencies. For Fedora / CentOS::
>  
>    dnf -y install netsniff-ng python-yaml socat iperf3
>  
> +TLS hardware offload
> +~~~~~~~~~~~~~~~~~~~~
> +
> +``hw/tls_hw_offload.py`` tests TLS 1.2 with AES-GCM-128/256 using a C
> +helper on both endpoints. Configure the endpoints using the variables above
> +and enable at least one of ``tls-hw-tx-offload`` or ``tls-hw-rx-offload`` on
> +the DUT. The peer can use software kTLS. The test checks every enabled DUT
> +direction; unexpected software fallback fails. Known AES-GCM-128-only
> +drivers skip the AES-GCM-256 case.
> +
> +The record-type cases require DUT TX offload. They install TLS_RX after
> +TLS_TX, buffer application data with MSG_MORE, then send a handshake or
> +alert record. The peer verifies both record types and payloads. Running
> +with RX offload enabled covers hardware RX setup; running with it disabled
> +also covers software RX setup on a socket with hardware TX offload.
> +
> +Run without other kTLS workloads in either endpoint's network namespace:
> +the tests compare shared TLS MIB and NIC counter snapshots. Build the helper
> +with ``make -C tools/testing/selftests/drivers/net/hw tls_hw_offload`` and
> +run ``tools/testing/selftests/drivers/net/hw/tls_hw_offload.py`` with the
> +endpoint configuration. The harness deploys the helper to the peer.

Why add this here? Do you see similarly low-value info for any other
test in this README?

>  Guidance for test authors
>  =========================
>  
> diff --git a/tools/testing/selftests/drivers/net/hw/.gitignore b/tools/testing/selftests/drivers/net/hw/.gitignore
> index 46540468a775..911a9bfeaf41 100644
> --- a/tools/testing/selftests/drivers/net/hw/.gitignore
> +++ b/tools/testing/selftests/drivers/net/hw/.gitignore
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  iou-zcrx
>  ncdevmem
> +tls_hw_offload
>  toeplitz
> diff --git a/tools/testing/selftests/drivers/net/hw/Makefile b/tools/testing/selftests/drivers/net/hw/Makefile
> index 78bb0169350b..ee412ec93023 100644
> --- a/tools/testing/selftests/drivers/net/hw/Makefile
> +++ b/tools/testing/selftests/drivers/net/hw/Makefile
> @@ -45,6 +45,7 @@ TEST_PROGS = \
>  	rss_drv.py \
>  	rss_flow_label.py \
>  	rss_input_xfrm.py \
> +	tls_hw_offload.py \
>  	toeplitz.py \
>  	tso.py \
>  	userns_devmem.py \
> @@ -77,6 +78,7 @@ YNL_GEN_FILES := \
>  # end of YNL_GEN_FILES
>  TEST_GEN_FILES += $(YNL_GEN_FILES)
>  TEST_GEN_FILES += $(patsubst %.c,%.o,$(wildcard *.bpf.c))
> +TEST_GEN_FILES += tls_hw_offload

We need TEST_GEN_FILES to be formatted like TEST_PROGS
please download the selftest validation scripts from:
https://github.com/linux-netdev/nipa/tree/main/tests/patch/check_selftest
and run those

>  include ../../../lib.mk
>  
> @@ -90,6 +92,8 @@ include ../../../net/ynl.mk
>  
>  include ../../../net/bpf.mk
>  
> +$(OUTPUT)/tls_hw_offload: CFLAGS += $(KHDR_INCLUDES)

?? Should not be necessary 


> diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py

Please make sure (recent version of!) ruff and pylint --disable=R are
clean. Ruff says:

tools/testing/selftests/drivers/net/hw/tls_hw_offload.py:6: [I001] Import block is un-sorted or un-formatted

> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> @@ -0,0 +1,402 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +
> +"""Test kTLS hardware offload using a C helper binary."""
> +
> +import re
> +import shlex
> +import subprocess
> +from collections import defaultdict
> +
> +from lib.py import ksft_run, ksft_exit, ksft_pr, KsftSkipEx
> +from lib.py import ksft_ge, ksft_eq
> +from lib.py import ksft_variants, KsftNamedVariant
> +from lib.py import NetDrvEpEnv
> +from lib.py import cmd, bkg, wait_port_listen, rand_port
> +from lib.py import CmdExitFailure
> +
> +# Reading /proc/net/tls_stat is trivial locally, but on the remote it runs
> +# over ssh, where connection setup can occasionally spike past the short
> +# default cmd() timeout. Give these tiny reads plenty of headroom so a slow
> +# ssh round-trip doesn't fail an otherwise-good variant.
> +STATS_TIMEOUT_S = 30

Shouldn't be your concern. Please remove this, any workaround of this
nature belongs in remote classes (IOW if someone has a really bad SSH
they should implement their own SSH adapter)

> +# `ethtool -S` counters on the DUT NIC, from the minimum set every TLS
> +# offload driver should report (Documentation/networking/tls-offload.rst,
> +# "Statistics"); mlx5, nfp, cxgb4 and funeth use exactly these names.
> +# TlsTxDevice/TlsRxDevice in /proc/net/tls_stat only prove tls_dev_add()
> +# accepted the offload:
> +#  - *_packets increment once per packet the NIC actually encrypted or
> +#    decrypted (mlx5 counts gso_segs, not records), so they prove the HW
> +#    crypto path was exercised.
> +#  - *_ctx increment once per tls_dev_add().
> +# Missing NIC crypto counters remain optional.
> +HW_NIC_COUNTERS = {
> +    'Tx': {'crypto': 'tx_tls_encrypted_packets', 'ctx': 'tx_tls_ctx'},
> +    'Rx': {'crypto': 'rx_tls_decrypted_packets', 'ctx': 'rx_tls_ctx'},
> +}

> +def stop_helper(helper):
> +    """Reap a helper that is still running: SIGTERM, then SIGKILL.
> +
> +    cmd.process(terminate=True) sends SIGTERM and waits; if the process
> +    ignores it there is no fallback and communicate() raises again from the
> +    cleanup path, leaving the child alive. Escalate to SIGKILL instead.
> +    """
> +    try:
> +        helper.process(terminate=True, fail=False, timeout=5)
> +    except subprocess.TimeoutExpired:
> +        helper.proc.kill()
> +        helper.process(terminate=False, fail=False, timeout=5)
> +
> +
> +def kill_remote_helper(cfg, helper_cmd):
> +    """Stop this variant's remote helper and confirm that it has exited.
> +
> +    Signalling cmd.proc only reaches the local process, which for the ssh
> +    backend is the ssh client, not the helper on the peer. Losing its stdout
> +    does not stop the helper either: it ignores SIGPIPE so that a peer abort
> +    is reported as EPIPE instead of a bare signal death. Left alone it keeps
> +    driving kTLS (bumping the peer's TLS MIBs) into the next variant's
> +    measurement window, or sits in accept() for the rest of its own timeout.
> +    Match the complete command, including this variant's port, since the
> +    netns backend uses the same binary path for both endpoints and other
> +    runs. The anchors also exclude the shell executing the cleanup. Failure
> +    to confirm exit must prevent later variants from taking counter
> +    snapshots.
> +    """
> +    pattern = shlex.quote('^' + re.escape(helper_cmd) + '$')
> +    cmd(f"""
> +command -v pkill >/dev/null && command -v pgrep >/dev/null || exit 2
> +for tls_signal in TERM KILL; do
> +    pkill -"$tls_signal" -f -- {pattern}
> +    tls_status=$?
> +    [ "$tls_status" -le 1 ] || exit "$tls_status"
> +    tls_attempt=0
> +    while [ "$tls_attempt" -lt 50 ]; do
> +        pgrep -f -- {pattern} >/dev/null
> +        tls_status=$?
> +        case "$tls_status" in
> +            1) exit 0 ;;
> +            0) ;;
> +            *) exit "$tls_status" ;;
> +        esac
> +        sleep 0.1
> +        tls_attempt=$((tls_attempt + 1))
> +    done
> +done
> +echo 'TLS helper still running after SIGKILL' >&2
> +exit 1
> +""", host=cfg.remote, timeout=STATS_TIMEOUT_S)

Please delete this, you should not have to implement local workarounds.
cmd() and bkg() must be sufficient (or fixed).

Since we are running our own binary remotely we should have the binary
time out after a few (tens of) seconds, so that we don't have to worry
about leaving bunch of running processes on remote.

And then bkg() should be enough

> +def run_tls_test(cfg, cipher="128", tls_version="1.2",
> +                 buffer_size=None, random_max=None, ipver="4",
> +                 record_type=None):
> +    """Run the TLS offload test.
> +
> +    The DUT runs the TLS client and the remote runs the echo server.
> +
> +    ipver: '4' or '6' - IP version to run over. The C helper is forced to the
> +           matching family with -4/-6 and connects to the peer's v4/v6 address.
> +           Variants requesting '6' skip cleanly when the environment lacks IPv6
> +           connectivity (require_ipver()).
> +
> +    The DUT (local) is the kernel under test; the remote is just a traffic
> +    source/sink and may run any kernel without HW offload. Both sides run
> +    kTLS because TLS is pairwise, but verify_tls_counters() requires HW
> +    offload only in enabled DUT directions. The peer and the DUT's other
> +    direction may use SW kTLS.
> +    """
> +    if cfg.cleanup_failed:
> +        raise KsftSkipEx("Previous helper cleanup could not be confirmed")

Not needed, CI orchestration should be clever enough.

> +    cfg.require_ipver(ipver)
> +
> +    # Echo exercises both directions, allowing SW in a direction without
> +    # HW support.
> +    hw_directions = tuple(d for d in ('Tx', 'Rx') if d in cfg.tls_hw_directions)
> +
> +    if record_type and 'Tx' not in hw_directions:
> +        raise KsftSkipEx("Record-type regression requires DUT TLS TX offload")
> +
> +    port = rand_port()
> +    send_size = random_max or buffer_size
> +
> +    server_parts = [f"{cfg.bin_remote} server -p {port} -c {cipher}",
> +                    f"-v {tls_version}", f"-{ipver}"]
> +    if send_size:
> +        server_parts.append(f"-b {send_size}")
> +    if record_type:
> +        server_parts.append(f"-t {record_type}")
> +    server_cmd = " ".join(server_parts)
> +
> +    client_parts = [f"{cfg.bin_local} client -s {cfg.remote_addr_v[ipver]}",
> +                    f"-p {port} -c {cipher} -v {tls_version} -{ipver}"]
> +    if random_max:
> +        client_parts.append(f"-r {random_max}")
> +    elif buffer_size:
> +        client_parts.append(f"-b {buffer_size}")
> +    if record_type:
> +        client_parts.append(f"-t {record_type}")
> +    client_cmd = " ".join(client_parts)
> +
> +    stats_before_local = read_tls_stats()
> +    stats_before_remote = read_tls_stats(host=cfg.remote)
> +    nic_before = read_nic_stats(cfg)
> +
> +    # Both helpers run with their stdout captured in a pipe that is only
> +    # drained once they exit, so the helper keeps its per-connection output
> +    # small (see the note on verbose in tls_hw_offload.c); do not pass -V.
> +    #
> +    # On the failure path make sure nothing outlives the variant: a leaked
> +    # helper keeps bumping the per-netns TLS counters (TlsDecryptError, ...)
> +    # and would corrupt the before/after measurement
> +    # window of a later variant. The local client is a direct child; the
> +    # server on the peer needs kill_remote_helper().
> +    server = None
> +    client = None
> +    try:
> +        server = bkg(server_cmd, host=cfg.remote, exit_wait=True)
> +        with server:

with ... as server no ?

> +            wait_port_listen(port, host=cfg.remote)
> +            # Start the client in the background so we keep a handle to it.
> +            # A foreground cmd() raises TimeoutExpired from inside its
> +            # constructor if the client hangs, and since the child is not
> +            # killed on timeout it would be left running with no handle to
> +            # reap it.
> +            client = cmd(client_cmd, background=True)

again, write the helper right and trust cmd() and bkg() or explain
the real issue.

> +            try:
> +                client.process(terminate=False, fail=True, timeout=20)
> +            finally:
> +                if client.proc.poll() is None:
> +                    stop_helper(client)
> +    except BaseException:
> +        # bkg.__exit__ reaps the server with a plain 20 s communicate()
> +        # (SIGTERM first only on an exception). A server that hangs or
> +        # ignores SIGTERM makes it raise TimeoutExpired with the process
> +        # still alive; escalate to SIGKILL as for the client.
> +        cfg.cleanup_failed = True
> +        try:
> +            try:
> +                if client is not None and client.proc.poll() is None:
> +                    stop_helper(client)
> +            finally:
> +                if server is not None and server.proc.poll() is None:
> +                    stop_helper(server)
> +        finally:
> +            kill_remote_helper(cfg, server_cmd)
> +        cfg.cleanup_failed = False
> +        raise
> +
> +    cfg.wait_hw_stats_settle()
> +    stats_after_local = read_tls_stats()
> +    stats_after_remote = read_tls_stats(host=cfg.remote)
> +    nic_after = read_nic_stats(cfg)
> +
> +    verify_tls_counters(stats_before_local, stats_after_local, is_dut=True,
> +                        hw_directions=hw_directions)
> +    check_hw_crypto(cfg, nic_before, nic_after, hw_directions)
> +    verify_tls_counters(stats_before_remote, stats_after_remote, is_dut=False)
> +
> +
> +# Drivers whose tls_dev_add() accepts only AES-GCM-128: nfp
> +# (nfp_net_cipher_supported()), cxgb4 (chcr_ktls), funeth.
> +GCM128_ONLY_DRIVERS = {"nfp", "nfp_netvf", "cxgb4", "funeth"}
> +
> +
> +# The cipher/version matrix runs over IPv4; the socket setup is the only
> +# IP-version-specific code path, so a single representative variant over
> +# IPv6 is enough to cover it (it skips cleanly without v6 connectivity).
> +# The suites below likewise stay on IPv4 to bound runtime.
> +@ksft_variants([
> +    KsftNamedVariant("tls12_aes128", "128", "1.2", "4"),
> +    KsftNamedVariant("tls12_aes256", "256", "1.2", "4"),
> +    KsftNamedVariant("tls12_aes128_ip6", "128", "1.2", "6"),
> +])
> +def test_tls_offload(cfg, cipher, tls_version, ipver):
> +    """Cipher/version matrix over the HW offload data path."""
> +    # The tls-hw-{tx,rx}-offload feature bits do not advertise cipher
> +    # support, and there is no uAPI to query it. Skip AES-GCM-256 on drivers
> +    # whose tls_dev_add() accepts only AES-GCM-128; keep the HW assertions
> +    # for every other driver/cipher pair.
> +    if tls_version == "1.2" and cipher == "256":
> +        info = cmd(f"ethtool -i {cfg.ifname}", fail=False).stdout
> +        for line in info.splitlines():
> +            name, _, value = line.partition(':')
> +            driver = value.strip()
> +            if name.strip() == 'driver' and driver in GCM128_ONLY_DRIVERS:
> +                raise KsftSkipEx(f"{driver} TLS offload supports only AES-GCM-128")

No need, just let them fail. There are automated systems which check
if failures are regressions or not. We only care about regressions
and crashes in HW tests. No device supports all features and cleanly
skipping for all conditions is a fool's errand.

> +    run_tls_test(cfg, cipher=cipher, tls_version=tls_version, ipver=ipver)
> +
> +
> +@ksft_variants([
> +    KsftNamedVariant("small_buf", 512),
> +    KsftNamedVariant("large_buf", 2097152),
> +    KsftNamedVariant("random_buf", None, 8192),
> +])
> +def test_tls_offload_sizes(cfg, buffer_size=None, random_max=None):
> +    """Echo-mode TLS 1.2 across a range of buffer sizes."""
> +    run_tls_test(cfg, cipher="128", tls_version="1.2",
> +                 buffer_size=buffer_size, random_max=random_max)
> +
> +
> +@ksft_variants([
> +    KsftNamedVariant("handshake", 22),
> +    KsftNamedVariant("alert", 21),
> +])
> +def test_tls_offload_record_type(cfg, record_type):
> +    """RX setup must preserve the HW TX hook which flushes an open record."""
> +    run_tls_test(cfg, record_type=record_type)
> +
> +
> +def main() -> None:
> +    """Set up the DUT/peer environment and run the offload test suites."""
> +    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
> +        cfg.bin_local = cfg.test_dir / "tls_hw_offload"
> +        if not cfg.bin_local.exists():
> +            raise KsftSkipEx(f"tls_hw_offload binary not found at {cfg.bin_local}")

Raising ksft* exceptions outside ksft_run is pointless,
you can just drop this check, if someone didn't build the tests
they will quickly realize that from the litany of ENOENTs..

> +        cfg.bin_remote = cfg.remote.deploy(cfg.bin_local)
> +        check_tls_support(cfg)

Again, this has to be in every test case, not outside ksft_run()
(you can stash the result of the check on cfg/env)

> +        cfg.cleanup_failed = False
> +
> +        ksft_run([test_tls_offload, test_tls_offload_sizes,
> +                  test_tls_offload_record_type], args=(cfg, ))
> +    ksft_exit()
> +
> +
> +if __name__ == "__main__":
> +    main()

