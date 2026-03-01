Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC2932142B
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Mar 2026 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772378402; cv=pass; b=knP7k9EI2gGaTs0PQvoulTr6nlULvWj/gFMFZ5Y/ps+xX6k+jXfVpJAdpExLSvrH+16K9qj3ZuryY1rX9yR4EDzcFRO0K57Ua3Qvo8WA2DjM8vofJWfvkQa2OrVgmE0EG8VMOGgZTkej0/qUntnK02oavzolnJSk7YS9vwUp42I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772378402; c=relaxed/simple;
	bh=Fiwwjp3q58poFbwEi1UnSoyKncjAv5ZQQsyqXdz0VPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rBSiB7M8JPYf7rX7RieXqaWJaMl/XwvC4J0bbTOMBbzMTB3FIpD/C0Ye/YUsNJDxIMCVVPXjfy3QNhXczN/4ZEzlGOnyyfKteEKN5/sfxgTDKdt9KucoB2CjTicJ6zi98ybO+kK5Aq5GrKtrDPJQhuLjaqg9gnvl6+t/uDG7fMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4sAIl9E; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4sAIl9E"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5ff14dd9be4so2715286137.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 07:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772378400; cv=none;
        d=google.com; s=arc-20240605;
        b=GgUiHRR9pVAWLcE9EQ5kDb9NdJryTAiVN8ZCKi+k2RbbsNj5uFlXMHZJ8uvWUzS6o2
         49/eMutEp3jGHq8XYR24bi4x4707QkzUvld5e9KrKlvOB0GZJj4a9f+RN8f0GGmNCe25
         mun7aFskTOVqJ4MfUPiOzKnwUFXQrg/5C4Z6yhmyFId8KSX8JS5bUaFPUt16yoTM/ao7
         vN1zrDe3r4o7B07Q+gg96BEWuUbWzz8h/+Nf/125zNVuu1YqxRrpZe8z5X6eQlYaoLJK
         fybhv21rj9OlhYdJQmYP9PqqM76HSsnwqBvK6rFqUmfmBi88jWcLTFArF6j4q9J2s2pb
         j/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fiwwjp3q58poFbwEi1UnSoyKncjAv5ZQQsyqXdz0VPE=;
        fh=wCH/QvdgCUhgUeh0dENql+AIMcBDO96WX92gdGpX7yA=;
        b=FKjm++CCdrL626AfniDE3YRXFGImA7YV7vh8+wnDVDapR8voVIT06FbIeCb3Mr0dML
         bhv8z02Jo5Nl6kAcw9RAFX+jnzx1EHepBh7JIWtipOPHI6lO62Lw14cvUCX1qOU4bUeZ
         XNvmrmx1paM5H+DAvfx6kcaG4QUalO+LbQNIV7HZTukApOIIzd5w2lDejAbhuGABNuSZ
         9eSdBUE55TbAuOkfEQqgObaExfMCiaIYHaiknyNU/48YKyRfUdpqhUsnV5Qq9VEgBJ65
         jnpGp5ac4vpharcy5xSmFtsM23Ba0mJvgGSHQGtLHfODol6gLyM3O31fVsp8qKfgDJsh
         cQXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772378400; x=1772983200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fiwwjp3q58poFbwEi1UnSoyKncjAv5ZQQsyqXdz0VPE=;
        b=H4sAIl9El3DNOjSs6WpoPmMrg64nxdhM2ZU5p6QYdJgq0rtcVMiLtOknYAp3Sg1HnR
         zuEPbTmKD1ahGkEt3CE7W/3H5T9dhJifaqxhoa4FnJIn1ZHEkCrP0KrT0cHSvWzxETnb
         MbQOhGyR7CPg5xgLKg7YKeEJVtdUNLNdy+utBZZbL/Jp+UK/UYfxbYJC/r09iyrQkrq8
         mxKbP0RTNPaULQk5XcC0nqNjCJTCy9r4hOpSX+4eaoRxRsX2lGltWHfOVKOZiO6+5udc
         ZHmxplPmgnjfFEzR/g0/DYxbZ9xUIHWOxlu9NKNyarI58YO2J4A566bqfoxSDFengttt
         GXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772378400; x=1772983200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fiwwjp3q58poFbwEi1UnSoyKncjAv5ZQQsyqXdz0VPE=;
        b=k5n1Rvfrl8Yp5g1xqnOz5IU0t9/HbL+6irTXF33D+ezobh1hvZPC8JtM5O4V4SzB2m
         9hc4iOMgEfKUjESmW1CofS44uJrYrPqbuitrZTcC2jMbtyxAdLFsciACFmInwniv4Xk9
         WDQPBHUak0g3HcYJd6ehmdYUzkgVUfyBWZd8aFiyoBu20u3wuFWy20uiX1ClH4qPb/AW
         a1OyoJdT5TH1DxfDgEKp/OChjVRJurc3qwGBCARve29q565ts3T00ZxzdzrApbercwXS
         TKt4gJ+WUe82MsidbqB8dXH3yxnVaUKMhcA0r1Orjbd0sBknRb70J0tsfHSkisZ/8Y8z
         NQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXc9l6GcGFFC7Ha5zu2d4t8C1uZ6u+bu58Mh11D28Tw5YrzVN3g5LeA7cntIUmqYbl6a2EtV5IKlM/cdzNL8Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsa0KuNd1ne1EXzwxb+r1m4xcsYfpN3Qk/MAAty9s3FOC4w7Fe
	Sst+wHJ0oI7RCFCvVOv6KgV9AjttAFSWtn09xhl7dcq1slGuv94LL7HuL/ejTMQKy/+86GX3lBg
	x6y2DCWkpXpUfSUVksQEcBatEsEZyCMcHLk7S
X-Gm-Gg: ATEYQzztCgvimmT81QYsT1cf7UnZMumrYPY4SnHQwKowkp7Sa3yTZ9PqD4TwzdXEYxA
	KF3bQ0MohU82+XqVWiDjHOolfooJXRXro1M3WqoXO3uDzsW1PdU8Yej7K0Sr0ioc0PlPe2Eecn3
	52df4tm1FbPqr5HMpLr9pts+Cpv5izn80wRUdUIuTqROBeL+kBOJDJ0QOE7DKmWnMvQgn5H8YH7
	48y02jzcNzaLJgMTXrQ0b81a9cjSogKwY4V+N0TmrOaGTRr/5wEQ5xklcP1tpcYTCIhqcXVRqHN
	MFbragtS3mqv8wD8ZueEDguo8cRH/PsUnDzua8p5Ng==
X-Received: by 2002:a05:6102:160c:b0:5ff:1981:aba6 with SMTP id
 ada2fe7eead31-5ff31fab9ffmr5005001137.0.1772378400433; Sun, 01 Mar 2026
 07:20:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260221145915.81749-1-dorjoychy111@gmail.com>
 <20260221145915.81749-2-dorjoychy111@gmail.com> <2f430eb613d4f6f6564f83d06f802ff47adea230.camel@kernel.org>
 <CAFfO_h7i86qdKZObdFpWd8Mh+8VXVMFYoGgYBgzomzhGJJFnEQ@mail.gmail.com>
 <ed5aeaa81ad9b87926fa7ebee0308aeb8df9f0ac.camel@kernel.org>
 <CAFfO_h5za6gV99TQS3pwHnf7zyCeVySn3CdRyV+_jFqjovGBqA@mail.gmail.com>
 <beead8bbff344ddfc279e0fc86db0dd5dd98562b.camel@kernel.org>
 <CAFfO_h4brg90tMNp6VAzs5Lo8Lbu=DK2csjDqr2zspOygKEFCg@mail.gmail.com> <73c8ea54bcda0b64093d84fe047914c0632c2d0c.camel@kernel.org>
In-Reply-To: <73c8ea54bcda0b64093d84fe047914c0632c2d0c.camel@kernel.org>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Sun, 1 Mar 2026 21:19:49 +0600
X-Gm-Features: AaiRm51DyMEBRNPI1HVDhCyC4qT7r77uNpEMtKgft97OSaudIMk11BvPwkDJ_3M
Message-ID: <CAFfO_h59LQSjncu_4YE5YB+mt-FL2c1GN-jF_WtoKj1u43DcuA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] openat2: new OPENAT2_REGULAR flag support
To: Jeff Layton <jlayton@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, linux-nfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, chuck.lever@oracle.com, alex.aring@gmail.com, arnd@arndb.de, 
	adilger@dilger.ca, mjguzik@gmail.com, smfrench@gmail.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, davem@davemloft.net, andreas@gaisler.com, idryomov@gmail.com, 
	amarkuze@redhat.com, slava@dubeyko.com, agruenba@redhat.com, 
	trondmy@kernel.org, anna@kernel.org, sfrench@samba.org, pc@manguebit.org, 
	ronniesahlberg@gmail.com, sprasad@microsoft.com, tom@talpey.com, 
	bharathsm@microsoft.com, shuah@kernel.org, miklos@szeredi.hu, 
	hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 1, 2026 at 9:17=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:
>
> On Sun, 2026-03-01 at 21:15 +0600, Dorjoy Chowdhury wrote:
> > > >
> > > > I only added a kselftest for the new flag in
> > > > tools/testing/selftests/openat2/openat2_test.c in my second commit =
in
> > > > this patch series. Where are the fstests that I should add tests? I
> > > > think you added the wrong URL above, probably a typo.
> > > >
> > > >
> > >
> > > I did indeed, sorry. They're here:
> > >
> > > https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> > >
> >
> > Thanks! This is a separate git repository, so I guess for both
> > manpages and fstests I need to submit separate patch series for
> > O_REGULAR. Do I need to wait first for this patch series to be merged?
> > How does it work?
> >
> >
>
> No, you can submit them in parallel, but they probably won't get merged
> until the kernel patches go in.
>

Alright. I can look into submitting patches in parallel. Thanks for
all the info!

Regards,
Dorjoy
