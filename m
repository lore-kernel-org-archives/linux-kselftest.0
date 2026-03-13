Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55E039E6F1
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 17:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773423321; cv=none; b=Fr5Czer1SGTZ/VzK9+E2dmtWaqMQ5O0xnJBiEZQ3xFAro8dEgsGgMnkwJOnOzh4Pv7/pbk9gtbiGDwC9s/842cYKpGs/+aveIf3UbJqdBtGCKSZsGhjJbLBKHxQ5SgQGOH/1t0Jq9dPvpe1vE92/zIERFDV+F/Dsp2FJrl4WTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773423321; c=relaxed/simple;
	bh=ApvbsXVbaqMbdaCDuqA/3rLOXLy0yrXR+9ASU7EGH/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLsvBKg2wX15rJtANMCJMAh2oDp+sOlf/sSB7p55SUuviI+oip+K2en1awsEMLO8Z1BJBLVYPu65cHjn8+BtE5jtFkV0ydkejklEMLduAhaErcdnOSc0gA3/9q0MCf3hfxW/31fn9lhh0fOmOxo7xfti/slcyGWgDctiPZcXewM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mjw1zWLw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mjw1zWLw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A573DC2BC9E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773423321;
	bh=ApvbsXVbaqMbdaCDuqA/3rLOXLy0yrXR+9ASU7EGH/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mjw1zWLw9cf283V0S0iWehmdz1ZoVsu3IdmTYSBhyZN7QTHParcGEZZFYIvC+SLhY
	 8UnumqpE21F1PTRBFZJIxJ1LmLUCMzthA6aARqjOwOksFXAAZdtfnEW41x1A3vMVPa
	 m3o0IFb9XFW8uvp/iJJCj3qpXXKXMjxMiRbLJeG8zYtTMbPqcebeFmdtO0/Ybzfqif
	 mgfYU4RaDr8Ocf1cwdJ9N1VndF2Rr1oQBr7ssPIWn4sW9gQXWrF0VcGjS0vjBMWgpF
	 1WqUEoal/aMGMzn4Uv5lKrQsUVXABb8onSFcKaFaZwlPLomYx9gT4MxPQWmZytddgy
	 y9Upt0tDAWqNg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b96e1ae843dso366204566b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 10:35:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXN5SnUvECXeW+V4rZaaCWPW7P7h5maerQSMTAWNUJTAURbHujBjbLGEaAEWcMIA82QWhWCGAIPtmn+Mf8LATU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr9+1wcZOj59OunuUvhE5xsxL7jpCmZXV9MDGb/6pH1p22YPev
	6r9jccnXaDUg4OnBRt2/qFj52TTOd/oSJapu27EGGYqRyka6d/QVQXSAeykxuQTubGrSMLGrQvj
	d0LoBRgWnCkSGPoG3Z0A8PbKSCge51js=
X-Received: by 2002:a17:907:9452:b0:b94:244b:2ba8 with SMTP id
 a640c23a62f3a-b9765103493mr283406166b.29.1773423320405; Fri, 13 Mar 2026
 10:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313043532.103987-1-liwang@redhat.com> <CAO9r8zMsbVHKnCzfQcdtomRMWTNFgTGY4XALxwm+i9m1SUPPvg@mail.gmail.com>
 <abPEALhYmtBnEULi@redhat.com>
In-Reply-To: <abPEALhYmtBnEULi@redhat.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 13 Mar 2026 10:35:08 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMciNGa1ei-pSvx+ndrCJtZguGj12R3sa8PkDHYwsvGzw@mail.gmail.com>
X-Gm-Features: AaiRm52tG5grTbDaQuCRVOsImQRc5zDDMbvT8ehPQwz0Bf2Lf2h1t26HM-nxIv0
Message-ID: <CAO9r8zMciNGa1ei-pSvx+ndrCJtZguGj12R3sa8PkDHYwsvGzw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] selftests/cgroup: skip test_zswap if zswap is
 globally disabled
To: Li Wang <liwang@redhat.com>
Cc: yosryahmed@google.com, nphamcs@gmail.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 1:00=E2=80=AFAM Li Wang <liwang@redhat.com> wrote:
>
> On Thu, Mar 12, 2026 at 11:34:41PM -0700, Yosry Ahmed wrote:
> > > diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/test=
ing/selftests/cgroup/test_zswap.c
> > > index 64ebc3f3f203..e69d845d3592 100644
> > > --- a/tools/testing/selftests/cgroup/test_zswap.c
> > > +++ b/tools/testing/selftests/cgroup/test_zswap.c
> > > @@ -589,9 +589,21 @@ struct zswap_test {
> > >  };
> > >  #undef T
> > >
> > > -static bool zswap_configured(void)
> > > +static void check_zswap_enabled(void)
> > >  {
> > > -       return access("/sys/module/zswap", F_OK) =3D=3D 0;
> > > +       char value[2];
> >
> > Please wait for discussions on the previous version to conclude and
> > give people a little bit of time to respond before sending the next
> > version.
>
> Sorry for the rush. I thought that I had clarified the issue there.
>
> > I think this can just be be:
> >
> >     char value;
> >     ...
> >
> >     if (read_text(.., &value, sizeof(value)) < 0)
>
> This actuall introduce a problem to the code, as in read_text()
> that achivement is:
>
>   len =3D read(fd, buf, max_len - 1);
>
> When 'sizeof(value) =3D=3D 1' pass in that makes read(fd, &value, 0);
> read zero, after that, the value is set to '\0'.

I see, I missed that, thanks for clarifying. If you do send a new
version, put the path of the module parameter in a macro or variable
to make the lines in check_zswap_enabled() shorter and hopefully have
everything fit in one line. Anyway:

Acked-by: Yosry Ahmed <yosry@kernel.org>
