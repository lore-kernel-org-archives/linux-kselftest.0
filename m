Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793211815;
	b=cCAGSCTKjGB1sS5aF2EKcN9I8C7Clz3sbk0Q+uvFLBfSfvILbCT8jK5c3ZvuZ+/aCdjm
	 nOVT/Yo35SPgpD+x617TJR2Z59X8N/H7Yiri8MRKc80+flXKSyKBAeSnccH7WMBleUD1a
	 wNFJfyrlJ2DBRnAo1enGEXi0MRDlXt0DWe8JcCo1uh3h2r26h09vp9zhFT8DyawKZxjkl
	 C1ESoW8OrPl+0N4qzfujW1VbzyKchi+cGEcS8x40mgdWHf3hcpYBSnRd8WIqS6m6zk4h0
	 ue0W2+QVzBN5DE1CRU6NRtRa/BpXO//rkwOhYgD0ILwls836SnxtBvFhPdF/5+WMSQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793211815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cFWfkIkWfjhOSUFJOJXQEhmE0QtvF6eBs0tDviPyGsc=;
	b=q2ofjv0VO5xK4zFfIKGwloGV0p6KA5j8w60YAV7LnFLfrRCYD4z7kAEd0gIKI0V6uMef
	 xkU0TtcAh+Ufp7tKYECb8rZZU690/5pMfbJiUBIBmqlcZ9rY7P9Zo96TlTIn+9TFa6rzq
	 OoU+/mVTSpizmWd+9WRq/e1xRkbUgVYug0c9PzvHTVKunoFrvRoGcF46IzTgkSyiEQ3MP
	 CeeFOSG7bn4nyt4EpYFen22fmnX2UCeyOR9nWURK8HfyRuk9/m+R1N5kaoU3MauqoU9ac
	 mBki8il2MXIHKp50XuA2eT4iLdcyscadBZkqVQhtZDxDjo0LWQYQFfZaYSzENAJc7Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmCVmz5E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54526606A338
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 18:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54526606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmCVmz5E
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67999045530so1187548d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 11:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793211813; cv=none;
        d=google.com; s=arc-20260327;
        b=PAREtzE7fKOYSsMJsfs72P/V00wFNeaqT3hlmxYmOEKIJcRgsB2rfLdSlLuvgQaBGi
         43e0wCymddgC6B8rjPaVRHu0yt8HMGreo2mKw6ZlAkge5Nvhgso2WpSBf4Bm08IvYgnt
         GIoj12FvNpXCZSjjnzY7D9rXTAWbOBMQYP9Jq21gltfhVWrywKPGuXBYRXadRIuzlpEV
         31qRXt6qfRMSGdYKGxzB8u44g7vA8/THSOzIZNLqm1Gj3LUrcB49yq65SYkM3NmNIVNV
         1nMTECR0hXs98+tjaokrwfkoRNFN9F5fZB974y/PR7XOBVf+euUR2fleNCUtGdiLpGMU
         DQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cFWfkIkWfjhOSUFJOJXQEhmE0QtvF6eBs0tDviPyGsc=;
        fh=fsKPHZP2WsXJZ63w4Lcf1kg6iWo5fc2uaQ9rv6Q8M6M=;
        b=G4lpVAMwyMTEDY4+iJQ3hRYGkqEZiaddvR52rzQ2Lry9d+aKCbRK7EarJQthDs6GMO
         qf2A+XW6R3xKG+ARAfWArt2Oui38172T+nVjRCdcwYXW5W/SOS7YKCaTXFtcPzshvqux
         thOufTJSsPCrME08eFtvDxdLugT29TOCp2iO8WjEgoIgDvyZRL9VewDY81wWxJybQQSu
         S6NA0wL0LMq41ZgyUtpFPwt28StMQkQulQdfcldSTquQyOt+6KPdKQ2YqyOA7MmZPw8F
         ReE478bBnguGOt56ee9FeXdg+T+wSDiN3v4sgynZYOWKvLz/BdHE2PtKaanhLPFl9CQy
         yqbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793211813; x=1793816613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFWfkIkWfjhOSUFJOJXQEhmE0QtvF6eBs0tDviPyGsc=;
        b=cmCVmz5EDlPgGpt7D48i7zZLLkqYO+wKOQEJCFw+CPT1V0HsVdAOe24mkft9RXoEkD
         jPI3A5deGmYs3Q1PF3kw8R4dQ23CEIy4/U1S9qF9Ar1JXrXInpunTdMqBudL8okCjjoy
         5f2IcaSQ8wAY9ju3+/m0NYTjPTu/ueX6EsDmnX2FcC4QUPjx2/QEKkvGtV3J6mBSoLn1
         c3+DohN62m7thFQFl0j2MU+ok2Gf6av/sgv+lltqY/+2wDnHn7XYq7irZX+hCgsbB0iP
         CA/YnvHkM7rIJBNzGlEN4RTUyMUBRGWhDff6qMJm3GQt/BHtf5zQNMIcn/yy9/Oe26Hk
         1FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793211813; x=1793816613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFWfkIkWfjhOSUFJOJXQEhmE0QtvF6eBs0tDviPyGsc=;
        b=ZdpqB5wSKmjhkqB+xIKCnvgMO/1ofIJh/7S+V60NjHHQKKOzgpAwq4ssjQxFnXwXAT
         nh3J3fZxsDRxrGNyjPXgd57mjZm5KcT3oPSvYVxaugqvK7EkmUj9soipLXAhBfzSLy9S
         IN5/RiRh1dvCf4AtZJ+Lfs5vMLCMDNB8miQnWnlRHiaW0wbALyKWbO0pLvWuRvaPh6RL
         27OpORl9bf5es4Y2dAdYDVsv3hYDGjV0Ns8IBzwMDCiN2dsB0+tEgTE/8Wtyt0lYI3jR
         grHnZthmYplfNxiXO+5jzjWXY93v1ew0+iyRRaOCUgd0xjAR7h4xSnP/ZEPkEVKf/ySy
         A1bA==
X-Forwarded-Encrypted: i=1; AKwUvByTargQCpGqUDnBCJpH0JrrjJvJs5DfcaWAKE5j7cCR0KH/c05/S5o2DpLlUBE77Ml931g5PR4ghV5OBU3LV3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMOvRkcdeW2Txrbhq6RzQfB45gHOcP7j80yhdgbWHkMOBk4KX3
	GXUb2wu/oqiUGliEWdsFlMfmNW4rS5YRFuiHEfBGs1FBKXA0zQGAUf6l+oAQjXcOcauyH3f98HL
	WEVMXY8OKYwmMRPhM8lgsl4s9bM/xiv0=
X-Gm-Gg: AYBFou1JBumt0ec12PKvaMp+7kd06VDeokkiEOLUoA4TwaPQPH4AKfJWmiuEnX3pfzi
	MmDjTwWHUIIbX+k75GKvOSw60j1mATssXLfjx8d8h9slL1+yWyAgkwux9Q2w25GYXYJ74EMv0B+
	qaTkoTqA7U4+LxGceyiNBP/Hkf/fE0SuJTA/1j3396QwSgHticcR/CebnXcu1qFuKgqEE5C8U62
	iBDid9HFRmm20Sgf4WjBY8kEHVPM25P2WgOBCh71Wq+I46WMeD1pNfKGn1A+kQ+sv8S50Wo1dHw
	0iPoC5UjkpgNub0ukW6/ygsSUiUnPpacJQg7dflfnTGn+iB1T79N5rf7pNMLmv3mFvWkbj45j8o
	FvINQMGjNVoIP5M+KQz2q5FcDxChyXQwCN7bRpb6mcAQbZSXDp+RMDB1c1SOGKCwKk9PrwpdpPz
	5AUcW2FNiaPwQsCTg=
X-Received: by 2002:a05:690e:d0d:b0:679:9e60:346c with SMTP id
 956f58d0204a3-67a7baef0a5mr2432293d50.4.1793211813004; Wed, 28 Oct 2026
 11:23:33 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
 <20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com>
 <as4W9hToBqAvbzJ-@pathway.suse.cz> <20261027132253.5f3a461d@pumpkin>
In-Reply-To: <20261027132253.5f3a461d@pumpkin>
From: jim.cromie@gmail.com
Date: Wed, 28 Oct 2026 12:23:06 -0600
X-Gm-Features: AclHuK-4voxmbnvtymBlAumJXr1uxieHMHufYdWUINblBauYdwThefAV8akW3iU
Message-ID: <CAJfuBxxgn8AOv_1rrAWb1xgJiPyU0faD08RuTz4kGY9RS_-v1g@mail.gmail.com>
Subject: Re: [PATCH v12 33/40] dyndbg: Ignore additional arguments from pr_fmt
To: David Laight <david.laight.linux@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
	Philipp Hahn <phahn-oss@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:22=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 13 Oct 2026 13:33:10 +0200
> Petr Mladek <pmladek@suse.com> wrote:
>
> > On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote:
> > > From: Philipp Hahn <phahn-oss@avm.de>
> > >
> > > pr_fmt can be used to add a common prefix to any output from a module=
:
> > >     #define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> > >
> > > But adding additional arguments breaks dynamic debug:
> > > > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 arguments=
, but takes just 3
> > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > |                                                  ^
> > > > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > > > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)       \
> > > > |
> > > > error: =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA_CLS=E2=80=99 undeclar=
ed (first use in this function)
> > > > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DF=
LT, fmt)
> > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > I wonder what this error about undeclared macro means.
> >
> > > > note: in expansion of macro =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA=
=E2=80=99
> > > > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));  =
       \
> > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > note: in expansion of macro =E2=80=98pr_debug_ratelimited=E2=80=99
> > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > |         ^~~~~~~~~~~~~~~~~~~~
> > >
> > > Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to slu=
rp
> > > any additional argument, which `pr_fmt` might add.
> > >
> > > --- a/include/linux/dynamic_debug.h
> > > +++ b/include/linux/dynamic_debug.h
> > > @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descript=
or,
> > >             dump_stack();                                   \
> > >  }
> > >
> > > -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)  \
> > > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)     \
> > >     static struct _ddebug  __aligned(8)                     \
> > >     __section("__dyndbg_descs") name =3D {                    \
> > >             .modname =3D KBUILD_MODNAME,                      \
> > > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > > index f594c1266bfd..5d701952e739 100644
> > > --- a/include/linux/printk.h
> > > +++ b/include/linux/printk.h
> > > @@ -742,7 +742,7 @@ do {                                             =
                       \
> > >     static DEFINE_RATELIMIT_STATE(_rs,                              \
> > >                                   DEFAULT_RATELIMIT_INTERVAL,       \
> > >                                   DEFAULT_RATELIMIT_BURST);         \
> > > -   DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));         \
> > > +   DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);         \
> >
> > IMHO, this changes the existing behavior. The prefix added by
> > pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
> > Is this intentional, please?
> >
> > Anyway, if we do not longer pass pr_fmt(fmt) then we should not
> > need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().
> >
> > By other words, we newly pass just the format "fmt" without the paramet=
es.
> > The 4th parameter was added by pr_fmt().
> >
> >
> > IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
> > BEFINE_DYNAMIC_DEBUG_METADATA() and
> > DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
> > to accept var args. I would expect something like:
> >
> > #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)        \
> > ...
> >
> > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)         \
> >       DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt,=
 ##__VA_ARGS__)
> >
> >
> > or maybe, we could "eat" the extra parameters in
> > DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
> > DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
> > DEFINE_DYNAMIC_DEBUG_METADATA(), aka
> >
> > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)         \
> >       DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
> >
> >
> > Or do I miss something, please?
>
> Don't think that will work.

Im not sure who youre responding to here,
in any case I sent v13, with adjustments based on Petr's observations.

here it is, in action

bash-5.3# history
    1  modprobe test_dynamic_debug dyndbg=3D+p
    2  dmesg
    3  modprobe test_dynamic_debug_submod dyndbg=3D+pmf
    4  dmesg
    5  history

[    0.707538] virtme-ng-init: initialization done
[    1.060923] clocksource: Marking clocksource tsc unstable due to
inter CPU skew
[    1.060929] clocksource: CPU0       4136478715 < CPU1
4136478900 (cycles)
[    1.060932] tsc: Marking TSC unstable due to clocksource watchdog
[    4.703188] (udev-worker) (78) used greatest stack depth: 12376 bytes le=
ft
[   44.598698] dyndbg:  47 debug prints in module test_dynamic_debug
[   44.598706] dyndbg: module: test_dynamic_debug dyndbg=3D"+p"
[   44.599208] test_dd: init start
[   44.599210] test_dd: do_classes 1 times:
[   44.599212] test_dd: doing categories
[   44.599213] test_dd: doing levels
[   44.599214] test_dd: do_bulk 1 times:
[   44.599215] test_dd: bulk msg 1.0
[   44.599216] test_dd: bulk msg 1.1
[   44.599217] test_dd: bulk msg 1.2
[   44.599219] test_dd: bulk msg 1.3
[   44.599220] test_dd: bulk msg 1.4
[   44.599221] test_dd: bulk msg 1.5
[   44.599222] test_dd: bulk msg 1.6
[   44.599223] test_dd: bulk msg 1.7
[   44.599224] test_dd: bulk msg 1.8
[   44.599225] test_dd: bulk msg 1.9
[   44.599226] test_dd: init done
[  527.233033] dyndbg:  47 debug prints in module test_dynamic_debug_submod
[  527.233039] dyndbg: module: test_dynamic_debug_submod dyndbg=3D"+pmf"
[  527.233458] test_dynamic_debug_submod:test_dynamic_debug_init:
test_dd_submod: test_dynamic_debug_init init start
[  527.233460] test_dynamic_debug_submod:do_classes: test_dd_submod:
do_classes do_classes 1 times:
[  527.233461] test_dynamic_debug_submod:do_cats: test_dd_submod:
do_cats doing categories
[  527.233463] test_dynamic_debug_submod:do_levels: test_dd_submod:
do_levels doing levels
[  527.233464] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk do_bulk 1 times:
[  527.233465] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.0
[  527.233467] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.1
[  527.233468] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.2
[  527.233469] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.3
[  527.233471] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.4
[  527.233472] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.5
[  527.233473] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.6
[  527.233475] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.7
[  527.233476] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.8
[  527.233477] test_dynamic_debug_submod:do_bulk: test_dd_submod:
do_bulk bulk msg 1.9
[  527.233478] test_dynamic_debug_submod:test_dynamic_debug_init:
test_dd_submod: test_dynamic_debug_init init done
bash-5.3#

NOTE that  the dynamic-prefix precedes the one added by pr_fmt,
(the parent and submod differ, latter adds __func__,
in both the dynamic-prefix, and the one from pr_fmt())
This is perhaps vaguely sub-optimal, but it has been this way for ages.

> Won't you end up with ".%s" fmt as the string without the extra argument.
> So you need to keep the expansion of pr_fmt() together until is is finall=
y
> substituted into a printf-like call.
> It is possible to enclose it in () so it is passed as one parameter and
> remove them on the final expansion.
>
> David
>

hi David,

Im not sure what / who youre responding to with "

> >
> > It is possible that the macros work another way. Or this depends
> > on another change. I checked only this patch...
> >
> > Best Regards,
> > Petr
> >
> > PS: I was curious what Sashiko says about this change and it seems
> >     that it does not review this patchset from some reasons.
> >
> > >     if (DYNAMIC_DEBUG_BRANCH(descriptor) &&                         \
> > >         __ratelimit(&_rs))                                          \
> > >             __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS_=
_);    \
> >
>
