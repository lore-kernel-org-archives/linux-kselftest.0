Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FEB4F4755
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368287; cv=pass; b=WcChrpGri5l+LQiXt13CfyS0GGJmHfsYaJiKZ1kAJjNWIvwWx51VA6X2SmHNK9xYx9wwvP536tptgkWIdcSzhdmuJBw/Wjd0qkdrYJy+7tGj13vAxp5LVMQFqEJEXnYU2WzNBlJVuPuxkv6f55zvpBzX+hc1Vrhn4BDc6ImPIns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368287; c=relaxed/simple;
	bh=i8K2V7iauqRYBnywpRsfGwdqYCZfWv4UWx7sJDax4N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2XnTbfLaiKR/uuFOuDbOP47kuk5HE42GoVaR3XFZHbXimS2lqaE3MSCOFgGWH+Hk5ZwjZgzhjHw2EuSMFkfcLYoCmV7K8V5UMpfj5tF7BdWLKjh6bGiPpYnB3ycUJ5vB8sZFl2ACaQmzuVhSfsKXi//bVOKLNSpTaEdOk7WUMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjpNXmLz; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjpNXmLz"
Received: by mail-yx2-f41.google.com with SMTP id 956f58d0204a3-673ba589d0dso1339642d50.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 13:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790368282; cv=none;
        d=google.com; s=arc-20260327;
        b=HeWIsEHqED8jTehD6GFXW9/Djy5lQBXC1Yb6XE6zHfH8NfmeiYxbyAXvz9eI0sVUaE
         i4h1I+M+9TrG7WzL96X4/evGV1Lv8Dr/pXXW601mlvLm8IOBD7VyzP+QB3qBQLQStNPg
         6X1+SL0XHAvfkNJ75yQCkw1qO6FuKW+ahjHp0rec1IeiJmrZ6cECw9cHUQ1ZLc0vX3DL
         t3p/w0PhAwPCXZ7lGxfKAy+2urDx/zqt31QHohDSZX3+BO5RK/SE+SW+n/ylHtnFcedC
         JE3zJ8owvKxbErTNE4UmNHixP3Xx+PYxjqjzcpZxw3DWO3qsz0cg9AwU52TrUNSBF8fE
         LMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=noxPgsc3ymzPUXdD7j20u0RQJiwVbYzVMSbEnyT4ByQ=;
        fh=guiwj3+yTU6eHaf+IDuR0rGuLKkGKVrVc2aRslnUZ5E=;
        b=BUWB7BZpj+xieZKiAyVs82ZPAAduaiZKgtQk+w+PcyO5juGGvReoOnAFAFp/cbj//i
         5K7HJayaTFxeWZXLFE/FgUMgYZzbYqJv0fKgN7IsO4bAm1Y2c/YnHWOHJV59sfwWxuDk
         MT33ys3XpdPEu2V2DTMw9dZYWGbkKVpOuheTKufMVW7+12OeKJRY079JcQx2/ZZl3zdO
         BjONKYy5dWAkRRwidVwR7Yc7+wjuS54thCNjN2RO7fgJGjXGa5QZ618j17CBuS8BSyqx
         iPJ7Msy5BKTqvo6jFJAxdc2G7L9wo/1bqCujhtX5sMJdnomqZr5J0zzZb8a5rxwYMV/H
         4OgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790368282; x=1790973082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=noxPgsc3ymzPUXdD7j20u0RQJiwVbYzVMSbEnyT4ByQ=;
        b=TjpNXmLzBaIdJEpWXZQ+rE33LSI7Ijg4oqvYvQ8zcO1X4TIybbM9R7tW+Rx6PJ94e6
         VL9xrMXYP5AoQ+b2+Lvexr8ZUqvzm5VAO32nn5LsfFgf7KyxWMiL3fwwKV2VAF44BJ25
         /3ZuVluFlCo490TVbBuLDq0x7fEwGBek7zym35Z9sHhXJ9/aIGj0NNK5WaxUMLABOtuy
         PaTWKoHMvq8svAdwg2t14P+TNeADlcXCbREq4dN0mDj/eq7kE8QdAwzMSbdAT13vDivf
         VrMILSLZSdZiBeMumuRGXPqK2VGB8kzp4kE3GIGtqSkT407KGvLiHAm/oVl/92qqPuzP
         cVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790368282; x=1790973082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noxPgsc3ymzPUXdD7j20u0RQJiwVbYzVMSbEnyT4ByQ=;
        b=bgaYgtR1OVcb6xT0KXM5qvyKiuFy7MEQrrjtLQkTWPXTtT4Y6CQhue5qn7WmL3VT3I
         x4AbfV2uk8eyekwhnhTer2c0EeFuJWA9AJMc+ozVcmCgPTeTkTSWwjbTHmJWxmJdi8d2
         0pE3kmh3TLiqoOcw8HCxpJqHkB2DPt1yP1M6YmrcJ5Rl9l17FXgkHNpGkyl4t0Brrr1k
         hK2YQFIoFO/1j18kHmFL+8MIkFj2dLKPOmFx+rCz3nK3gFn2lGcEfBuZd50eUjADqOfy
         x735Hv79NTiMNjY8nQb1DPNf0E4B71dlBOUek0WabF8TfdDUEes/yXldX6Xj4rLw7U1w
         I7gA==
X-Forwarded-Encrypted: i=1; AKwUvByu/EuhnXGyqQ9tixzRw/JRbfrqHiCAEvlY00gl78L82+ZtQEPAI5t492KGjwjZJsLhue/pnTfWjqNRAOmO1zM=@vger.kernel.org
X-Gm-Message-State: AFuF++noLivtZ77xc8utq4BuP2wpaj5wWdMK0W3yUJn7CcBEFJX2sSaw
	tIUqqhi1smktl1QXf92sfOZyDV6nw4lK1sAJgz5xs0rNLfIOE7U2ThSW5mi/tqgxeJq3FWB1vUg
	ExrZrtJinVXnv35DFjVkN9EakSc1/1MU=
X-Gm-Gg: AYBFou1metQT5iSG7XAlJ43sENC7ZRMZboAyXNSFWpT5ZqcUlDWD/kB4RMJ+2K0Q9VX
	7w3txYJQjLT9w4zgpw2tbKmPMrj1U+rpjegN5GG/3VSNyWS53j25UAsSJZs2qXjxIMk/oQARY+Q
	48nSQDgcguSWPktKxbGoVU+nsuIRWMWGJ4nvejYkjAqvoQTYkZDoydPv7OiLSK3re5Bem/sDej0
	Swx6zUVpZi9E8lAUjJg0qmXrnW3+SeiEOiGsm3Wx9+j9ajB5sTwzxQPed9uVQ1+167Yw7Z3d5Cm
	vA6oOcd9yLAPmh9H0SkQaAbM5Dn8NRs1c7EwEtiq/yK85VRVXCNj3+dVGxUOkYz1cpkmrsxBV6K
	/Az9hnTcKpE9fvjNDFHGcwDJsb/rCAJOonw==
X-Received: by 2002:a05:690e:1382:b0:672:a289:7b0 with SMTP id
 956f58d0204a3-672ed93a88emr3463724d50.76.1790368282266; Fri, 25 Sep 2026
 13:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com> <20260923155339.bdc677e8e688611bcf190ad9@linux-foundation.org>
In-Reply-To: <20260923155339.bdc677e8e688611bcf190ad9@linux-foundation.org>
From: jim.cromie@gmail.com
Date: Fri, 25 Sep 2026 14:30:54 -0600
X-Gm-Features: AclHuK81aQy7pcphOyoCN0Cv4efDR1k93Uxkj909m52hc-_PgnQGdKhUE2sknH8
Message-ID: <CAJfuBxxd8hMf0OcnOK+w-QyizaKY=WA4VL+fyoD3y6EsHW1+og@mail.gmail.com>
Subject: Re: [PATCH v11 00/38] dyndbg: Fix classmaps API for subsystems, query
 extensions, selftests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@net.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Philipp Hahn <phahn-oss@avm.de>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:53=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 23 Sep 2026 16:34:24 -0600 Jim Cromie <jim.cromie@gmail.com> wrot=
e:
>
> > The drm subsystem has *lots* of debug statements, in 11 categories:
> >
> >  $> git grep '\w*_dbg' drivers/gpu/drm/ | wc
> >    5663   30159  542864
>
> Methinks this regexp was overly promiscuous, but point taken.
>
> >  $> git grep 'DRM_DEBUG\w*' drivers/gpu/drm/ | wc
> >    2206   12834  202332
> >
> > All of these are bit-tests on __drm_debug, exposed to users as
> > /sys/module/drm/parameters/debug. Many of these are done often;
> > vblank is done ~100/sec for some displays. Over the uptime of many
> > boxes, this is a lot of cpu cycles on bits that are almost always off.
>
> A __test_bit (or |) every 10ms sounds quite negligible?
>
> Especially if __drm_debug is __read_mostly.  Which it isn't, afaict.
> Um, low-hanging fruit?
>

__drm_debug certainly qualifies.
I will send the patch, separately.

patch 37 adds a +c flag, to count invocations of flagged callsites
it counted 5M calls in 60 sec.  or 83 KHz.
That seems "fast-ish" at least,
perhaps worthy of a static-key over a __read_mostly



> > Dynamic-debug excels at replacing such tests with NOOPs (via static
> > keys). Classmaps was devised to bring that 0-off-cost to drm's
> > categories.
> >
> > Classmaps-v1 went into the kernel in Sept 2022, in 2 chunks:
> >   b7b4eebdba7b..6ea3bf466ac6    # core dyndbg changes
> >   0406faf25fb1..ee7d633f2dfb    # drm adoption
> >
> > Sadly DRM-CI found a regression during init with drm.debug=3D<initval>;
> > the static-keys underneath the drm-dbgs in drm.ko got enabled, but
> > those in drivers & helpers did not.
> >
> > So in Feb 2023, it got pulled:
> > commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")
> >
> > Root Problem:
> >
> > DECLARE_DYNDBG_CLASSMAP defined the classmap, but its repeated use in
> > both core and drivers violated a K&R rule "define once, refer
> > afterwards". This flaw resulted in a regression; with drm.debug=3D0xFF
> > boot arg, drm-core got enabled, but drivers/helpers did not.
> >
> > This patchset replaces DECLARE_DYNDBG_CLASSMAP with:
> > - DYNAMIC_DEBUG_CLASSMAP_DEFINE (invoked once in the exporting module)
> > - DYNAMIC_DEBUG_CLASSMAP_USE (invoked repeatedly in drivers & helpers)
> >
> > _DEFINE exports the classmap it creates (in drm.ko), and other modules
> > _USE the classmap. The _USE adds a record referencing the _DEFINEd (&
> > exported) classmap in a 2nd __dyndbg_class_users section.
> >
> > At modprobe, dyndbg scans the new section after __dyndbg_class_maps,
> > follows the linkage to the _DEFINEr module, finds the (optional)
> > kernel-param controlling the classmap, examines its drm.debug=3D<initva=
l>,
> > and applies it to the module being initialized.
> >
> > To recapitulate the multi-module problem wo DRM involvement, we add:
> >
> > - tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh:
> >   Alters pr_debugs in builtins and test modules,
> >   checks results against checksums of expected results
> >
> > - lib/test_dynamic_debug.c & test_dynamic_debug_submod.c:
> >   Builds parent & _submod modules with _DEFINE and _USE inside #if/#els=
e
> >   blocks, reproducing the 2-module scenario under selftests.
>
> So what I'm understanding is that this series presently has no effect
> upon DRM?

I have 2-3 DRM adaptation patches,
then a single 1-liner patch per driver,
to get DRM using the new API.

39 patches seemed big enough for now,
if you'd like the rest tacked on, Im happy to do so.


> What subsystems *does* it affect?



>
> Sashiko had quite a bit to say.  It hasn't quite completed at present.
>         https://sashiko.dev/#/patchset/20260923-dd-cmap-part2-clean-v11-0=
-9b6c217fdf2f@gmail.com
