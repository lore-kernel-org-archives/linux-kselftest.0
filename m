Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64603B9930
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784328642; cv=none; b=pM+4mik1m8gOAzWFSXUV/abtvHw6l2LFcN516mxps5vscYfg++9eDUJdR8dj5XaRnvr6PJwC8xhU03xYm5lGHWe/FoixuX2MasRoUDi5xNwMSQ9RXc9Wga2CiYNFmiAJUTZZvHl2GiZdU1Ly34b+zzSHUCqKl+eW9q0hc4kFfKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784328642; c=relaxed/simple;
	bh=mgW5hkyyFlTa2qahrjW8gwxDfjHXe+8J+zMvRUWc8T8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=QPvGDY1ORUjqpQzA2nkRv9yMVHCdUI8RsXCcHgRmW3w3TMPC8FppCOBpr9NDhIp7X0sJHslEn/rkCYXnkHetbfBGPiFcuY8BS2Yxhym0GvLlXBfV/sWymuCNHni+OLte5n9LhpKVPUs7yIZ+6Un7rtse6MOljU5Bl1EkqyexeAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=VlA1K9zm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="VlA1K9zm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caed617615so94630095ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 15:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784328623; x=1784933423; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQB1kLibm+mqIDhPJ2Qg7uWSr1ECEky8yQSVMXEwy0k=;
        b=VlA1K9zmm0U//B7UV8CxAtwslgtfPjqOb8LYR/FSICAPDO1ecOdrLMQiC0uhsRxvyD
         qm61Wevt4JlmW6U58u4BhN3V0dV7KNmurGoBnasFmbf7/CgVs2OmSQZKFSjnn7wGgxwl
         ZK0wfNBNrx0BOR2YsDjVRNBa6WdVckSmngGPX0wQyrH4Givl4x1Lyxfugacj0TrGAG7+
         5Yrx1KumG6sKYj3ewliroVWBpprAl6ApzhinrH657+OhXTR3Iz6wMtNPKZBES2zNHA2d
         g9xvq51R7dQM4rJcbRfwdKcvwn/5r1K+zwAcF3AgQNs4bJZCoZSHx9z18lez6gnTzUIE
         IuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784328623; x=1784933423;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQB1kLibm+mqIDhPJ2Qg7uWSr1ECEky8yQSVMXEwy0k=;
        b=oh8ew/VufjBmmCOj/iviwj/5O0f9aB4vMQudweevkUW9vP+SiqqUNJ5pfwUJ0CdeeY
         nNuxuV7uCS7319mmnex0ZWh8h81uBV6OXTBdrGvLsC5FQ0lhynvuLCTqolaz+eiPRP5a
         RkbETva93FSnRK8Mg1oStIF7H7ZIC6G2usySrYaRox0u+ammPwrxQCc/IdEhkAqjjjZL
         Ca/LJKj9z15vAo1P8hxykwyoi4YaCcEJ1CK4azTPPbOJpIR6XY4w3nqYNagTfh8v3QGF
         H2qBHfx6ZdnYPvV62SRY9WHe5alwtaX7kUtLxU5mdmF/UM9mP37WFkZNaVJ5waIB3Bqx
         SnEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpib0Sd+QXRG4Ytv8k3xB7nrYom8rdbCiU+4NCs7CjmWI2txW2ifKamxwVm/r8A7zCvx4Q6npiXT41kniVlaNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxtrtjpUl+1r8R7/pSIOjWmkIe5/437DdaHMUTjfEV0zOAS2ch
	ODAvSdw02MRGUtnDfshXRCdkhlpQ7cjQoMNcB4lOZrIsY97wzpIJkGKzZRcXGMTiisg=
X-Gm-Gg: AfdE7ck6kLtOUfcs+CxssfT0hIXmy4CrESahkJk+tlEbBMwtajwJ5TdlcIl4Kr81SHZ
	YyrCjsku/PicQG7YlOxGRJQ7rEMKBMUgS3XiMedfVHzGEgd339KdFcNIMj36YgQBUZsmgiRvMcU
	8qgxWAhZqFJD4Y7Qy5hOjOHwR6SG+M1q/Z77XlrhZineJwdjCMtnt5VmyRuPlpR9+MWYsh7GgdX
	rGM3wmWlKErrIDG5mx+e0F/BObx9AtosWRMAHamf616w2IrSeUd2+jV1A5o3YMYJrnWHTJQO9UX
	dYn/oFqGjiZNzJsMNXXzvKtlo6XdRY+iHv5f6gaJeJGS5Teq47eUzYm0uvUdzVL4CyFlOIpb+KC
	pCizqFvM0Ft3KKhVoM8/hvwkuHiItfiE3epor8n/cTzUSQifEn5jmUOfGQ48=
X-Received: by 2002:a17:90b:3ec7:b0:38e:581:3fcb with SMTP id 98e67ed59e1d1-38e4b5ab06amr4971934a91.34.1784328623407;
        Fri, 17 Jul 2026 15:50:23 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::f5f9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm10910203eec.24.2026.07.17.15.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 15:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 18:50:19 -0400
Message-Id: <DK17PFHSBPNW.2MVGOS5KEEBLI@etsalapatis.com>
Subject: Re: [PATCH bpf-next v10 8/9] selftests/bpf: Test verifier log for
 global percpu data
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Quentin Monnet"
 <qmo@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-patches-bot@fb.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715153254.92010-1-leon.hwang@linux.dev>
 <20260715153254.92010-9-leon.hwang@linux.dev>
In-Reply-To: <20260715153254.92010-9-leon.hwang@linux.dev>

On Wed Jul 15, 2026 at 11:32 AM EDT, Leon Hwang wrote:
> Add two tests to verify the verifier log
> "R%d points to percpu_array map which cannot be used as const string\n".
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  .../bpf/prog_tests/global_data_init.c         |  6 +++++
>  .../bpf/progs/test_global_percpu_data.c       | 23 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c b/=
tools/testing/selftests/bpf/prog_tests/global_data_init.c
> index d4405646847a..598b7dde6581 100644
> --- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> +++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> @@ -278,6 +278,11 @@ static void test_global_percpu_data_rdonly_direct_wr=
ite(void)
>  	close(map_fd);
>  }
> =20
> +static void test_global_percpu_data_verifier_log(void)
> +{
> +	RUN_TESTS(test_global_percpu_data);
> +}
> +
>  void test_global_percpu_data(void)
>  {
>  	if (!feat_supported(NULL, FEAT_PERCPU_DATA)) {
> @@ -293,4 +298,5 @@ void test_global_percpu_data(void)
>  		test_global_percpu_data_rdonly_direct_read();
>  	if (test__start_subtest("rdonly_direct_write"))
>  		test_global_percpu_data_rdonly_direct_write();
> +	test_global_percpu_data_verifier_log();
>  }
> diff --git a/tools/testing/selftests/bpf/progs/test_global_percpu_data.c =
b/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
> index 54380dfb11a5..b852a0b07508 100644
> --- a/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
> +++ b/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
> @@ -30,4 +30,27 @@ int update_percpu_data(void *ctx)
>  	return 0;
>  }
> =20
> +static const char fmt[] SEC(".percpu.fmt") =3D "data %d\n";
> +
> +SEC("?kprobe")
> +__failure __msg("R{{[0-9]+}} points to percpu_array map which cannot be =
used as const string")
> +int verifier_strncmp(void *ctx)
> +{
> +	return bpf_strncmp("test", 5, fmt);
> +}
> +
> +SEC("?kprobe")
> +__failure __msg("R{{[0-9]+}} points to percpu_array map which cannot be =
used as const string")
> +int verifier_snprintf(void *ctx)
> +{
> +	u64 args[] =3D { data };
> +	char buf[128];
> +	int len;
> +
> +	len =3D bpf_snprintf(buf, sizeof(buf), fmt, args, sizeof(args));
> +	if (len > 0)
> +		bpf_printk("snprintf: %s\n", buf);
> +	return 0;
> +}
> +
>  char _license[] SEC("license") =3D "GPL";

