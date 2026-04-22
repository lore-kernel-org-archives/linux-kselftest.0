Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DA34753C
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 21:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776892893; cv=pass; b=c8wXRCn0YhcrsO7UmRfJwhpfUkIg4cBvf7voCG8nRew1ttAAYySCPCLNdK4jrVCNNFGpyhXgiaC/8UrUSd1aI4+0V/V2mJZW9E/0UDUQJTPRnrZJJ2iesIYNswMoTS3LL06xrJFHM5jRhyF+o35Vky/kwAem2uR98Y79VdnnWvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776892893; c=relaxed/simple;
	bh=9zguB9XlBxZ6vFmLEIJe1T+7HqRL81DEg3F1nGal+lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ap+bhIynOIByt0S+o+H7771LBjim4KSOCEqVLWmkp6RvtwpiEJi05ytRf032RTPypbmMm0c7tdTPXyt8uZrSYFaOwbz4bBWvD81ORixk5FsIOyGJXhFjVs9wdoRQjMIYoDXjAvMSn7vO2EU6wgbjOHMsFYR/9Ay4MlDk6TWApDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/+nCvji; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/+nCvji"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483487335c2so58704265e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 14:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776892890; cv=none;
        d=google.com; s=arc-20240605;
        b=czquH2wJwWHhFpnMXd93laJCSIMVd15BW6dRsgm+RRbFwPL4O3QDeoCOI/OM3O29IU
         WtMn40BlpgEAFjKeeUQvU60/NNP0s0xdvUI9KWkCMo9OaOXiskY9HLTBKpveFW1FaInY
         bHiiLjRPhWB1x902mcJlFjVPh7lfiAUbhyCHMV5Kv/Dqi63Ln9BxOP4wJedK3hap275C
         yDVYleafMQj5ycc0ZOSz84Xjwl6QTUiWHGtOuTba5SR3WfWY0IvbnMPVW8dez8hXPB9J
         r7dAPZKW5Qyk7LqB3+/W/0FUjyBQYqJ/QuNGC4H3PrIJINqLhbHHvBdJdEPeSduOrpjl
         05wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NZuBKfQ2MgYFhVF7PmHxZk/nfgb4kJA+rMrnGSvhZOs=;
        fh=1Q9Xmw1kxnwaytna4GPFXOo3htNDCicAl826syArNmA=;
        b=Ub4jXiZRsFlRXu8KdsaKa5C9LsdjcbL8nSKecncvLZRrH9YyoC9SKtytQdSjgdN6IY
         1nxpAtNzs9pvP5Ymj5FKtMzAQHRpm+HIaw3t/JpvDpizJV7KphcVgdiTCJNIRrphNOy8
         f27YxA0WBTwlJEj33WWdjMVZ4ll98qXQnMn01SUThNNl+F/Z694aCKvoZ3lCbSjb+u43
         5kwr2RkFSwWGQWa9dmZU8kzuU1X6+f669oXcehMVeZ18YcXBiLpJ3NSRFPxMAhnmDTnK
         hN89mIGeXr9YuGv6A0swh+uZaw3m/nAeO1A7SLEL+z6KTb9IBqS1VgdLVu8N/QX6mg4I
         l6sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776892890; x=1777497690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZuBKfQ2MgYFhVF7PmHxZk/nfgb4kJA+rMrnGSvhZOs=;
        b=o/+nCvjibiiD/2Gf006phWN/GEl/Ug1+VSvj/Wzal2BvpUFCQl98dMvKP7yHSi6UwA
         7dFOPCRojepDj4uieYG9n3T25XlbuSSlzk+4MV3gX4bMJzXIResjp0IoPqz1ZGtfbKW+
         mRLw4Lj531+xK0L7LPNq3889wROB5dMASZZKyMXnDYRvvPWhD2Km2HgWegF/MQURLCf2
         rwfvEA/U4AaNPkW5BvikSCAN6L2mHM5wXyNmFDpcVgbVWPyKGICnVUNHGsOGZGywX1rF
         XnbolghlDJ7qYaY88kV9UL1JrQ4orTDtcxEbc5tFLu6q9pmfm1+Vh64NTd0PpEnN0zBs
         ++3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776892890; x=1777497690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZuBKfQ2MgYFhVF7PmHxZk/nfgb4kJA+rMrnGSvhZOs=;
        b=QalPM1pjJxrFzTwFDvMQ/Q4Svg+Fbo73EskLRAkY/SdvFWAcDufATZmDtZ+W0yAwGG
         BfwZnkcbuSdwMLVk4zFFY32V5ftrZtLTtZ/33eb+luL7BwEXE0SVBPZuL81Q2R42TuRX
         KceUjFQx4Bh5s70OI//vR28S+/fSos0oIAnFw63x+HK20Qtks9oTSso/cMdVBsko1UBb
         DndhFd7KZtIW2kEYKs7puQd1HjGIax451crhwQ7tNvCq2G0gVkIr8kBPKXDpwP8pt9Zd
         hVWJQXGR/LmXN3Fh6nas/fCGXIa6JKN6jwPiQ1fJvd6soauggnvLbVOZZiGcHuX8xii8
         JmKg==
X-Forwarded-Encrypted: i=1; AFNElJ8q10CSNX1+8geyubeUwczjYn1UtYa8GiwTkXBY0FedLFsKA4dXPoeXPQzYKAQ1KUw+AvYqip+3t/7uAN5uzgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrCJIEWHHLgB+J8gnyxdCDovHpZCT3yFfcylrdsNky3ZzSuF9
	z1cYSU8wZxVL/IWai9LikPiKESCH+PCwZFkuo657WIGnkApAFJBN4NwOBx9qclKMBduUxvLPjSC
	8zLu/CkPbbudasd7nkGIB1FL/PKmoPMY=
X-Gm-Gg: AeBDiesT0RQVWtv+w5z+v5yW6hRXAC6Rw5yd9NY5i5pu6b7hx1aCH/YvCqcmpwaOE12
	Jhj1uxJXdO1a6E76qIK6WtjXi74agAlgVT85XNgCv+ArCi80KJkyg11qhnOqxbj+rKxsg7yxBIh
	iFHPkwdNcWxOsgfgP8Ao6wD4k8dzVqZT6L9PMKhKZVFH29VF+huLB9u9tFw6xfIaord7ZOgqub0
	u7uLic/rrvvtO9iljnLMkmx1qA1cR7+vWgb5/1tvuXzMUMnZCC2wLp+iYpNl8wp2bBHw1qeDsVP
	RsYkP3fm+xQrECxyVk1AOUIqpHrZgppNjM5H//UzDEsCpez8aLTvNIPghFHib8rRl1Jm4P+BP7c
	j92s21yY2Z82Zjna+48TN6NEMWJhlxLy3WSXB
X-Received: by 2002:a05:600c:8b8c:b0:489:1d74:56d with SMTP id
 5b1f17b1804b1-4891d7406famr223100405e9.29.1776892889976; Wed, 22 Apr 2026
 14:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422183757.15069-1-suchitkarunakaran@gmail.com>
In-Reply-To: <20260422183757.15069-1-suchitkarunakaran@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 22 Apr 2026 14:21:18 -0700
X-Gm-Features: AQROBzBKSX92AyAmrbDljEpz9q61ZOj6nh6Etsr8XmHktjELlJWEXlMnmFrN-Mw
Message-ID: <CAADnVQ+=iEmyf-=T=V0oW2aK+dgx4S0CbAAPi4pSg=DnaHNFoA@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: replace bpf_probe_read_kernel with direct access
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 11:38=E2=80=AFAM Suchit Karunakaran
<suchitkarunakaran@gmail.com> wrote:
>
> Use direct field access instead of bpf_probe_read_kernel() for
> nlk->groups[0] and inode->i_ino, and clean up related code.
>
> Removes obsolete FIXME comments and unused variable.
>
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  .../testing/selftests/bpf/progs/bpf_iter_netlink.c  | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c b/tools=
/testing/selftests/bpf/progs/bpf_iter_netlink.c
> index 00b2ceae81fb..5930bf8899d2 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c
> +++ b/tools/testing/selftests/bpf/progs/bpf_iter_netlink.c
> @@ -17,7 +17,6 @@ int dump_netlink(struct bpf_iter__netlink *ctx)
>         struct seq_file *seq =3D ctx->meta->seq;
>         struct netlink_sock *nlk =3D ctx->sk;
>         unsigned long group, ino;
> -       struct inode *inode;
>         struct socket *sk;
>         struct sock *s;
>
> @@ -35,10 +34,7 @@ int dump_netlink(struct bpf_iter__netlink *ctx)
>         if (!nlk->groups)  {
>                 group =3D 0;
>         } else {
> -               /* FIXME: temporary use bpf_probe_read_kernel here, needs
> -                * verifier support to do direct access.
> -                */
> -               bpf_probe_read_kernel(&group, sizeof(group), &nlk->groups=
[0]);

Please stop sending patches to remove TODO and FIXME.

pw-bot: cr
