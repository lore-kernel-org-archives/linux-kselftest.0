Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACFB37F000
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 22:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781649267; cv=none; b=IbSpGiOOkFEWZrJeMhGkFRa8vvSXWJxCCsdo7N7w9+7vdhA+aosbS7e3/yOZICnhRKPZ4IiEBWt5kSPE7neZk6jWeJlRfVBvcfhhGqXvf7a/j06cdRdMF2FJ66cgFRf6I7CZ7s2w4Y24zvBq9YvffhocvyqsVxBgRxghPZMGSKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781649267; c=relaxed/simple;
	bh=+k+Z5QT8jwp2bFgq5LnQarAVCm6xtVohhvDgImufK9I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CWDV263zed5IF+mbxdh0fK1UaR6WCx4XJ/y1Z7c8nNOTF7wlHtAp0wnTu2qPoiSadNDcOcT0cE9X0JmPRVmYb0S0BZhejCxD+hJTlH43xlwSPn7UGb+BFty1+ODp8I/p1Bxy3kWfEEdd+E+yLCdkE/ml1Imt3V7+6cqRhCR5KQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=R/2h6asC; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="R/2h6asC"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-13986d61b4eso3007789c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 15:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781649263; x=1782254063; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MD5iZFuM9ZopY66WGxBJxUk9sqbEsapLkycXT2EpEGQ=;
        b=R/2h6asC6iYJaz6+jj9LMjgxjwPi7mM3ZZNfOAyFvCMwbWcpodwzbzijY/iuEYIkNO
         DtRMmQABUM7IfbI8wXTbMR/T/2k3LrLICoaDzIAhuDL+H2pcW3zULb3WemuHb6CVMyOy
         NBh+k6WLXtC62G1Z3tJFnozyasl3X/9AInT+PM7wLqUkKlOsm1BFVWMazQHyD93E9FQ9
         h417s2SK4yERe10W2FDqPiPwyuXnAdSz4RKgqytBhuNkR2n/Rf92fFVxKyiSMbadc1gu
         GGbf18sZYrJGsTcdiGK96jZnPonSYEGUjFWUBW0uY2iYmhX9RwRlfQ/jLHaVPm/CKszG
         HWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781649263; x=1782254063;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MD5iZFuM9ZopY66WGxBJxUk9sqbEsapLkycXT2EpEGQ=;
        b=k3iKutso5bRhepw7IsovnGbdCR7zIy/3Xcgt0KLK2+/fOk5zbeq/QJathhlfhPPKyY
         iX4EmOsOC7IclcUc2e++61TgemxYJM/Iz0OxvM1v8VDSFbRykuckCLsjWJ0K20J81xb7
         yg9XqMbW95waM5a7UTR6Hg8emm9RtWSX8Or2x2cu/etMnwPZSww2tGANyfUkpnjGpKC6
         GOM7Farqr/6AC8x3f6CawLOdLqDQGS+tcSFT3o56ykDROYKsbKlivw+2l9Pt9QWaXJYR
         k8QHQrQDQeileOb1tDeh6nb/kbE0ylmHDA6sxue6hbmAyz2c4nNyBCdL8DaoUZecN4tu
         PztQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GX4HksiewiKthyxLrn1DG160/bwHIeAY3tmBD8pC1JqupyE9NONXiAgaGh56BNTOedw149Gz6KCsXSgZwrpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZpwj21obwCfddGQS4nyzK8S248pKkFROhrr443Rm6stopjzD
	FIr/Dn4/7ub2Xzx9ZeqFrQZb6DH29VRJIa89ALb0bHU5Bn7sbYuC8CEEuicLdUpDAvU=
X-Gm-Gg: Acq92OF2GO0R8izcfowtbpMIVZhwwaI9e/PEq3ASaa5rh233wJRCfJmtQ5P5cDgIHyr
	989J0WbyO+Zpx9fzTHSz3fBIpQdHOzjqeB2tJbqDgMuwvs2ECB33NPlql42CtD6SgEi9MrP9r93
	YvJYkIkALSa3ly2aqqgBhbsvfCRDvCpSNjXhcjGwr0j9GBT97E48H0m+V/FZ0mux9f0Mvssqase
	hbCdrSR3zfwV5f5iGVOBlC7cOR+KAu+csWCFXjlnSdA/nLmOGlEx3JT17YkfBDrE69tnmAJOa7q
	0HHO3/btk4s7ESj4EloKI/R8uUsFUcUnNBS7BcZXZUrFayojG7KMvtlxH3nLrtmgxh/aS3g7vHY
	3n2s6gD/PJqROvyJdC5gVpoqVZC51/q1prkk8syLZks9vD23taa6j/D+TVHDiL4y40/532dAktu
	k3h5FT
X-Received: by 2002:a05:7022:6b82:b0:12f:c7c3:f5ab with SMTP id a92af1059eb24-1398f66bbd2mr534919c88.2.1781649263283;
        Tue, 16 Jun 2026 15:34:23 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1a8e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97570asm14146633c88.12.2026.06.16.15.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 15:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 18:34:19 -0400
Message-Id: <DJATYAJ7LUNT.NHNYXVW1RTGV@etsalapatis.com>
Cc: <pablo@netfilter.org>, <fw@strlen.de>, <phil@nwl.cc>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <shuah@kernel.org>, <kartikey406@gmail.com>, <coreteam@netfilter.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Cover small conntrack opts
 error writes
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, <bpf@vger.kernel.org>,
 <netfilter-devel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1781586477.git.chenyy23@mails.tsinghua.edu.cn>
 <c4c898dd23181b676ebf6b6b4d9c54f51bb69c75.1781586477.git.chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <c4c898dd23181b676ebf6b6b4d9c54f51bb69c75.1781586477.git.chenyy23@mails.tsinghua.edu.cn>

On Tue Jun 16, 2026 at 1:42 AM EDT, Yiyang Chen wrote:
> Add a conntrack kfunc regression check for opts__sz values that do not
> cover opts->error. The BPF program initializes opts->error with a guard
> value, calls the lookup and allocation kfuncs with opts__sz set to
> sizeof(opts->netns_id), and verifies that the guard is still intact
> after the kfunc returns NULL.
>
> Without the conntrack wrapper guard, the kfunc error path overwrites
> that guard with -EINVAL even though the verifier checked only the first
> four bytes of the options object.
>
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  .../testing/selftests/bpf/prog_tests/bpf_nf.c |  6 +++++
>  .../testing/selftests/bpf/progs/test_bpf_nf.c | 26 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_nf.c b/tools/test=
ing/selftests/bpf/prog_tests/bpf_nf.c
> index b33dba4b126e2..14d4c1793aed5 100644
> --- a/tools/testing/selftests/bpf/prog_tests/bpf_nf.c
> +++ b/tools/testing/selftests/bpf/prog_tests/bpf_nf.c
> @@ -5,6 +5,8 @@
>  #include "test_bpf_nf.skel.h"
>  #include "test_bpf_nf_fail.skel.h"
> =20
> +#define CT_OPTS_ERROR_GUARD 0x12345678
> +
>  static char log_buf[1024 * 1024];
> =20
>  struct {
> @@ -119,6 +121,10 @@ static void test_bpf_nf_ct(int mode)
>  	ASSERT_EQ(skel->bss->test_einval_reserved_new, -EINVAL, "Test EINVAL fo=
r reserved in new struct not set to 0");
>  	ASSERT_EQ(skel->bss->test_einval_netns_id, -EINVAL, "Test EINVAL for ne=
tns_id < -1");
>  	ASSERT_EQ(skel->bss->test_einval_len_opts, -EINVAL, "Test EINVAL for le=
n__opts !=3D NF_BPF_CT_OPTS_SZ");
> +	ASSERT_EQ(skel->bss->test_einval_len_opts_small_lookup, CT_OPTS_ERROR_G=
UARD,
> +		  "Test no error write for lookup opts__sz before error field");
> +	ASSERT_EQ(skel->bss->test_einval_len_opts_small_alloc, CT_OPTS_ERROR_GU=
ARD,
> +		  "Test no error write for alloc opts__sz before error field");
>  	ASSERT_EQ(skel->bss->test_eproto_l4proto, -EPROTO, "Test EPROTO for l4p=
roto !=3D TCP or UDP");
>  	ASSERT_EQ(skel->bss->test_enonet_netns_id, -ENONET, "Test ENONET for ba=
d but valid netns_id");
>  	ASSERT_EQ(skel->bss->test_enoent_lookup, -ENOENT, "Test ENOENT for fail=
ed lookup");
> diff --git a/tools/testing/selftests/bpf/progs/test_bpf_nf.c b/tools/test=
ing/selftests/bpf/progs/test_bpf_nf.c
> index 076fbf03a1268..df43649ecb785 100644
> --- a/tools/testing/selftests/bpf/progs/test_bpf_nf.c
> +++ b/tools/testing/selftests/bpf/progs/test_bpf_nf.c
> @@ -10,6 +10,8 @@
>  #define EINVAL 22
>  #define ENOENT 2
> =20
> +#define CT_OPTS_ERROR_GUARD 0x12345678
> +
>  #define NF_CT_ZONE_DIR_ORIG (1 << IP_CT_DIR_ORIGINAL)
>  #define NF_CT_ZONE_DIR_REPL (1 << IP_CT_DIR_REPLY)
> =20
> @@ -19,6 +21,8 @@ int test_einval_reserved =3D 0;
>  int test_einval_reserved_new =3D 0;
>  int test_einval_netns_id =3D 0;
>  int test_einval_len_opts =3D 0;
> +int test_einval_len_opts_small_lookup =3D 0;
> +int test_einval_len_opts_small_alloc =3D 0;
>  int test_eproto_l4proto =3D 0;
>  int test_enonet_netns_id =3D 0;
>  int test_enoent_lookup =3D 0;
> @@ -124,6 +128,28 @@ nf_ct_test(struct nf_conn *(*lookup_fn)(void *, stru=
ct bpf_sock_tuple *, u32,
>  	else
>  		test_einval_len_opts =3D opts_def.error;
> =20
> +	opts_def.error =3D CT_OPTS_ERROR_GUARD;
> +	ct =3D lookup_fn(ctx, &bpf_tuple, sizeof(bpf_tuple.ipv4), &opts_def,
> +		       sizeof(opts_def.netns_id));
> +	if (ct) {
> +		bpf_ct_release(ct);
> +		test_einval_len_opts_small_lookup =3D -EINVAL;
> +	} else {
> +		test_einval_len_opts_small_lookup =3D opts_def.error;
> +	}
> +
> +	opts_def.error =3D CT_OPTS_ERROR_GUARD;
> +	ct =3D alloc_fn(ctx, &bpf_tuple, sizeof(bpf_tuple.ipv4), &opts_def,
> +		      sizeof(opts_def.netns_id));
> +	if (ct) {
> +		ct =3D bpf_ct_insert_entry(ct);
> +		if (ct)
> +			bpf_ct_release(ct);
> +		test_einval_len_opts_small_alloc =3D -EINVAL;
> +	} else {
> +		test_einval_len_opts_small_alloc =3D opts_def.error;
> +	}
> +
>  	opts_def.l4proto =3D IPPROTO_ICMP;
>  	ct =3D lookup_fn(ctx, &bpf_tuple, sizeof(bpf_tuple.ipv4), &opts_def,
>  		       sizeof(opts_def));

