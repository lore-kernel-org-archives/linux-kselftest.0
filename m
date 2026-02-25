Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AFD2E7179
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 05:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771999192; cv=pass; b=LR5PfAOrwxVJFSq9k/kJONJIBKbEGwprsBT3DJqxRgOzl5vS/jGDFdxUqyNXa4okFXJJ42vE97JQOwzWy6IIX0KSrX3/y/S0eSbWe+swf7YU9VGCOnkLOC4VMOtLoc/etPIcdmDE4r8iekQTqcx3TJsb5To8hmyTaROZQ0U54Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771999192; c=relaxed/simple;
	bh=0187+HJXbxbDqoLndFtsYeQmB5bITMCie3MJcozAX/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMUFDhwr8VUV/De/q/w4mjdATsrrHJMy2O5/VsfW9AaK2pV+jaC2pF0wnxPD5RStFzXXbe4uKJ5mtvMak7f0jneGqLn4Elq9cxWV7Evvv34lwsR6nG4AqP/4Vdb9KQbgPPpCXJcKLInGq8f5neVQvlTOBl6hz7pmgwKB6Kr/lzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zmd8nkhY; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zmd8nkhY"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79427f739b0so59395317b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 21:59:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771999190; cv=none;
        d=google.com; s=arc-20240605;
        b=kIaJgyxG1ZoLlDWjA8j+92FJ3XsvESbNY1lBqARXUsaTZPkWKscuOQhHBMVu8EnI07
         dl4TH/5B6Ew7Kp5ApphIq7exOMi8A2a+n6xBcpITyCbuBCndpZxKsp6UZvs8oQyALgxh
         2NpzNiSe518csmKdByw2xcDcKDGnjcRKnnFin7K0rbSBobfhhNyoKAG5F5uwkYrSKckr
         9TivnxdqzsTsw0FIoMdTrzCxKym5Q0UDRugr1xuXqE6CROqnUQwpYu/0adztFpNBJagH
         GXJ7B5JLGRInSCC5H8L/YO/sytBjpOD197KJWG22OZ+nal2FuBkxU4/EFk5Ptxk8YcRl
         wsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sTIOS1OA768nNXxxFVbpB4ZHw3BFrbFTz2tgbv5jMPk=;
        fh=c6an7M6PQ4ArcflNe3T6T+dSZ61mk06l39A2s8MC2ls=;
        b=hIOsbQXx3OcANWXPnPShmDX9dZL0OxLYDC1ODtROYIbjqLksgTG3SMHZs+NxDQhACn
         Nr7huPbcUySwuC0gfmlLp1lMEhm33LTyO0HKG7Vjq/XmubBZdJ1/mTPPHKtsjj+IB3Ev
         uTQXvlUm08pgPvmT/LALhCyEPN7qpDivl4C4lhk887fZxAJOW0XPkJSCwdmXdXTBJKk4
         bpUtjBTTFtf55TQW7KFvUjvbUBhCsMSBY2p6EbQT1XOZFeAbvybj+metb5w8eOTETnvQ
         5WOVnh018ovdpsGmgwmCj6nDknU+ItDj6V34gISsBhb5M7DwZlxj/VBhIJiXxsAeHtjY
         fx8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771999190; x=1772603990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTIOS1OA768nNXxxFVbpB4ZHw3BFrbFTz2tgbv5jMPk=;
        b=Zmd8nkhYOuPr3EEgo+NbAUzEvq8xZ/n0WVOYGtx+/65YvvUo6ke+vTHOc6C7rW0ldm
         2+n+AcVW2aZZMQdKNq+XIwzs3d6ktE6AQoxSPJbAGqZ2IThAm05ysU63tUo8sXyyyL7l
         fBXg4E0joW83zQDcvEB5+806ohIYajT0mOwngX3E7TN+u+yEEVmLswvSPyUXjFkuuIOi
         fbE90U9NfE/+VbV1xCWPP7fjD8sWkM3qpUkYgA7HaRy+KWTcvl+mxSBpPWItxfzYms4n
         sDnPFOH02NCImS3oDq9WKePZ7OSKMkQLJ8MZ9EJ0dRFpBus21J3eHxdwoTOV+f7jZoZ4
         QnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999190; x=1772603990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTIOS1OA768nNXxxFVbpB4ZHw3BFrbFTz2tgbv5jMPk=;
        b=aiatWAMx6cgs2eoEJxCRDF4vGGEo8fOEb6CEtA/CV3XajVifCUTl+2aLjChoCJrVmh
         PsR+aSUo1J4rsZYrTRAcohqiNCK36TLQCM6TNsxN3cpq03Xlu21d8UgGxV+jZvr8omZE
         O8G071EHSl4lSs8sa0mKefFpK1q50BZRnTRCIo1flWdeHC8ZQjax/KMnz4JAkJYmfDjQ
         B/edTmGOxnHHWiB4o68qb28Dhl5j4jr8xEJdh9dCpslfvTnSiXnkSjTsSk9Mf8LYAWla
         0al4zSzZaMesJhiiCpBs+h/YQo5SPJ9lRmY7K3Ismbolb5l7cQVH6FF6YcJdJ9SRJMMP
         Tq7w==
X-Forwarded-Encrypted: i=1; AJvYcCVoK1tF8QWWdkkB51bNKqk8pHzrugYb3gxVJi08tpZvJuEYvVJtiWDvAdbzQtJxFmzWDtcfdnlY9BM13x67QCk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza4b4AIe78+5XFlEMFDFw8/220Xn/VtjSiNAb0mVjmuloOhICz
	dyC5B711jWuZiq2T4kVYB1EyJLDoQjX/vw/thcIi/Br3wpfhrSaAmxNY4RyElpJl9Nmuiq98tUB
	TsxUo8iKAudY4OML2Qp9UadQXpaNtrXc=
X-Gm-Gg: ATEYQzwweN45F3DjVFSpXyMH+0DV6nqXk/bEeOW1UQ4U0SazjTPuIyn21hL0xBzyP/b
	+hnUZ/cyKKOZpc0/GmmOEC0A8yAqKy+aFOdF4hSkoFMFStdHopMrv4jXxPvn13cDd3y3jFGD3Jn
	0XyLkTSu/7bdr3/Nh5YAlBOTog6QLBC7seaXUMeyWR6CEPMKkry53Tg7k+1h5eeR5EtxjKgpdbb
	Dq00c65R09h+RKSSM6T9z5M7Oj4xo41yu0hNiwMLrmcvKsr5ERTIgYtGvpk4XCX8e81NF3GPDDO
	l9dPfhqu
X-Received: by 2002:a05:690c:9d:b0:798:25d:9b1 with SMTP id
 00721157ae682-79828cd049emr129572897b3.12.1771999189729; Tue, 24 Feb 2026
 21:59:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218092002.147306-1-mahdifrmz@gmail.com> <CAADnVQJdQ5PpHRvYahuSk0=cYBXnf5Z9tkdBLs1tcnasigrntQ@mail.gmail.com>
In-Reply-To: <CAADnVQJdQ5PpHRvYahuSk0=cYBXnf5Z9tkdBLs1tcnasigrntQ@mail.gmail.com>
From: Mahdi Faramarzpour <mahdifrmx@gmail.com>
Date: Wed, 25 Feb 2026 09:29:40 +0330
X-Gm-Features: AaiRm50Jnc1hdfMZrcEoHjnxIA7SWXi5yLlX7fypqKNkoMiU9nlIjTPDz2hqS3I
Message-ID: <CA+KdSGMxO5C=nFVFbauS2DTRzSvoj14pAMwmbWpj_c50JgOroA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: fix selftest/xsk single test selection
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 7:35=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Feb 18, 2026 at 1:20=E2=80=AFAM Mahdi Faramarzpour <mahdifrmx@gma=
il.com> wrote:
> >
> > From: Mahdi Faramarzpour <mahdifrmx@gmail.com>
> >
> > This commit fixes the integer parsing of -t option. The cli parser
> > only relies on errno to detect parsing errors. The manpage for
> > strtol (https://man7.org/linux/man-pages/man3/strtol.3.html)
> > states that the said function "MAY" set errno to EINVAL in case the
> > conversion fails. Currently on some systems, this leads to a silent
> > failure with return value not being exactly documented in the
> > manpages (probably zero). The reliable way to validate the input is
> > to check whether the endptr has been bumped all the way to the end
> > of the string or not.
> >
> > Fixes: 146e30554a53 ("selftests/xsk: add option to run single test")
> > Signed-off-by: Mahdi Faramarzpour <mahdifrmx@gmail.com>
> > ---
> > v2:
> >   - fix style issues
> > v1: https://lore.kernel.org/all/20260217080326.50564-1-mahdifrmz@gmail.=
com/
> > ---
> >  tools/testing/selftests/bpf/xskxceiver.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/xskxceiver.c b/tools/testing/s=
elftests/bpf/xskxceiver.c
> > index 05b3cebc5..5e4095fd1 100644
> > --- a/tools/testing/selftests/bpf/xskxceiver.c
> > +++ b/tools/testing/selftests/bpf/xskxceiver.c
> > @@ -200,6 +200,7 @@ static void parse_command_line(struct ifobject *ifo=
bj_tx, struct ifobject *ifobj
> >         struct ifobject *ifobj;
> >         u32 interface_nb =3D 0;
> >         int option_index, c;
> > +       char *eptr;
> >
> >         opterr =3D 0;
> >
> > @@ -248,8 +249,8 @@ static void parse_command_line(struct ifobject *ifo=
bj_tx, struct ifobject *ifobj
> >                         break;
> >                 case 't':
> >                         errno =3D 0;
> > -                       opt_run_test =3D strtol(optarg, NULL, 0);
> > -                       if (errno)
> > +                       opt_run_test =3D strtol(optarg, &eptr, 0);
> > +                       if (errno || *eptr)
>
> This is unnecessary. It was required we would have hit segfaults by now.
This patch does not prevent segfaults; it prevents silent misparsing.
On systems where strtol() does not set
errno for non-numeric input, passing -t abc results in opt_run_test
being 0 without triggering usage().
Checking endptr is the documented way to validate full-string conversion.
>
> pw-bot: cr
