Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F8411F95
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 19:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784747773; cv=pass; b=mB7zIe5t3foo7jZxqS3N1QKKPHWO6Hnor/bcmdmjy2OpbVwFCWwvrgL6AV2EQsSaGmyRcMcsVt4lzMhbESU27AX2EnnNMmM1WL3oNfPfPSTz+oLkWf7Ro7sUDcVRVFav1vWcckqlM56zTphnb20urbrZA58zNamxLY37L6MbHZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784747773; c=relaxed/simple;
	bh=uSNJCpAH8uWnp47OfcSugHf++Ebaa9RRjZUksg42xyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tcQ7GTINVJSNOWeyNCUaD0lgqSwZ7gc/CAHHwZKRa2KM31Erd4r1iznHCeJsqEJ5cjNxv0cGEtXux4E5WAvTq7egkRdtxrsXDlJ/d+dnTW5d9aDj9n/OlNCQiGMOpCwld6tg6YZEA+XP6yi+4CT4uutxsOein8br32+P5pMOaR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWZdTFt8; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWZdTFt8"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so7581284a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 12:16:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784747769; cv=none;
        d=google.com; s=arc-20260327;
        b=ZufMAYNDgBbVkM1jAzrpZeWNzuj62nw/MgUsCVJz4qqHK8+NRBpkhhiJOM9DEV4LQF
         /LWKyze4JV/1clYIbl49ovI7zlNLxlgwZOQEjeEX/+/FBubNaf8x3V2EUiAU/dG6zUF4
         ZdCHCr2tAFdNPJPdCWjDHUnm5qF9/WrBxlpv8VJp6EgTqJ0I6EKSy6a8x+AW+IxVW2ta
         kAfTGbcd8dFc2WcXTICyD3Kpe8KPpOLpXTaIWjBgxbK8QLokBcwBvo1/1xhP8ZFxQ5Z6
         /5wDaUrFOSRS18TevyOR3DjVpjZyWpJGWpoAH3GwHxAuYz+Qg2scQNgZ7zRT6VYW2XQO
         9mqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ozOug//rn4js3ZBhPhRoANd/kYjBAviHldTtDn8NnaE=;
        fh=HmX7psFw+TexPP5ensJTWZyVqxYDZ9rJ0a0Pv+4Pq7E=;
        b=jcJhdAwsiv1EEB22ZPFeyh4qrMFFB2oG2DR+MWwtzaa0Qd4mkIomWmpwnZ/fRPDeJs
         wI6v/gnUI1zHidfqF7rwLd28aXNoxHV1FmIVf/ye8XMTKMJvmJ98iZE2qaLXZoCi6bCM
         FeAoBdCVwsCNhromhMiPdz8NgyOiZTtB3SxKutgWktwNc4OcfFn+iZ311CqMax09FqHV
         X7qWDYE7/89Wpjwe7xRNV5Azp9C0phfulUebZrBm8WoTlagfxUVXiR6R4y7L9EhepFbe
         ZjK9S5m/km3Qo7UF20uckk79Mi/9yTc6AOBk0l3itiMsAdNkcfrlF7uBUZ1O2+31d2G7
         1Hag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784747769; x=1785352569; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozOug//rn4js3ZBhPhRoANd/kYjBAviHldTtDn8NnaE=;
        b=IWZdTFt8pEBK2RtwMyGYwCc8XHgwSqds2leKyZj+O2HqppT3E/cQVgpwpXQ0nQsDpU
         QPoJmEsFfU3OyckA+hNXQLuyvShgQIMcSv0M16G84cTPuFbhHjuBUfGNzjo9adPnObDG
         rOkvecWPxPjO5jd+rh77OPV23gpRIFpy2mKC6UlZBYJdiQGv0dmqcPYzjYe0tR+qGFTd
         S1W00rIRxF2e998HAiPQ4XnUfDS0Zh21J/9vOCFr3h2xLRJQyzl1uYpAiCFQYPHLwOpE
         +LJapzAwtKtkdF4vXB+4JxBFIwNrJ+9AVbhrT8MjTP+jGIfzgeAw7NQ5+ox9IO5BiujD
         uROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784747769; x=1785352569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ozOug//rn4js3ZBhPhRoANd/kYjBAviHldTtDn8NnaE=;
        b=BoBEfm5YkNTh573lT+rCnkwH8Lr+iIXUapsHMbeezpYHJ4V6EZNIrUlleUP023iSzd
         kZLaYpXwrawYIi3h7D4gQb87rmuH3fu5hophVPBaSYsev71BxczMal1vzKetHv65uoZY
         v5GKb4LpPGWonlEcMhQmRimdMdapd/a9ldQ9T33V4fT8tss4OLul/HiEF5EyWRq+vktY
         g4tmyP0w6vYicULKBR4T3breo6BPKNgWCnpooDWCm4LM4tGWysgaY49s4Nr7Swh+hCUt
         mDII32HVMZik4fyaBrb6113XIn8UEM/ylukrJfd5Ovb126CO1qULQZkYzP2+rU9Z5Nf9
         QWww==
X-Forwarded-Encrypted: i=1; AHgh+Rr1P+YErgr1WsUe0A5DKcTohfgX6Ewvh5S35S3Fy7BUP+svrcQirbsPcUUMYTAM3Nd6X3Qn8/bCNHJmawc8bEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKO/GnL7uVe8FsJT9cZIMCcB8q4hKspcdRkA0PiEU5qSTRjQHZ
	PAcEY9jfrzNmxVaj1vECAh2X47/60RTlMQgrOtK7Q9iyYf9o2I+jUM6R35/ETrIa+oTZ7KDsAPM
	1M7nC4BmpDbPUPZ3whCsFy5rirCMkxwqepZl2IrOYcHpe
X-Gm-Gg: AR+sD13a17+xy5UaTG/fc+BfKniuipy0XaqtrP95y+KJvJ1ZYRZpbnsubscyBpzM2PE
	V5o6opgRjdC7JMo4adjEKJ/vAdGOYnh0NsaLhdNP1z4++mkRihsVTiHQ79E5e89dw4sM91+aFmA
	PR9qviEn/FlWmPRWpJ+8dw5Lh4UXsELO4O0Li+L1BKlmMeC6M5ZD1DFzRQWeflWlOVikAnSfDdv
	DG27Lxl+u0V2JRIQpuMFeOL961jQPa14+G/Wt+0iNnCFENPMG56r1c691cO7V8yERDV0YWubOs0
	8D6HXF0SEQ42oi2Z
X-Received: by 2002:a05:6a20:258d:b0:39f:a8fb:3354 with SMTP id
 adf61e73a8af0-3c3ad805268mr25896068637.17.1784747768953; Wed, 22 Jul 2026
 12:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722033844.65932-1-sj@kernel.org> <20260722134812.88133-1-sj@kernel.org>
In-Reply-To: <20260722134812.88133-1-sj@kernel.org>
From: Hari Mishal <harimishal1@gmail.com>
Date: Wed, 22 Jul 2026 21:15:56 +0200
X-Gm-Features: AUfX_mz66IglqNqdzZCfbnWOLo8Vdschk37JvoWGxCkjUKLSNKZYiZ0uUUFwDeg
Message-ID: <CAMmC+=BDZ6thHptTq=yGvfygUQb+0i2QeGbKXH+OFcXpnTXv1A@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/damon/sysfs.py: clean up sh processes used
 for obsolete_target test
To: SJ Park <sj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> From the next time, please don't post a new version of a patch as a reply to
> the previous version.  Post a new version as a new thread, with changelogs [1]
> including links to previous revisions.
>
> Also, give others sufficient time, say, one day, to add comments before posting
> a new version.  If someone publicly asked questions to your patch, please
> answer the questions and keep the discussion in public until the discussion is
> clearly completed, before posting a new version.

Got it! Will keep it in mind for next time. Sorry about all the confusion! :)

> > The obsolete_target test spawns three sh processes and uses their pids
> > as DAMON monitoring targets.  These processes are never terminated or
> > waited on, so they are left running (or become zombies) as orphaned
> > children after the test program exits.
> >
> > Terminate each process and communicate() with it after the targets are
> > no longer needed, so it exits and gets reaped instead of being leaked.
>
> Makes sense to me.  Thank you for this patch.

Ofc, happy to contribute!

> >
> > Signed-off-by: Hari Mishal <harimishal1@gmail.com>
>
> Reviewed-by: SJ Park <sj@kernel.org>
>
> > ---
> > v2: Terminate each sh process directly instead of giving it its own
> >     stdin pipe to close, dropping the stdin=PIPE changes and shrinking
> >     the diff.
>
> When you add changelog, please add links to the previous revisions.
>
> Finally, please use mm-new [2] as the baseline of DAMON patches from the next
> time.
>
> This patch is applied to damon/next [2] tree.  If this patch is not added to
> mm.git in short term (~1 week?), I will ask mm.git maintainer (Andrew Morton)
> to pick this.  So, no action from your side is needed for now.  If it seems I
> also forgot doing that or you cannot wait for my action, please feel free to
> directly ask that to Andrew.
>

I'm quite happy to wait! Thanks for your clarity.

> We (mm community) now want to focus on making mm.git more stabilized and
> therefore ready for the next merge window, rather than adding more changes that
> are not really urgent.  I agree and want to help [1] that.  For the reason,
> unless Andre pick this first, I will request adding this to mm.git only after
> next -rc1 release.  Let me know if you think this is really urgent.
>
> [1] https://lore.kernel.org/20260722133829.87607-1-sj@kernel.org

Definitely don't think it's an urgent change. Anyone who is using a
tool like damon would be able to debug this quite easily.
Thanks for clarity, again.

Accidentally dropped reply all AGAIN, sorry about this. Resending to
make sure everything is public again.
Cheers,
Hari
