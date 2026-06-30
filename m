Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C4F395DBF
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 03:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782789772; cv=pass; b=iowLY0Zpc8ORnz3PeWFoPVnIZQNAD8StdOS6nHhTqstc8Io/Jfllu2ZGiTlgOiPdzvWnO3qwSIDK3HyTZ4NWABj8GiJfnIdBmRezSbinOF9s0goG056B14nNY05S+sR4jSTQLVZKL6J0pKH5Ppv+fbFcd3GdCvuCEDpleg9wJVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782789772; c=relaxed/simple;
	bh=exeKnUHavp/OKrHftRTzlqh9NDuuC1kbg/uZzf/tCB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3alCkF2lhaCaN9Hfx9nYLXx7MP5oAegd0cGNxZ3DjgGmNK3PCIZjnKvWUVb0l610Z6jA8+ZIr9arvOeSeflLgkxzuaLhEpiBu/mOia7aPV340K/ycYZDE3Z1vPrKok3d4IzZzR7PHNkBksvhKMBSAOLCNb3WBWsE/U+Hua8huU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKZBjU08; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKZBjU08"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c125bcfd9a1so239050166b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 20:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782789764; cv=none;
        d=google.com; s=arc-20260327;
        b=KoT+eHXPrzCN5OAE4yjhs7QKpEy5/tNZ1C84/iq/P7E0ItdjStdDup+tFy1vMJKeey
         VYfYb9EKVZRcW5Rkirj7QuJnu1UZdxzArOcRZN+CJdIO1QTjK304qCPknTRNetz2AN0U
         DZH/3Y9kImlXNZzZ3S8c4NzzczSXL3657Ny9JTjivGEZNN5w3ThKtIGMrZ7tUtDityaH
         ey0qsM++0E+zfHuS+qkClBrz+zCpiBFY5dayeHJ9KpLbm0I5gA4ET7ySwtRWn7EL3yJj
         zj7bzk+1IEK+A6nYowy5318tecxjfgRfrjmi3s21Zvti/1lcYxnlZWfMa/ZGmsNTPB3P
         t9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5t0Z8YH1W6ojWYQbuId+EJuIef6/fECfTrP9ygzO3Us=;
        fh=p0MG/ZCfpBnyI4KpsukZBxB6pEEiB4WL+IJsXswz3oQ=;
        b=MFffHr50EbsdIgWTedTb/WtaOQdW6xwIVEoKq96EmIDQbwVkJ+o8lbSzfxNaGV6tKK
         yt5pYXhCculN/m8wL2GbxRxmiZZJgDdCQ2hQvjzJBPidUXqORG+NdR2mECTSswyL4pfC
         eLapYdeP7kxznmhnN4v/RxxOmQZk9q4x8pwV5b4/jXLMnhnqZwOaOe03s5wb3ScARBSu
         a/euUjhXcrRrcSYgrus/wTRutnh1m00Mu+xo9sbaCOgm/1ZD6yHiuT24un9n2FwBca0x
         uXhRFHKnDnA6oZMPivLQRkJguNWkot5IBq4HtNkAby3lgJTf/z2zc0EcFJAf3xn+ZXRK
         dTPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782789764; x=1783394564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5t0Z8YH1W6ojWYQbuId+EJuIef6/fECfTrP9ygzO3Us=;
        b=KKZBjU08ki+m75JYuFallJjK1SVF4oL3LQd63eE7arBAhbPTHBWorc9XCoG4rx1HsU
         4jdhFYf33l2h3R1A+eyBL6sBbHdPOD9mb4i4UlB9dmNAv6vQNfY98ki5vJzw7Jgj9m0p
         iPQD24K6EXvbV+tNtN3l+kMsfGnbkqMnYrrgXLTAg1uRpJ7ziZNI3Zwj+PfZ6f/ZpOqh
         xF+H9lRRW/q4HN4jexSIOnFGbbNaF7ySiWyFT9Ud7MTBcv01I2AbEHeg97KchOqtIo3H
         FB18R8VueODaFGN4P2ITXl+GfRqFjzORIv43PFpmA3yFlEPqa9qNylLhpkq/lPC/hakj
         1vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782789764; x=1783394564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5t0Z8YH1W6ojWYQbuId+EJuIef6/fECfTrP9ygzO3Us=;
        b=h0vYInuXyaTRnBMRjuWZ9ytZthBPp+mglLSEuR60vNFlqAll9omYm50hqMrZIwbMXZ
         CjEdCHzAXwn8sCfSeqf8MaD5ut9nEmbYjKsf5FzXXjokVRsj4bzy7//71S2TUey+rKlo
         JVfefl2phqRt0vJS2bqEtLuRYPFZVLCzyW9jc8iBTpsxIydP7Id7Ap0c8A5lsIqumVfc
         Mkmcxubwjg2s6Tp0eDEzkVrek9IIoO4nklIdt52l8V54M3v8DrVFPz+ko+vUQN4NCVtk
         nHfyEZbjimtaCgWHRpW+kMamY5nbbigQkumSMdnnOWVlmZ/pYQ/ditBlJJ0R8tDhJMQK
         frBw==
X-Forwarded-Encrypted: i=1; AHgh+RpCOSgQsy8w7GJdjIUl/WqsIl5fPVQMfHsCzhEjqNccmq4IoIP+VDUGfWm/RObo2X5ZiacWtILcADkzJp0dyCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTKJSJOnF5OW+IxzgcSfi981rbavJHMcqeAUTu5J0FCbLn0on2
	6uuzXKlcKyW5OJyYSyBBF4hkQAO3JG0kJsM0kBRXPTjPHk0m6q9xqugciGtuJdAy+vTcjeXnF/9
	CUd/5D8TDX3DFq1sg5q8tmOlip0VvNEM=
X-Gm-Gg: AfdE7ckMk82cHgavCXKXoUGwt52383j5dfFx7B18DSggY9rWpoMBf9RgCUJ1Lx990wk
	PoMxb05Jji8TbrBq5M/xOZBE7s0gI7l8/K0hVpDCpzcXxeckhgkd2c0CxsWS9CbJXMDSx9BiUoQ
	jCK7Lt3aJC5Jf2FDAx3CxFlHmuuMISXyeHEsUfRHdpmL8lf2yZdQCbE+mMFYY2+H496yn3CFgZZ
	u0fR+KvskTBRGEqzJGYCf0BO71JoT0IOad2td0V0DEo1EmcCgp4e2h4EaMgBolfFmTt9vj07zoA
	WoO7AWr3Zn1xJDFyl8fwYpQbRm6b
X-Received: by 2002:a17:907:c9a0:b0:c12:696b:dd78 with SMTP id
 a640c23a62f3a-c1287289985mr52985166b.39.1782789763503; Mon, 29 Jun 2026
 20:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616173240.3665059-1-bestswngs@gmail.com> <DU0PR10MB538744C92335756B7F125867E0E42@DU0PR10MB5387.EURPRD10.PROD.OUTLOOK.COM>
 <CANgPUi24wvQ4CLMozb3EBAC-5QKWiMHWpoCQgsBHkG+vZjHALg@mail.gmail.com> <DU0PR10MB5387B831C4F2240AC3B03984E0E22@DU0PR10MB5387.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DU0PR10MB5387B831C4F2240AC3B03984E0E22@DU0PR10MB5387.EURPRD10.PROD.OUTLOOK.COM>
From: Weiming Shi <bestswngs@gmail.com>
Date: Tue, 30 Jun 2026 11:22:05 +0800
X-Gm-Features: AVVi8CfJQcYoiMZR5w6DvUVzxIeWsToljnaZvTXs1mfyEV4ivv6qkONI3rTb7GA
Message-ID: <CANgPUi1ZWrv2ahDcPjWKsgaZikYMLntCxR9cV7TAVHpXxQFwxQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] tty: n_gsm: fix gsm_queue() UAF and add a base
 regression test
To: "Starke, Daniel" <daniel.starke@siemens.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Xiang Mei <xmei5@asu.edu>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Starke, Daniel <daniel.starke@siemens.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=88=
19=E6=97=A5=E5=91=A8=E4=BA=94 15:14=E5=86=99=E9=81=93=EF=BC=9A
>
> > > > The receive worker walks gsm->dlci[] without gsm->mutex while a
> > > > concurrent GSMIOC_SETCONF -> gsm_cleanup_mux() frees the DLCIs, so =
the
> > > > control handlers can dereference a freed gsm_dlci. v1's NULL check =
only
> > > > narrowed the window; v2 fixes the use-after-free itself.
> > > >
> > > > The fix pins each DLCI the dispatch dereferences with its existing
> > > > tty_port reference (option 2), so the data path stays lock-free. Se=
e the
> > > > patch 1 commit message for details, including why the late destruct=
or
> > > > uses cmpxchg() so it cannot wipe a re-created mux (Daniel's teardow=
n
> > > > concern).
> > > >
> > > > Changes since v1:
> > > >  - Fix the UAF by reference-pinning instead of a NULL check in the
> > > >    handlers; no gsm->mutex in the data path (Greg, Daniel).
> > > >  - Pin every DLCI the dispatch touches, not just the addressed one:
> > > >    MSC/RLS/PN operate on gsm->dlci[k] named in the payload.
> > > >  - Add a base selftest (patch 2), as Greg asked.
> > > >
> > > > Verification (KASAN, panic_on_warn=3D1): the originally reported sp=
lat is
> > > > the gsm_control_reply() / CMD_TEST path (see the Link in patch 1). =
A
> > > > reproducer targeting the MSC handler crashes the unpatched kernel a=
nd
> > > > survives 270 race rounds on v2. The selftest passes on both the cle=
an
> > > > and patched kernel (pass:3 fail:0 skip:0).
> > > >
> > > > Weiming Shi (2):
> > > >   tty: n_gsm: fix use-after-free in gsm_queue() control frame dispa=
tch
> > > >   selftests: tty: add base regression test for n_gsm line disciplin=
e
> > >
> > > So now there is a race on device node level. We have the old virtual
> > > gsmttys still waiting for the current pending operations to finish wh=
ile
> > > the reconfiguration of the ldisc triggers a recreation of these. How =
is
> > > this handled?
> > >
> > A pending gsmtty operation stays bound to the old object. gsmtty_instal=
l()
> > takes a dlci_get() and the gsmtty ops use tty->driver_data, not gsm->dl=
ci[],
> > so an open fd keeps its own reference and never reaches the recreated d=
lci
> > (a fresh gsm_dlci_alloc()). On teardown gsm_dlci_release() does
> > tty_vhangup(), which unblocks the pending ops, and sets DLCI_CLOSED, wh=
ich
> > every gsmtty op checks first.
> >
> > This is the existing tty_port refcount, and the receive path here uses =
the
> > same dlci_get/put, so I don't think the pin adds a device-node race. Bu=
t
> > you know this hardware better than I do; if there's a path I'm missing,
> > point me at it.
>
> Sounds right. Thank you for the explanation. My tty internals understandi=
ng
> is rather shallow.
>
> > > PATCH 1/2:
> > >
> > > > -     if (addr =3D=3D 0 || addr >=3D NUM_DLCI || gsm->dlci[addr] =
=3D=3D NULL)
> > > > +     if (addr =3D=3D 0)
> > > >               return;
> > > > -     dlci =3D gsm->dlci[addr];
> > >
> > > Control octets can be transmitted on non-control DLCIs in convergence=
 layer
> > > type 2. You do not guard against invalid DLCIs anymore. Same for para=
meter
> > > negotiation and RLS.
> > >
> >
> > The checks aren't dropped, just folded into gsm_dlci_open_get(), which
> > returns NULL for addr >=3D NUM_DLCI and for an empty slot. But hiding t=
hem
> > in the lookup makes the diff read like the guard is gone, which was a b=
ad
> > call. For v4, maybe we should keep the addr checks at the call sites an=
d
> > et the helper only do the locked lookup and pin, so the guard stays
> > visible where the DLCI is used? Does that match what you'd expect?
>
> Let's revisit the code for gsm_control_modem for example:
>         len =3D gsm_read_ea_val(&addr, data, cl);
>         if (len < 1)
>                 return;
>
>         addr >>=3D 1;
>         /* Closed port, or invalid ? */
>         if (addr =3D=3D 0 || addr >=3D NUM_DLCI || gsm->dlci[addr] =3D=3D=
 NULL)
>                 return;
>         dlci =3D gsm->dlci[addr];
> Without the addr >=3D NUM_DLCI part you access the dlci array at a possib=
le
> out of bounds index if the received data was broken. Let us keep input da=
ta
> validation at system boundaries. You also risk dereferencing a null
> pointer if the requested DLCI has not been allocated, i.e. opened, yet.
> Hence, both checks should be kept in place.
>
> Best regards,
> Daniel Starke

HI,
v3 has been sent. If there are any issues, please let me know.

Best regards,
Weiming Shi
