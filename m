Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362A37C0F8
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 01:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781574297; cv=pass; b=jk8ex92rn73ak4TwhIMSEgb/FqVg/ElOOXoG4sCijfZsF+JVyhFi2AU8OvORCHcWcG7dtgsuKGMMxiQTnJiFQ3a/ewIkFc4eava5lofGxJ+vsPna4kBwMJA0O2DuCb7LKf32wHSLo/LHTdCk/uChJei2z+bKykBq3LMklVwl9PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781574297; c=relaxed/simple;
	bh=8tb1U1aZ9n4reEv10sQy7avbCZsN68fkX6jT/KPserc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ho9gx6LbAa/QSKIVSXtFaEFmsYRCVo3OAfXV7+4nuBvljqIG+arFB2R8kg8Uuy9xkS/j8ueCYVlwHoFCSH76RvhwU71coLbUSVhPAtiksos/ab8mBHyqox9TuStUbTZ2gQpPbaVabH6yINiFEFv5E0F++jnj8z+vXQLajNDY0P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwnPR6I5; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwnPR6I5"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7e3b2a435ecso43616177b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 18:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781574295; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8pKt3/8Xvcy1qefkq+xc2BTKoXmFCG6bGRQAw2BITUxZGitboJzIL0Rpl3wH8+802
         GWXI4Z+SQQbg0lmD7i1MgxCFjhjM8Btd/RhqtMBkjJ4GyQmOZ/5+Prf/7g/v7ARGIPin
         n/23s36IonYpguDmA6aqiaJ9FsFy6u+Egrc4AAgAXKgBfR8uaobh6QpGbRG0TXv05uNg
         MlrGWD+T2FEu+Bbvq25aFc0CZYAgebRuoaOFADA44zKZP26N/xrZ7JlLzd+NMWivea01
         CeskG53c+yVZ9drKcERMnjGIxIDKZJKzG3u2Q80clq6dt4cGriFCiP6Nt2VcIsLL/JoK
         cE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73H1rmBZsR9HB0wLO22wKQ4YOh6GObKN7jR8HYwzlak=;
        fh=T4SsCNVB23boyrulUklW2pTdn5Ayl9zTBsfFsOAG4DI=;
        b=DKXGptjneUm4L4hxBJpgYnkaY7rZjU5uLBCpdyfe6XRZwRA6mH5t0amibTcmUEwUXC
         p8gNNZBFFjRZHsW61JmkxjgaOOifNu8aA5QMvreimSG0sbPmI+Vlee/3SrI7pz1FeIkE
         lhdbGDQ5EZfB0/BErMdBn5taT88fXA6zACreTmPsL0z++qtDtI7mH8I89ZPGRiazDmvv
         CgTP2MlLPqq3fVNzVk63d1KYK5Dmu9Ui/EDUJRblevG6/b0JUjE+YSfTpvYsG8lGxtQG
         FR0ijJ5VLaY1TB4M36jYV/hu/QcKSRVFDCRJNIgyyYRyH7ooIn8pe8vpgvPUuzb9/lvW
         FFpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781574295; x=1782179095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73H1rmBZsR9HB0wLO22wKQ4YOh6GObKN7jR8HYwzlak=;
        b=OwnPR6I5iIs3RNyIl7li/ifWPBaRoWSLpVjjuEyDVWS62jUrE/MoAVNMhCMGpbIqrE
         /2i6BuHuX5b8az7Yo1OrPtmAge1WunOi45at90gpQXXA/h+ywccJRNjhtDGcvoWRkalM
         0t8GYkldhbtUdD8qInwfGg2TvXqpUAa202NBRcM/1pWS3TcgtOwUXQ/YXcL73q8uHwyZ
         WQ88gK2/RAaSyRGDAb/uKncOtos2rQsrinmHOu8QAoAUV1OX5Ot4heHifAaX1zRLChWf
         p+itmcyBFTIaP3TS2nXxeGozYEFk8Ycz22PxffOZOP78k/qVNtZ68Yss6STa5J3UfeAr
         eUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781574295; x=1782179095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=73H1rmBZsR9HB0wLO22wKQ4YOh6GObKN7jR8HYwzlak=;
        b=WesyqaOO6v2qUBskZFsSI3mT3sHoskKA3ANMfEtFIhy/Ba11ztvrDw1hSDsF0/RfCd
         b9ZL9NO3uGs+7JBthpRqrBC14mQpu6pRaUHm7TZcDc3uVTQROPeV+R4lW2OYZRTj4UUf
         le/stwO/NI9OCO9OKKCkXXKQQYA3mE+DfjTEsLKZtCeY6GVXLPd9e3g4YliG17esALf3
         ou+c/H+xrbhIW6yV0elNI1azxvMaqIrlZkCVDcAKvkz4XR2GmmXhW/U9LBTc6vt/SjP+
         uDQtQZLbu5GQnPLxeOh/OPvKEE37yZGEEeoQE7ZTYP2ho8bQZOopNDSyxQEUxQZ3xwJg
         AgKw==
X-Forwarded-Encrypted: i=1; AFNElJ/OgBqFjqBSU/kVrW6uFPLA5xPq83wz66CaGL6CRvNIS9PCyOe3MgW4bbNeFedKoHqRidAay6i/sC0jOduHH7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JDHFzeQIs4Zgek1nEBSPaUlDreI8Oa31XnoNEmy10jOpJYMd
	e8koouf4YACG6jVc1yRqEUJKYYCakMUCkLKcHuqvQ1WppI8DWi6wR8dFLMJcqe8/f3UmqgrA6KX
	ZtjLb9561YzsCFv+Fpp+rwGSO2rmPepc=
X-Gm-Gg: Acq92OFS8OJwC6BTuTKrc5ki0Xi2xZIPtiXv6xf9IC+GrRLGDPrHxDolYK3a/Tl+mdl
	YQJtTTEm4VGRmB5aX4XxexSGMqee7K0h/utcGUelFPqUXpNM9Z0wIAtmMwPDqpOVbJLHfb9cLLh
	8YNCBRcLDtZitmPRxxc2y2q21wmkJUUDHJyhy/kSezoAPt3BsnFUpQWXTvZIj427zyZtxXpJmIj
	GZIGPh8YxgQLpsWGTcBrYFMlhmQMeUbeSSKZN7AQYCaESbn3ucU7fIP7m9PhxBxTReGo3ucnBBm
	90mFaGiBUaPVRkCXaPCFuiJYwle+y2g9+hv2DKWDMOTGEgEoOuc=
X-Received: by 2002:a05:690c:4902:b0:7a3:7ad3:3e9e with SMTP id
 00721157ae682-7f8c37d34b1mr121816437b3.32.1781574295274; Mon, 15 Jun 2026
 18:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
 <20260615073856.152479-3-sun.jian.kdev@gmail.com> <ajAIdJHvvIH9ZSrM@mail.gmail.com>
In-Reply-To: <ajAIdJHvvIH9ZSrM@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 16 Jun 2026 09:44:45 +0800
X-Gm-Features: AVVi8CfJxceWjHoo-gL6bJqNaLI_gcPFSgsxs1Oced6jE74a7o2xoyErdyfibJ4
Message-ID: <CABFUUZEkndSQyxckpNZ8tbP6_o7zL7fBNdrsWNia4JDiHD-NHw@mail.gmail.com>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Cover partial copy of non-linear
 skb test_run output
To: Paul Chaignon <paul.chaignon@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 10:13=E2=80=AFPM Paul Chaignon <paul.chaignon@gmail=
.com> wrote:
>
> On Mon, Jun 15, 2026 at 03:38:56PM +0800, Sun Jian wrote:
> > Add a test case for BPF_PROG_TEST_RUN with a non-linear skb and a short
> > data_out buffer.
> >
> > The test verifies that test_run returns -ENOSPC, reports the full packe=
t
> > length through data_size_out, and copies the packet prefix into data_ou=
t.
> > The test uses a 100-byte data_out buffer with a 64-byte linear head, so=
 the
> > expected output spans both the skb head and the first fragment.
> >
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
> >  .../selftests/bpf/prog_tests/skb_load_bytes.c | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c b/=
tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
> > index d7f83c0a40a5..134be0ea8ed7 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
> > @@ -3,6 +3,39 @@
> >  #include <network_helpers.h>
> >  #include "skb_load_bytes.skel.h"
> >
> > +#define NONLINEAR_PKT_LEN 9000
> > +#define NONLINEAR_HEAD_LEN 64
> > +#define SHORT_OUT_LEN 100
> > +
> > +static void test_nonlinear_data_out_partial(int prog_fd)
> > +{
> > +     LIBBPF_OPTS(bpf_test_run_opts, tattr);
> > +     __u8 pkt[NONLINEAR_PKT_LEN];
> > +     __u8 out[SHORT_OUT_LEN];
> > +     struct __sk_buff skb =3D {};
> > +     int err, i;
> > +
> > +     for (i =3D 0; i < sizeof(pkt); i++)
> > +             pkt[i] =3D i & 0xff;
> > +
> > +     memset(out, 0xa5, sizeof(out));
> > +
> > +     skb.data_end =3D NONLINEAR_HEAD_LEN;
> > +
> > +     tattr.data_in =3D pkt;
> > +     tattr.data_size_in =3D sizeof(pkt);
> > +     tattr.data_out =3D out;
> > +     tattr.data_size_out =3D sizeof(out);
> > +     tattr.ctx_in =3D &skb;
> > +     tattr.ctx_size_in =3D sizeof(skb);
> > +
> > +     err =3D bpf_prog_test_run_opts(prog_fd, &tattr);
> > +
> > +     ASSERT_EQ(err, -ENOSPC, "nonlinear_partial_err");
> > +     ASSERT_EQ(tattr.data_size_out, sizeof(pkt), "nonlinear_partial_da=
ta_size_out");
> > +     ASSERT_OK(memcmp(out, pkt, sizeof(out)), "nonlinear_partial_data_=
out");
> > +}
> > +
> >  void test_skb_load_bytes(void)
> >  {
> >       struct skb_load_bytes *skel;
> > @@ -40,6 +73,8 @@ void test_skb_load_bytes(void)
> >       if (!ASSERT_EQ(test_result, 0, "offset 10"))
> >               goto out;
> >
> > +     test_nonlinear_data_out_partial(prog_fd);
> > +
>
> Maybe prog_tests/prog_run_opts.c would be a better place to cover this?
> test_skb_load_bytes() is meant to cover the bpf_skb_load_bytes helper.
>
> >  out:
> >       skb_load_bytes__destroy(skel);
> >  }
> > --
> > 2.43.0
> >

Hi Paul,

Thanks, agreed. The test is really about BPF_PROG_TEST_RUN copy-out
semantics, not the bpf_skb_load_bytes() helper.

I'll move it to prog_run_opts.c in v2.

Thanks,
Sun Jian
