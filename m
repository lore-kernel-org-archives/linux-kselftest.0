Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF5D4D7974
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575908; cv=pass; b=N+R14h0CRjlpKI+mdhthzrhkOOZNfb1YduGHfrDiDFSr0HdX+m+AlYxx40kJ3+RXSqwmyaVg0PGdzmoUMtbyepmFtquLiQsioZLMGPeN6MKB76xOV8dRFc4y22nhFf1NQPoZnR4xUyFSuBJmiWkHSTZ2Djr3Yds1zVEKbojdVKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575908; c=relaxed/simple;
	bh=Tfy5DSiHTM2ZgjvWMzhVCdG5j/zkio3GvqabXlNj/F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0169bHCicvDWghQg2uU8h305hXLqutHGvyGVMp0NXoduCvQlfqhAwjcD9fa9vpNHsr20g0GTnb7UxCW6RcBYo/mMs4nxGZWY+0jJrVryQiSxcowC3Udc66YY3xLteHkBjs7NS2pPXIK5MKptbdQDj+t/m7Hfe9vuzHKqHu7XCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZekhNhp; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZekhNhp"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so598301a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 09:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789575899; cv=none;
        d=google.com; s=arc-20260327;
        b=nj7pntqZc6tvc/ifj6D4+WZ15f4h7UF1XnABHZYm383NNzjD1YqQAueWw4TjxGpfFz
         3GvKqvFBVWTm4XL+kdV4cMg0cvP+1Rqkp26DD4K0FlwVfmL4L6LfHSbeTueVVf2f2W/l
         O81zyKi/JEPDnmmqeoEt9AEj3evM9f9NR+dyAiwwhYkY+Mwu39X1WzlDZblUi5bYHTY5
         Ldp/WKiV+DdzBSsVGoX6+BHYAZqvyW2y9jfXGh1Mg7xBKdxpDj4xoX5IcoK5o0nkwdYU
         6LWQ9z+fQWgtvNwvrwiEjDb9CoJxBtjTzjkUCPMYvDdjPqqIUPN+p8ZWtAZvZ0RCJQI5
         AHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T8vXUt64r835ESBTJB/dxhUkslLOOIq8gAbMXJNheR4=;
        fh=heJIAiO6vA8pP89XD2fHG6LD10pq/5PYH5DFfsNzttE=;
        b=RGYnTvQ2flCqKEFGDF+BxZhYfnNzQPUNSc6ndpOXML5iFWiTbtjYkGZx/rw8QvEsGn
         AuC3mKo49s5va5FOV0XbDJ+pyMBSHOTVbkAeFEUQjJILVOdw7/GCYntBGLBr/z8nHfdB
         wImCtI5Qz0vHuGTqeWwaPODx0WiH8A7Wh8/+2Yoif3CcbcV0hoS1I3+fVLoJKimMatMF
         WYdAOriRNneQ2hH9SoBXux55B21+bvV08kQP3udnZO7kyDdGiJNAxV5K+wl7lu09AEWc
         bNQC7Exmy6LaVnPQLwIqJm5Uzkytc/gTFJxD/LI6CjXUALHCnYPmQsMorKQHm30YNy2c
         PHjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575899; x=1790180699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8vXUt64r835ESBTJB/dxhUkslLOOIq8gAbMXJNheR4=;
        b=bZekhNhpcg/1WhRHKG+Te+9vs6pKpnPaeYDWYjxmHME2wRqUKJwf+jbgpyIQk0f+6V
         O13fJ64qVUx0EbIwbu58oC0t+S3pdV9MTIHi1uM7QDpLJvzHlet/u3tlnO9/FgAuHkFh
         WQBPJoP8/NXvDcjpTh7jSeinHytvfkuVsSilIQSGdhzC2KUbYqJliGCs21YfYXqSqETO
         rk4Z7qavbTXqB03s39SBI4JfjdMg19KoHEWsWzptpKFTAEnE0Gt5Uy1Na+pOvclqT9gz
         q66MNxfH6dcaNjRIEoaniNrjEW7bksizf8f9c6V1JGBGPZLtsddsnaFpbNi/nmwiAOf1
         wJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575899; x=1790180699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8vXUt64r835ESBTJB/dxhUkslLOOIq8gAbMXJNheR4=;
        b=fnAW1k4N+bRAqIxaIxZxTpmcpaDaR2MNEVKjAvCR3EAcKkXakF2GPt/UcAz9RWSTAM
         y56fl5Xes58iL0YrJB71BCocX3dMLYwgiWP44qbO6DlkaZyqHQeKyTBzb+NwhkvY8p+R
         1F82ENy45ZOoQt0yVN4KF0Eit/8XDZJKLYRZJy6QvaTaZ1TegjqEV60G/zSZcY4ysW0z
         mc1xrWP3ti7LAoWeloPbS/Kht1eugddj/AXkbBTk+ElYvIMCItoS98w4x4yfjramrhoG
         4Qqz7NtK/SzZ5xyTi4NgrygdbvRlvO8b1zZExXSg1c4wMIHJOmi9JuxGnwgZTTZSIVxL
         lTLg==
X-Forwarded-Encrypted: i=1; AKwUvBzqFlfBHlbjMrrcnw8wHFfXO1d6NsT1w02ZTen2+ZsFAWwvIenxL0oRVBGYKgghJAF9MFhTMR1lZOSMkSfxWMY=@vger.kernel.org
X-Gm-Message-State: AFuF++nY8Q9etX1eGptbysWu64MzdR8SHPRLDLSWevXRU1Jw7rEY8fGr
	HpaddbTyDUoIckBOADDtYmLxgl6bg54tZ16/CAjKZbUhbSrPSzBmeKXMiu3ZxreUVnJ6vcgOUnH
	U4vMzdLWTtkR2pruX0n5gUZPbWqR0mv8=
X-Gm-Gg: AYBFou0oZgf/VWf/1pJNWe4Bk2MYEXoGvnoKa/QA8At+PaAQHEh5DeAPuXVlVKlWRNM
	eFsfOxKNN6B7Uh8CfyVUqxYW5bP6EocT6aTO8icRFrUMrDPUl657Z2RxGvJl0TmM9eHt4un7zKy
	ZYVLabdGeHeUbybhQkWokkizzck9kTEYYQVsBC5cb6ajutjg+r4uNb+lTgK2IHFyRXNbtsMuFoo
	NOB3d9MJ7G7EnidZI+qVkcvpJuOhEGVK0o7CEcA0q+U/AzJBKDdKu8p/0nxKG19mmfsdbnPwG6E
	x+2u63XLMR4wtpF3ebTcvmi67QpSg1OsXNDfxH/7/tIGEhkyImZEpGBm+JsyYNevo2PbnXPzrFo
	JQIYbc/Hy/dlOMDZOQ3s2/wUK88dtDxBYwoZ+h27/pnMdVqvVG/fj4VSiHWhxLZsacUm16jpqN2
	FuNvjvcpLj5taKEEz5Sz+PRVQep+hqTzY=
X-Received: by 2002:a05:6a20:9c9b:b0:3d3:adbf:7781 with SMTP id
 adf61e73a8af0-3dd5f73f2fdmr9852912637.22.1789575898997; Wed, 16 Sep 2026
 09:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916112554.413933-1-madhav.khoslaa@gmail.com> <fe92569462dc4decf36f4dcb3b45372fc0d42fb6842eda0d3396fa18ee32aa55@mail.kernel.org>
In-Reply-To: <fe92569462dc4decf36f4dcb3b45372fc0d42fb6842eda0d3396fa18ee32aa55@mail.kernel.org>
From: Madhav Khosla <madhav.khoslaa@gmail.com>
Date: Wed, 16 Sep 2026 16:24:46 +0000
X-Gm-Features: AcwNN1U8QHUiHDV5g4tLvSfFw01ei7S3h8NzFnBoBxITmcE6o6f_L5XxCkZd1mI
Message-ID: <CAHFb0oABUaKNWVcNZwrxPv0MJU=3Jt1X+iv3fJX9RgO97uu4iQ@mail.gmail.com>
Subject: Re: [PATCH v2 bpf] selftests/bpf: Fix csum_partial() dropping
 trailing byte on odd length
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	alexis.lothore@bootlin.com, eddyz87@gmail.com, ihor.solodrai@linux.dev, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This isn't a bug, but would it be clearer to paste the full failure
> output or mark the elision? The summary line says six subtests failed
> (1/6 FAILED) while only the ipv6 one is shown, and test_progs.c runs
> three ASSERT_EQ calls per subtest ('test first port', 'test second port',
> 'test third port'), so 'test first port' would have failed too. And
> '1/0 PASSED' reports one passing test, which cannot come from a run whose
> only named test failed.

Not a bug. That log is the test failing on the TEST_PACKET_LEN=3D99 case
against the old (pre-fix) csum_partial(), not my patch. My change is
what makes the test catch it; it passes with the fix applied.

Madhav

On Wed, Sep 16, 2026 at 12:13=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/tools/testing/selftests/bpf/network_helpers.h b/tools/test=
ing/selftests/bpf/network_helpers.h
> > index 75133119c04a3..878c9fc5c37ca 100644
> > --- a/tools/testing/selftests/bpf/network_helpers.h
> > +++ b/tools/testing/selftests/bpf/network_helpers.h
> > @@ -129,12 +129,23 @@ static __u16 csum_fold(__u32 csum)
> >
> >  static __wsum csum_partial(const void *buf, int len, __wsum sum)
> >  {
> > -     __u16 *p =3D (__u16 *)buf;
> > +     const __u8 *p =3D buf;
> >       int num_u16 =3D len >> 1;
> >       int i;
> >
> >       for (i =3D 0; i < num_u16; i++)
> > -             sum +=3D p[i];
> > +             sum +=3D ((const __u16 *)p)[i];
> > +
> > +     /*
> > +      * RFC 1071: an odd-length buffer's trailing byte is paired with
> > +      * a zero pad byte to form the final 16-bit word.
> > +      */
> > +     if (len & 1) {
> > +             __u16 tail =3D 0;
> > +
> > +             __builtin_memcpy(&tail, p + len - 1, 1);
> > +             sum +=3D tail;
> > +     }
> >
> >       return sum;
> >  }
> > diff --git a/tools/testing/selftests/bpf/prog_tests/flow_dissector_clas=
sification.c b/tools/testing/selftests/bpf/prog_tests/flow_dissector_classi=
fication.c
> > index 80b153d3ddecf..421dfa6c4ea36 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/flow_dissector_classificat=
ion.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/flow_dissector_classificat=
ion.c
> > @@ -27,7 +27,7 @@
> >  #define TEST_NAME_MAX_LEN (32 + SUBTEST_NAME_MAX_LEN)
> >  #define MAX_SOURCE_PORTS 3
> >  #define TEST_PACKETS_COUNT 10
> > -#define TEST_PACKET_LEN 100
> > +#define TEST_PACKET_LEN 99
> >  #define TEST_PACKET_PATTERN 'a'
> >  #define TEST_IPV4 "192.168.0.1/32"
> >  #define TEST_IPV6 "100::a/128"
>
> The commit message body includes:
>
> >     v1 -> v2:
> >     - comment style: opening /* on its own line, per BPF selftests styl=
e
> >     - Retarget the Fixes tag to bcc00987bc56. commit f4504af68575
> >       ("selftests/bpf: move ip checksum helper to network helpers") mov=
ed
> >       the helper, but sizeof(iphdr) is always a multiple of 32 bit word=
s /
> >       4 Bytes (iph->ihl counts in 4-byte words), so the odd-length path
> >       was never reachable through build_ip_csum(). csum_partial() first
> >       gets called with a length that isn't guaranteed even in
> >       bcc00987bc56, via build_udp_v4_csum()/build_udp_v6_csum().
> >     - TEST_PACKET_LEN 100 -> 99 so an existing test catches this instea=
d
> >       of the bug staying unexercised
>
> This isn't a bug, but could the 'v1 -> v2:' block move below the '---'
> line so it stays out of the committed changelog? Documentation/process/
> submitting-patches.rst asks for inter-version changelogs to go below the
> '---' separator so they are dropped when the patch is applied. The
> content itself is useful review material, especially the reasoning for
> retargeting the Fixes tag.
>
> The commit message also includes this test failure excerpt:
>
> >     Without the fix and with TEST_PACKET_LEN=3D99, flow_dissector_class=
ification
> >     fails under vmtest.sh:
> >
> >         test_flow_dissector_classification:FAIL:test third port unexpec=
ted
> >         test third port: actual 0 !=3D expected 10
> >         #137/6   flow_dissector_classification/ipv6:FAIL
> >         #137     flow_dissector_classification:FAIL
> >         Summary: 1/0 PASSED, 0 SKIPPED, 1/6 FAILED
>
> This isn't a bug, but would it be clearer to paste the full failure
> output or mark the elision? The summary line says six subtests failed
> (1/6 FAILED) while only the ipv6 one is shown, and test_progs.c runs
> three ASSERT_EQ calls per subtest ('test first port', 'test second port',
> 'test third port'), so 'test first port' would have failed too. And
> '1/0 PASSED' reports one passing test, which cannot come from a run whose
> only named test failed.
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/350910=
50280
