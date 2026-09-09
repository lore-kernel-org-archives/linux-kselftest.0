Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D52BE7CD
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 04:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788928706; cv=pass; b=osIdgu9YAB6Tzc0a4YhW/0CQyZWDmQK39xa9Zvyzuuw6VnTyJxw4hP4FYhfPWfuSNxF86qrPtN2kZKU3LTB1jwkGxVLF7F0XIQfs9XJrv1Vm9XA1Y813whz2KZOuUhTOqgg+XRoLf8aoQWTCBw+c4rBO8dYf9/zOs7Vy89rhE4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788928706; c=relaxed/simple;
	bh=/+3eKYYz03dUBjHcHqHQIQKyut0iHUO9Sr1nrn4fiWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qORGfZch3ZRYLdGuHVPa93py/KSaBqbgmxMNX9hoKLdupbKHc+slfMMxZmEU7CF0ZyGyUsRHsgijzCneAPKzquQpjloty6YEeV2M+XvMGb708rcJ7zsrLyV/mCEf2eZW7svG64A2d5EUgGXgt9/ehBKPffoqmpkyC0MaKkIeUH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=G+slYNMJ; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="G+slYNMJ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8588583a7c3so55276607b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 21:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788928703; cv=none;
        d=google.com; s=arc-20260327;
        b=H2CRIR//oiD5Al6f5PO5HmWuud0EVM9iuWPzw3Mz9UVJAmKwXARkwmY6Uz3P42LshC
         AcZTP3LmFxEnAUY+vc9It8waLGfbwYdaUCXkRWn5veFIFJH+FwVo+xIYVhfMmGyi4e+9
         o0mtuwouN8XPe8EsSe+/3eAHTMCoVDQy/ktruyie11gA3ATP7YHaSBog+M7w4EL3S/5V
         SnqD7QIAzsS6SlVMKiLqd4Lmem4TIM6WnyxXHEiZmbxXP/zsBByv3u6Xfx/8wNsTnweB
         34A4pNYwql49aqg8c+VViqUc0hRDYGYbLxk2Oz9PKqiuJMQtRrMgTvAiNcVWIHiSEjlq
         V38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        fh=/x4aBKbJhnDh7gbIXrWmKCCqU8s53l2Hjp5MWdVi2ok=;
        b=Hz27BM8PY+tKFe6PN7vihFMO+BlYcJBCzlQpvRnUsWsqeapkqRVk47UoysPMy1bLQP
         m+KA8Hc5JvmnFdFlj+EotVrVj983muMrVqfj7oLZE3yl1ujXCsDnfFwdPrXls36ocsip
         Y4iYdhWbHQtgAMPSPhyeK2yAcezAXBW+izOVQ0+VVRE/F0N71OpxNvr7tUtDkN6HIttF
         cS545t000a1oUmLK0vucidmP3uQ6+fOUgLSDIvKPAw+zNgJfYgBK2gc74VZnmszvX9j3
         3hwfi6+tnXIX7MybAhLY1GTHD6bfeePIAPC4iQCseUfyj5m9J4D3qML+5c9hVUD3YTN2
         PIrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788928703; x=1789533503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        b=G+slYNMJ4NeYNov1rDcn3MJkqULMh4eAK7gcukOQB6HThKx6bB05QZKrqxMyyNZDg6
         qQ7nlvJQp27dtcDujIxhQMxrNeKZLOKfUDGMeyKDpOoKLk+ad9bSIcI6ezlT7yHqihsk
         h0Z9SjcyRDJfbVk7Jgx28PATGsWAs51SmRg95r0crWFucxkJW8J1+uEaU+5sr50mvVGO
         BJnLvXTi9B1YqaxczK7sUZF1nJGRAh8x7jTDRAi4DLB9+sOju+Vx8XMcD7aVlcEZE98h
         u+qKtDkafzy077tmVLUxRqtWLbgCF/FbzhwTCAH6OaWKd9dYs3x7OqEmuwpwC+Df3YPo
         UjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788928703; x=1789533503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Teu6cC+d3LHtdtN3ePnM4eTc17lML+xatDJgJtdz0Ns=;
        b=DFOynu+R5hCOC6+aMtaYEj7q8BL1sCEj6BuDBa/85Kk4gKpGMTc7g+v8jSxseKHkhx
         3VceOspk3Qt5ohb2zfej8lh8cyZBzVH7EYQizS02L/aXc6d2bpxXfA6NnED/4bxvXqWa
         OZnLpjS3Wcq/SVtOTCZWHJ0tWdZmoVLWa6ERNmeAstlcQAAFFwX0uUYOoB6CVc8yNNeE
         Ui69oZLX/QDPQ9SMGEWfnMlGXrdGWaiZJlehWjw/H3g9pD3HtwSOFltBvWbMChVEpfpt
         Jcc9OPMYNfCtd1gpQSzvYaPq7R/VcWCRRJwx+oXwBYG1GyThrDntSfEBzVJVRmQWgMIa
         s0ig==
X-Forwarded-Encrypted: i=1; AKwUvBxuqUxYJuDPg77GyE5JCJja7elgdNrcjKJG8o1lPsXxA39k52bsI/nNjQwqi173q5nVarhaMTthj6Z7LOAeBLE=@vger.kernel.org
X-Gm-Message-State: AFuF++mm5dJQpcK5qGcrkuslUuepKU5hxFN26ODJl+6Pm0rLVlYX2Y9/
	OgIIzOUoz0e0mM79Jq9C17+QDHr2p6fWpdAbiD5rxTPTpvxBaE2qyj4ODudvk2CtYJKMrb5LMMr
	AXhOzJhYDKt1tybGiX0Y6NnffHY2yQb5IPwrdCNoodQ==
X-Gm-Gg: AYBFou0R0OkJ0qZdvzryCxWqx/xklinQntRZnY1aM79t5rPOyv4D9pJltzGtlw2EQOl
	KBOo+Zu52aL6N1ErJP1QaIS/Bk+PNx8Wee/pHh628+qBKcH03WAGjbOP6Ks6HlsX9jvYTgCZtU5
	3qtTPNmgdA9/v/gE3p8DGRxJyHY8DbQ8nMzXCEgsKKmpckdxj5QMpEVuCl1tWLBIt8+ArDRtHAz
	NTLnUKb54TrUmO1NE4yGI4bAFAPVF6JcT3Kbqh/VzRY2ueIBtEKTd/cQLnynJEn462k3x3k+Ic/
	pSUcbmNrDhDa3YR+7qLwMoXU3Zp6wVuGslfWIsClDPdaRZX1fxmr7bs=
X-Received: by 2002:a05:690c:e3e9:b0:870:820e:da66 with SMTP id
 00721157ae682-87127d2ca36mr124113977b3.23.1788928703258; Tue, 08 Sep 2026
 21:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903150351.12725-1-colin.i.king@gmail.com>
In-Reply-To: <20260903150351.12725-1-colin.i.king@gmail.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Wed, 9 Sep 2026 00:38:11 -0400
X-Gm-Features: AcwNN1WAFyR_AVCv1IXGTjGY0PGid8q5kgFayEO3Y82fm5jIlHk6g71DHjJvDXg
Message-ID: <CABFh=a7YTi2U2-cx4b5zejWv6MXE-VG-u7K410pPbtJiw6qbWQ@mail.gmail.com>
Subject: Re: [PATCH][next] selftests/bpf: test_xsk: Fix spelling mistake
 "conigure" -> "configure"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:05=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in an assert message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/xsk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/xsk.c b/tools/testing=
/selftests/bpf/prog_tests/xsk.c
> index 6e2f63ee2a6c..772f3dd7ce64 100644
> --- a/tools/testing/selftests/bpf/prog_tests/xsk.c
> +++ b/tools/testing/selftests/bpf/prog_tests/xsk.c
> @@ -75,7 +75,7 @@ static void test_xsk(const struct test_spec *test_to_ru=
n, enum test_mode mode)
>         if (!ASSERT_OK_PTR(ifobj_rx, "create ifobj_rx"))
>                 goto delete_tx;
>
> -       if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "conigure ifo=
bj"))
> +       if (!ASSERT_OK(configure_ifobj(ifobj_tx, ifobj_rx), "configure if=
obj"))
>                 goto delete_rx;
>
>         ret =3D get_hw_ring_size(ifobj_tx->ifname, &ifobj_tx->ring);
> --
> 2.55.0
>
