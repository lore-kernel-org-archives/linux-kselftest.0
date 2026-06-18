Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22D31355D
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 16:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800802; cv=pass; b=UhN9RH5AC0zLbnla6JT2UL46feyY8laviicK/Pg91ubpgRCqBjaIWoLf8eDPwmth+/Qkl199PwIfoc8Iw13onQ4XWIXlNanIsGwdPbisxEoR1jFOZl4gfO6PoCeJu4YJrdwKbLo++fm/4oKVNzQdqmZbPxMEtwj/OmH/xC5BxMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800802; c=relaxed/simple;
	bh=ZWeYY5EsOw054i6YP8butqMMDZMCJ6MTBzBqPzct8FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osBFwBJQBlp+A7Z+PrpVaVNIT9dWMSAt4IoeenVC/SdTjZ2UASgiHLfbJeEBF9qot9FY3IdFpcEqsinWyx8q2RF6QH/HfhtgWkwpMCz7Rv0xd7J6t3GOi7zVBZk6Jgt0x9qWJBATRQLmOjiHbAFbP+mgzd0EaP1FTxRUdD89EGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIEYXuLB; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIEYXuLB"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c074ac8adaaso146006566b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 09:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781800799; cv=none;
        d=google.com; s=arc-20240605;
        b=JrJ8ueds3xBlBa7Y0to747aRVioBToJe4CiHMHGu2svhi6nSgthvYkHQYSqwWz/OfT
         SmiQJ/oA7Hwh7l22zDWTqko8Exmi3KAeK6GP8z77gnE8d0BSn0AGnUZIvW5DmcMWFbOK
         gLFBkACN+c8b5+l6/rbFYaIJ5seRgG0C4DXnkVlbE1JC5mOvkIzyZo/zOXiVN6Rhotjp
         YHM0FQs0s5BYgxUIAyRdv1UF9wtA+tq1/4SoNzTxGFcSfVqsrYstQGK2i4yoys2uebaw
         PNk8uSYBBf/E/xMeD6qx8dXP/NUAm/YLPxiW/0QIFDXvt1yHkCeR7nveDOoWvDaSE0q2
         mlsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ylNEn1iXKNRmHKldiN/3uxktuPUhP+JK50i2MvPfZc=;
        fh=X4Ms4BJO0681CQPbxWf+GHj0AR27O0L87DYPtZulckw=;
        b=KKTo+iqH9M0DHHyWigmt4tzRQuf2a04+pupBwGoUejuR+nmLGdPd2/oZrFJLn4Gzm3
         Dnryzjmv1ayfQZbO8IvBlpT1BBjlZuka0XS/RKaRM170id4rlKExs/yUMAesIexdM3RS
         edFKge4b9xQk9duosEnht2xQA8yj59j3Aa32WvdLCvG5/wuBHlvgQK7s8eEceAScFJaa
         kgIBAISD/zczoiha7numEb7R44atA/e0M2QAc+L4jIB3S+pBvErwOt0BrayDlhVZxlJa
         qS5WLxKScnQEHFD3EWRhH/Qt6WYXAyKHTAkBAj568tLx7uMZ9/hvh+hENUbiIaWicEA8
         FqRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781800799; x=1782405599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ylNEn1iXKNRmHKldiN/3uxktuPUhP+JK50i2MvPfZc=;
        b=OIEYXuLBn9OH+WzDdtCldsuCe5vlWnaCMxv2VU7f4Ksqu+CHEsqaYq/NquzC/OG1SP
         p+Wqdp0d38j3FDwxksRV8e6w0UO9iCCeeLo+h6n6qXApvlkxnPmDOmZIuAvJSXCjyeMN
         YYD8tt7eCT7dttuaDAu725sWZY5BMHlPcQOjUr59W6dlV2RnYjmW/XBp2QWMRBR3htTs
         pQYga3WpTt09UEOKXMCPW4jN4CwGQYuFD0+XTE+6tPRWS0GN99H08XYk5NAAcuEH77fy
         /zXjeWJomJon6boDE4Kr6mTKlvK4/SrMeXQUd/nxgovgPfklahi/VNKci3F5Imsxiuqt
         XHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781800799; x=1782405599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ylNEn1iXKNRmHKldiN/3uxktuPUhP+JK50i2MvPfZc=;
        b=jYzAAOiEbNs+rD7lGTUgKf7oF5OU9n/H1XggQvGO6ZXWojjimAy1iKudldhxsr8W45
         rHeBUUvwiruscB85F5GbE+nxGhKL89grQpkYy5UU8/Fiz3jErcO5p37PZkv5WaOXZw+j
         WG3iG+Ht1nQ2HkqBBGKJWYcuSlNAL+u+Y0jjOb4gAkqstK2DeLjGh96Px49PlTMbHBq7
         XorE1ijZzf7hw47+ZJaskORJVXov1HHb9Wq7AFv4yb8sGMhhJHj7HpXvFRsVIdq9CsZq
         b7eyEP9aLH08Sv+o/C42OjBo33/ld7CAvB0VWh0k2Jfj/GA/QO1m9GQdyqrMgHIWBp2i
         Gm7g==
X-Forwarded-Encrypted: i=1; AFNElJ8/P0bIz9ml3xttsPx++tL7qDv5nzq1AjFI3HQj5VDqKYu0sqKPZgIK62SVruo1/RAPQBR0vyy41O2GOLNNpdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKp7m0eeYJmFdpe1eI/Xh9+pdu5TdV96YJZ9fN/WfFI/q/Oom8
	n5yNFmwQZfRiEXvv5ZFduHIXKYjr7SjY+K+ao/Red3sR/sW9X+wtodzXtiebPQD8aWsG9mXtZsN
	k4wXGPSm/1W2mnrpcjdc9dUt0DofYVmM=
X-Gm-Gg: AfdE7clKRb+0WMrcueyr6QBABuNJodlDW4kodOUH0XCj08hZYy5OpM5xmEUXxwwA9hV
	ytkTQYguJ81QZrSiDQfhYkXAVCrVQdDaIm4uE0PMXvySeB3t1KkPwvk77Ab/ANoJhBLUNaC74t7
	FiDRiYlZeHU5AzHe1PICJ5vMUZ2nUgMHqzpNmpz055al+7zW7i4jlUZNKkFE3aWgtd4rBlvEgd5
	HIeLXwzq2LSBJkS8m27ypN5KUwm5JwFm+mxyu/g3FtRmiGi3qiqVB7+DM83GMcpXC+Y1Fwrzfec
	YSh6AF5MhOcMQlJMJ+l6wkCxh630L1r0i7jZSFbA
X-Received: by 2002:a17:907:981:b0:bf8:b1ed:43e0 with SMTP id
 a640c23a62f3a-c05a4f0705dmr601383266b.18.1781800798876; Thu, 18 Jun 2026
 09:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616173240.3665059-1-bestswngs@gmail.com> <DU0PR10MB538744C92335756B7F125867E0E42@DU0PR10MB5387.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DU0PR10MB538744C92335756B7F125867E0E42@DU0PR10MB5387.EURPRD10.PROD.OUTLOOK.COM>
From: Weiming Shi <bestswngs@gmail.com>
Date: Fri, 19 Jun 2026 00:39:21 +0800
X-Gm-Features: AVVi8Ce0NUYYVksQhe4auyimCwK5nbJIygcAYXk976ZZ9WY7yLA2_V9yD9NVioM
Message-ID: <CANgPUi24wvQ4CLMozb3EBAC-5QKWiMHWpoCQgsBHkG+vZjHALg@mail.gmail.com>
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
17=E6=97=A5=E5=91=A8=E4=B8=89 15:26=E5=86=99=E9=81=93=EF=BC=9A
>
> > The receive worker walks gsm->dlci[] without gsm->mutex while a
> > concurrent GSMIOC_SETCONF -> gsm_cleanup_mux() frees the DLCIs, so the
> > control handlers can dereference a freed gsm_dlci. v1's NULL check only
> > narrowed the window; v2 fixes the use-after-free itself.
> >
> > The fix pins each DLCI the dispatch dereferences with its existing
> > tty_port reference (option 2), so the data path stays lock-free. See th=
e
> > patch 1 commit message for details, including why the late destructor
> > uses cmpxchg() so it cannot wipe a re-created mux (Daniel's teardown
> > concern).
> >
> > Changes since v1:
> >  - Fix the UAF by reference-pinning instead of a NULL check in the
> >    handlers; no gsm->mutex in the data path (Greg, Daniel).
> >  - Pin every DLCI the dispatch touches, not just the addressed one:
> >    MSC/RLS/PN operate on gsm->dlci[k] named in the payload.
> >  - Add a base selftest (patch 2), as Greg asked.
> >
> > Verification (KASAN, panic_on_warn=3D1): the originally reported splat =
is
> > the gsm_control_reply() / CMD_TEST path (see the Link in patch 1). A
> > reproducer targeting the MSC handler crashes the unpatched kernel and
> > survives 270 race rounds on v2. The selftest passes on both the clean
> > and patched kernel (pass:3 fail:0 skip:0).
> >
> > Weiming Shi (2):
> >   tty: n_gsm: fix use-after-free in gsm_queue() control frame dispatch
> >   selftests: tty: add base regression test for n_gsm line discipline
>
> So now there is a race on device node level. We have the old virtual
> gsmttys still waiting for the current pending operations to finish while
> the reconfiguration of the ldisc triggers a recreation of these. How is
> this handled?
>
A pending gsmtty operation stays bound to the old object. gsmtty_install()
takes a dlci_get() and the gsmtty ops use tty->driver_data, not gsm->dlci[]=
,
so an open fd keeps its own reference and never reaches the recreated dlci
(a fresh gsm_dlci_alloc()). On teardown gsm_dlci_release() does
tty_vhangup(), which unblocks the pending ops, and sets DLCI_CLOSED, which
every gsmtty op checks first.

This is the existing tty_port refcount, and the receive path here uses the
same dlci_get/put, so I don't think the pin adds a device-node race. But
you know this hardware better than I do; if there's a path I'm missing,
point me at it.

> PATCH 1/2:
>
> > -     if (addr =3D=3D 0 || addr >=3D NUM_DLCI || gsm->dlci[addr] =3D=3D=
 NULL)
> > +     if (addr =3D=3D 0)
> >               return;
> > -     dlci =3D gsm->dlci[addr];
>
> Control octets can be transmitted on non-control DLCIs in convergence lay=
er
> type 2. You do not guard against invalid DLCIs anymore. Same for paramete=
r
> negotiation and RLS.
>

The checks aren't dropped, just folded into gsm_dlci_open_get(), which
returns NULL for addr >=3D NUM_DLCI and for an empty slot. But hiding them
in the lookup makes the diff read like the guard is gone, which was a bad
call. For v4, maybe we should keep the addr checks at the call sites and
et the helper only do the locked lookup and pin, so the guard stays
visible where the DLCI is used? Does that match what you'd expect?

> > Fixes: e1eaea46bb40 ("tty: n_gsm line discipline")
> > Cc: stable@vger.kernel.org
> > Reported-by: Xiang Mei <xmei5@asu.edu>
> > Link: https://lore.kernel.org/all/DJ7OKN8EMAK8.22CE0B8NZXD73@gmail.com/
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
>
> This whole worker separation was added later, not in e1eaea46bb40. Maybe
> worth updating to the corresponding commit.

I'll find the commit that moved the eceive side onto the worker and
point Fixes: at that.

> Also, the code comments have a strong AI flavor but AI use was only
> disclosed for PATCH 2/2.

Sorry, I missed that tag. v4 will add

Thanks for the careful review.

>
> Best regards,
> Daniel Starke
