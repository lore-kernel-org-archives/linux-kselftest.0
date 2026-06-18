Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481ED3E639F
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779533; cv=pass; b=DR5hHVobp09ez0dm62BNjhz6imNuR5vs2zeO6rRiHBvrsZ30HFlshrOCb3Nf+0ulaLn7UUMFCm7GlrssQP25eGdbSpiRHe5lwh1aS0MPQvDpL2Afx1KUAsq/EwLVE4ORWU5UoJ2cnktq6UQK6Xk1IU//FaPpsKSy/SmXDCGodfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779533; c=relaxed/simple;
	bh=yeE5VZid+PR+8xO9WKfTDka5xDLbl39UJCqmBBiuLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHcEuyS8pPETGnQb0XUupQcrCKtG0Rpn2PZkV9AiLwSrgpsQxRPkHy+fn6rN4Ly6mOio2WiyRULxxA/jdAgg04pCmfyHcXtaOJE101XUX9nJSI8jkm6uaGR11ujLU7hDyqmKMSrWkNJPSkD/42mJlmykyImsGkQTZiMoZiohv94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYvfibE6; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYvfibE6"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7e8b45dfb3dso9946327b3.3
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 03:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779531; cv=none;
        d=google.com; s=arc-20240605;
        b=JvMOMF55INbvymxkJ6iHNdQXLdC+Nd9n3TCXttm8zDH65P209bxcAgyyjs+zTUtCO/
         T4RuLHXfWDVnOMcsvz3SNf15P6s0KU9Su4e+Q9FcjuexkSBaDp5LppxK3cEGPV9ZA5ub
         86nBVPKoK5TDdRQA3k1AofDLLI1bWD2mTcEJ5vwMX+h8gZAwSI8dhNXBlGKdcQaw9tOM
         HrzMbRtos8BU1KUjpVdt/G3SYMgkh2Q83wG7AtMWH1jru4nnrkO9ZS9pdWrAZlspedWv
         blSCpDSlKcOHKKt7oVBxQgpXLhbcXkfhYaRZyf0TdM7dLTzc1xVy8pTV3swszp7sXtfp
         6vUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IAX/QMZ2lNnCR4HEVf+9VfFWBfEVxUbspDlYV1+1z1k=;
        fh=v54ufnEnWYhvk2D27A3mHbyKDTW31LBAmGGynt8+nHQ=;
        b=Xk/StH9z8tqSX1eGf8x11upe2imGme0G6zs0JfYtXIMVlJ1Lvo9EWQakX2m4g886Sa
         58oKOdQ7s081oRjNMFp1ArQDa6g48PV9nud+Ai26AlbhVr41T13fVWmY983LBVACobk9
         XGDHGRsUSQg+tisiXX3HHFtWDN6jySCFIIXn4WcUgbiBeTfRJdE76iiuW3pJoEg42J2f
         9E2jLBXNAMddT7QfBSAQ7UH65np7LHjFcElTlJQdfo77m2HV8EZSBq6ddm9VT8mrx3W3
         CjfDvrbCWi6IfOjR4wWmnxicA0xdu08J60oQ5VRhsAkQezsI6To4CfcVnM70XJSpWAnF
         QKZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779531; x=1782384331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAX/QMZ2lNnCR4HEVf+9VfFWBfEVxUbspDlYV1+1z1k=;
        b=DYvfibE6iT3k3xxwapGSwjFKAh2mfqmxG+heGaSqRjX6FMW2Pb+vbJcb4+9ALQM0Fo
         vC1n7S2rJmq1Pji9je9fpoWUzDuukmz5jcNv1Z/200bju5dOj0B3EwBt7XED9LHRiVw9
         YB49oRBwK20jUDd2ofifnf3lKvhDaOxJbT174SMFCyHOBGHgx/w+T3o9TUB4GtjJl10b
         fsTYS3iKXbadciPl+Ee6626u75GmGKdTfLPJEY4duXt+TPB0PCifGc+TeQfExSjAk4Ve
         +tunLmy2LXDglMLwv6OU/DzqPuzJIz9UHPFsZ/ehfJyiaLL+ZTmhOrDX1vf10rHq9yW/
         XMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779531; x=1782384331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IAX/QMZ2lNnCR4HEVf+9VfFWBfEVxUbspDlYV1+1z1k=;
        b=UTU7GhH/l7mvFPgIK+Ij0HB50Min2lZCtl8Vv4a7HZYmzqCjTOjvXn5IkVW/hNJy7N
         3j8lRQDbLYuAsI7F2Sc32RwJbKm9i3gJfylAE15NyQdm8OiNDMzP1zB4v9uA4CkR88ZU
         WWV2nV9p0jCJHu6NQyREtynJObSX8IOp+YKUZzTXPpYwaQa0NX4RZ4ntZfProEJPJww7
         Ab9VeaXDN9gBBKUUQGpM6MrgQT6qVbzCZqrEZY0PtxV9ypN5Fom+ssTjnEnGcQS0BqSV
         Wtc0a1tn/qAl7lOqNXTCDbPQEcv688p05NOE/+ennClWCIb+JsXy4sk3lPkVgT6XJiOI
         rQ0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/37aObiGRX7IGWatTq1Npu45GIMTC2mzzrfNMc5+0XJISJkSDVNDbyGMcpegRLXqhYHQXA4rlxKRlvl3Olhic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0KMWuRSL9FT9wyl8rjCazJv9fkLOjmr9W3KkTcKOfvH0LSrS1
	JHTSv1D8yT9ERmXhudEeIIgeu/SoaKTp3vDEOH45Qk6aFRzwKdymreC9Iu2ByN8TqFcXuT4tgW9
	kW8MIgqZlHWm3cWjpgYZ9HtdOiRyxwRI=
X-Gm-Gg: AfdE7cmEWYAY4tYSX4UA9pZwVXRDlBUKC+N/oqyTF2ESj1DyIWGy+AKYr2ByuLvWKOi
	zFU0pi6/SrxjcNwkdeV8ORQaJ9liVq4ivg2M3zI4wN3vkUjUwFf6c84iXHFPiaBrRHc/IiaESaD
	4jk4S2ltWI1ZqJxaosWMHlH492ikWu3QYQdGVjG8iigxtogmL94rkYrww/AEEj3var0Vnsfzv5j
	5r11JKk/ldvNKAgnwQObG2fL/+yRWZTCywpUzivBzZ++4K0yNN1SLX0VEyUBb7jn9E9P49r7Q4f
	gE8d+CnnBXLXhzzqlantG1ZvF+IotNad1xN71TWJ
X-Received: by 2002:a05:690c:b91:b0:7f8:7e6f:f543 with SMTP id
 00721157ae682-7ffc86c9549mr29850657b3.49.1781779531112; Thu, 18 Jun 2026
 03:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617093557.63880-3-sun.jian.kdev@gmail.com>
 <2dad9b5c184fa101d7cffa1d8f5eea5b5df60f53533d98c68175c9e3ec5ee6ac@mail.kernel.org>
 <CABFUUZFeh18OjQ6EhjD17ZwQKb1aiVNkYKv-hAkVGrHhPpjE4Q@mail.gmail.com> <ajOv_oOd1zInaW1b@mail.gmail.com>
In-Reply-To: <ajOv_oOd1zInaW1b@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 18 Jun 2026 18:45:18 +0800
X-Gm-Features: AVVi8Ceo2RL3_RfBhTUKCmC5sJSFyC9LIcZeW8zb5WpwBtQh_A6J58Lq3pCapyk
Message-ID: <CABFUUZHCr=4kb7kSaaPGpc4nkyn32i-svD9v7ONF+TYrrQ-xaQ@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/2] selftests/bpf: Cover partial copy of
 non-linear test_run output
To: Paul Chaignon <paul.chaignon@gmail.com>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, toke@redhat.com, 
	lorenzo@kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 4:44=E2=80=AFPM Paul Chaignon <paul.chaignon@gmail.=
com> wrote:
>
> On Wed, Jun 17, 2026 at 10:19:52PM +0800, sun jian wrote:
> > On Wed, Jun 17, 2026 at 6:31=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
> > >
> > > > diff --git a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c=
 b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > > > index 01f1d1b6715a..9cc898e6a9f7 100644
> > > > --- a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > > > +++ b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
> > > > @@ -4,6 +4,10 @@
> > > >
> > > >  #include "test_pkt_access.skel.h"
> > > >
> > > > +#define NONLINEAR_PKT_LEN 9000
> > > > +#define NONLINEAR_LINEAR_DATA_LEN 64
> > > > +#define SHORT_OUT_LEN 100
> > > > +
> > >
> > > [ ... ]
> > >
> > > > @@ -20,6 +24,69 @@ static void check_run_cnt(int prog_fd, __u64 run=
_cnt)
> > > >             "incorrect number of repetitions, want %llu have %llu\n=
", run_cnt, info.run_cnt);
> > > >  }
> > > >
> > > > +static void init_pkt(__u8 *pkt, size_t len)
> > > > +{
> > > > +     size_t i;
> > > > +
> > > > +     for (i =3D 0; i < len; i++)
> > > > +             pkt[i] =3D i & 0xff;
> > > > +}
> > >
> > > A question was raised on v2 about whether pkt_v4 could be reused by
> > > reducing the linear area to ETH_HLEN, rather than introducing a custo=
m
> > > init_pkt() with a 9000-byte stack packet.
> > >
> > > Can't we reuse pkt_v4 here by reducing the linear area to ETH_HLEN?
> > > The v3 still adds init_pkt() and the NONLINEAR_PKT_LEN packet, so thi=
s
> > > doesn't seem to have been picked up.
> > >
> > > > +
> > > > +static void test_skb_nonlinear_data_out_partial(struct test_pkt_ac=
cess *skel)
> > > > +{
> > > > +     LIBBPF_OPTS(bpf_test_run_opts, topts);
> > > > +     __u8 pkt[NONLINEAR_PKT_LEN];
> > > > +     __u8 out[SHORT_OUT_LEN];
> > > > +     struct __sk_buff skb =3D {};
> > > > +     int prog_fd, err;
> > > > +
> > > > +     init_pkt(pkt, sizeof(pkt));
> > > > +
> > > > +     skb.data_end =3D NONLINEAR_LINEAR_DATA_LEN;
> > > > +
> > > > +     topts.data_in =3D pkt;
> > > > +     topts.data_size_in =3D sizeof(pkt);
> > > > +     topts.data_out =3D out;
> > > > +     topts.data_size_out =3D sizeof(out);
> > > > +     topts.ctx_in =3D &skb;
> > > > +     topts.ctx_size_in =3D sizeof(skb);
> > > > +
> > > > +     prog_fd =3D bpf_program__fd(skel->progs.tc_pass_prog);
> > >
> > > [ ... ]
> > >
> > > > diff --git a/tools/testing/selftests/bpf/progs/test_pkt_access.c b/=
tools/testing/selftests/bpf/progs/test_pkt_access.c
> > > > index bce7173152c6..cd284401eebd 100644
> > > > --- a/tools/testing/selftests/bpf/progs/test_pkt_access.c
> > > > +++ b/tools/testing/selftests/bpf/progs/test_pkt_access.c
> > > > @@ -150,3 +150,15 @@ int test_pkt_access(struct __sk_buff *skb)
> > > >
> > > >       return TC_ACT_UNSPEC;
> > > >  }
> > > > +
> > > > +SEC("tc")
> > > > +int tc_pass_prog(struct __sk_buff *skb)
> > > > +{
> > > > +     return TC_ACT_OK;
> > > > +}
> > > > +
> > > > +SEC("xdp.frags")
> > > > +int xdp_frags_pass_prog(struct xdp_md *ctx)
> > > > +{
> > > > +     return XDP_PASS;
> > > > +}
> > >
> > > A related suggestion on v2 was that, once pkt_v4 is reused, the exist=
ing
> > > BPF program could be reused instead of adding new pass-through progra=
ms.
> > >
> > > Could tc_pass_prog and xdp_frags_pass_prog be dropped in favour of th=
e
> > > existing program? The v3 still adds both of these, so this point also
> > > seems to be open.
> > >
> > >
> > > ---
> > > AI reviewed your patch. Please fix the bug or email reply why it's no=
t a bug.
> > > See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/R=
EADME.md
> > >
> > > CI run summary: https://github.com/kernel-patches/bpf/actions/runs/27=
680511802
> >
> > Hi,
> >
> > Thanks for checking this.
>
> Hi Sun Jian,
>
> It would help if you could reply inline instead of at the end of the
> messages, especially when there are multiple comments. See [1] for an
> explanation of how that works.
>
> 1: https://kernelnewbies.org/FirstKernelPatch#Responding_inline

Acknowledged, I will reply inline.

>
> >
> > I tried reusing pkt_v4 and the existing TC program, but they do not fit
> > the skb case this test is trying to cover.
> >
> > For skb test_run, IPv4/IPv6 inputs with a too-short L3 header in the
> > linear area are rejected before bpf_test_finish(). With pkt_v4 and a
> > linear area of ETH_HLEN, the test fails with -EINVAL before reaching th=
e
> > partial copy-out path. If the linear area is increased enough to pass t=
he
> > IPv4 check, pkt_v4 is too small to both trigger the old
> > copy_size - frag_size path and verify that the copied prefix spans the
> > linear data and the first fragment. pkt_v6 has the same issue: after
> > making the IPv6 header linear, only 20 bytes remain in frags.
> >
> > The existing test_pkt_access program has its own packet-access coverage
> > goals and is not just a pass-through carrier. With such a short linear
> > area or small packet fixture, it can fail before the test hits the
> > bpf_test_finish()'s partial copy-out path. A pass-through TC program is
> > therefore a better fit, because it keeps the test focused on the
> > bpf_test_finish() copy-out semantics.
>
> If we're keeping tc_pass_prog() then can't we use pkt_v4 and get rid of
> init_pkt?
>

pkt_v4 is too small to construct a meaningful nonlinear skb with a stable
linear/frag split while still exercising the partial copy-out boundary in
bpf_test_finish().

With pkt_v4, we either do not reach a fragmented layout, or lose control ov=
er
the linear/frag boundary needed to exercise the regression path.

This test uses a 9000B packet so it does not depend on small-packet
allocation details. Smaller packets might work depending on allocation
state, but 9000B reliably gives us a non-linear skb with page frags and a
stable linear/frag boundary for the copy-out regression.

init_pkt() is needed to ensure deterministic byte content across both linea=
r
and fragmented regions so that the memcmp-based validation is stable.

Thanks,
Sun Jian


> >
> > For XDP, this object does not have an existing xdp.frags pass-through
> > program, so the small XDP frags program is needed to cover the other
> > caller of the shared bpf_test_finish() path.
> >
> > Thanks,
> > Sun Jian
