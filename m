Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0C4CC26A
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558488; cv=pass; b=N+PeQibBzNALnNvIh4fklyteoTnCo/B4d/BTSKCEnY9wY+EtSahto4kWwpgaJ4Mv0ukHq6r0Hvt3VX5apu56t1yxCAjL1XAAROGP4WwXdx1RlWFsydBN6FujwAmONWutuQju3E0PUpRCaJWeS0tGKbciCmr0a8maQnlEYbgU75U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558488; c=relaxed/simple;
	bh=8lQEuf+S9Yr+praW+GOTCf9ZwY8pq+0gPcT80hqP2nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOV5C/VQQhtACjhUWO2nPs0MHJWo+nandni0fJm6Cjy+l+Dtn7jLVMerL8d8XEUHz0MeRa1DcBUllZx1njccNrVoYwQNVJ5i6fwIKAaif0fXKyXO+bxUDClzyuRlxZ5Wov/HhRYYXUXwgks2RMh+NnMNDafL5B164S+UJkVDSqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WcVFVPI1; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WcVFVPI1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a18617ae90so68735e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 08:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791558484; cv=none;
        d=google.com; s=arc-20260327;
        b=h16acAH+ztERRKVtuSXSaIgmaeHAvOD0L8bvBeJ2YkPa/m+dNbDcGppgrsYkygf4FE
         9j8ecCj9IQndZRF6DNVYf4NJmcGQqHmi+yUUN7dnwvp2L2rON7egMNTxg5d3hDXiN143
         k8EuhsFyn8iGolsOhRk6UXphiie8Ox9LJMc6QjMRxDzLieODoMGBWW1fQHGbLBEGKyNg
         97FGatE5DzbT46g7k5Ah30rI7M6Jpp4/c89E7loaVkQMb2HvWOtbXJ7PBze1VAsqqu7s
         73PmO/oWoBNKheZSx7CT8bOhAAsmnN6bHGfIY5uIAtdyE4IdACNeKAsX4RBWUwg6pBoK
         Xmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5B9NDWTDoWCGkjiGw08sTP7KBdaeckYZ1pF6N1eVNno=;
        fh=CHj2l4ZsJr2Of45+hXQ4fTuntlri8AN1bHKdZ/2z/IQ=;
        b=bUruXl/4rWeI4iMTafaRFLyo8Dcpqa1w+7KNB8H/hfjQyfXVyL3ymtSVsFphML1Nzp
         upbT8bW8wxopAKRWpX1wthSQXyGw8WosMtj/LdmrLsqTkaTn22FlwjOPdZd+/UZITpMg
         6+OkCNeIplM1HnQDVvPub3AocwGp1GS3aDk0ND8BXSDJrxeAeae5PraXOJg9Js266+Hp
         noFvA6lg8e6f04FgitiCrWy4xHEapKNQnTYdZ8AsA16b4AlG2NVqoDJKHXFPIqLxE+fc
         UHdhz0+OQXgjAymzhoBLjXTQXXXoOp5JENJG4IopGZ5Kvv8/E20CJ8DhqcRzLfQ2RvXV
         6hTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791558484; x=1792163284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5B9NDWTDoWCGkjiGw08sTP7KBdaeckYZ1pF6N1eVNno=;
        b=WcVFVPI1Ayshs9wj3KuSa/05azM4soITeqpu/5ZCCcPHlky5DDySK1zQvvzUzKpgY0
         MsLzeqyB7RIzslmgI1QrGNDlLSePCIN7rDLkjF8TweFE2dxFGjWnHUxzOSRvAhKrVNZ8
         C37gRjS/h6b5u6elJ+TNdiGBC/CIlKqdiTjZWLPlN9WojoLRHucwSIyezgz71rQUbMIq
         vWB83RZDQRewI1AQAyt1TK4CJmdpkdBV2383nePv89DVxVJOfiyi0p7au9hgUc/7M9r4
         fiy5AThWArosba9zL2plML5WYrhWiyq/kz2qo+GYzau9TV07FEV8fslLxjJrwAgIO6MF
         aXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558484; x=1792163284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5B9NDWTDoWCGkjiGw08sTP7KBdaeckYZ1pF6N1eVNno=;
        b=ubiFpELLuTsQvu1q2rzl08tmJED6BJKFVBMEka2O3HXl0aFyZiZCyPIeMhJLbr9Zdc
         6S34icypSkELTr1miaW+ljRFoIG3ZoljgfByG9jHWTQ1dyW130WYyuk1R6Ih0w1dVoYG
         O8G6a30rQOdBE6pptauxIW2R7GqfCNZcA/o0tS5czy6gIkps9bbFUTq8Z/Z8DISccB07
         eaQVaDP9BN2gFqtYyi4EBnU/ddsM6PLy8oSVz1QxumXOnzEfAiIPDJZ5bWm8APtxyoH9
         n/EBes/g6Fr7F0xzYUaLxFfFbtsqMPKah2z+jii0FCLU1Cmhlpy326T676z22VSHKqAx
         QgxA==
X-Forwarded-Encrypted: i=1; AKwUvByjzRmXu/nJFMc1r8wW5kLVhMs4KrkPqHPEH4GK7kiNeTrvCr+bWnCyDWzrVAU4ED98/sj7apUwfBEtFqZfDNs=@vger.kernel.org
X-Gm-Message-State: AFuF++kBOBM4V6ZB43OY7bVUjB2iWL5FyYPOr7HhBZUnfWJdsITYMS11
	GeF2di9rOgqAdmdr5kR2VKjigtmspRQF+JTc378Bt9Hi2a88CcZ/kSV2wjz1TsfSeKLzI1C98g9
	nh9zWzmlEP/kzHw5kwl/VGwyeCH1D6GcI3uPB7UFj
X-Gm-Gg: AYBFou0O8S8wP5K+t4t2GA0QNsYR803xTzt5AioUXeHXst7dcZmVaV0QrpH+mOIIEeP
	kxpvl2cLUf9P4T1KGbMI0COn2zi9A1/5AGVRORBN6pJL3BpndNyTa5LakS4+Q96/BfIQI5AQD3r
	RxU3b9APMBupIiHoDmAUuCUPEpCwaMuBj08NVLWD1v51wnr6xMvXMI+S36X4iAiLbv3I06iJAf7
	OXGsIYqLEMOIk95/q2mwt6RPNX6W6Re1KDA3xLp+mn05bEA2wTf18Yyh/WbFfrpPLNqOO5cNQkg
	h7DzVOIBTTIgYFROPV4gx/5GGwWx2RAXD8LfmsKzlZDLJ4lmajm33zWDiotWkMkImxF1ZknTvsC
	RjmynRwGEE2wTqPm69uzrOA==
X-Received: by 2002:a05:600c:2151:b0:4a1:9034:e9ac with SMTP id
 5b1f17b1804b1-4a19034ee9fmr272115e9.14.1791558483022; Fri, 09 Oct 2026
 08:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com>
In-Reply-To: <20261009-selftests-bpf-dmabuf-iter-unnamed-v1-1-962ee94f7a5e@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 9 Oct 2026 17:07:51 +0200
X-Gm-Features: AclHuK_t9iEbDfrbBV_kHItKsjIiOteX4n4AKqToDkA1GKSU32A56GHZ4NbXcEk
Message-ID: <CABdmKX2VHqWrPb2O3Uqdccx=nP66gECU0kVc=4tZdGqSEZvuGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Accept unnamed dma-bufs in the
 dmabuf_iter default test
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:49=E2=80=AFAM Qiliang Yuan <odys.yuan@gmail.com> w=
rote:
>
> The dmabuf_collector iterator prints the inode, size, name and exporter
> of every dma-buf in the system on separate lines, with an empty name for
> the buffers that have none. The default_iter subtest parses that output
> and looks for the two buffers it created.
>
> It requires a name for every buffer, and sscanf() finds none on the
> empty line of an unnamed one. On a system that has such a buffer, like
> one exported by udmabuf without a name, the subtest fails before it gets
> to its own buffers.

Hi Qiliang, are you running this locally instead of with:
tools/testing/selftests/bpf/vmtest.sh -- ./test_progs?

> Take an empty name for a buffer without one.
>
> Fixes: ae5d2c59ecd7 ("selftests/bpf: Add test for dmabuf_iter")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools=
/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> index fb2cea710db3e..1a5dc1adae735 100644
> --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> @@ -188,8 +188,9 @@ static void subtest_dmabuf_iter_check_default_iter(st=
ruct dmabuf_iter *skel)
>                         ASSERT_EQ(sscanf(line, "%ld", &bufinfo.size), 1,
>                                   "read size");
>                 } else if (f % FIELD_COUNT =3D=3D NAME) {
> -                       ASSERT_EQ(sscanf(line, "%s", bufinfo.name), 1,
> -                                 "read name");
> +                       /* Keep an empty name for a buffer without one */
> +                       if (sscanf(line, "%s", bufinfo.name) !=3D 1)
> +                               bufinfo.name[0] =3D '\0';
>                 } else if (f % FIELD_COUNT =3D=3D EXPORTER) {
>                         ASSERT_EQ(sscanf(line, "%31s", bufinfo.exporter),=
 1,
>                                   "read exporter");
>
> ---
> base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
> change-id: 20261009-selftests-bpf-dmabuf-iter-unnamed-217561e20d84
>
> Best regards,
> --
> Qiliang Yuan <odys.yuan@gmail.com>
>
