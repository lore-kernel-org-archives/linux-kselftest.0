Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB133BBAA
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 02:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772764001; cv=pass; b=G6V60u8YW6ZFmBsQteZvuPBaJIwU/nYJxSoDZTaSewXmMQW4+0Y5k3GGktuhro3Pfl+AmxLQoxly/iIlQ+kwl/0+lspwRaBQ0PVsiBeVZWOoZv0jgJIIh2p39q9slixUcYlVLrnfQRJa+Jzwe32P62J+PJi/yBve1ePzLGB0/+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772764001; c=relaxed/simple;
	bh=UDS74/xcl5OJssDWqd0By56d3wyNHRnEU5ge7nZTzOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkFCjQ9WKNxfuhOR0kL3ooXembCHAYQTryD30bSISQyCePZp5svw0gaRqzAu5R6BnyX3l5WoSad9/7Ugas+4yVagLuM/Eb3eFgBxP7vX1hVIA/au7cLLdiSgJKTYdpGADTEwdqpa1/DZmZ7LJwvrUSHwcJcppn7HtaueanXd3Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCoeVHLl; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCoeVHLl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483703e4b08so84788225e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 18:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772763998; cv=none;
        d=google.com; s=arc-20240605;
        b=d0ZTJFrqNfBXlZpV2V9fGd26sb1LiGyr0Ouxq9qNLE/BciClB91GaZhOcbVnmFG7Vb
         UH6Y+o+wA9svFH+WB2apMpLLVSGEOoOg35UwAS4jOPx/9I8Q04mmXAQhsnUCfWBIFZLm
         3Pps5K3e0YoyhzHDyuMxUQEFZQlw3lcHO8xD/WbtBk1lyp+w0b2fy1JMjVsyagFmT6vA
         132HtlR8GDKj1+bTP4We+vm+d9ggbglQ70Nky7Svx2gx+dSM+YFf7NFz+rR/NgVOq3x0
         eA8AbqJmykOxtJHdCjpPtcdoUJaDnfhD7G8shEdoglgyeN2/UcDQkZMqaLksdHYItNoN
         aRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n2TFpv0VKsV5EvrPnFDMEkG92wU7XaQFnZYIaCfU3hY=;
        fh=KFx1jr3XuAB/EYmXCZFB1f1TAqwCFVbd05NZZ3Vw2EE=;
        b=LHOHc6PbS3mvBHP2Ir+wFTN5BtfyqQDv/AFEtle4cleeiv+bQ7p+6jE+w3iDbUckCI
         ccVwaZvV9ritEzzNCcGUnJrB50AlKpV58qJVreIbJVR8z7dWs5VwFNRLbuSltoeQTlDY
         FTN55KNXwEAE0fine9kZwBkAAUaxqXTrZFSaWp9ipwd3xUNMYDDLleb/Al4ISjsKMdhq
         VSUQfHMU9pf9FLwRBWtlkR0kKbzJYYrUQ5eRbuM8aFn53ati9nN6VYhhsVh/CsUfTmrS
         H1xRQvx9Th65gKN0fk5XeLClhhHP6sXIqDBl4S16cebxrrot4QIErVgqxAtbazI0RxV6
         qigQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772763998; x=1773368798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2TFpv0VKsV5EvrPnFDMEkG92wU7XaQFnZYIaCfU3hY=;
        b=bCoeVHLlKGpjeMl4Ft0xkufhr005Zq2eDvsNwKNtz+RmBjvASppqEZyXJsFX6qM3PL
         BmW9pASn8Til+msYU1Un8PADXEyoR/+XCQfnP/1c6RrdyX4f8mQUquQ8+X8PvRpvOIlo
         Kk7YkOEChpftNWoKt2D57DJbUlrI+ikTTvwcukUrwvfwbE9eFG2GyDPprXhi8v3MITyp
         3TrTRscYMx6qP5V3MnosmYH88Gea0upvTK6drLCMBsOd+BTRRad6Kvy3j+YTA4U/2mIu
         2Wkjrk05KbBLAERRSgLEQPvZ4yippLwTDKXpmQjoxO16emp7IJJC+N3H1AKTieG0DE3O
         1W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772763998; x=1773368798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n2TFpv0VKsV5EvrPnFDMEkG92wU7XaQFnZYIaCfU3hY=;
        b=nHotk2vm9UtfAWhO8yBFlPIABWxsjbNvGH4IAXc9+cAh2w3xGO/UkSe8Acb9iD25D3
         MsQ4l2rLm0jCkQRT/1E3G9PUfEONcTjF1Q9y+Z3OBmsk5Q4QwMn37C+49t09w8lgJcM2
         RRUuRo+iI9RhW5HII24X6eqMOw5rDB2peP5BEYLoiffwoLzmGmEfeYSo/RsYwMJLAD4p
         J+ts72iLiQf/MIxteHX2wyeA0S38ZngoodujOqC+yNDSK+ARH5m1z8lahCtlSKVWBR19
         si6l42dlIvib90cdXaHV4K2TEb/72NSrvde30hazIhiOqH7cpK1amXBlw5f3VZoiuSgb
         ti5A==
X-Forwarded-Encrypted: i=1; AJvYcCX/QUeYv87YuB2gmWhp+J5d66mcgzzWAcv8cbC4SkYqxF4ueNhGYWmKljZn8EAb5K8uCXZIxgc/pKmzJi3t/FE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6E9IPVmJNAfZ/PhgE/1Z0VgUIPC6+hpOCnC1mqBIBkTbqoPBk
	0cavJrurk+3ZWG1cbSA+2Y+BmBVXwoJj3LeECvyedIEYLtdxPfysxteYgoMw8s6R3p17f7zY4gi
	7HhwL4EYULDajMJ93r4H1Iw1xia2IzXA=
X-Gm-Gg: ATEYQzwuHeecnFeGd/aVpDBeT84J1Es2+Z20zB9i+1AmmpRQix95UJhTqLXvg3NiAzB
	85hQ6YjTHbY1lzqj7Oy/LdIwgR0qMyZI/zsKic1Zk/RKCsYTgXuJS991CYNKpEanHVKeu4thMtH
	t58R1aiQFVzj3jY0NO/oDypf0fTVTaI15XwCg39s9293ycgbsKj5AKJJhK4LfDX9hz48O7C72HZ
	BxNVJF9LF0OJL6kd3fZf0uO92KUiqh9NbdhxWQ1RJRyMynNbulyo9FM3qzAVbjWv3jBeMqDu1zZ
	HoaxaCuiBvpxKYwLi6AdKRlUWJyQ7gpQin+DTTo6fDbZ4FdJW18D7K8C2HfL8TCPbM+l8XP3hU0
	+JjOAuesxrn9roeR4ZuwEWsL6Ng==
X-Received: by 2002:a05:600c:154b:b0:47d:6c36:a125 with SMTP id
 5b1f17b1804b1-4852675edf7mr6731585e9.17.1772763998304; Thu, 05 Mar 2026
 18:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305222132.470700-1-varunrmallya@gmail.com>
 <12848362.O9o76ZdvQC@7940hx> <CAADnVQL7BpNh_WuR3bPKuVPeKLOgnkY+MUwDG2WgN1ZPtD734w@mail.gmail.com>
In-Reply-To: <CAADnVQL7BpNh_WuR3bPKuVPeKLOgnkY+MUwDG2WgN1ZPtD734w@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 5 Mar 2026 18:26:27 -0800
X-Gm-Features: AaiRm53ltGWbt7YWlC9e3Ad6zWeS5FUC7pw7OoSNqS6AexwChHHTRiJSQkapvsg
Message-ID: <CAADnVQ+gA+4UHjz8BvN7fSRehZ9c0vdYGVJ4e01ecat3beCwAQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix const qualifier warning in fexit_bpf2bpf.c
To: Menglong Dong <menglong.dong@linux.dev>
Cc: Varun R Mallya <varunrmallya@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard <eddyz87@gmail.com>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Song Liu <song@kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 5:40=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Mar 5, 2026 at 5:16=E2=80=AFPM Menglong Dong <menglong.dong@linux=
.dev> wrote:
> >
> > On 2026/3/6 06:21 Varun R Mallya <varunrmallya@gmail.com> write:
> > > Building selftests with
> > > clang 23.0.0 (6fae863eba8a72cdd82f37e7111a46a70be525e0) triggers
> > > the following error:
> > >
> > >   tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c:117:12:
> > >   error: assigning to 'char *' from 'const char *' discards qualifier=
s
> > >   [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> > >
> > > The variable `tgt_name` is declared as `char *`, but it stores the
> > > result of strstr(prog_name[i], "/"). Since `prog_name[i]` is a
> > > `const char *`, the returned pointer should also be treated as
> > > const-qualified.
> > >
> > > Update `tgt_name` to `const char *` to match the type of the underlyi=
ng
> > > string and silence the compiler warning.
> > >
> > > Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
> > > ---
> > >  tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c b=
/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> > > index 23d933f1aec6..92c20803ea76 100644
> > > --- a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> > > +++ b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> > > @@ -111,7 +111,7 @@ static void test_fexit_bpf2bpf_common(const char =
*obj_file,
> > >               struct bpf_link_info link_info;
> > >               struct bpf_program *pos;
> > >               const char *pos_sec_name;
> > > -             char *tgt_name;
> > > +             const char *tgt_name;
> >
> > I have been suffering from this build error too. So,
> >
> > Acked-by: Menglong Dong <menglong.dong@linux.dev>
>
> Looks like this patch was lost. Pls resend.

Ohh. I see it now. Your reply got delivered before the patch itself
and the patch went to spam.
No need to resend.
