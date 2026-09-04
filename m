Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E8C533590;
	Fri,  4 Sep 2026 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560743; cv=none; b=KrJ4sx7YpOnqFRiwoYFLk0mdAO4MRB1JDhVf53fZsyGw7nV9cq5Xi9FdFKNFV3+Vmn2jxsHzgjtryVSEFJk0M29ZunrBhERHagW79Ucf+T8HBRtoyFuD6vbU/1AW5VH9uM1Oon5UjNDw2PWXkaOOLjBlaZph0lP5p/uXU5UKPNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560743; c=relaxed/simple;
	bh=EBcF3TiOg0WEPl4LjWHMVEni9IEe/s6n8IQy68eFBws=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nGmYZzssUJOB7UZPuUmAwR4jtyB2HyT+7jgI0gJNoh/4l+dLMpmvWnVSaFu2VMsS2vFmcXvCDRDpoJ2mweWhvPym5sbS5ELJ13f0xGO16mTDlXtH6TfW+w/+a+YfjqVKFmtBJmu6dv3ZgoGzKn3bFKDO1N3L/LLrlNK95xp+IUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ng9kM22j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ng9kM22j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1241F00A3F;
	Fri,  4 Sep 2026 22:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788560739;
	bh=suPu0cdQDOTwATm9T47irhtcJrPVB2hrMYZxY2+mQ+8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ng9kM22jM37bbeaTPEjZlcsKXw++97TMsC2O2m1T5fDrXDBTjUOkGVJ/Y/WZKBBfD
	 pYPPa/Ye94dA0gDkeISdHtjMRpx86mUXIRhKy6Y2/QExxO1VY1qTTHiXAI7t+EVK+e
	 VI+If2Vnjyucye4NlzGJPu/dTNl17OwurpdAmF3BsYO/1gNjwg6jsBxy1DUUsqeSoG
	 fND5EFTFmFLLEzVsFqIUv2CQIWbOphgNNI4Xxz6h+qqyESJDGNsk3KspIbFXCRxWe2
	 Vsk0kj4cVhODJxoZanwOkLNVUSfjmwfU44WLrZE+tzuiubNq724dBssaojr0yjQwBT
	 hgZdTxi1Q4O9g==
Subject: Re: [PATCH net-next v1 2/2] selftests: netdevsim: add a kTLS device
 offload test
From: netdev-bot+sashiko@kernel.org
To: jiayuan.chen@linux.dev
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 04 Sep 2026 22:25:38 +0000
Message-ID: <178856073881.219967.7291257459649538794@kernel.org>
In-Reply-To: <20260901154914.11637-3-jiayuan.chen@linux.dev>
References: <20260901154914.11637-3-jiayuan.chen@linux.dev>
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
issue(s) to consider:

Critical: 0 · High: 0 (1) · Medium: 2 · Low: 3

- [Medium] The `run_pair nosample` run (offload features turned off) has
  no rendezvous between the two helpers: both are expected to abort…
- [Medium] The payload verification for splice fragments generates
  identical data for all fragments, which silently defeats the test's…
- [Low] tls.sh reuses the global, fixed network-namespace names
  `nssv`/`nscl` and exactly the same random netdevsim device-ID ranges…
- [Low] Two assertions inspect only one of the two ports/namespaces even
  though their messages imply both: (a) the `tls-hw-tx-offload`/`tls-hw-…
- [Low] The "per-port debugfs tls file exists" assertion is dead code: a
  few lines earlier the script already does `if [ !

Pre-existing issues:
- [High] The new test is the first in-tree user of setsockopt(SOL_TLS,
  TLS_TX_MAX_PAYLOAD_LEN) on a device-offloaded (TLS_HW) socket, and it…

--

selftests: netdevsim: add a kTLS device offload test

Adds tls.sh plus the tls_offload helper under
tools/testing/selftests/drivers/net/netdevsim/, running kTLS over a linked
netdevsim pair with one port per netns.  The helper asserts via
/proc/net/tls_stat that both directions landed on the device path, then
exercises bulk transfers, MSG_MORE writes, splice() with TLS_TX_ZEROCOPY_RO
and a minimal record limit, plus the ethtool off/on path.

A few questions about the new test below.

> diff --git a/tools/testing/selftests/drivers/net/netdevsim/tls.sh b/tools/testing/selftests/drivers/net/netdevsim/tls.sh
> new file mode 100755
> index 0000000000000..59b7d1c0e5148
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/netdevsim/tls.sh
> @@ -0,0 +1,334 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Exercise netdevsim's emulated kTLS device offload over a linked
> +# netdevsim pair, one port per network namespace.
> +#
> +# shellcheck disable=SC2154 # ksft_skip comes from lib.sh
> +
> +lib_dir=$(dirname "$0")
> +# shellcheck source=./../../../net/lib.sh
> +# shellcheck disable=SC1091
> +source "$lib_dir"/../../../net/lib.sh
> +
> +# Device IDs and the nssv/nscl namespaces are picked the same way as peer.sh.
> +NSIM_DEV_1_ID=$((256 + RANDOM % 256))
> +NSIM_DEV_1_SYS=/sys/bus/netdevsim/devices/netdevsim$NSIM_DEV_1_ID
> +NSIM_DEV_2_ID=$((512 + RANDOM % 256))
> +NSIM_DEV_2_SYS=/sys/bus/netdevsim/devices/netdevsim$NSIM_DEV_2_ID

[ ... ]

> +# Each resource is handed to defer only once it exists, so a run that loses a
> +# race for one of the global names does not tear down the winner's.
> +setup()
> +{
> +	set -e
> +
> +	echo "$NSIM_DEV_1_ID" > "$NSIM_DEV_SYS_NEW"
> +	defer nsim_dev_del "$NSIM_DEV_1_ID"
> +	echo "$NSIM_DEV_2_ID" > "$NSIM_DEV_SYS_NEW"
> +	defer nsim_dev_del "$NSIM_DEV_2_ID"

[ ... ]

> +	ip netns add nssv
> +	defer ip netns del nssv
> +	ip netns add nscl
> +	defer ip netns del nscl

[Severity: Low]
The fixed names nssv and nscl, and the device ID ranges $((256 + RANDOM %
256)) / $((512 + RANDOM % 256)), are exactly the ones peer.sh in the same
directory already uses.

What happens when a stale nssv or nscl namespace is left behind by an
aborted peer.sh or tls.sh run, or when peer.sh runs concurrently?  setup()
runs under set -e, so ip netns add nssv (or the new_device write) failing
aborts the script mid-setup with a raw shell error and no PASS, FAIL or
SKIP line at all.

Would setup_ns() from the already sourced tools/testing/selftests/net/lib.sh
be preferable here, since it generates per-run unique namespace names?

[ ... ]

> +run_pair()
> +{
> +	local sample="${1:-sample}"
> +	local srv_rc cli_rc ready=1

[ ... ]

> +	if [ "$sample" = "sample" ]; then
> +		# Comfortably longer than the helpers take to get to the
> +		# barrier.  Timing out here means a sample would be stale, so
> +		# fail the run rather than assert on it.
> +		slowwait "$READY_TIMEOUT_SEC" both_ready >/dev/null || ready=0
> +		if [ "$ready" -eq 1 ]; then
> +			CONNS_1=$(dbg_field "$NSIM_DEV_1_TLS" count)
> +			CONNS_2=$(dbg_field "$NSIM_DEV_2_TLS" count)
> +			: "${CONNS_1:=0}"
> +			: "${CONNS_2:=0}"
> +		fi
> +	fi
> +	touch "$SYNCDIR/go"

[ ... ]

> +# The offload has to be advertised, and on by default like the other
> +# netdevsim crypto offloads.
> +for f in tls-hw-tx-offload tls-hw-rx-offload; do
> +	[ "$(feature nssv "$NSIM_DEV_1_NAME" "$f")" = "on" ]
> +	check "$f advertised and on by default" $?
> +done

[Severity: Low]
This loop only queries feature nssv "$NSIM_DEV_1_NAME", but the message says
the feature is advertised and on by default without qualifying which port.
Should the client port in nscl be checked too, the way set_features() does?

The same one-sided pattern shows up later for the current-context counters:

	[ "$(tls_stat nssv TlsCurrTxDevice)" -eq 0 ] && \
		[ "$(tls_stat nssv TlsCurrRxDevice)" -eq 0 ]
	check "no device contexts left behind" $?

/proc/net/tls_stat is per netns, and enable_ktls() installs TX and RX
contexts on both ends, so would a context left behind on the client port in
nscl pass unnoticed here?

> +
> +[ -e "$NSIM_DEV_1_TLS" ]
> +check "per-port debugfs tls file exists" $?

[Severity: Low]
Is this assertion reachable in the failing state?  A few lines earlier the
script already does:

	if [ ! -e "$NSIM_DEV_1_TLS" ]; then
		echo "SKIP: netdevsim built without TLS device offload (CONFIG_TLS_DEVICE=n)"
		exit "$ksft_skip"
	fi

so by the time [ -e "$NSIM_DEV_1_TLS" ] runs it is always true, and the
check only adds to num_pass.

Meanwhile $NSIM_DEV_2_TLS is never checked for existence, although
all_ctx_released() and the tx_packets/rx_packets assertions parse it.  If
that file is missing or a field name changes, dbg_field() returns an empty
string and [ "" -eq 0 ] / [ "" -ge 1 ] emit "integer expression expected"
rather than a clean FAIL.  Should the existence check cover port 2 instead?

[ ... ]

> +[ "$(tls_stat nssv TlsCurrTxDevice)" -eq 0 ] && \
> +	[ "$(tls_stat nssv TlsCurrRxDevice)" -eq 0 ]
> +check "no device contexts left behind" $?

[ ... ]

> +# Turning the features off has to make the offload refuse the connection;
> +# the test binary insists on the device path, so it must now fail.
> +set_features off
> +check "both offload features turned off on both ports" $?
> +
> +run_pair nosample
> +rc=$?
> +[ "$rc" -ne 0 ]
> +check "offload declined once the feature is off" $?
> +
> +# Both directions on both ends have to have landed on the software path.
> +[ "$(tls_stat nssv TlsTxSw)" -ge 1 ] && [ "$(tls_stat nssv TlsRxSw)" -ge 1 ] && \
> +	[ "$(tls_stat nscl TlsTxSw)" -ge 1 ] && \
> +	[ "$(tls_stat nscl TlsRxSw)" -ge 1 ]
> +check "software path used when offload is off" $?

[Severity: Medium]
Can this assertion fail intermittently?  In nosample mode run_pair() skips
the slowwait/both_ready barrier entirely, and neither helper reaches
rendezvous() because enable_ktls() exits first:

tools/testing/selftests/drivers/net/netdevsim/tls_offload.c:enable_ktls() {
	if (read_tls_stat("TlsTxDevice") != tx_before + 1)
		fail("TX did not land on the device path (TlsTxDevice %lu -> %lu)",
	...
}

So whichever end aborts first closes its socket and sends a FIN.  If the
peer processes that FIN before it gets to setsockopt(TCP_ULP, "tls"):

net/tls/tls_main.c:tls_init() {
	...
	if (sk->sk_state != TCP_ESTABLISHED)
		return -ENOTCONN;
	...
}

the peer dies in die("setsockopt(TCP_ULP, tls)") and never installs software
kTLS, so TlsTxSw/TlsRxSw in that namespace stay at 0 and this check fails.
Note the first run already asserted TlsTxSw == 0 in both namespaces, so
earlier traffic cannot cover for it.

"offload declined once the feature is off" still passes in that case since
it only requires a non-zero exit status, so the failure reason is hidden.
Would a rendezvous (or a retry) before the helpers give up make this run
deterministic?

> diff --git a/tools/testing/selftests/drivers/net/netdevsim/tls_offload.c b/tools/testing/selftests/drivers/net/netdevsim/tls_offload.c
> new file mode 100644
> index 0000000000000..0d7c8950ca6ce
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/netdevsim/tls_offload.c
> @@ -0,0 +1,505 @@

[ ... ]

> +/* A record can be up to 16K, so normally one segment carries a piece of a
> + * single record.  Shrinking the limit puts a dozen or so whole records in
> + * every segment instead, which is the multi-record path through the driver.
> + */
> +static void send_small_records(int fd, unsigned int seed)
> +{
> +	char buf[SMALL_LEN];
> +	uint16_t limit;
> +
> +	limit = REC_LIM_MIN;
> +	if (setsockopt(fd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &limit,
> +		       sizeof(limit)))
> +		die("setsockopt(TLS_TX_MAX_PAYLOAD_LEN)");

[Severity: High]
This isn't a bug introduced by this patch, but it looks like the first
in-tree caller of TLS_TX_MAX_PAYLOAD_LEN on a socket that the test has just
asserted is device offloaded (tx_conf == TLS_HW), and the kernel handler
looks type confused:

net/tls/tls_main.c:do_tls_setsockopt_tx_payload_len() {
	struct tls_sw_context_tx *sw_ctx = tls_sw_ctx_tx(ctx);
	...
	if (sw_ctx && sw_ctx->open_rec)
		return -EBUSY;
	...
}

include/net/tls.h:tls_sw_ctx_tx() is an unchecked cast:

	return (struct tls_sw_context_tx *)tls_ctx->priv_ctx_tx;

and for an offloaded socket net/tls/tls_device.c:tls_set_device_offload()
stores a struct tls_offload_context_tx there:

	ctx->priv_ctx_tx = offload_ctx;

There is no tx_conf == TLS_SW test, so the ->open_rec read lands inside the
offload context's sg_tx_data[MAX_SKB_FRAGS], which tls_push_record() fills
for every offloaded record:

net/tls/tls_device.c:tls_push_record() {
	sg_unmark_end(&offload_ctx->sg_tx_data[i]);
	sg_set_page(&offload_ctx->sg_tx_data[i], skb_frag_page(frag),
		    skb_frag_size(frag), skb_frag_off(frag));
	...
}

Two things follow, and which one happens depends on the struct layout:

If the aliased bytes are non-zero (page_link/offset/length, e.g. once the
offsets shift with CONFIG_DEBUG_SPINLOCK or LOCKDEP changing the
scatterlist stride), setsockopt returns a spurious -EBUSY.  That is fatal
for this helper, since the call above goes straight to
die("setsockopt(TLS_TX_MAX_PAYLOAD_LEN)") after the bulk, MSG_MORE and
splice traffic has already populated sg_tx_data.

If they are zero (default x86_64 layout, where the read lands on
sg_tx_data[n].dma_address, which tls_device.c never writes), the intended
guard never fires, because tls_offload_context_tx->open_record is never
consulted.  The limit can then be shrunk while an offloaded record is open,
and the next send hits:

net/tls/tls_device.c:tls_push_data() {
	...
	copy = min_t(size_t, size, max_open_record_len - record->len);
	...
}

with max_open_record_len < record->len, i.e. a u32 underflow that makes copy
== size and lets the record grow past the requested limit and past the 2^14
payload ceiling.

Should the guard check ctx->tx_conf == TLS_SW (and consult
tls_offload_ctx_tx(ctx)->open_record for the TLS_HW case) before the test
starts relying on this option on offloaded sockets?

> +
> +	fill_pattern(buf, sizeof(buf), seed);
> +	write_all(fd, buf, sizeof(buf));

[ ... ]

> @@ -0,0 +1,505 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * kTLS device offload data path exercise, driven by tls.sh.
> + *
> + * One instance runs as the server and one as the client, each in its own
> + * network namespace, connected back to back by a linked netdevsim pair.
> + * Both ends enable kTLS and rely on netdevsim's emulated TLS offload, so
> + * every record travels through net/tls/tls_device.c rather than the
> + * software path.
> + *
> + * The two processes rendezvous through a shared directory so that neither
> + * side sends before the other has installed its RX offload.
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include <arpa/inet.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <netinet/in.h>
> +#include <netinet/tcp.h>
> +#include <stdarg.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/socket.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <time.h>
> +#include <unistd.h>
> +
> +#include <linux/tls.h>
> +
> +#ifndef SOL_TLS
> +#define SOL_TLS			282
> +#endif
> +
> +#ifndef TCP_ULP
> +#define TCP_ULP			31
> +#endif
> +
> +#define BULK_LEN		(200 * 1024)
> +#define MORE_FRAGS		64
> +#define SPLICE_FRAG_LEN		4096
> +#define SPLICE_FRAGS		8
> +
> +/* TLS_MIN_RECORD_SIZE_LIM and TLS_MAX_PAYLOAD_SIZE, which are not uapi. */
> +#define REC_LIM_MIN		64
> +#define REC_LIM_MAX		16384
> +
> +#define SMALL_RECS		100
> +#define SMALL_LEN		(REC_LIM_MIN * SMALL_RECS)
> +
> +#define SYNC_TIMEOUT_MS		20000
> +#define CONNECT_TIMEOUT_MS	20000
> +
> +/* accept() and the transfers have no timeout of their own, and tls.sh waits
> + * on both helpers.  Bound the whole run so a stuck peer cannot hang the test.
> + */
> +#define RUN_TIMEOUT_SEC		120
> +
> +static const char *role;
> +
> +static void die(const char *what)
> +{
> +	fprintf(stderr, "%s: %s: %s\n", role, what, strerror(errno));
> +	exit(1);
> +}
> +
> +static void fail(const char *fmt, ...)
> +{
> +	va_list ap;
> +
> +	fprintf(stderr, "%s: ", role);
> +	va_start(ap, fmt);
> +	vfprintf(stderr, fmt, ap);
> +	va_end(ap);
> +	fprintf(stderr, "\n");
> +	exit(1);
> +}
> +
> +static void msleep(unsigned int ms)
> +{
> +	struct timespec ts = {
> +		.tv_sec = ms / 1000,
> +		.tv_nsec = (ms % 1000) * 1000000L,
> +	};
> +
> +	nanosleep(&ts, NULL);
> +}
> +
> +/* /proc/net/tls_stat is per netns, so both ends can check that their own
> + * connection really landed on the device path.
> + */
> +static unsigned long read_tls_stat(const char *name)
> +{
> +	char line[256];
> +	unsigned long val;
> +	FILE *f;
> +
> +	f = fopen("/proc/net/tls_stat", "r");
> +	if (!f)
> +		die("open /proc/net/tls_stat");
> +
> +	while (fgets(line, sizeof(line), f)) {
> +		char key[64];
> +
> +		if (sscanf(line, "%63s %lu", key, &val) != 2)
> +			continue;
> +		if (!strcmp(key, name)) {
> +			fclose(f);
> +			return val;
> +		}
> +	}
> +
> +	fclose(f);
> +	fail("%s not found in /proc/net/tls_stat", name);
> +	return 0;
> +}
> +
> +static void fill_pattern(char *buf, size_t len, unsigned int seed)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < len; i++)
> +		buf[i] = (char)(seed + i * 31 + (i >> 8) * 7);
> +}
> +
> +static void check_pattern(const char *buf, size_t len, unsigned int seed,
> +			  const char *what)
> +{
> +	char *want = malloc(len);
> +	size_t i;
> +
> +	if (!want)
> +		die("malloc");
> +
> +	fill_pattern(want, len, seed);
> +	for (i = 0; i < len; i++) {
> +		if (buf[i] != want[i])
> +			fail("%s: payload mismatch at byte %zu: got 0x%02x want 0x%02x",
> +			     what, i, (unsigned char)buf[i],
> +			     (unsigned char)want[i]);
> +	}
> +
> +	free(want);
> +}
> +
> +static void write_all(int fd, const char *buf, size_t len)
> +{
> +	size_t done = 0;
> +
> +	while (done < len) {
> +		ssize_t n = send(fd, buf + done, len - done, 0);
> +
> +		if (n < 0) {
> +			if (errno == EINTR)
> +				continue;
> +			die("send");
> +		}
> +		done += n;
> +	}
> +}
> +
> +static void read_all(int fd, char *buf, size_t len)
> +{
> +	size_t done = 0;
> +
> +	while (done < len) {
> +		ssize_t n = recv(fd, buf + done, len - done, 0);
> +
> +		if (n < 0) {
> +			if (errno == EINTR)
> +				continue;
> +			die("recv");
> +		}
> +		if (n == 0)
> +			fail("peer closed after %zu of %zu bytes", done, len);
> +		done += n;
> +	}
> +}
> +
> +static void enable_ktls(int fd)
> +{
> +	struct tls12_crypto_info_aes_gcm_128 ci = {};
> +	unsigned long tx_before, rx_before;
> +
> +	tx_before = read_tls_stat("TlsTxDevice");
> +	rx_before = read_tls_stat("TlsRxDevice");
> +
> +	if (setsockopt(fd, IPPROTO_TCP, TCP_ULP, "tls", sizeof("tls")))
> +		die("setsockopt(TCP_ULP, tls)");
> +
> +	ci.info.version = TLS_1_2_VERSION;
> +	ci.info.cipher_type = TLS_CIPHER_AES_GCM_128;
> +	memset(ci.iv, 'i', sizeof(ci.iv));
> +	memset(ci.key, 'k', sizeof(ci.key));
> +	memset(ci.salt, 's', sizeof(ci.salt));
> +	memset(ci.rec_seq, 0, sizeof(ci.rec_seq));
> +
> +	if (setsockopt(fd, SOL_TLS, TLS_TX, &ci, sizeof(ci)))
> +		die("setsockopt(TLS_TX)");
> +	if (setsockopt(fd, SOL_TLS, TLS_RX, &ci, sizeof(ci)))
> +		die("setsockopt(TLS_RX)");
> +
> +	/* The whole point of the exercise: refuse to silently fall back to
> +	 * the software path, otherwise the test would pass without ever
> +	 * touching tls_device.c.
> +	 */
> +	if (read_tls_stat("TlsTxDevice") != tx_before + 1)
> +		fail("TX did not land on the device path (TlsTxDevice %lu -> %lu)",
> +		     tx_before, read_tls_stat("TlsTxDevice"));
> +	if (read_tls_stat("TlsRxDevice") != rx_before + 1)
> +		fail("RX did not land on the device path (TlsRxDevice %lu -> %lu)",
> +		     rx_before, read_tls_stat("TlsRxDevice"));
> +}
> +
> +static void sync_path(char *out, size_t len, const char *dir, const char *who)
> +{
> +	if ((size_t)snprintf(out, len, "%s/%s.ready", dir, who) >= len)
> +		fail("sync dir path too long");
> +}
> +
> +static void rendezvous(const char *dir, const char *me, const char *peer)
> +{
> +	char mine[PATH_MAX], theirs[PATH_MAX];
> +	unsigned int waited = 0;
> +	int fd;
> +
> +	sync_path(mine, sizeof(mine), dir, me);
> +	sync_path(theirs, sizeof(theirs), dir, peer);
> +
> +	fd = open(mine, O_CREAT | O_WRONLY, 0600);
> +	if (fd < 0)
> +		die("create sync file");
> +	close(fd);
> +
> +	while (access(theirs, F_OK)) {
> +		if (waited >= SYNC_TIMEOUT_MS)
> +			fail("timed out waiting for %s", peer);
> +		msleep(20);
> +		waited += 20;
> +	}
> +}
> +
> +/* Both ends stop here with their offload installed and no data sent yet,
> + * so that the driver state can be inspected from the outside.
> + */
> +static void wait_for_go(const char *dir)
> +{
> +	unsigned int waited = 0;
> +	char go[PATH_MAX];
> +
> +	if ((size_t)snprintf(go, sizeof(go), "%s/go", dir) >= sizeof(go))
> +		fail("sync dir path too long");
> +
> +	while (access(go, F_OK)) {
> +		if (waited >= SYNC_TIMEOUT_MS)
> +			fail("timed out waiting for go");
> +		msleep(20);
> +		waited += 20;
> +	}
> +}
> +
> +/* Small writes with MSG_MORE accumulate into one open record before it is
> + * pushed, which is the interesting part of tls_push_data().
> + */
> +static void send_msg_more(int fd, unsigned int seed)
> +{
> +	char buf[MORE_FRAGS + 1];
> +	int i;
> +
> +	fill_pattern(buf, sizeof(buf), seed);
> +
> +	for (i = 0; i < MORE_FRAGS; i++) {
> +		if (send(fd, buf + i, 1, MSG_MORE) != 1)
> +			die("send(MSG_MORE)");
> +	}
> +	if (send(fd, buf + MORE_FRAGS, 1, 0) != 1)
> +		die("send(last)");
> +}
> +
> +/* splice() reaches tls_push_data() with MSG_SPLICE_PAGES once
> + * TLS_TX_ZEROCOPY_RO is enabled, which is a distinct fragment path.
> + */
> +static void send_splice(int fd, unsigned int seed)
> +{
> +	char buf[SPLICE_FRAG_LEN];
> +	int val = 1;
> +	int i;
> +
> +	if (setsockopt(fd, SOL_TLS, TLS_TX_ZEROCOPY_RO, &val, sizeof(val)))
> +		die("setsockopt(TLS_TX_ZEROCOPY_RO)");
> +
> +	for (i = 0; i < SPLICE_FRAGS; i++) {
> +		int p[2];
> +
> +		fill_pattern(buf, sizeof(buf), seed + i * SPLICE_FRAG_LEN);
> +
> +		if (pipe(p))
> +			die("pipe");
> +		if (write(p[1], buf, sizeof(buf)) != sizeof(buf))
> +			die("write to pipe");
> +		if (splice(p[0], NULL, fd, NULL, sizeof(buf),
> +			   i == SPLICE_FRAGS - 1 ? 0 : SPLICE_F_MORE) !=
> +		    sizeof(buf))
> +			die("splice");
> +		close(p[0]);
> +		close(p[1]);
> +	}
> +
> +	val = 0;
> +	if (setsockopt(fd, SOL_TLS, TLS_TX_ZEROCOPY_RO, &val, sizeof(val)))
> +		die("setsockopt(TLS_TX_ZEROCOPY_RO off)");
> +}
> +
> +/* A record can be up to 16K, so normally one segment carries a piece of a
> + * single record.  Shrinking the limit puts a dozen or so whole records in
> + * every segment instead, which is the multi-record path through the driver.
> + */
> +static void send_small_records(int fd, unsigned int seed)
> +{
> +	char buf[SMALL_LEN];
> +	uint16_t limit;
> +
> +	limit = REC_LIM_MIN;
> +	if (setsockopt(fd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &limit,
> +		       sizeof(limit)))
> +		die("setsockopt(TLS_TX_MAX_PAYLOAD_LEN)");
> +
> +	fill_pattern(buf, sizeof(buf), seed);
> +	write_all(fd, buf, sizeof(buf));
> +
> +	limit = REC_LIM_MAX;
> +	if (setsockopt(fd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &limit,
> +		       sizeof(limit)))
> +		die("setsockopt(TLS_TX_MAX_PAYLOAD_LEN restore)");
> +}
> +
> +#define SEED_C2S_BULK	0x11
> +#define SEED_S2C_BULK	0x22
> +#define SEED_C2S_MORE	0x33
> +#define SEED_C2S_SPLICE	0x44
> +#define SEED_C2S_SMALL	0x55
> +
> +static void run_client(int fd)
> +{
> +	char *buf = malloc(BULK_LEN);
> +
> +	if (!buf)
> +		die("malloc");
> +
> +	fill_pattern(buf, BULK_LEN, SEED_C2S_BULK);
> +	write_all(fd, buf, BULK_LEN);
> +
> +	read_all(fd, buf, BULK_LEN);
> +	check_pattern(buf, BULK_LEN, SEED_S2C_BULK, "server -> client bulk");
> +
> +	send_msg_more(fd, SEED_C2S_MORE);
> +	send_splice(fd, SEED_C2S_SPLICE);
> +	send_small_records(fd, SEED_C2S_SMALL);
> +
> +	/* Wait for the server's verdict before tearing anything down. */
> +	read_all(fd, buf, 1);
> +	if (buf[0] != 'k')
> +		fail("server reported a failure");
> +
> +	free(buf);
> +}
> +
> +static void run_server(int fd)
> +{
> +	size_t splice_len = (size_t)SPLICE_FRAG_LEN * SPLICE_FRAGS;
> +	char *buf = malloc(BULK_LEN);
> +	char more[MORE_FRAGS + 1];
> +	char *sbuf;
> +	char ok = 'k';
> +	int i;
> +
> +	sbuf = malloc(splice_len);
> +	if (!buf || !sbuf)
> +		die("malloc");
> +
> +	read_all(fd, buf, BULK_LEN);
> +	check_pattern(buf, BULK_LEN, SEED_C2S_BULK, "client -> server bulk");
> +
> +	fill_pattern(buf, BULK_LEN, SEED_S2C_BULK);
> +	write_all(fd, buf, BULK_LEN);
> +
> +	read_all(fd, more, sizeof(more));
> +	check_pattern(more, sizeof(more), SEED_C2S_MORE, "client -> server MSG_MORE");
> +
> +	read_all(fd, sbuf, splice_len);
> +	for (i = 0; i < SPLICE_FRAGS; i++)
> +		check_pattern(sbuf + (size_t)i * SPLICE_FRAG_LEN,
> +			      SPLICE_FRAG_LEN, SEED_C2S_SPLICE +
> +			      i * SPLICE_FRAG_LEN, "client -> server splice");
> +
> +	read_all(fd, buf, SMALL_LEN);
> +	check_pattern(buf, SMALL_LEN, SEED_C2S_SMALL,
> +		      "client -> server small records");
> +
> +	write_all(fd, &ok, 1);
> +
> +	free(sbuf);
> +	free(buf);
> +}
> +
> +static int do_server(const char *ip, int port, const char *syncdir)
> +{
> +	struct sockaddr_in sa = {};
> +	int lfd, fd, one = 1;
> +
> +	lfd = socket(AF_INET, SOCK_STREAM, 0);
> +	if (lfd < 0)
> +		die("socket");
> +	if (setsockopt(lfd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)))
> +		die("SO_REUSEADDR");
> +
> +	sa.sin_family = AF_INET;
> +	sa.sin_port = htons(port);
> +	if (inet_pton(AF_INET, ip, &sa.sin_addr) != 1)
> +		fail("bad bind address %s", ip);
> +
> +	if (bind(lfd, (struct sockaddr *)&sa, sizeof(sa)))
> +		die("bind");
> +	if (listen(lfd, 1))
> +		die("listen");
> +
> +	fd = accept(lfd, NULL, NULL);
> +	if (fd < 0)
> +		die("accept");
> +	close(lfd);
> +
> +	enable_ktls(fd);
> +	rendezvous(syncdir, "server", "client");
> +	wait_for_go(syncdir);
> +
> +	run_server(fd);
> +
> +	close(fd);
> +	return 0;
> +}
> +
> +static int do_client(const char *ip, int port, const char *syncdir)
> +{
> +	struct sockaddr_in sa = {};
> +	unsigned int waited = 0;
> +	int fd;
> +
> +	sa.sin_family = AF_INET;
> +	sa.sin_port = htons(port);
> +	if (inet_pton(AF_INET, ip, &sa.sin_addr) != 1)
> +		fail("bad server address %s", ip);
> +
> +	for (;;) {
> +		fd = socket(AF_INET, SOCK_STREAM, 0);
> +		if (fd < 0)
> +			die("socket");
> +		if (!connect(fd, (struct sockaddr *)&sa, sizeof(sa)))
> +			break;
> +		close(fd);
> +		if (waited >= CONNECT_TIMEOUT_MS)
> +			die("connect");
> +		msleep(20);
> +		waited += 20;
> +	}
> +
> +	enable_ktls(fd);
> +	rendezvous(syncdir, "client", "server");
> +	wait_for_go(syncdir);
> +
> +	run_client(fd);
> +
> +	close(fd);
> +	return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int port;
> +
> +	if (argc != 5) {
> +		fprintf(stderr,
> +			"usage: %s server|client <ip> <port> <syncdir>\n",
> +			argv[0]);
> +		return 2;
> +	}
> +
> +	role = argv[1];
> +	port = atoi(argv[3]);
> +
> +	alarm(RUN_TIMEOUT_SEC);
> +
> +	if (!strcmp(role, "server"))
> +		return do_server(argv[2], port, argv[4]);
> +	if (!strcmp(role, "client"))
> +		return do_client(argv[2], port, argv[4]);
> +
> +	fprintf(stderr, "unknown role %s\n", role);
> +	return 2;
> +}

[Severity: Medium]
Does the per-fragment seed here actually produce distinct payloads?
fill_pattern() truncates every byte to 8 bits:

	buf[i] = (char)(seed + i * 31 + (i >> 8) * 7);

and SPLICE_FRAG_LEN is 4096, a multiple of 256, so seed + i *
SPLICE_FRAG_LEN only ever differs from seed in bits 8 and above.  All
SPLICE_FRAGS fragments therefore get byte-for-byte identical contents,
and the matching loop in run_server()

	check_pattern(sbuf + (size_t)i * SPLICE_FRAG_LEN,
		      SPLICE_FRAG_LEN, SEED_C2S_SPLICE +
		      i * SPLICE_FRAG_LEN, "client -> server splice");

collapses to the same expected buffer for each i.

That is not a correctness problem for the transfer itself, but it does
remove most of what the splice case is supposed to prove: with every
fragment identical, reordering, duplication or dropping-and-refilling a
fragment inside the TLS_TX_ZEROCOPY_RO / MSG_SPLICE_PAGES path still
compares equal and the test passes.  Given that the whole point of this
hunk is to exercise a distinct fragment path in tls_push_data(), it
seems worth having the payload distinguish the fragments.

Would a seed step that survives the truncation be preferable here, e.g.
seed + i rather than seed + i * SPLICE_FRAG_LEN (with the same change on
the server side), or should fill_pattern() fold the seed's high bits into
the byte value so that any seed spacing works?  Note the other cases are
unaffected, since SEED_C2S_BULK/SEED_S2C_BULK/SEED_C2S_MORE/SEED_C2S_SMALL
all differ in the low 8 bits.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260901154914.11637-1-jiayuan.chen%40linux.dev
