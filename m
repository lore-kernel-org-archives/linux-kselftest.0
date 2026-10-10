Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9158D3B42D3;
	Sat, 10 Oct 2026 21:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668631; cv=none; b=ful97pt+OemeStVAei/Az6qLEk/PX5X6MUbB45tZyi6NzjzlWLaf2sPAWZH44cpiTN3JkVUBjVv8fopf159TFA4EGQhTxCUVhCw7uyHFLs+OFGKPxrvPrk7RZx9QLYF7lgQzH+G6ombRjsdeVn64OQsWdGwMNYBARqu5ngXvjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668631; c=relaxed/simple;
	bh=DENKigDtr3qZUkkBMHHH5hQ//u5w3D+zbgsDc5Sdk7w=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZnSP0C9dVhW7540tFXdmc7jHJQX9Em9wvgSSyzhE2ef9oZvFdR/AZC1owlRVpVz3DnVPf0coV70rcbTAq6LF+TWV9BdGRNcyqcIRmNY3qbm8grgOITZC3D2AdH6XJt16PiEzxhrq12bYIq5sF+b8MsFFCrkeP8YRCbfvNyX5tKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Elfwa+5V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Elfwa+5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2D91F00893;
	Sat, 10 Oct 2026 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791668630;
	bh=R1VJIkiZ494C5LdMKYBXPOFyrA3ooFg9lUxnteWMxE8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Elfwa+5VBFRLAm1d55hPlJgBeS5hHrD5G8RkChd/QPxAUtT8fJltYzoLNMRyH2c3n
	 yIjRAimKSNiim0lhJqjJMZ9SqxBLHHInNalBCoPlr4Pn0ea41faMLM2PXqCBd/hXPX
	 uHCHAkwF/BWzFeLhVJ6hDQbEj4+HjEDsPmA82MUmUlXNjy9Sr4+8YvIF+pWI5RKmid
	 pcvQ3QxN4T1xO/tN2IaqOz0oeMflDN4d06qkVfaf9+0Gof4oCAQYmX/pLQCrn1DZr9
	 TyL8sOzBN+bHsVXqOQBkG5IqeYY+Rp3qMBmwoNxjBPsO2jxqkgxDQaHCdEcmdYt8cj
	 uLZOo0J65mcIQ==
Subject: Re: [PATCH net-next v2 6/7] selftests: drv-net: psp: add rekey tests
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 21:43:48 +0000
Message-ID: <179166862864.434549.13306388395291538500@kernel.org>
In-Reply-To: <20261009-psp-v2-6-5596ab50f677@gmail.com>
References: <20261009-psp-v2-6-5596ab50f677@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In run_session()
  (tools/testing/selftests/drivers/net/psp_responder.c), the cmd() and…
- [Low] _recv_careful() in tools/testing/selftests/drivers/net/psp.py
  never detects that the peer has closed.
- [Low] rekey_tx_basic() (and, for the responder's tx-assoc,
  rekey_rx_basic()) would still pass if the Tx rekey left the old…
- [Low] selftests: drv-net: NULL pointer dereference if
  psp_key_rotate_req_alloc() fails

--

selftests: drv-net: psp: add rekey tests

This adds selftests for rekeying PSP connections. They include cases
where rx-assoc and tx-assoc should be rejected because of a PSP version
or state mismatch. It also adds rx assoc, tx assoc and key rotate
commands to psp_responder so the remote side can be rekeyed.

> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index 71eeade62ad24..af67c9e8c40fb 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py

[ ... ]

> @@ -130,6 +164,41 @@ def _check_data_outq(s, exp_len, force_wait=False):
>      ksft_eq(outq, exp_len)
>  
>  
> +def _recv_careful(s, target, timeout=2):
> +    """Read exactly target bytes, tolerating short reads"""
> +    data = b''
> +    end = time.monotonic() + timeout
> +    while time.monotonic() < end:
> +        try:
> +            data += s.recv(target - len(data), socket.MSG_DONTWAIT)
> +            if len(data) == target:
> +                return data
> +        except BlockingIOError:
> +            time.sleep(0.001)
> +    raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")

[Severity: Low]
What happens here if the peer closes the data connection cleanly?
s.recv() with MSG_DONTWAIT then returns b'' right away instead of raising
BlockingIOError. So data never grows and the time.sleep() branch never
runs.

Won't the loop then busy-spin for the whole 2 second timeout and report
"short read, got 0 of 5 bytes" instead of reporting the close?

_recv_all(), added in this same patch, handles this case:

    if not chunk:
        raise KsftFailEx(f"peer closed after {len(data)} of {target} bytes")

Could _recv_careful() do the same? Every new rekey test reaches it via
_psp_txrx()->_req_echo()->_recv_careful().

[ ... ]

> +def _rekey_tx(cfg, s, sent):
> +    """Rekey the Tx direction, running traffic after each step"""
> +    version, tx = _remote_rx_assoc(cfg)
> +    sent = _psp_txrx(cfg, s, 1, sent)
> +
> +    cfg.pspnl.tx_assoc({"dev-id": cfg.psp_dev_id,
> +                        "version": version,
> +                        "tx-key": tx,
> +                        "sock-fd": s.fileno()})
> +    return _psp_txrx(cfg, s, 1, sent)

[Severity: Low]
Can this check tell whether the new Tx key is actually in use?

After the receiver's rx-assoc rekey, psp_sock_rx_rekey() keeps the
previous association valid:

net/psp/psp_sock.c:psp_sock_rx_rekey() {
    ...
    pas->prev_spi = prev->rx.spi;
    pas->prev_generation = prev->generation;
    ...
}

psp_pse_matches_pas() then accepts packets that match it:

    (pas->prev_spi && pas->prev_spi == pse->spi &&
     pas->prev_generation == pse->generation)

After a single key rotation the old generation is still valid. If
tx-assoc left the old SPI and key on the wire, the byte count and echo
in _psp_txrx() would still pass. This applies to rekey_tx_basic(), and
also to the responder's tx assoc step in rekey_rx_basic().

rekey_both_sides() does catch a stale Tx key indirectly, because its
second rotation invalidates the original generation. Should the basic
variants also check that the new SPI is in use?

[ ... ]

> diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
> index 57425ecb9561f..b3e0fe6d69750 100644
> --- a/tools/testing/selftests/drivers/net/psp_responder.c
> +++ b/tools/testing/selftests/drivers/net/psp_responder.c

[ ... ]

> @@ -247,6 +343,9 @@ run_session(struct ynl_sock *ys, struct opts *opts,
>  			match;						\
>  		})
>  
> +#define cmd_w_msg(_name, _type)						\
> +		(off >= sizeof(_name) + sizeof(_type) && cmd(_name))
> +
>  			do {
>  				consumed = false;
>  
> @@ -261,6 +360,16 @@ run_session(struct ynl_sock *ys, struct opts *opts,
>  						fprintf(stderr, "WARN: echo but no data sock\n");
>  					send_ack(comm_sock);
>  				}
> +				if (cmd("rx assoc"))
> +					handle_rx_assoc(ys, data_sock,
> +							comm_sock);
> +				if (cmd_w_msg("tx assoc", struct assoc_msg)) {
> +					handle_tx_assoc(ys, buf, data_sock,
> +							comm_sock);
> +					__consume(sizeof(struct assoc_msg));
> +				}

[Severity: Medium]
Could a later cmd() check match the binary assoc_msg payload that is
left in buf?

In run_session(), the cmd() and __consume() macros compare against n.
n is set only once, right after recv():

    off += n;
    n = off;

__consume() never updates it:

    if (n == (sz)) {
        off = 0;
    } else {
        off -= (sz);
        memmove(buf, &buf[(sz)], off);
    }

Suppose "tx assoc" is the last request in the batch, so n == 49.
cmd("tx assoc") leaves off at 40, and __consume(40) leaves off at 0.
The 40 byte assoc_msg is still in buf[0..39], though, and n is still 49.

The cmd() checks that follow in the same pass ("key rotate", "data
close", "conn psp", "conn clr", "exit") still see n >= sz, so their
memcmp() runs against that payload. With an SPI of 0x65786974 and
version 0, buf[0..4] is "exit\0". cmd("exit") then matches, sets
should_quit, and its __consume(5) does:

    off -= 5;                       /* off == -5 */
    memmove(buf, &buf[5], off);     /* size is (size_t)-5 */

Won't that memmove() run far out of bounds and crash the responder? The
same thing can happen when handle_tx_assoc() fails and returns after
send_err(), because parsing continues either way.

cmd_w_msg() already checks off rather than n. Should cmd() and
__consume() use off too?

[ ... ]

> @@ -155,6 +157,100 @@ static void send_str(int sock, int value)
>  	send(sock, buf, ret + 1, MSG_WAITALL);
>  }
>  
> +#define PSP_MAX_KEY_LEN		32
> +
> +struct assoc_msg {
> +	__be32 spi;
> +	__u8 version;
> +	__u8 pad[3];
> +	char key[PSP_MAX_KEY_LEN];
> +};
> +
> +static void
> +handle_rx_assoc(struct ynl_sock *ys, int data_sock, int comm_sock)
> +{
> +	struct assoc_msg msg = {};
> +	__u32 spi;
> +
> +	if (data_sock < 0) {
> +		fprintf(stderr, "WARN: rx assoc but no data sock\n");
> +		send_err(comm_sock);
> +		return;
> +	}
> +
> +	if (rx_assoc(ys, &spi, msg.key, data_sock)) {
> +		fprintf(stderr, "ERROR: rx_assoc() failed\n");
> +		send_err(comm_sock);
> +		return;
> +	}
> +
> +	msg.spi = htonl(spi);
> +	msg.version = psp_vers.rx;
> +	send_ack(comm_sock);
> +	send(comm_sock, &msg, sizeof(msg), MSG_WAITALL);
> +}
> +
> +static void
> +handle_tx_assoc(struct ynl_sock *ys, char *data, int data_sock, int comm_sock)
> +{
> +	struct assoc_msg msg;
> +
> +	if (data_sock < 0) {
> +		fprintf(stderr, "WARN: tx assoc but no data sock\n");
> +		send_err(comm_sock);
> +		return;
> +	}
> +
> +	memcpy(&msg, data, sizeof(msg));
> +	if (tx_assoc(ys, msg.version, ntohl(msg.spi), msg.key, data_sock)) {
> +		fprintf(stderr, "ERROR: tx_assoc() failed!\n");
> +		send_err(comm_sock);
> +		return;
> +	}
> +
> +	send_ack(comm_sock);
> +}
> +
> +static int rotate_key(struct ynl_sock *ys, int devid)
> +{
> +	struct psp_key_rotate_rsp *rsp;
> +	struct psp_key_rotate_req *req;
> +
> +	req = psp_key_rotate_req_alloc();
> +
> +	psp_key_rotate_req_set_id(req, devid);
> +
> +	rsp = psp_key_rotate(ys, req);
> +	psp_key_rotate_req_free(req);
> +
> +	if (!rsp) {
> +		perror("ERROR: failed to rotate key");
> +		return -1;
> +	}
> +
> +	psp_key_rotate_rsp_free(rsp);
> +
> +	return 0;
> +}
> +
> +static void
> +handle_key_rotate(struct ynl_sock *ys, struct opts *opts, int comm_sock)
> +{
> +	if (opts->devid < 0) {
> +		fprintf(stderr, "WARN: key rotate but no PSP device\n");
> +		send_err(comm_sock);
> +		return;
> +	}
> +
> +	if (rotate_key(ys, opts->devid)) {
> +		fprintf(stderr, "ERROR: rotate_key() failed\n");
> +		send_err(comm_sock);
> +		return;
> +	}
> +
> +	send_ack(comm_sock);
> +}
> +
>  static void
>  run_session(struct ynl_sock *ys, struct opts *opts,
>  	    int server_sock, int comm_sock)

[Severity: Low]
psp_key_rotate_req_alloc() is a YNL generated helper that allocates
the request with calloc(), so it can return NULL. rotate_key() passes
the result straight to psp_key_rotate_req_set_id(), which writes the
id field through req without checking it.

If the allocation fails, won't the responder segfault here instead of
taking the existing error path? That path prints a message and calls
send_err() from handle_key_rotate(). On the psp.py side the crash would
show up as a lost comm connection in the middle of a rekey test, not
as a clean failure.

This is unlikely in practice. Would it be enough to check req for NULL
and return -1, the same way the !rsp case already does?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-psp-v2-0-5596ab50f677%40gmail.com
