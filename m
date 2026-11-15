Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770602;
	b=tdTa5/AodYZKuOexNltuREXP2Dp79JybldUuvItA806AP/nJEA23YA8GoqP171p2nQtf
	 QQ+Yg2Vca12eSYjTj/jtFz96HJJp+b2rkBxjKR/XnDv2SXhpz72qO9rt4LeifiumGSluz
	 KDChtJRLU32gHmZXpSb593EuloM5g3wKmEvXB4PZNVGwNaX0iV6qAYAzVvj4HyH6JIaYC
	 Q/NIoi6WYyY2SudVPi091ygPc+hg9mttnr+wNtl+gsfIO6wDPfNFa3ijY6yWHQ/T5Ebsc
	 45euCrWiyDgGe9ZSTDXy8J+0QSGjerQvEG25Z1quI8J6dRrONTsizXxfWCNlqptrTvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770602;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=X9K4Dz2pQrUIazD2dS9iZJmAZrlJ1T+oSK7eDWS4krU=;
	b=RkNEf9fPY1xvtQ0JZSPKMnAxP0U8HcJJsx/ZV3qCzy+1p6pZekyHQYfe6WytZcJyyvnf
	 aYyVASGdjpBPwbsYzfNZA6/+bm4UaFHlKy0ow5DPwNY6cokXwKgLNavcIPvUh7GIvod4X
	 2g4sgPcCD+n439u5yoBKw1z/V2j+/KwQV4jql/VDioBq9kUFWrNZGMapmW2TZtCKHhH7+
	 3Vooop5O86GN+14hG8rBhausgSzrK4+1q7Az7hftUv41ufpTSuhfIJEzYWxeS+EiiWIhe
	 8A49fjvbWJgR/N3zD1KuoH/NVScKeYIMs8F6wjalJglka/yCKf7XZLkK2f074dhizAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kaGOsWbW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A02606A32C;
	Sun, 15 Nov 2026 19:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kaGOsWbW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2451F000C4;
	Sun, 15 Nov 2026 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770601;
	bh=X9K4Dz2pQrUIazD2dS9iZJmAZrlJ1T+oSK7eDWS4krU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kaGOsWbWoTmqvvmG2qw9HbZT/nGfBGVjYHsMB45BwM8CFKNrwf9lhQv4Xsyub2sK/
	 tQd2DSpSPCjb/BkiWtQCULAP6F7UChIsTVdzm1yDEBVtkGXMC8sDyG3H2yEvA63577
	 ZWHhwL8JsYakB5OgZ9DE/lIBgZYk9hC3yGwTqCjJpeW13qONCq8gCO+hzaP0yb8HD5
	 nzutINUJf42m8AN4SK77vtHkBAGffppwq9+uZ6qryApfBe1pG0oyr7hxA4xSZpmxNz
	 HeJiIsxD3S5CZx88f5HqZYpzZnKrcK5VJk4gyJaE2yiS4M1uulmFwbrZrbd8pUz71w
	 JQSI17aB9XdXA==
Subject: Re: [PATCH net v2 1/5] tls: Break the connection after a burst of
 empty data records
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sd@queasysnail.net, john.fastabend@gmail.com, shuah@kernel.org,
 cel@kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 15 Nov 2026 19:23:20 +0000
Message-ID: <179477060077.3136.251643647705678040@kernel.org>
In-Reply-To: <20261111185522.2859004-2-kuba@kernel.org>
References: <20261111185522.2859004-2-kuba@kernel.org>
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

- [Medium] ctx->empty_run counts only consecutive empty DATA records.
- [Low] Documentation/networking/tls.rst (line 123) still says only
  '``EBADMSG`` is returned if decryption failed for any other reason.'…
- [Low] In tls_sw_recvmsg() the new check 'if (is_peek && chunk)'
  (net/tls/tls_sw.c:1963) applies to every record type, not only…

--

tls: Break the connection after a burst of empty data records

This patch adds a per-reader counter of consecutive empty TLS data
records. Once more than 128 are decrypted without the reader sleeping or
returning to its caller, it aborts the strparser with EBADMSG. It also
makes tls_sw_recvmsg() decrypt empty records synchronously, and consume
them rather than queue them on rx_list when peeking.

Link: https://lore.kernel.org/all/20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org/

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 23eb94d9da6ee..65e578c8c6124 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1582,6 +1584,19 @@ static int tls_rx_one_record(struct sock *sk, struct msghdr *msg,
>  	rxm->full_len -= prot->overhead_size;
>  	tls_advance_record_sn(sk, prot, &tls_ctx->rx);
>  
> +	/* A peer may send empty data records, e.g. as cover traffic, but
> +	 * a burst of them traps the reader in the kernel. Treat more than
> +	 * 128 in a row, without the reader sleeping or returning to the
> +	 * caller in between, as a protocol violation. Stop the strparser
> +	 * before the next record gets parsed, so the reader finds the
> +	 * error in tls_rx_rec_wait().
> +	 */
> +	if (rxm->full_len ||
> +	    tls_msg(darg->skb)->control != TLS_RECORD_TYPE_DATA)
> +		ctx->empty_run = 0;

[Severity: Medium]
Can a peer get around the cap by mixing in non-empty records? Any record
with a non-zero rxm->full_len resets ctx->empty_run. So a peer that sends
repeated groups like this never triggers the abort:

  [128 empty data records][1 one-byte data record]

With that pattern, each byte delivered costs the reader 129 decryptions,
but the loop bounds only advance by one byte per group. In
tls_sw_recvmsg() the loop is:

  while (len && (decrypted + copied < target || tls_strp_msg_ready(ctx))) {

The sk_flush_backlog() calls in tls_read_flush_backlog() and
tls_rx_rec_wait() keep feeding in new records, and signals are only
checked when the reader sleeps. One recvmsg() with a 1 MiB buffer could
process around 135M records. With plain one-byte records it would be
about 1M.

tls_sw_read_sock() loops on desc->count. svc_tcp_recvfrom() starts with:

  .count		= serv->sv_max_mesg + sizeof(rpc_fraghdr),

and only lowers it by the bytes consumed. That gives an NFS-over-TLS
client the same ~129x amplification while the socket lock is held.
nvme-tcp uses rd_desc.count = 1 and never lowers it, so for nvme-tcp the
interleaved stream looks as unbounded as before.

The commit message says empty records "advance neither loop bound" and
keep the reader "in the kernel for as long as they arrive". With
interleaving, empty records are still 128/129 of the work, and the bounds
barely advance.

Would a per-call budget (empty records per reader call, or per byte
delivered), or a signal/need_resched check, be needed to close this?

> +	else if (unlikely(++ctx->empty_run > 128))
> +		tls_strp_abort_strp(&ctx->strp, -EBADMSG);

[Severity: Low]
Should Documentation/networking/tls.rst be updated for this new error
case? It currently says only:

  EBADMSG is returned if decryption failed for any other reason.

After this change, a record that decrypts and authenticates fine can also
cause EBADMSG. On the 129th consecutive empty data record,
tls_rx_one_record() calls tls_strp_abort_strp(). That sets sk->sk_err and
stops the strparser for good. Every later recvmsg(), splice() or
read_sock caller then gets EBADMSG from tls_rx_rec_wait().

Reusing EBADMSG matches existing practice, since tls_rx_msg_size()
already returns it when data_len < cipher_overhead. However, the
128-record limit and the fact that it breaks the connection permanently
are not documented anywhere that userspace TLS libraries would find them.

> +
>  	return tls_check_pending_rekey(sk, tls_ctx, darg->skb);
>  }

[ ... ]

> @@ -1939,7 +1960,7 @@ int tls_sw_recvmsg(struct sock *sk,
>  			if (err < 0)
>  				goto put_on_rx_list_err;
>  
> -			if (is_peek) {
> +			if (is_peek && chunk) {
>  				peeked += chunk;
>  				goto put_on_rx_list;
>  			}

[Severity: Low]
Does this also consume empty non-data records under MSG_PEEK? The chunk
check applies to every record type, not just TLS_RECORD_TYPE_DATA.

Take an empty alert or handshake record that is read with MSG_PEEK.
full_len is 0 after decryption, which can happen with TLS 1.2 when
data_len == cipher_overhead, or with a TLS 1.3 inner type on an empty
body. Then:

  chunk is 0, so "async && chunk" is false
  skb_copy_datagram_msg() copies 0 bytes
  "is_peek && chunk" is false
  partially_consumed is false

The code then falls through to consume_skb(skb) and frees the record.

Before this patch, a peek always queued the skb on rx_list. The next
non-peek recvmsg() returned it from process_rx_list() along with its
TLS_GET_RECORD_TYPE cmsg. Now the next real read skips straight to the
following record.

The pile-up described in the commit message doesn't seem to apply to
non-data records. If one is already on rx_list, process_rx_list() sets
control != TLS_RECORD_TYPE_DATA and tls_sw_recvmsg() jumps to end, so
repeated peeks can't stack them up. The counter in tls_rx_one_record()
also only counts data records.

Would limiting the new condition to TLS_RECORD_TYPE_DATA records keep
the old peek behaviour for control records?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111185522.2859004-1-kuba%40kernel.org
