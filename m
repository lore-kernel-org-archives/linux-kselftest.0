Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772891;
	b=3Nb/se1yYk0b+BXSorbYJ13ZIIQt85ttjj9efHgccKeshHoCL129E0onH2q3R/DB3Clr
	 FRi1rjNwXJNidZCtZkoU7Ajv/AQMMUHZpj9s3GjBJWUD9MzARYgor+xSY4JZSffIR0A4p
	 zkKqKpRoWdLMN32BG+YazfQ5z9Wog/zrC5Qy1joLY2jDkIfZOYp3MuRamWvzYANj9wem9
	 AwfEHLmXuslvKQcZdh6qBYxwrzcjjm5t1VugrfhhuffjhMwYCbqldwiTSA9Y5MQwArgG/
	 rUdVLmm7rpjVljeJnkt/m89zPiek2leXcnTnbp3xwL3FsWj8iEFPFaQC0RnVXpVNNLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772891;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0g7WYB6uoahgDBa/G7HAgtzGq2iMqoL02xTsrofOnbE=;
	b=EyZu/IV/bq5+jcPEhzC0lgQMcllw3FZLQ1niTrvZv5C1kKd3NfYijM7fr3y3p9FIOCXs
	 UONwW8+pXY+KTIq2P85ANM5ARb0soJ0rjbcS1JHA8EIJWfAym8wzYEo6ZtmCHrWnWn1M4
	 Oz2UPaw0Ig5WvC25S6YLiD0GTyJptombdBj+m+dZ0JKZNlSNUIQ/x1Mmpz79PmdoQ2KYp
	 UUVM/DzTOP5Jkp+NTNwV2BTEwaItS4Lg72CtP/Jw46sFt7ZJhnMN7ssMvhOJX4HbjkDIp
	 WihsjBOsYrIkPbYH5MgCnucqFZitEUMbU4NYtGUtwd3H5nsmqy14GzsECjzDbY95kgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2ST3CQa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EB1606A336;
	Fri, 27 Nov 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2ST3CQa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296401F00898;
	Fri, 27 Nov 2026 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772890;
	bh=0g7WYB6uoahgDBa/G7HAgtzGq2iMqoL02xTsrofOnbE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K2ST3CQax1RGy7nJk8oNQk+zQ/mAb4WUwQlvbave292QHfi4nG0yFLFw2Lv00jzbM
	 xMoKqRpkmYh63bMHdfV+DgiRPTc4TX9rkdrXwpDrw7OqSFJcUeAmL+OneNFwfM8kVe
	 Sh8QBNdULnf4dp1mmdCrsOFx00sZfFskDO6a7piRVuYXBc3kcKqaUksB9q9fTgoZyB
	 5B3/yeN1gU1r1iLGOpicK4Mv1hkwvfwOmdJQ9BGCHU9XQwHS/0MdToPSLyQM7t9pY6
	 aXG7H5tTp5Lb6YKwSwcHsQftKP70kNY9CCzMpZF3rfeVs0aRCVenuRTgwfeYfn8ial
	 XLmOleYyz++Ew==
Subject: Re: [PATCH net v2 2/2] wireguard: selftests: remove a peer under load
From: netdev-bot+sashiko@kernel.org
To: apasichnik9@gmail.com
Cc: Jason@zx2c4.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 09:48:09 +0000
Message-ID: <179577288974.3135.10854019193613008297@kernel.org>
In-Reply-To: <20261126094722.73025-3-apasichnik9@gmail.com>
References: <20261126094722.73025-3-apasichnik9@gmail.com>
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

- [Medium] Raising CONFIG_LOG_BUF_SHIFT from 18 to 20 leaves almost no
  headroom for the log volume the new loop in…
- [Low] The commit message gives the test's ability to detect the
  regression only for 1 vCPU ('Without the previous patch it fails in…
- [Low] The new loop in netns.sh (lines 213-222) relies on fixed waits at
  two points and checks neither result.

--

wireguard: selftests: remove a peer under load

This adds a loop to netns.sh that removes and re-adds a peer ten times
while a UDP iperf3 flood keeps its receive queue busy. The final
created/destroyed object check should then catch peers or keypairs that
queued packets keep alive. It also raises CONFIG_LOG_BUF_SHIFT from 18 to
20 in the qemu kernel.config so the log can hold the extra output.

> The loop adds about 13 seconds to a run. Without the previous patch it
> fails in every run with 1 vCPU.

[Severity: Low]
The detection rate is given only for 1 vCPU, but the qemu harness uses
4 vCPUs by default:

tools/testing/selftests/wireguard/qemu/Makefile:
NR_CPUS ?= 4
...
		-smp $(NR_CPUS) \

With 4 vCPUs, NAPI and the decrypt workers get more CPU time to drain
rx_queue before napi_disable(). The loop may therefore catch the
regression less often in a default run.

Could the commit message give the detection rate with the default
NR_CPUS? Or it could say that NR_CPUS=1 is needed to reproduce the
regression reliably.

> diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
> index a8f550aecb35d..8303802c02f27 100755
> --- a/tools/testing/selftests/wireguard/netns.sh
> +++ b/tools/testing/selftests/wireguard/netns.sh
> @@ -207,6 +207,20 @@ n0 iptables -F INPUT

[ ... ]

> +for ((i = 0; i < 10; ++i)); do
> +	n1 iperf3 -s -1 -B 192.168.241.1 &
> +	pids=( $! ); waitiperf $netns1 $!
> +	n2 iperf3 -Z -t 2 -b 0 -u -l 64 -P 4 -c 192.168.241.1 >/dev/null 2>&1 &
> +	pids+=( $! ); sleep 1
> +	n1 wg set wg0 peer "$pub2" remove
> +	kill "${pids[@]}" 2>/dev/null || true; wait "${pids[@]}" || true
> +	n1 wg set wg0 peer "$pub2" preshared-key <(echo "$psk") allowed-ips 192.168.241.2/32,fd00::2/128 endpoint 127.0.0.1:2
> +	n1 ping -c 1 -W 1 192.168.241.2
> +done

[Severity: Low]
Does anything confirm that the peer is actually under load when it is
removed?

The fixed sleep 1 is the only ordering between starting the flood and
the removal. The client's output goes to /dev/null, and wait ... || true
throws away its exit status.

The iperf3 UDP streams might not start within that second, which is
possible on slow TCG targets. The iteration would then remove an idle
peer and the final object check would still pass. The leak this loop
targets would go unnoticed.

Checking wg show wg0 transfer, or rx_bytes on n1, before the removal
would catch that.

Separately, can the single ping abort the whole run? It needs a full new
handshake plus a round trip within 1 second. It also runs under set -e
with no retry.

If a handshake packet is lost or late, the next attempt only comes after
REKEY_TIMEOUT (5 seconds). The ping then fails and netns.sh exits.

Right after the removal, up to 1024 queued packets may still be draining.
About 1000 KERN_DEBUG lines are also going to the console, because
init.c writes 9 to /proc/sys/kernel/printk.

Other places in netns.sh already use a single 1-second ping after a
handshake without trouble. This is a timing concern rather than an
observed failure.

> diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
> index 368fd9d600c83..c69a408a5a94c 100644
> --- a/tools/testing/selftests/wireguard/qemu/kernel.config
> +++ b/tools/testing/selftests/wireguard/qemu/kernel.config
> @@ -67,7 +67,7 @@ CONFIG_SYSCTL=y

[ ... ]

> -CONFIG_LOG_BUF_SHIFT=18
> +CONFIG_LOG_BUF_SHIFT=20

[Severity: Medium]
Does 1 MiB leave enough headroom for what the new loop can log?

netns.sh sets message_cost to 0, and WIREGUARD_DEBUG=y defines DEBUG.
In wg_peer_remove(), peer_make_dead() takes the peer out of allowedips
first. NAPI then keeps draining peer->rx_queue until napi_disable().

Each packet handled in that window fails the source check and logs a
line:

drivers/net/wireguard/receive.c:wg_packet_consume_data_done() {
    ...
	net_dbg_skb_ratelimited("%s: Packet has unallowed src IP (%pISc) from peer %llu (%pISpfsc)\n",
    ...
}

The only limit on the per-peer queue is in wg_prev_queue_enqueue():

	if (!atomic_add_unless(&queue->count, 1, MAX_QUEUED_PACKETS))

MAX_QUEUED_PACKETS is 1024, so one removal can log about 1024 of these
lines. Each record takes about 96 bytes in the printk data ring: about
86 bytes of text plus the 8-byte block id, rounded up.

Ten removals can then use 10 * 1024 * 96 = 983,040 bytes. That is about
94% of the 1,048,576-byte ring. Even with the commit message's estimate
of about 1000 lines per removal, it is still about 91%.

That leaves roughly 65-88 KiB for everything else netns.sh logs, from
the run's start to its end. This covers the "created" lines from
configure_peers at the start, the handshake and keepalive debug lines,
and about 80 netlink-test peers. n2's original "Peer N created" record
has to survive the whole run.

If the ring wraps, the object check at the end of netns.sh would see a
"destroyed" record without its "created" record. It would then report
"merely destroyed", which is the failure this change is meant to
prevent.

The rest of the log has not been measured, so this rests on the
arithmetic above.

Would setting a non-zero message_cost while the loop runs avoid relying
on such a thin margin? A larger shift such as 21 would also work.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126094722.73025-1-apasichnik9%40gmail.com
