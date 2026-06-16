Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68413DBD57
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781638598; cv=none; b=Fqj84yEZZEchPJnqcgUkUxq+/9hmGJ0ClwXZ5g1CeLVNX1EUeEZwWKmb2CnyT3fmhwlKE1vxiWnas4sD3kwozYwtQZme7sKHsea0W2xYCWPO/V/eEQo/y2kW88YBg9LhoKA4UU9HeXR2i7YeZHY586KkxkpPy2oYfhMZUsLSKhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781638598; c=relaxed/simple;
	bh=x4vuvjMjK3Siqy6TliGJe8+jhWlv6O6RxnFPsOmVF7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=e13aoDZZZvxoCUsGoi/K0Ggdh+H3MNUjwidJu8nJzjmY0dU2hZHCKi8e4jf6qquU481C4G7MuTLLY8MHbkCvAq/JjAbQMPMBoVvMMNLKEilLVsVkDsncqf8toEdYJghtfr+YF0w6lba8azZuhUn5BLtGuy/0MidtgAcRt0P7r74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC8Anh5V; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC8Anh5V"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e74a827212so2308982a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 12:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781638596; x=1782243396; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EO/9z4OOJVGQlHYYaBZaNw8VQwWazXkqSJi3LxEM90=;
        b=GC8Anh5VfSrdFDAjBCA+t3VBlW9IQNj5CS2020mtctSOl0TPtqgqnGjyN+MItcjWCE
         R0j+pM5rZJAV44nYdGQv7jC3qjGRKFk5ryfZPJP6ggkny9bOvT5PsAWDBqNcZnOUDHzW
         55at24VAlGj21mPIJaKOSHd4NigWRARptROZhFH3vPAFtWHmD3Dcc2orE/BzygvegpF8
         MYKIXU7AGLmA1BXhbVVUIyvaoI5TvJOVe0/vMdnU4AZCkGAi3uDlSMlvfvJARjsCEL6h
         eT6d5OdfnVWITLk0Pho0d6JAb83fB8Ys9lco4IUXjCHAL6DfOFBC6BEmxTmI4sb3ZPRt
         MAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781638596; x=1782243396;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EO/9z4OOJVGQlHYYaBZaNw8VQwWazXkqSJi3LxEM90=;
        b=NShmE18hEWzelM7B2pIUiTJgtVR5pOGzFr8F203OeaYGjirqzHcrFgIEvoSQllhP8v
         AqIIEZie7su1r/8/Ycj4I8VYiUj9HhqNJozm6S5RveBY4fST8CskBg/GH599UrfNG2cD
         MvsWccY87SkITeYIozY9uZVJnlpUMptMzOBIPoDE3ooV0wCHiCzMaqR5WmXkXMQObBzn
         nPb+y1JyPytc4PXRAuS+rzbuRLCib4pGjU2VUKeS+dh4JSXcK/JmY0ISuBCgjU4+1qtQ
         qrKfNTgh/W05NcJpm/tURHCQi0aYdkNU9etbJMGRKJ9skd2TrpmnB2FdhiYQTg1Ux+8O
         PEgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gajxQoSHm3YxLGUpdiktlhCTGw45hB9KQNCQoVREiChl90xIPOsQjC/ZKB/GZqwbycqmo0IVJf1yepuXlTfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsVKJ7edbzMkqDbEMBnuW+K6pQYTg+8/poM5j0iH95oPwmBxYv
	liTqc8uihi1VEatTRGakFX3OjvQkjMyNlODgLFoNLMQ49N2GPdc3WdQk
X-Gm-Gg: Acq92OELCHinH1+tjzxR7pufJC3eGMqzNGnTowniLStD4/aMZbOVaUwlq/K9NXB9r+0
	oMj2yeJU5CsBCuFLVNKSdPEYQNbud1CRdGEvn27UXcP4Y9p0GxDBWlGaKWniwjp8kMXX4qoidnn
	Tz0uYbNUUn9tc0ntv/aBJBba5Zd0Ou3OcJDCrecZdYNTrkZCrTdABdNxYuAsRYiiWqf6htTsZM5
	ZZOnHgKSXScGGgU99JIItYnRWklCg4KuwGUe3pFGEaTO9ijru/0StnoqnGJYBsg3/pJ7y8UqIsg
	Tza3ObrPMUePitAUXfYzaj/crdhkvmzbUeqpNty8XEl6ha8jvt6fT9ooLPyy/AmczYsoDakEu11
	vhmtLwM7fMUeq9iyVvdjhp2vvUaOZI1igHN1J875rqFopm9OYfCLXowFUbqR9hqZ/aIebsvuUpM
	VxrGzMTYmAj2AHrb0uxLNXHNgKAxnYRX+5gLzktrrSdTJKHraGO7ilw5jiNlR+b4lBtiKZGRm6h
	DM7fQkiO3Wx74u6xQ==
X-Received: by 2002:a05:6808:1b28:b0:479:faf5:ef4c with SMTP id 5614622812f47-48944641750mr389992b6e.32.1781638595545;
        Tue, 16 Jun 2026 12:36:35 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:53::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875ddda6b6sm4881214b6e.8.2026.06.16.12.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 12:36:31 -0700
Message-Id: <DJAQ65ZVYAN7.2Z8DNW7Z0JE7V@gmail.com>
Cc: <pablo@netfilter.org>, <fw@strlen.de>, <phil@nwl.cc>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <shuah@kernel.org>, <kartikey406@gmail.com>, <coreteam@netfilter.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] bpf: Guard conntrack opts error writes
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, <bpf@vger.kernel.org>,
 <netfilter-devel@vger.kernel.org>
X-Mailer: aerc
References: <cover.1781586477.git.chenyy23@mails.tsinghua.edu.cn>
 <70aeec0ab762aebe65129cf6052e132c7329edc2.1781586477.git.chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <70aeec0ab762aebe65129cf6052e132c7329edc2.1781586477.git.chenyy23@mails.tsinghua.edu.cn>

On Mon Jun 15, 2026 at 10:42 PM PDT, Yiyang Chen wrote:
> The conntrack lookup and allocation kfuncs take an opts pointer
> together with an opts__sz argument. The verifier checks only the memory
> range described by opts__sz, but the wrappers unconditionally write
> opts->error whenever the internal lookup or allocation helper returns an
> error.
>
> For an invalid size smaller than the end of opts->error, that write can
> land outside the verifier-checked range. Keep returning NULL for invalid
> arguments, but only report the error through opts->error when the
> supplied size includes the field.
>
> This preserves error reporting for the supported 12-byte and 16-byte
> layouts, and for other invalid sizes that still include opts->error.
>
> Fixes: b4c2b9593a1c ("net/netfilter: Add unstable CT lookup helpers for X=
DP and TC-BPF")
> Fixes: d7e79c97c00c ("net: netfilter: Add kfuncs to allocate and insert C=
T")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
>  net/netfilter/nf_conntrack_bpf.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/net/netfilter/nf_conntrack_bpf.c b/net/netfilter/nf_conntrac=
k_bpf.c
> index 40c261cd0af38..3c182024ec509 100644
> --- a/net/netfilter/nf_conntrack_bpf.c
> +++ b/net/netfilter/nf_conntrack_bpf.c
> @@ -65,6 +65,11 @@ enum {
>  	NF_BPF_CT_OPTS_SZ =3D 16,
>  };
> =20
> +static bool bpf_ct_opts_has_error(u32 opts_len)
> +{
> +	return opts_len >=3D offsetofend(struct bpf_ct_opts, error);
> +}
> +
>  static int bpf_nf_ct_tuple_parse(struct bpf_sock_tuple *bpf_tuple,
>  				 u32 tuple_len, u8 protonum, u8 dir,
>  				 struct nf_conntrack_tuple *tuple)
> @@ -298,7 +303,8 @@ bpf_xdp_ct_alloc(struct xdp_md *xdp_ctx, struct bpf_s=
ock_tuple *bpf_tuple,
>  	nfct =3D __bpf_nf_ct_alloc_entry(dev_net(ctx->rxq->dev), bpf_tuple, tup=
le__sz,
>  				       opts, opts__sz, 10);
>  	if (IS_ERR(nfct)) {
> -		opts->error =3D PTR_ERR(nfct);
> +		if (bpf_ct_opts_has_error(opts__sz))
> +			opts->error =3D PTR_ERR(nfct);

LLMs have no taste.

Above two lines could have been one helper
   bpf_ct_opts_set_error(opts, opts__sz, PTR_ERR(nfct));

Or we can do a step further and simplify the code more.
Turn this:
   if (IS_ERR(nfct)) {
           opts->error =3D PTR_ERR(nfct);
           return NULL;
   }
   return (struct nf_conn___init *)nfct;
into:
   return (struct nf_conn___init *)bpf_ct_opts_result(opts, opts__sz, nfct)=
;

static void *bpf_ct_opts_result(struct bpf_ct_opts *opts, u32 opts__sz, voi=
d *ret)
{
  if (!IS_ERR(ret))
    return ret;
  if (opts__sz >=3D offsetofend(struct bpf_ct_opts, error))
    opts->error =3D PTR_ERR(ret);
  return NULL;
}

This kind of small improvements should be obvious to any human developer.
Please do NOT send us patches straight out of LLM.
Review it first and think how to improve it.

pw-bot: cr
