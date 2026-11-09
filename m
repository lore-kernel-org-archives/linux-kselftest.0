Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244717;
	b=Ja6FdEDiCadYGw8oo0U7v99th0a0P5IrxYelabutHirgZJxFAC2927UWkRiNihTfSoy7
	 o9tGZSxceIDOz/mpg4GwBKBWtkb+vkeS6DGQw5onYu9Ak8hcGKsRGOuCfFCuLNri/qKPS
	 tOWtpL2tmtoC0hix0BLXw72hemDtoonxsWvMEurPDzu5zlxljDU+1Lu1O2rOflYUBra+p
	 6ZZjCVdokpnA9mWchfrwZactlfmXx6scs5BUTS/RB1IA6Y4bYo7KLz5oPv3kHzVf9Pj5z
	 X4d3JY6FR/ruHvpGKG2/p4VzpW4hme1jdtQlvvxF4S/jgffqsUdOq4gckK4oFrRVu1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244717;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=N1jVAbk+fLYeVgHzpO4lNhBibStWh+CggcSUKOdyVco=;
	b=R/R2VUyESkO2cciCK61ROpSCgg6IlIPpmpLQSukzZ5U5bBH4r0nDKiVTS+ureb8ViWct
	 0lRxwsHbT3yVEkSVtOee5opbPFD4EtAFZJS4ZDO9AtBS59TYyeeI9U+jH/JuskIyoyr9O
	 0Em1OZ+pqftRTPWAokW0qS4YMpJZHcZbf0muUJUJTr4w3qFh9Qe5uHl2gFo8XBEbXq0YZ
	 s7Dhz5XGg6pDYCM8q5748yYtzNaiUbT4f6B8CapApxLhs1JK79+VDGO6HP2e8UjrUaCz/
	 NRa4xK5OkqylsCOFVNq/6A9tM3Y/7awtD5K0ui8+Bl/xw2LdRtJP9UnYz/E9roi5cpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+3Vt0ub;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC072606EE8E;
	Mon,  9 Nov 2026 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+3Vt0ub
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1681F008A1;
	Mon,  9 Nov 2026 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794244716;
	bh=N1jVAbk+fLYeVgHzpO4lNhBibStWh+CggcSUKOdyVco=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B+3Vt0ubNJLnX81jdqt4VAHPCX17jde7HN/5WPX1znhgnAra0RbC4opyj2B4kBcya
	 nBlDUVBZkQIWgV0FJ6FA6VPmzJbwG7vk1p2Li2k+Mh5doXPB5oFDCgvooQFaMF3E2x
	 nK1DwXvE+zZcGNCepPvwdZv4Yc2c75myGb/tuasl+Qdemf+ObGGR6tQ8X0L/mweXFj
	 TWshZjyGC2f7Yd6dliVYw8UiLqqZE9qKTJQ8ol9mb+MIaRE+PMpmfANQZ180qOQI4T
	 aG+1LsRuDPYThmpbInHbOkIAuA/lxRJWr5GZX7JI2uHbl7cMcljedVf7K6K5sJ5MUD
	 LyLJwESafqvAA==
Subject: Re: [PATCH net-next v6 6/6] selftests/tls: add KeyUpdate tests
From: netdev-bot+sashiko@kernel.org
To: martin.nvme.dev@gmail.com
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, hare@kernel.org,
 cel@kernel.org, kernel-tls-handshake@lists.linux.dev,
 alistair.francis@wdc.com, martin.belanger@dell.com
Date: Mon, 09 Nov 2026 17:18:34 +0000
Message-ID: <179424471492.994134.1896421329544039632@kernel.org>
In-Reply-To: <20261105-keyupdate-rfc-v6-6-99b695f9eb4f@gmail.com>
References: <20261105-keyupdate-rfc-v6-6-99b695f9eb4f@gmail.com>
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

- [Medium] In keyupdate_setup_seq() (tools/testing/selftests/net/tls.c),
  a missing AF_ALG hash interface makes the test FAIL instead of SKIP.
- [Low] No new selftest checks the next-generation traffic secret, key or
  IV that the kernel derives in tls_keyupdate_rekey()…
- [Low] In keyupdate_manual_rekey() (tools/testing/selftests/net/tls.c),
  the comment says "a key installed by the user removes the registered…

--

Reviewing commit cf973cdf44894385edb313912c677758928546ac in this reply.

selftests/tls: add KeyUpdate tests

This adds kselftests for the in-kernel TLS 1.3 KeyUpdate. Each end of a
bidirectional connection registers both traffic secrets. The tests cover
registration errors, KeyUpdates in both directions, update_requested,
splice, the record limit, manual rekeys, the rate limit and invalid
KeyUpdate messages. The generation-0 keys are derived in userspace with
HKDF-Expand-Label, using the kernel HMAC through AF_ALG.

> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index c4203401c4bfc..ed3b510a5ef6f 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c

[ ... ]

> @@ -2421,6 +2422,525 @@ TEST_F(tls, rekey_poll_delay)

[ ... ]

> +static bool hkdf_expand_label(const unsigned char *secret, int secret_len,
> +			      const char *label, unsigned char *out,
> +			      int out_len)
> +{

[ ... ]

> +	tfm = socket(AF_ALG, SOCK_SEQPACKET, 0);
> +	if (tfm < 0)
> +		return false;
> +	if (bind(tfm, (struct sockaddr *)&sa, sizeof(sa)) ||
> +	    setsockopt(tfm, SOL_ALG, ALG_SET_KEY, secret, secret_len))
> +		goto out;

[ ... ]

> +static bool keyupdate_setup_seq(struct __test_metadata *_metadata,
> +				FIXTURE_DATA(tls) *self,
> +				const FIXTURE_VARIANT(tls) *variant,
> +				uint64_t seq)
> +{

[ ... ]

> +	memset(secret_a, 0xa5, sizeof(secret_a));
> +	memset(secret_b, 0x5a, sizeof(secret_b));
> +
> +	/* the keys must be the ones that the secrets give */
> +	ASSERT_TRUE(keyupdate_keys(variant->cipher_type, secret_a, len,
> +				   &keys_a));
> +	ASSERT_TRUE(keyupdate_keys(variant->cipher_type, secret_b, len,
> +				   &keys_b));

[Severity: Medium]
If the AF_ALG hash interface is missing, should these tests skip rather
than fail?

hkdf_expand_label() returns false if any of these fail:

- socket(AF_ALG, ...)
- bind() to "hmac(sha256)" or "hmac(sha384)"
- ALG_SET_KEY
- accept()

That happens on a kernel without CONFIG_CRYPTO_USER_API_HASH,
CONFIG_CRYPTO_HMAC or the SHA-256/SHA-512 crypto API drivers. The
ASSERT_TRUE() above then aborts every in-kernel KeyUpdate test as a
failure, for each TLS 1.3 variant. keyupdate_manual_rekey_request() has
the same ASSERT_TRUE(keyupdate_keys(...)).

The kernel feature does not need any of these options. net/tls/Kconfig
only has:

	select CRYPTO_LIB_SHA256
	select CRYPTO_LIB_SHA512

The additions to selftests/net/config only help runs built from that
fragment. Elsewhere, a missing test-only dependency will look like a
KeyUpdate regression.

Could this return false so the caller takes the existing "no in-kernel
KeyUpdate for this variant" skip, or SKIP() with its own message?

> +
> +	/* rec_seq is the last member of each crypto_info */

[ ... ]

> +	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_TRAFFIC_SECRET,
> +			     secret_a, len), 0);
> +	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_RX_TRAFFIC_SECRET,
> +			     secret_b, len), 0);
> +	EXPECT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_TX_TRAFFIC_SECRET,
> +			     secret_b, len), 0);
> +	EXPECT_EQ(setsockopt(self->cfd, SOL_TLS, TLS_RX_TRAFFIC_SECRET,
> +			     secret_a, len), 0);

[Severity: Low]
This isn't a bug, but does any test check the next-generation secret,
key and IV against an independent calculation?

Each test that uses keyupdate_setup() or keyupdate_setup_seq() registers
both secrets on both fd and cfd. The sender and the receiver therefore
run the same kernel code on the same secret:

sender:   tls_keyupdate_rekey(sk, 1)
receiver: tls_keyupdate_rekey(sk, 0)

net/tls/tls_keyupdate.c:tls_keyupdate_rekey() {
    ...
	rc = tls_hkdf_expand_label(secret->data, secret->len, "traffic upd",
				   next, secret->len);
    ...
	memcpy(secret->data, next, secret->len);
    ...
}

Both ends would agree on the same wrong key after any of these mistakes,
and every test would still pass:

- a wrong label
- a wrong output length
- a wrong hash
- swapped salt and IV
- the secret never being replaced

keyupdate_keys() only derives the generation-0 key. The kernel already
checks that key at registration in tls_check_traffic_secret().

One option is to compute HKDF-Expand-Label(secret_a, "traffic upd", ...)
here, pass it to keyupdate_keys(), and compare the result with
getsockopt(TLS_TX) after a KeyUpdate. Another is to register only the TX
secret on fd and install the independently derived next key on cfd with
TLS_RX.

[ ... ]

> +TEST_F(tls, keyupdate_manual_rekey)
> +{
> +	struct tls_crypto_info_keys tls12;
> +	int zero = 0;
> +
> +	if (!keyupdate_setup(_metadata, self, variant))
> +		SKIP(return, "no in-kernel KeyUpdate for this variant");
> +
> +	/* a key installed by the user removes the registered secrets */
> +	tls_crypto_info_init(variant->tls_version, variant->cipher_type,
> +			     &tls12, 2);
> +	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX, &tls12, tls12.len), 0);
> +
> +	EXPECT_EQ(setsockopt(self->fd, SOL_TLS, TLS_TX_KEY_UPDATE,
> +			     &zero, sizeof(zero)), -1);
> +	EXPECT_EQ(errno, EINVAL);
> +}

[Severity: Low]
This isn't a bug, but the comment says "secrets", and the test only
shows that the TX secret is gone.

The EINVAL comes from the first check in tls_sw_key_update():

	if (!ctx->tx_secret.len)
		return -EINVAL;

On a TLS_TX update, do_tls_setsockopt_conf() also clears the RX secret
and tx_key_update_asked:

		memzero_explicit(&ctx->rx_secret, sizeof(ctx->rx_secret));
		/* the answer now goes to user space */
		ctx->tx_key_update_asked = false;

Nothing here would catch a change that left rx_secret set. The kernel
would then keep consuming the peer's KeyUpdates silently, even though fd
can no longer answer them.

Could the test also check that a KeyUpdate sent from cfd now reaches
user space on fd?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261105-keyupdate-rfc-v6-0-99b695f9eb4f%40gmail.com
