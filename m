Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB62C237E
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787175267; cv=none; b=R7M3Okx1flc3VTIyoyhyg5njEBYvXaU8fkERmeS6o2AoDpEIUcSaXnqjbVaG9Q78PICw6tb6ipG7/nw3Tp1ZakARahZ7rVopxzilkhmwoQ+BIUjUjsDJztlKKUpnIG7pHhqzQAZ0VpTRbsoEv9Avc4TpxxkvLKA/NKCzgcSuoJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787175267; c=relaxed/simple;
	bh=Ouhl7hfuno05RUm4TmMlvCp4iFdazi1ClhurwRMipXM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ei/ENoArq9D7EX0IWxlWqSqu/RIkpi+in1tXWHurR5SINrX0TF5LNjEvW1EdbJAhS9/bs3f6IqDnJzpun18NTZjeCrcRrRR/dX2/G6EoIj92DqupWVePU5oi9TZoF1IUtEwuWPKAwNb8Jqd26OCY+pPsl3BUGItnl52ixswU62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=woEaq9kr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="woEaq9kr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc891373e0so18684165ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 14:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1787175264; x=1787780064; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZvSzYmeFm5vAIe+RzmI/yulTjUip37BVmsT7quQF4BA=;
        b=woEaq9kr+rAlU6etUyZSfIE3oEiM1iA5oeUAuR7lGVJKd7s+U42dPuC1eWzzqzkPa0
         YE382dnpklcliwJQprnJRKta7twQzC9h9O0tYzgSv9heU7ScAdQiTeViWU6H06vq4AT4
         E1n2+pUWM7LSSGG/aKYfc2DG757PfO9Dc3NIdVwVO3zPrEjfi+B4OS3B+iW6OTTJbqV1
         HKs9Uc729yZ5GLZsEGVc0sCEAw/5QWPsVw+n2hqXHgaGjL1ACj6LaCGEKhJvzML663lF
         2GlXTS0gBSbiqyz59KGjS+UJ2LZtwsghAQE/DnabI7aJ2GbBDcuMjUzhuVnD7j0P57nd
         szLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787175264; x=1787780064;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvSzYmeFm5vAIe+RzmI/yulTjUip37BVmsT7quQF4BA=;
        b=GhhE0q7KyeEOtTSbvTpHk7SaYBkeHdiKfrpTIDNWuLXo/bq5jI8wQ6IXdxm4lpc6xL
         Jq+qjZnYr32h+qxQ7zNaKq5YWNyimlXzdp4Nk+YTFFcJ8WBXCLo3J67tavFm1iZa8tb5
         DaKI9z1OXsQlkC7DuIQJ6xE8Wo3D2J3fcqj9o8yNuIOn2cawglzaX5dEwVjHk5RS4lJ4
         cvmNZbqQDoXTXD7L1/QARfGBZz8TQd1DV3Nrbmkuwo6/yDRiKm0RjOWnwoyH6QvS28oq
         LFYgbXe8WCcoFInmo1gJdzLzzS8+dJstKmI6UBaYN3Kk2NkOzd0sZ0Et3if5nUzuBv3I
         K76Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp6YhP7CPY3hoVh+J13uc0LSxQGvyt2jreH7u2rtXopEzcA1h5nMBaGwBphIPWjNdR4EpaOL10hA3c+xvHo5qg=@vger.kernel.org
X-Gm-Message-State: AFuF++muzpLY4330XPwuzSRFdK7Jfy7WhlXddjoDp+4SMieHqDN1Pokz
	UUubzC9zM8xhTSJIDLR4oXvv9C09ogwMI+d1oIRAEOZxOrE1hrLIAPUmCg5w8vs3WSk=
X-Gm-Gg: AR+sD13Q8ThducAS7g4YK2f/KTlVbn4WYi3CKANBc3znOoMzTO9LlKJ1nYjzTeaVMmE
	Vtkq/Fjmyx0G1+tGjUNFpawanVaWEYO8kqFSIYaeIvIWMA1my1bXYodDKN0qLpSjAtXhnM3E8c1
	KSG1NM6G+YWjDzmk2RDN2CoLsmAXL3D/cAh9/zqhckowXIqqxdsByQ7fzPWr+oSOsPeoqdHaku7
	U9u/YQA0iGFFlGjIc/2+7hBmifk+07nu9ZOpAwJuWdooo6fdIr8Un77O6LU3cZMj5ev3nckJe8/
	ZK9Vp7ZyxvTM3cpOzFNy+los3vdHUc13WwHWfFdKs1eaXvvFx494Gu6FpFxTD53K7G4yLn2iVdm
	6rZGjvcrAfbQm+wc5cU9IEdcDxXCxiE0bshJDMoKB23Nb0/R46T2cP50CBfqgumFuP/dUdr27hb
	reb/aCexq3a+MozofdbHZVdIcKErygfHQtQawFcR69Qr7wyDHmAgQqW0Rnxu89yXQozZfktNq9+
	6g2aekAg5qBaRk7qfDpPrMl6ssY
X-Received: by 2002:a17:902:e94c:b0:2d5:d9c2:bbe0 with SMTP id d9443c01a7336-2d5fd621427mr140996965ad.4.1787175264264;
        Wed, 19 Aug 2026 14:34:24 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb519678sm31564335ad.31.2026.08.19.14.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 14:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 17:34:22 -0400
Message-Id: <DKT8R9H3SX3Z.2PW8ZOHVZ5QFN@etsalapatis.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] selftests/bpf: tc_tunnel - validate decap tunnel state
 without false-pass gaps
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Nick Hudson" <nhudson@akamai.com>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818120308.623905-1-nhudson@akamai.com>
In-Reply-To: <20260818120308.623905-1-nhudson@akamai.com>

On Tue Aug 18, 2026 at 8:03 AM EDT, Nick Hudson wrote:
> This follow-up tightens the selftest to guard against false passes in
> GSO decap validation.
>
> It validates the expected post-decap state for both GSO and non-GSO
> packets: expected tunnel gso_type bits must be cleared and
> skb->encapsulation must match the remaining tunnel state.
>
> It also adds explicit assertions that the decap validation path was
> executed, including the large-send phase for GSO-marked subtests, and
> asserts that the large-send marker is reset after the send.
>
> This keeps the tc_tunnel decap checks meaningful and avoids false-pass
> regressions without over-constraining behavior across tunnel modes.
>
> Signed-off-by: Nick Hudson <nhudson@akamai.com>
> ---
>  .../selftests/bpf/prog_tests/test_tc_tunnel.c | 33 +++++++++++++++----
>  .../selftests/bpf/progs/test_tc_tunnel.c      | 19 +++++++++++
>  2 files changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/test_tc_tunnel.c b/to=
ols/testing/selftests/bpf/prog_tests/test_tc_tunnel.c
> index 67ba27d69347..08d7d90f7772 100644
> --- a/tools/testing/selftests/bpf/prog_tests/test_tc_tunnel.c
> +++ b/tools/testing/selftests/bpf/prog_tests/test_tc_tunnel.c
> @@ -206,7 +206,7 @@ static void disconnect_client_from_server(struct subt=
est_cfg *cfg,
>  	free(conn);
>  }
> =20
> -static int send_and_test_data(struct subtest_cfg *cfg)
> +static int send_and_test_data(struct subtest_cfg *cfg, struct test_tc_tu=
nnel *skel)
>  {
>  	struct connection *conn;
>  	int err, res =3D -1;
> @@ -215,6 +215,7 @@ static int send_and_test_data(struct subtest_cfg *cfg=
)
>  	if (!ASSERT_OK_PTR(conn, "connect to server"))
>  		return -1;
> =20
> +	skel->bss->decap_expect_large_send =3D 0;
>  	err =3D send(conn->client_fd, tx_buffer, DEFAULT_TEST_DATA_SIZE, 0);
>  	if (!ASSERT_EQ(err, DEFAULT_TEST_DATA_SIZE, "send data from client"))
>  		goto end;
> @@ -226,14 +227,17 @@ static int send_and_test_data(struct subtest_cfg *c=
fg)
>  		goto end;
>  	}
> =20
> +	skel->bss->decap_expect_large_send =3D 1;
>  	err =3D send(conn->client_fd, tx_buffer, GSO_TEST_DATA_SIZE, 0);
>  	if (!ASSERT_EQ(err, GSO_TEST_DATA_SIZE, "send (large) data from client"=
))
>  		goto end;
>  	if (check_server_rx_data(cfg, conn, DEFAULT_TEST_DATA_SIZE))
>  		goto end;
> +	skel->bss->decap_expect_large_send =3D 0;
> =20
>  	res =3D 0;
>  end:
> +	skel->bss->decap_expect_large_send =3D 0;
>  	disconnect_client_from_server(cfg, conn);
>  	return res;
>  }
> @@ -374,10 +378,15 @@ static int configure_ebpf_decapsulation(struct subt=
est_cfg *cfg)
>  	return ret;
>  }
> =20
> -static void run_test(struct subtest_cfg *cfg)
> +static void run_test(struct subtest_cfg *cfg, struct test_tc_tunnel *ske=
l)
>  {
>  	struct nstoken *nstoken;
> =20
> +	skel->bss->decap_validation_seen =3D 0;
> +	skel->bss->decap_gso_validation_seen =3D 0;

Sashiko points out correctly that gso_validation_seen is never checked.
Can we assert it with the others?

The CI bot's point on the other hand doesn't matter that much imo, the
assert for the config variable is good in case we ever add any other
subtests.

pw-bot: cr

> +	skel->bss->decap_large_send_validation_seen =3D 0;
> +	skel->bss->decap_expect_large_send =3D 0;
> +
>  	if (!ASSERT_OK(run_server(cfg), "run server"))
>  		return;
> =20
> @@ -386,7 +395,7 @@ static void run_test(struct subtest_cfg *cfg)
>  		goto fail;
> =20
>  	/* Basic communication must work */
> -	if (!ASSERT_OK(send_and_test_data(cfg), "connect without any encap"))
> +	if (!ASSERT_OK(send_and_test_data(cfg, skel), "connect without any enca=
p"))
>  		goto fail;
> =20
>  	/* Attach encapsulation program to client */
> @@ -398,7 +407,7 @@ static void run_test(struct subtest_cfg *cfg)
>  		if (!ASSERT_OK(configure_kernel_decapsulation(cfg),
>  					"configure kernel decapsulation"))
>  			goto fail;
> -		if (!ASSERT_OK(send_and_test_data(cfg),
> +		if (!ASSERT_OK(send_and_test_data(cfg, skel),
>  			       "connect with encap prog and kern decap"))
>  			goto fail;
>  	}
> @@ -406,7 +415,18 @@ static void run_test(struct subtest_cfg *cfg)
>  	/* Replace kernel decapsulation with BPF decapsulation, test must pass =
*/
>  	if (!ASSERT_OK(configure_ebpf_decapsulation(cfg), "configure ebpf decap=
sulation"))
>  		goto fail;
> -	ASSERT_OK(send_and_test_data(cfg), "connect with encap and decap progs"=
);
> +	if (!ASSERT_OK(send_and_test_data(cfg, skel), "connect with encap and d=
ecap progs"))
> +		goto fail;
> +	if (!ASSERT_NEQ(skel->bss->decap_validation_seen, 0,
> +			"decap validation executed"))
> +		goto fail;
> +	if (!ASSERT_EQ(skel->bss->decap_expect_large_send, 0,
> +		       "decap large-send marker reset"))
> +		goto fail;
> +	if (cfg->test_gso) {
> +		ASSERT_NEQ(skel->bss->decap_large_send_validation_seen, 0,
> +			   "decap validation executed for large send");
> +	}
> =20
>  fail:
>  	close_netns(nstoken);
> @@ -438,6 +458,7 @@ static int setup(void)
>  	SYS(fail_close_ns_client, "ip link add %s type veth peer name %s",
>  	    "veth1 mtu 1500 netns " CLIENT_NS " address " MAC_ADDR_VETH1,
>  	    "veth2 mtu 1500 netns " SERVER_NS " address " MAC_ADDR_VETH2);
> +	SYS(fail_close_ns_client, "ethtool -K veth1 tso off");
>  	SYS(fail_close_ns_client, "ip link set veth1 up");
>  	nstoken_server =3D open_netns(SERVER_NS);
>  	if (!ASSERT_OK_PTR(nstoken_server, "open server ns"))
> @@ -701,7 +722,7 @@ void test_tc_tunnel(void)
>  		if (ret < 0 || !test__start_subtest(cfg->name))
>  			continue;
>  		if (subtest_setup(skel, cfg) =3D=3D 0)
> -			run_test(cfg);
> +			run_test(cfg, skel);
>  		subtest_cleanup(cfg);
>  	}
>  	cleanup();
> diff --git a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c b/tools/t=
esting/selftests/bpf/progs/test_tc_tunnel.c
> index 853bca962910..e9bd1c9781f7 100644
> --- a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
> +++ b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
> @@ -16,6 +16,11 @@ static const int cfg_port =3D 8000;
> =20
>  static const int cfg_udp_src =3D 20000;
> =20
> +__u64 decap_validation_seen;
> +__u64 decap_gso_validation_seen;
> +__u64 decap_large_send_validation_seen;
> +__u32 decap_expect_large_send;
> +
>  #define ETH_P_MPLS_UC	0x8847
>  #define ETH_P_TEB	0x6558
> =20
> @@ -690,7 +695,21 @@ static int decap_internal(struct __sk_buff *skb, int=
 off, int len, char proto,
> =20
>  	kskb =3D bpf_cast_to_kern_ctx(skb);
>  	shinfo =3D bpf_core_cast(kskb->head + kskb->end, struct skb_shared_info=
);
> +
> +	if (flags & (BPF_F_ADJ_ROOM_DECAP_L4_MASK |
> +		     BPF_F_ADJ_ROOM_DECAP_IPXIP_MASK))
> +		decap_validation_seen++;
> +
> +	if ((flags & (BPF_F_ADJ_ROOM_DECAP_L4_MASK |
> +		      BPF_F_ADJ_ROOM_DECAP_IPXIP_MASK)) &&
> +	    decap_expect_large_send)
> +		decap_large_send_validation_seen++;
> +
>  	if (shinfo->gso_size) {
> +		if (flags & (BPF_F_ADJ_ROOM_DECAP_L4_MASK |
> +			     BPF_F_ADJ_ROOM_DECAP_IPXIP_MASK))
> +			decap_gso_validation_seen++;
> +
>  		if ((flags & BPF_F_ADJ_ROOM_DECAP_L4_UDP) &&
>  		    (shinfo->gso_type & SKB_GSO_UDP_TUNNEL_MASK))
>  			return TC_ACT_SHOT;

