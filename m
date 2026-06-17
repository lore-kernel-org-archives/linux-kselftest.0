Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B296217F27
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781706007; cv=pass; b=C/HZ+SPF5Pv6AnYh+aER+mkYptjdOGpwj4T9qcdmjvdQC0dr3EYpJK/NvTPQ6G3A4E2JcJVKFlJPI2h8iT4rs8d03DHHznHtb0xaVdf6ru5rDlck6gJaf4WdeYcRPX0yVaqUAV6Ti43kafbLQfJkUw+E4RPTDIjvVG9R1pyV758=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781706007; c=relaxed/simple;
	bh=LXjj2AX0Vl2kOkkKEFA18exaCc4ribznTBsnG03/ix4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hANPYCMVLTdHWhtPz+AEyM/7TTC/zOvZcR/4l5kNp3d1BBpbD2ArCOtE40OdxDZl9LxqEo36hkqd0QewkHigD8C5yA3lvOyg68ZwbP/NO8W8ii2zHNn1uDJV18NYSwDzLIH2kL3Dn+0Ag6CcroY1w7cnIvSD9fBvJ2D7RKsazEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n7RWfaQ7; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7RWfaQ7"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-662bb8b1f93so1649539d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 07:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781706005; cv=none;
        d=google.com; s=arc-20240605;
        b=IDITRG5R8lKvq1l7oJIhkUfOsFjiKoFqMfYlU//bKBrk0ve0ctAE8tAkv5+BiMgO/R
         ge9vCK9gogt5GiO3qQDdbZZzvNGzIkVuqgk35CZhLVhGpTG49N19Q3qJF+dyPkuZ5LUk
         fHmhzioHXe0utG7+zwR7AU38Mq6dxPwvlOKfaGj/RjJPfxFbVN6raXi2lV2iEWbBQIXO
         ZawnuskxDZZP036IThkB0wg3hZ30JoKTvtdtfQsscSMbe9C+aUP3UQ62IQ9jILXtDqHH
         kR7DL6CWshXExMODzSHf+7+wJZamav8dc+BCwQ7VqAwUYpuHQVL7Xjw5R2mXTbIggfv/
         xzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KrC9X0aB+Fg+JQYfds61UWaxCNwOvyYtowwG8v7gyUk=;
        fh=eu46Z088UpdXGfktx/1aSSnw3RP5g99amRGO48mlZy8=;
        b=aAz9iCF5YTzZLxFKQj0ufKZf8gKALh3BQLlABT2UqVUaGdsvFm4oqFDpgDlKTiAi82
         +wMh4hc/mD85pDB+QJQzQ6R1IaFpcQsRU7fORrhoRgK8Teb11esvMtK2uG7978WObyd/
         YQG2OQAzIySkoqPfPSp6C5vo3ddScCINt8SUWLo1LvAgHbG7s9eGtK8EHf38elnEgjND
         nV2hKq572gjo3jUbWgNqvEjhJrLKDI6WinksGfK/FKPUcWTdsuBD6dOu2uPk05e+DL3r
         3Ib39BrSxsfygtV+ep5L/nb+/KWA8QZvlA/p5uCdRT7uMU3eKpXIwkfee+iTYOgIUHyI
         6nEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781706005; x=1782310805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrC9X0aB+Fg+JQYfds61UWaxCNwOvyYtowwG8v7gyUk=;
        b=n7RWfaQ7ZOd2SD1V9DFHwe13YYH0VxgLZbdiRx442lRvi2cRqo9jRgUg6x24YEJadT
         odl9vzMHey4oHjq/m8RaDqVlMqUoQRKHyNUa91Tj2yXR55n2QL1cwWIP37wFW/Lp0cOm
         dOK/ZHk8uc43n0aorJgsDCRKOurioR1SxdTL3TPpGsfZOwdLnm3sZ6n+KBw9M8aToJWL
         UZyVq/Me66SZn9oWKqpoJRWCUqY22UNCh81OaG6yMCxhXeI6uoWxDdS9c4RlYzOLBSHC
         HSN9a0wG4DqgFwDs+LEkMofRR/G08PbNsMWenM3REfuI0hFpqtUBQy47iM4rL4WZVTof
         rjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706005; x=1782310805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KrC9X0aB+Fg+JQYfds61UWaxCNwOvyYtowwG8v7gyUk=;
        b=XJ9KJLnrOrLD29Q22w8M24Hj9YvioLVFM8yjFdpTHV0xCa+14oBfz4LO2wdpDt3/Ur
         bFIl26x9O5FfTIOVLyEf9BexO/QLt7gUEw0Sc/A5fmNl2IHBqPGBwVCmGyoSvl89h7zD
         HAXHhAqjx300B07E8QKfi8hpAiWHalxXzThl3GRq7shIefPGOPBucZlVY/ps3wrqazi0
         cNIubmeQiT4JBSiYqXGC1mZEp+FPlkdI3DThpVDdu8f9gYNGDpeuLCNnY7DGQJ3cDb/s
         u8hvC+EhX/yqAfwwjTVl2wPWBSEdiWBJr7qptnx2bx84qOUp2djK2f5TS4P0Kt0q0bVP
         gHEg==
X-Forwarded-Encrypted: i=1; AFNElJ+i0tOE1N/jgnoQtrHESld/3fjT5x1c+SY/G9O5UPOgw/DNCW2JjJqjZNn++6Y4+rcBT7N13rB+/jUBCEon+5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKvLh2byaHYyydgt3YoKKXivY/BCQmitkmf9ZJ5DLn7T3370A
	+l4RLjKslRQSJzvqRFPf27Tk9G8U2gU/2wJYeJC5u1ZMiPqOpmOa37FcjFihooALCjSKLFHK9qm
	IBxNiM/PejKMVQEt4tw3gksC1OJbeyxM=
X-Gm-Gg: AfdE7ckOUHu1yDpCRYADbCK2vsXU14MlRqXpF3Nc6tijBB1cz2jOKjLV4X0mjEHy3VR
	em1AVcuRJnh1R6MCjeYI2RyQeVVLaQO2So6YOCI0rixea2zIidMVG04tFestJ3DT/PDmf1kmIwS
	C8iwWKrWnkUAqWpPJcDAsXnod241FUR5ZmqSv1QlbhjfkumqYV5kU3NkZXUgq6/FjwIudl9wKry
	fP0ZC/VGx18JKQgNBQWlynLIVWbHH2pKe41syDW+QBuGeyFSHlwYhRMNSqofRmUWLHlOuVBNQDz
	B/3MNld7kp5+VCpTzKoHTD3ixTBySQLYVOzhuga2Q2aDV34W8BPDU/0R
X-Received: by 2002:a05:690e:dc6:b0:660:933d:3057 with SMTP id
 956f58d0204a3-662cd092f11mr3027618d50.0.1781706005428; Wed, 17 Jun 2026
 07:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617093557.63880-3-sun.jian.kdev@gmail.com> <2dad9b5c184fa101d7cffa1d8f5eea5b5df60f53533d98c68175c9e3ec5ee6ac@mail.kernel.org>
In-Reply-To: <2dad9b5c184fa101d7cffa1d8f5eea5b5df60f53533d98c68175c9e3ec5ee6ac@mail.kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Wed, 17 Jun 2026 22:19:52 +0800
X-Gm-Features: AVVi8CeJJOuka0GCnt7aRS0jt8X52KgHwbpSBiN7gwyo77ljDBh5CLPdi-Ab_Fg
Message-ID: <CABFUUZFeh18OjQ6EhjD17ZwQKb1aiVNkYKv-hAkVGrHhPpjE4Q@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Cover partial copy of
 non-linear test_run output
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, toke@redhat.com, 
	lorenzo@kernel.org, paul.chaignon@gmail.com, martin.lau@kernel.org, 
	clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 6:31=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c b/t=
ools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > index 01f1d1b6715a..9cc898e6a9f7 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > @@ -4,6 +4,10 @@
> >
> >  #include "test_pkt_access.skel.h"
> >
> > +#define NONLINEAR_PKT_LEN 9000
> > +#define NONLINEAR_LINEAR_DATA_LEN 64
> > +#define SHORT_OUT_LEN 100
> > +
>
> [ ... ]
>
> > @@ -20,6 +24,69 @@ static void check_run_cnt(int prog_fd, __u64 run_cnt=
)
> >             "incorrect number of repetitions, want %llu have %llu\n", r=
un_cnt, info.run_cnt);
> >  }
> >
> > +static void init_pkt(__u8 *pkt, size_t len)
> > +{
> > +     size_t i;
> > +
> > +     for (i =3D 0; i < len; i++)
> > +             pkt[i] =3D i & 0xff;
> > +}
>
> A question was raised on v2 about whether pkt_v4 could be reused by
> reducing the linear area to ETH_HLEN, rather than introducing a custom
> init_pkt() with a 9000-byte stack packet.
>
> Can't we reuse pkt_v4 here by reducing the linear area to ETH_HLEN?
> The v3 still adds init_pkt() and the NONLINEAR_PKT_LEN packet, so this
> doesn't seem to have been picked up.
>
> > +
> > +static void test_skb_nonlinear_data_out_partial(struct test_pkt_access=
 *skel)
> > +{
> > +     LIBBPF_OPTS(bpf_test_run_opts, topts);
> > +     __u8 pkt[NONLINEAR_PKT_LEN];
> > +     __u8 out[SHORT_OUT_LEN];
> > +     struct __sk_buff skb =3D {};
> > +     int prog_fd, err;
> > +
> > +     init_pkt(pkt, sizeof(pkt));
> > +
> > +     skb.data_end =3D NONLINEAR_LINEAR_DATA_LEN;
> > +
> > +     topts.data_in =3D pkt;
> > +     topts.data_size_in =3D sizeof(pkt);
> > +     topts.data_out =3D out;
> > +     topts.data_size_out =3D sizeof(out);
> > +     topts.ctx_in =3D &skb;
> > +     topts.ctx_size_in =3D sizeof(skb);
> > +
> > +     prog_fd =3D bpf_program__fd(skel->progs.tc_pass_prog);
>
> [ ... ]
>
> > diff --git a/tools/testing/selftests/bpf/progs/test_pkt_access.c b/tool=
s/testing/selftests/bpf/progs/test_pkt_access.c
> > index bce7173152c6..cd284401eebd 100644
> > --- a/tools/testing/selftests/bpf/progs/test_pkt_access.c
> > +++ b/tools/testing/selftests/bpf/progs/test_pkt_access.c
> > @@ -150,3 +150,15 @@ int test_pkt_access(struct __sk_buff *skb)
> >
> >       return TC_ACT_UNSPEC;
> >  }
> > +
> > +SEC("tc")
> > +int tc_pass_prog(struct __sk_buff *skb)
> > +{
> > +     return TC_ACT_OK;
> > +}
> > +
> > +SEC("xdp.frags")
> > +int xdp_frags_pass_prog(struct xdp_md *ctx)
> > +{
> > +     return XDP_PASS;
> > +}
>
> A related suggestion on v2 was that, once pkt_v4 is reused, the existing
> BPF program could be reused instead of adding new pass-through programs.
>
> Could tc_pass_prog and xdp_frags_pass_prog be dropped in favour of the
> existing program? The v3 still adds both of these, so this point also
> seems to be open.
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/276805=
11802

Hi,

Thanks for checking this.

I tried reusing pkt_v4 and the existing TC program, but they do not fit
the skb case this test is trying to cover.

For skb test_run, IPv4/IPv6 inputs with a too-short L3 header in the
linear area are rejected before bpf_test_finish(). With pkt_v4 and a
linear area of ETH_HLEN, the test fails with -EINVAL before reaching the
partial copy-out path. If the linear area is increased enough to pass the
IPv4 check, pkt_v4 is too small to both trigger the old
copy_size - frag_size path and verify that the copied prefix spans the
linear data and the first fragment. pkt_v6 has the same issue: after
making the IPv6 header linear, only 20 bytes remain in frags.

The existing test_pkt_access program has its own packet-access coverage
goals and is not just a pass-through carrier. With such a short linear
area or small packet fixture, it can fail before the test hits the
bpf_test_finish()'s partial copy-out path. A pass-through TC program is
therefore a better fit, because it keeps the test focused on the
bpf_test_finish() copy-out semantics.

For XDP, this object does not have an existing xdp.frags pass-through
program, so the small XDP frags program is needed to cover the other
caller of the shared bpf_test_finish() path.

Thanks,
Sun Jian
