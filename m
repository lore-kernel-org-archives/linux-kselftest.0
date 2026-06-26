Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF77366DB5
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480892; cv=pass; b=ElfcZsg1ELFAgFIPeqZXdFQvXlJX5WrmNOtxxoVjR5nRJMPgkaJcfpT0k9a0GZtGvjrv9StMCzEP2cbUT08hGhuOtSCNl8BfKO1u5IPYPLLoP44aAn/AcqfyMk/UqKR7qxB529gi8kKXFU88feaiDQMEcIWprqWcuJwpxlzNiV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480892; c=relaxed/simple;
	bh=xaBlLFNTZl0kG4DGG0ss7wNRi4uRD8j3TezB5k4Epq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLp8/7KYAN6LGzE4b+Qx6qIH+2GVUvIio335BAGruK1SW3Bs0F9X0cEaUVsq+0PMG2ByZXaBaJJNpyTAbnuYDOGBFv/UP4r+Kj2JlP7C+fmdoPvaLxLKRxx1R+wBhx3/H6Vs0th/9GHUxk7ab/ik9oyZYyeLeWKiU9eKJmF86sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TmuEXy8E; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TmuEXy8E"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6982f2dc01bso4803a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 06:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782480889; cv=none;
        d=google.com; s=arc-20260327;
        b=EQFMccT8qDV4KDOHGxnMCw4kHJimu7wE5uNGPyCVud3xTrnKKzJaYLvCwI7QuqWt/d
         ASmxB2CMfLplNyPWqJdgen72b8+VhNljJTC5gIQ3ojl1j072V/dl149yl5rX3niAvcsF
         FpTDVfkuzdqSjwVEtxiblY7QouUHYwFjzcd7X/KRF2EkZQAswfZRkJ7MjbOX1fg5RzZ2
         V2CuT8JUdwViPM7UePoRjHvrK8KpB726z+dhe/r2cNIVzZd/1nwDjDitnCic1OJxfeoI
         iizZ2BaEyMnA4KvXvNJIETLLSgNM8xY02336ag+I6DZoX8BRSOR758MDGxp7YR/e6rAU
         gENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFusc4+4RUwOAF9njJqeKXVcmCxYVbDE1Q1t4UJqUMM=;
        fh=phGvzlVaFTeXwqE6sM+px02oOsJTjOWM/dzAlol+F3w=;
        b=Xy2/iY1J9ZhEyGO+E2bQhQDhM044NTjCpwHhE3TreitVEbnpQ0lRosckUgSuNoemws
         YM/SAMTiRStsPzBw2/jSd7oWkTD52h+eT7esNoqR6Ty9pCXjy2oBt0zB98ToqjGJg9x9
         icG853x66Q0Uu1cPupPAunFXY4R78nDIgH2K2nOei+eSYp8rP6nEGfj4K0SLUYjDstmO
         +kTmPf52KKHBuTcfF+Mxl8X0KjquZZ62KAbwDUvbBRCXN1e8Q4UBh1ZxcZyFMR5ndQ74
         +wkTPJf6onf1xRb0YXjBeBKomrrAzp3c8Sg36lxpudK514K0ed+jaQmCdya5d61uOQeH
         nEWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782480889; x=1783085689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFusc4+4RUwOAF9njJqeKXVcmCxYVbDE1Q1t4UJqUMM=;
        b=TmuEXy8Eb+db6mjphTsb7e790vmENZW6HFlV9ROV0ZwDHfYHG/kYOoUJ/JA1b99BAR
         lkhgHQE5lVBKWcRu/rZ78C/3AxFIp1+Ut+NrOa01pDclYWIdDyZFzO4t2GXkReiT/b12
         RLBkhkCx+oRgti/XJfr6vpiu8EiROu/1maRCvhOYBr07p8dnX/1t09etuemiWhhehR8p
         8KKo60hqhjcq1qmkmCfBNMpJ6hqC1n9zV6pXRXQceSXMlN7jVjV9gvh1RijYjsq39fyD
         GdehePE8aqOljG77ufH3X1Aci6/xqsJ2Eq0R0NsK/53fR3PV+0XtrAvP6lrsOSJ8Zv08
         nvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480889; x=1783085689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFusc4+4RUwOAF9njJqeKXVcmCxYVbDE1Q1t4UJqUMM=;
        b=CeZG7RUG1fZ6CExRvSkte504IDy3u4m+nrMau3jNsiqoxRO5VKTWuiW+YZCxQr0aPx
         YiTU/k/nL3nXPGCW3dVZcsnvS7ugWFpZ/pX/EqWdXV0DLDpsH20m2IsMrQRwxRmqhFj9
         quirqQeFEP9XDBQylDSnpj4M00nlY7oN8DWifDkcZRrDMx3Lw2qzbKRpRJoweyS7ebzp
         zzqb7KD5rdvwGPVoLlkA1m+iuMjw7x0U6pyD8sT5Yl8H7V/5kFdtyDmRl8hJVi0tIDAA
         8msbIED918P/gkH0ctATu6Vvgkx9lC7H1WJorf+RwH7uzcBUAo+DECfeGq2Va6KL0JOr
         GE4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqk/8iJkukqdK62PnXFXgzJiTvPd+N+Y9ftcA7xh1cAZbUf3mCOCtlDlQHW4ZmdEZLP+FBjBt6cIrZJEAyeMR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8y1o/kmz5ILL7/vbOU2eskCZzMbvDSE3G9ia06XFJggFXl6Hw
	EJXtMCIetuo6IfkpjRvqwfK5ovOgXG5F2KzTPjmFk6+eHjHx94hMCUAeamVW4UuO/Ukx5kAODxw
	8kfQCV0i//FmUv64ocQialksLUA0ozXdsSRE+NKIz
X-Gm-Gg: AfdE7clcZAnNUaP3XNJ8cF/XNHZfUXZ+K30/+8uXGXfg7/5Wk3kzY027L8HlcMgZ/VJ
	FpRMTssTDp2sgV8zJEPRNWRnCh8gXHqw4CEQWyBu+QhJcDSS4MxqupWjDSTMbVVVGgGD6tjuhDS
	5Tk7HNkzVLExtrsPGJAvQYXldM/T3X+at3wHyc705gQfaAD686ZH85EPqJliDLqUK5uODTN5rjE
	6O7vVDLUkXxW5sIOKkT/o26zEYskU0pbe0IvYXtIodSJSZ4ZRpWitDCBIQ2CecBKIWmKHKsbJiI
	i6kA/5RAYqgNzB/Ip/fOmfEZ/XjrCSNuydZOv/v3VfkPGM9EaVxmP1ljlc4=
X-Received: by 2002:a05:6402:305b:10b0:68f:d41d:ca5d with SMTP id
 4fb4d7f45d1cf-69838079835mr4734a12.11.1782480889012; Fri, 26 Jun 2026
 06:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
 <sfv7zc6jboy2oxv7zuyofysas4ncbzenwsuzveiyduisfr6i7q@mx23er7uxdbg>
 <CACCo2jkDuwy5w_yhX8833m+s-rY736pk8xtKjxg3_y_7BCOHeg@mail.gmail.com>
 <24420045-a6eb-4999-ab19-1e344eaba8a4@app.fastmail.com> <20260625-atomkraftgegner-hunger-kursbuch-b452ff2becab@brauner>
 <CAG48ez2X1p5Nm2_sU=SK9wUusUO8c3_T-=FGrrOhkm7Kn9Y_7g@mail.gmail.com> <20260626142616.5232c61e@pumpkin>
In-Reply-To: <20260626142616.5232c61e@pumpkin>
From: Jann Horn <jannh@google.com>
Date: Fri, 26 Jun 2026 15:34:12 +0200
X-Gm-Features: AVVi8Ccjij95miiFuC4obt1ADtwSEC1vQNqAn1Ep-7UuHNcBNEBqHY3MBA-NbNA
Message-ID: <CAG48ez3o1Mt59dWdyknh_SEaoi-cHv6pdmix+aOdBy3C0-LkYQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] fs: support $ORIGIN in ELF interpreter paths
To: David Laight <david.laight.linux@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, John Ericson <mail@johnericson.me>, 
	Farid Zakaria <farid.m.zakaria@gmail.com>, Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, shuah@kernel.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	linux-kselftest <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 3:26=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
> On Fri, 26 Jun 2026 14:39:22 +0200
> Jann Horn <jannh@google.com> wrote:
>
> > On Thu, Jun 25, 2026 at 10:50=E2=80=AFAM Christian Brauner <brauner@ker=
nel.org> wrote:
> > > The arguments I have heard from various people so far are:
> > >
> > > (1) Userspace would be able to clone a random chroot to /woot and run=
 a
> > >     binary from it without having to set up a complicated sandbox
> > >     effectively making dynamically linked binaries more like static
> > >     binaries in a sense.
> > >
> > > (2) Quote:
> > >     "If you debootstrap/dnf a chroot to some location in your
> > >     home dir and try to run a binary from it, that it tries to load t=
he
> > >     libraries from your /usr is a pretty unintuitive and not at all
> > >     useful behavior."
> > >
> > > (3) Quote:
> > >     "[Various remote execution things run in locked down containers t=
hat
> > >     disable userns, which makes the sandbox impossible and hence our
> > >     builds wouldn't work there."
> >
> > FWIW I think someone also mentioned to me that it would make things
> > easier for them if they could build a piece of software in one
> > environment and then bundle it up with all required libraries and such
> > and run it in a very different environment, without
> > container/sandboxing stuff and without static linking. But I guess
> > that's kinda niche.
>
> The problem with 'ship the shared libraries with the application' is
> that you get all the problems of static linking.
> If there is a bug in the library code you can't fix it without getting th=
e
> 3rd party to rebuild their application package.

Yes, it's appropriate for weird use cases like "I want to run this
historical version of the software and its dependencies", it's not
necessarily a good idea for normal application use.
