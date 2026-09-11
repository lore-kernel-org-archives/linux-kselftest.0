Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC50472091
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 18:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150867; cv=pass; b=Yy3NXNbuiuHF6uUH9LLwMBnuULnFIUCYid4RMWIOp/NI6pWrdJCbvVqFbLzdkXfcZA6L9Rr+HB36W1NYyhuASy/p9loABy88ivgLeM+/UQymtijPBF6ko6Xuev16oXLSz+2CgXk9qgyzKauWAcZ8iVsCgsiqyQQZ8vSNjpn+g6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150867; c=relaxed/simple;
	bh=ospiNi4mvJbHDyKvltQYpdK+X0l90zSr5sr0fKih89Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rD2jZmBpLzRInP2O0jWyHFhRPPSLrizF9ANL4SBSKCTUziJtB9cXdm9An/ddkEg4iALQJU2y4Tht+PV0QHWEXufnpYTE9jcAtUYjDaQxk/ffYIcuPCCfC4A0zLbNxCqADIqf6l3QTERi7TMpZpoMK6fvDN4nRIoI+Mo4Px6PMT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZy1O7nY; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZy1O7nY"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66bd7857841so1311721d50.3
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 11:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150865; cv=none;
        d=google.com; s=arc-20260327;
        b=Kqtp5WoUa983+uz3qzC37Dvql+nw/iz80zLu5/ZQmC/zFVjWX4ddSdhKDldtFtlbMU
         w+qK9ws1Ktxf64IyCtITwn6ndmoqqxVK6jYdCzAW2f5NWkpa8RY4cJDXK6GROBdKLSBQ
         nJ6N+WPjbW4uINOA6s/bMbBzP+Fs/87BoNYbfcmM3jppYyDrOt0/670nIvNzU9w65W/g
         yHDERmid3QJF3BAKEjyoJkEani6uwQmNG0kI29u/3T4zuiZwvhjqTOwpotqQBquD/5r2
         bm4ZegiZyms2eXS6wc8LS+J/D+vK8cFVWmFTzYoTrTkQztqa2yiIHqoUdc/oNnl7b+9S
         5sDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        fh=Ab8c4kPgBwQPZwCEf4E3f7PJvovVSw2uWXjLP81l3C4=;
        b=MhmfQl9Hhukl1wp/igT1vYsZw1nnLGCAeX66PrxR5rJNigYKNhiMyLB/Vq20Fj7xSv
         wiyK1ai/c9PMmTj93EQusQio7BLDc3MYvRmGV+28yFhIG8LPpqsyzBFMbxM6qDV8jfIL
         uTQU9dSW4CHGCbN4ZhiW2XFLrvp/9dH9Pe1wFB7rpjm3JTgtVQL5HpofnpJdRCQj7wSW
         83PgKrEtThiOjW3D8UTa0zjzEhdO2X9Cdvni7mJOEIOZOzT3mNY+pgLypPBsCQFH2sm2
         wUovepW5h4MKeK5Y43ZOV8NVPqjn1OCLijnOut/PNjJTBqasEvCB0a0KnQQWsnDb0qeB
         Lohg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150865; x=1789755665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        b=fZy1O7nYX4F8RpCBL719cejwO2JBZBHCsQ4M29xWe4J1TICgnhFF4vaFKW0LcVXdmJ
         7JdqsQw8HdHi3qOgLEDUvZWJMdsBhJvjcwAlk7s4SAP6Ge1bQDyq7QlkphqhoqP2sjxu
         hlvtKZOtj97s5AEkAIFBG6SfqtoFA9gozAIKE/u7v19trAtrqTj1kwsXEWMxfPpYViU1
         A6r7wP8ya52+HMgnFwqsiTQib+gLaQKrY4yT8f7y2bOXz5s2XRFZO4o9qvbLDU28U4sZ
         lUNz9mwfWNtI+Bz1r1H2qcuU/MZANI+qNPsIsj2VRtTm7dbTNkjPC+WsuM/oSxn58NcQ
         vk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150865; x=1789755665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PfkoOh/05AN64bzT3WIDHrUSVJxMax1VSqub7HGYzA=;
        b=tJetxbS2DiYvKUh7VvLUowrkA2VQ3QhvyF8/060s/6Jty280yALhUCR0l50IbEpSZY
         RxmpoTItHLlUwYbKWzNY5cHgRmv1HfE5WQYtVrgKNndRsZsq8l1yhDU5h929glNroYIW
         V4BGyDey9yxqB0fx8qKPla9oV6dXj+Trlf3+KXiVekrkuFsx8flVou/ZLBNgIqovI2yC
         KDU+3TId9Q2/gVwGL/8K339G4EHIrfak6umYX44PjwybnV40xbH0AVJ7QT1uaPcIWbAf
         YDAwvE9Cl/td6bbmfrvXsUmaGbEDnBLxTmwIs/huE+IY0Arx1Tehco6jJjn4UgaohObx
         Re+g==
X-Forwarded-Encrypted: i=1; AKwUvBxDo4iR1bgFU0iLKT73Fmqc/3Ysaov/DTtB6SopgzYQFbZkzfeabTNbOFUCYQGrTRazaz8kf2ce10cJse0xqv0=@vger.kernel.org
X-Gm-Message-State: AFuF++n6c8A9MKFhnAkARyYslbOMmUMzPl9DU1QWsBICF8W9oyUgjukt
	MiUxMCtoym2P+eeEsxwXJxAHXoFwpecVE1x9E2WBbUcTAUPpmSv6YhOadNv5PImOgGSlrH0k9cM
	nweHMHr2dA699PWT//4jnKXitLfRwfZg=
X-Gm-Gg: AYBFou2RPRtJi92NLRcDVjsa9pOvqprStnpGMwVhuvnQdWATd/loRi+ZMDT9byXStLk
	J2fyR4ICd+SeBStYJJ7g3I6Hu3Vv+uHxulpiHm0rMOZ49dbU2SY/S8cY7/tWztH/v2qypiqbd+I
	DF9iCA01mgA41ceZyQ82NncDjksBiJB9lirEj9oo4c6XDMv20RLE1+96mcArvA0xKpOhQvECnVu
	auhz46HxYvg96aVSnSeeItKGmDLQRGLVe2YYRQm+hu3wNPtpdLE5ecPxZ8AbmfJEdoCGhJrBxLM
	lrPV0ENNne/ya4dBjrO8sPS1FjMefyM4B77J+moKtkB1kX879mSfVU0KDSmG/4tDNpThKOH9eOM
	t8ujrdNsnPtk91xkYsC1AyvB7GuT59+JZTg==
X-Received: by 2002:a05:690e:450f:20b0:66f:c1bc:c072 with SMTP id
 956f58d0204a3-671246c1531mr1637688d50.58.1789150864802; Fri, 11 Sep 2026
 11:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-dd-cmap-part2-clean-v9-0-3a3f621f4a10@gmail.com>
 <20260908-dd-cmap-part2-clean-v9-15-3a3f621f4a10@gmail.com> <20260909-primitive-nano-hound-8ee2aa@l-nschier-aarch64>
In-Reply-To: <20260909-primitive-nano-hound-8ee2aa@l-nschier-aarch64>
From: jim.cromie@gmail.com
Date: Fri, 11 Sep 2026 12:20:38 -0600
X-Gm-Features: AcwNN1UJu3AgSAwYav9ulJp2R_HPP-fzpsFCD13LL3sQevEBQ_irSbDy0UqSCw8
Message-ID: <CAJfuBxx0VFCS820JLqawLdcpb49Nj-=xnSYdg6ytOub6NidM4A@mail.gmail.com>
Subject: Re: [PATCH v9 15/39] kbuild, dyndbg: Clean up builtin module-name ambiguities
To: Nicolas Schier <n.schier@fritz.com>
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:50=E2=80=AFAM Nicolas Schier <n.schier@fritz.com> =
wrote:
>
> On Tue, Sep 08, 2026 at 06:55:11PM -0600, Jim Cromie via B4 Relay wrote:
> [...]
>
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index 9c2f096ed1d8..99bbae37d34e 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> [...]
> > @@ -161,17 +161,21 @@ file
> >       file kernel/freezer.c   # ie column 1 of control file
> >       file drivers/usb/*      # all callsites under it
> >       file inode.c:start_*    # parse :tail as a func (above)
> > -     file inode.c:1-100      # parse :tail as a line-range (above)
> > +     file inode.c:1-100      # parse :tail as a line-range (below)
> >
> >  module
> > -    The given string is compared against the module name
> > -    of each callsite.  The module name is the string as
> > -    seen in ``lsmod``, i.e. without the directory or the ``.ko``
> > -    suffix and with ``-`` changed to ``_``.  Examples::
> > -
> > -     module sunrpc
> > -     module nfsd
> > -     module drm*     # both drm, drm_kms_helper
> > +    The query string is compared against the subsystem module name of
> > +    each callsite, as shown in the control file, or its simple name.
> > +    The simple module name is the string as seen in ``lsmod``,
> > +    i.e. without the directory or the ``.ko`` suffix and with ``-``
> > +    changed to ``_``.
> > +    Examples::
> > +
> > +        module nfsd        # simple modname (as from lsmod)
> > +     module init/main   # subsystem modname (as in control file)
> > +     module */main      # any subsystem ending in main
> > +        module main     # simple modname, selects same as above
> > +     module drm*        # both drm, drm_kms_helper
>
> The five lines above have mixed indentation, please switch them all to
> one tab (no spaces).
>

thanks, will fix.

>
> [...]
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 0a4fdd8bd975..e129c4d10ed8 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -23,6 +23,32 @@ modname_flags  =3D -DKBUILD_MODNAME=3D$(call name-fi=
x,$(modname)) \
> >                -D__KBUILD_MODNAME=3D$(call name-fix-token,$(modname))
> >  modfile_flags  =3D -DKBUILD_MODFILE=3D$(call stringify,$(modfile))
> >
> > +# Dynamic debug subsystem modname with clean heuristic and override su=
pport
> > +dd_modname_override =3D $(strip $(firstword $(DD_MODNAME_$(target-stem=
).o) \
> > +                                       $(DD_MODNAME)))
> > +dd_obj :=3D $(strip $(filter-out .,\
> > +             $(patsubst drivers/%,%,\
> > +             $(patsubst arch/$(SRCARCH)/%,%,\
> > +             $(patsubst arch/%/,%,$(obj))))))
>
> May it become problematic if there is a conflict with
>
>   arch/sh/drivers/dma/*
>   arch/sh/drivers/pci/*
>
> vs.
>
>   drivers/dma/*
>   drivers/pci/*
>
> ?

2 questions here really -
- what should happen ?   strip arch/sh/ and then also drivers ?
- what will happen - I will play with the expressions to find out.


>
>
> > +dd_modname_default =3D $(strip $(if $(filter $(notdir $(obj)),$(__modn=
ame)),\
> > +                      $(__modname),\
> > +                      $(if $(filter main core common util init snapsho=
t \
> > +                                    process,$(__modname)),\
> > +                          $(dd_obj),\
> > +                          $(if $(word 2,$(__modname)),\
> > +                              $(dd_obj),\
> > +                              $(if $(dd_obj),$(dd_obj),$(__modname))))=
))
>
> This looks quite complex.  I _think_ this should be equivalent, but
> perhaps a bit more simple to maintenance:
>
> dd_modname_default =3D \
>     $(or \
>         $(filter $(notdir obj), $(__modname)), \
>         $(filter-out main core common util init snapshot process, $(__mod=
name)), \
>         $(dd_obj)))
>
> (Removed $(strip) and the last $(__modname) fallback as both are already
> in definition of 'dd_modname'.)
>
> What do you think?

it does read better.  I will try it too.





> > +dd_modname =3D $(strip $(or $(dd_modname_override),\
> > +                       $(dd_modname_default),\
> > +                       $(__modname)))
> > +dd-name-subst =3D $(subst $(comma),_,$(subst -,_,$(strip $1)))
> > +dd-name-fix-token =3D $(subst $(space),_,$(call dd-name-subst,$1))
> > +dd_tok =3D $(call dd-name-fix-token,$(dd_modname))
> > +dd_modname_flags =3D $(if $(dd_modname),\
> > +     -DKBUILD_DD_MODNAME=3D$(call stringify,$(dd_tok)))
> > +
> > +modfile_flags +=3D $(dd_modname_flags)
>
> dd-name-subst and dd-name-fix-token are not needed, dd_modname_flags is
> used only once and can be folded:
>
>
> dd_tok =3D $(call name-fix,$(subst $(space),_,$(dd_modname)))
>
> modfile_flags +=3D $(if (dd_modname), -DKBUILD_DD_MODNAME=3D$(dd_tok))
>

yes, this all looks cleaner and more comprehensible. thanks.

>

>
>
> --
> Nicolas
