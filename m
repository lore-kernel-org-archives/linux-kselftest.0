Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3910317141
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 01:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772761261; cv=pass; b=LrcmxIMatkhjwHB9MZhOdwlmG6lyeVKhukK/RTH050rXw0ceI2D3hP/TiZpGpRwf7lBTrwZYEAx86/JfLv3hApcy5gclg8Q00utDe/7hPEYJiXcV0jLiGuZEKCMLhw/BJEojsfClVSTl541WU2+METOxg8dkKN1kYFgU7KlCDXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772761261; c=relaxed/simple;
	bh=nd6GaIamOft5XM/KgOAcyqUwrHPLKA5D7BRm536zHiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fO9UtEvAmOWR5ceoTXFx1woXjHxGZ4RNyCFCtEajyDCa+rosCUmjT10MoZKzZoxYAyEPLdZ2jW7ML1baV2ZVSJG5QP1sd4pPolA4L8Kd5kLXJxXbW5KkQZ7sbIwlwe/FrdGZyQTEy2F6VbYtMg2PIc8gX7MRoBK8ihMtfJ/q+gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BU2zeK0g; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BU2zeK0g"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439baf33150so3894189f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 17:40:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772761258; cv=none;
        d=google.com; s=arc-20240605;
        b=laOYAS2zPdPnxCPBGd1c2F9KWpZPEfjn5qSdEHOsus75LfDAHvycWQ7OfRhtFzL/ff
         b44MrxFWSkMtW5d9cPUGVW+R7I2buzqrMxelhbwtzdXMccX9fgqPt5pcMl8r6KhsKEFl
         WblA2xInYlVbYOpoSivZ7K9K5N0U7YT5zmC0qjKl4PmZ5lDJRy1soG4fo95/mN/Vb4Rk
         +Y2Mp++nnYxDr9JjNEHUTs9hkSFSfb8JBY++TXLg97+vjTRLRm+x8CFllhU+x91nV5Xh
         +BBaDat42T35a7Vxt/qu8fuN9LgR6DBVysckBd7rUOw3znTLeviYAuaUxzcA4UaofDPj
         T2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Uxac+KWCW7u/QZS/HLCt2EBa5IbxQyv7Xs4Uc4uzHU=;
        fh=pPXps021Mf0CEhq1HXHERAxZXSHRhXHExPPN5qygVhw=;
        b=kOGiRnR9LxHH/AfxHVGrtvH+VZje8IVS/wEJ9hEisNJ/uHDAqXs4LOucd4Wb5k9Qri
         GShyivwtqtd1/fQIjl+H1IN9L/7dMe58rNYoEpOKAUKR5dHz7ychUWZkFg1yO2F1E2je
         J3irkc8V80XXgPws6267wOvAnNauzEH9Yz4vM1U4C4LQex1BBCJP9CKZ0shg6ybLcLgX
         NCRTcsukUb/VTsVe8Hr5AkHVEEoLj4YRfR/SeK8i7dCVwk4Pj+JGFErsEdJMhxFoIe8z
         vurJ4oLBy3bf6MB/ccKl29nEl1vPQWbiUmYeJFRskJAtReXntCh4YdHqAyALmmuG48rx
         S4/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772761258; x=1773366058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Uxac+KWCW7u/QZS/HLCt2EBa5IbxQyv7Xs4Uc4uzHU=;
        b=BU2zeK0gViQ8E9eDYFwxyl/MmzVTnfUsUooBT2EsrwxDpJFr0HnlSUeDPccvFjZPUy
         FyVuhFeeirKnLoZJis+Dnn9DyvksVBhmliwyvj4Ly2ztmDj7NVmRlQvSy+n66fHxrvJJ
         f0l6hSfyp+3bcfAlofRY+E3EPPlCaHSh30AJKqEVsDX0nuCWh14poOqa91f8jI9T4HrD
         3PiTVoZcldhQLj8mhkrf1xqXWl0n6dKNyItIssTQAdEdm0WLMGXsn0hrxed2Z+ywEbQA
         02/00p5aARtDI23GVNPjG+rWMEmHMUXe40H+NKOXCYB4+dRhM+AhJDQ4rqMJ5oWenJ5w
         6ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772761258; x=1773366058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Uxac+KWCW7u/QZS/HLCt2EBa5IbxQyv7Xs4Uc4uzHU=;
        b=c1U3N6RGYUTFY1TedWq0u0xyf2uePk6g8qfneIpBbBZp8cKGFTAdCCenIiUAt8XR81
         3cWIj2aqckomGUHzYpgDyLdN+FrF/vo6/cnSYSNK2wF8JyVfnSJKsUemRF3eLvqn6PBf
         x70rJr3Yc3T7H6CVLZ1zV/8jqkbYj7Og08OU9vpEMw6dolV46dVool+2rciV7WS3vOaq
         hU60CnsdPKSaJD1lBKS/R4qPjCtWg9dmMrVopXGH6OTdGT4ttHVVoH8INoWUDLq02Cu8
         dq6Yy/4XKiQZONpJzoSAuKvjHKUouTRn/wgLvQwuxEGW7/bF2WOHgbyTLn5RPLaFS0QN
         xNcg==
X-Forwarded-Encrypted: i=1; AJvYcCVtbWWdwvpgVdyqsvIBv9zIVjAKgQIEE6sFPjSPqbBR2rIDIZpuglRuIsY/Fl9+Vm5nZwLtSdq0F0/5XnYNzdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cQAid3V+cA+ClGc+wkf9ozc0m101rnyJdarjR4QrbdrA0vPs
	riciXOCWyMqp/psEf4H+Zknt/PEOt/476ZDh52GnBuc/OfZxr+oi2HHbBK9KBnFr1vrqaC1LYCW
	URTb2rDPRQ+KhZdNza/Vb4iP5djADnK0=
X-Gm-Gg: ATEYQzweX2WBupQ+ApfHs0QNPxYhNWqAEgcmBlswS3DOJtWKjeAy2++iXSPD4zefRQ5
	gqivpr+0dzrbyFMhXuoXPQHNiFrLpxGrMiZXs1eadQHa0h7EJ5jv4T2JInNDOfeMmSoS9kc+Ism
	Bw7WyAMOrpUr738wUJK2xMd1+ZtWGYOt5hcMAn5XacS9Np7Pl4OM5b1HEN6Qbdt6T72LW863Nfa
	bc5djH5SsqhVFHQcr/0JwaOBsyLu+U3Ja+BZclrkdB8Rg2qfdlk1eJcifSL2aMYZW1GnF4vt++t
	nbb/T1/F94iYaaw5D5AT8exkwEyDptUPN0bipzxmY3W/18rP9xIZ7FVlUmZ+zT3LJilGKTUUjOK
	M5EB5R59Y/Mh49CHuKnhfPWX45IpHO+YQi6WJ
X-Received: by 2002:a05:6000:1a8d:b0:439:b69b:3c8d with SMTP id
 ffacd0b85a97d-439da363768mr545905f8f.13.1772761258188; Thu, 05 Mar 2026
 17:40:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305222132.470700-1-varunrmallya@gmail.com> <12848362.O9o76ZdvQC@7940hx>
In-Reply-To: <12848362.O9o76ZdvQC@7940hx>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 5 Mar 2026 17:40:46 -0800
X-Gm-Features: AaiRm51vEkGnLJ6mxjn5smhsPO9kg2uz9vQgb_fU3--4Fn4QGcpDSSwu3E-Nprk
Message-ID: <CAADnVQL7BpNh_WuR3bPKuVPeKLOgnkY+MUwDG2WgN1ZPtD734w@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix const qualifier warning in fexit_bpf2bpf.c
To: Menglong Dong <menglong.dong@linux.dev>
Cc: Varun R Mallya <varunrmallya@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard <eddyz87@gmail.com>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Song Liu <song@kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 5:16=E2=80=AFPM Menglong Dong <menglong.dong@linux.d=
ev> wrote:
>
> On 2026/3/6 06:21 Varun R Mallya <varunrmallya@gmail.com> write:
> > Building selftests with
> > clang 23.0.0 (6fae863eba8a72cdd82f37e7111a46a70be525e0) triggers
> > the following error:
> >
> >   tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c:117:12:
> >   error: assigning to 'char *' from 'const char *' discards qualifiers
> >   [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> >
> > The variable `tgt_name` is declared as `char *`, but it stores the
> > result of strstr(prog_name[i], "/"). Since `prog_name[i]` is a
> > `const char *`, the returned pointer should also be treated as
> > const-qualified.
> >
> > Update `tgt_name` to `const char *` to match the type of the underlying
> > string and silence the compiler warning.
> >
> > Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
> > ---
> >  tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c b/t=
ools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> > index 23d933f1aec6..92c20803ea76 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
> > @@ -111,7 +111,7 @@ static void test_fexit_bpf2bpf_common(const char *o=
bj_file,
> >               struct bpf_link_info link_info;
> >               struct bpf_program *pos;
> >               const char *pos_sec_name;
> > -             char *tgt_name;
> > +             const char *tgt_name;
>
> I have been suffering from this build error too. So,
>
> Acked-by: Menglong Dong <menglong.dong@linux.dev>

Looks like this patch was lost. Pls resend.
