Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2C41167F
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 21:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789422055; cv=none; b=nmnYAV6SWhnp1DvDzFY8JYCNaIr+EsxNNOVnEdQkZ+O2amWFRJxo6i0Y/eJZDV94qaVHoNluI0GmT6CYyMxcP+7WXiMUZt/YfM/dL0x+l0pzAkeXrkwAJTSqypOAK13UgcEihsIiBXblr/gFSWgmhBwoZ94uukuFlUg6JZdDxJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789422055; c=relaxed/simple;
	bh=rx4dkN1+TsSSDEILFCQSpnWfgYmGVlwKUZynBUyCi/4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TGBUzRffntFSFkD/OWdjy4PIQpGW8lQTU1w8tqKCSuUBnW88+1aqhm1CBqnfWgPw0dr/fVyb/MDquRCEBOImGmloYSUgPXrZl0sHCXZ5KSU5ot0X6z2m5FiYb+pWSwxxZWTRd86609pJpGgEdG6tOLjsEXUWgG7yHRoPzKAfqNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpPNOjzU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpPNOjzU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso17157795e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 14:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789422052; x=1790026852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7xb4iCajz/FOeNwMP9/vRI8V9ZVlNq4vmNdv3kXbOu4=;
        b=EpPNOjzUWGKG9vIVypiYfsTIZ0/3901oSrKNXPC9hycFt74uslD7JMrBF6j3eB42mn
         Fq/QtQSXQ7Pi37cDbhiOKI+tlPFEwYB9lO9TQ8a2kv98NsvEZT/y9IL+Soy5QQubNSz3
         Zjinh47mQsfXtSyC36HT3241Gjt5qTbJqD62XD0siqYarwlSoKSxFpURYaGW0ndLJquc
         SRzum77euaFCAss2TVaw8ddbyqWJI+wno65qT72A0Jrvd5oetuzEyNFIl7+9o/rqWHLk
         4SiXsam4BF+IhwS+OZhkVZqJd+ACFpQIFn/dJCTziTgME6yt56IU2ITCVaPSn9q7+9GL
         yGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789422052; x=1790026852;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xb4iCajz/FOeNwMP9/vRI8V9ZVlNq4vmNdv3kXbOu4=;
        b=rjPwqGC+kZvyscFM8bFGdDk+Ig/JkDnqufKOIUzM8rbnaTw0qLAWFHXhxm5shsa3fk
         +eJRiGr6WqnMJJHB9C/Y4NlVvh+XPoT/n2MFctxjgaFL+CdI3eyuR48p7SqjMwqeb6xX
         QtgnkqN3wnAz6sYgAf6trnft9ytg/tN1yqaSdF8pd7C5TsgehXXo4AxU0wWoujs69lEM
         gVRNC3ewd4NFYTmjWezibtbyqrT7jyw0RpVwhnJcrepNC2gez44wPzJ9wXQrE3/uCWPW
         nOeiBtniuhBp/NqxOg3r+FLlldwOWV7V5o8DpXcGOLm+pHWNaa+aJG8VAs5dNxqgZQab
         RC2A==
X-Forwarded-Encrypted: i=1; AKwUvBzf9vKuAAz42NOeatUVKbtOKbjkZWKFnyCDQRfp7mLmh9AutzsUPmthz9FXtxqpI8LHuZ1zbxIKJAVVCuVMa8w=@vger.kernel.org
X-Gm-Message-State: AFuF++m1bRqRGF/vER502nwXXzemZsUr7UnOd644jP+MdzW2aDd0gMQo
	lX2Mbh6x/hvi0zUegNmQjlKJG16Utot1WloYAF2kEsIw8l+K6j+zQBqe
X-Gm-Gg: AYBFou21RH+8LsXQr/AaMbUKfXa98VdmBx5PeERFNyjhMo6T1ofpgsInKnKimolTHJQ
	/17w+Tp+++iJFqXqBdg7xWxR1Tcz43xj7pxL1MowSv+fqTG70aitnBM9Av/m1eCOfNw3b4SDcne
	k1yup+LkQQMq+tVKHdUIuf19TghZuRF5k7OvfQ7zMrb1xRt9p/VrvTJTQNBEc8Fp/jbEmyvT26p
	1yw0WBvVvqoay6GcpA95+CPenpejIR9Aglb164w8+KdV8ucZO1pyphI4EaUfAbCAIoeC4Prhyi/
	FmNScUWyd9rw54sbBicgXIDN+3Od0Rufl70pwbFMebCxPn0v+yK6XTVqVaCp71Ip2JIUW04ck1d
	CgSvV8qi+DuSFJ/5na9Mxk3Not06pNNorujpsSV6QoHY95hZEHBppeAE+aYUFAl0PAs0OjrzG1h
	7Hqjpg3lGiXQ+cX+WAgvG1drDs6WIrVSUxeboR4Y2he4tWdECRS9uGnSjo+owHrISQMO+ph1unx
	udH41ZvpfRabfYtXjfnkPqPX9OM37QKPeKl
X-Received: by 2002:a05:600c:698e:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49e7a638778mr109073585e9.3.1789422052094;
        Mon, 14 Sep 2026 14:40:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2af31dsm22123915e9.4.2026.09.14.14.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:40:51 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:40:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan
 <shuah@kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, John Stultz <jstultz@google.com>
Subject: Re: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
Message-ID: <20260914224045.5fdfac58@pumpkin>
In-Reply-To: <A1E4F810-7A75-4AF8-9DE4-11BBA101F5E5@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
	<20260817130239.343594-2-haakon.bugge@oracle.com>
	<20260914103545.3db6eb45@pumpkin>
	<6546A220-4B85-4780-8B45-F8B35D24139C@oracle.com>
	<A1E4F810-7A75-4AF8-9DE4-11BBA101F5E5@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Sep 2026 17:21:41 +0000
Haakon Bugge <haakon.bugge@oracle.com> wrote:

> > On 14 Sep 2026, at 14:32, Haakon Bugge <haakon.bugge@oracle.com> wrote:
> >=20
> > On 14 Sep 2026, at 11:35, David Laight <david.laight.linux@gmail.com> w=
rote: =20
>=20
> [snip]
>=20
> >> If you use change the MX_ATOMIC_ADD to use the atomic_long functions
> >> (I've forgotten the exact name) then all the counter are the same type
> >> and can be removed from the union.
> >> The default 'just use +=3D' code can then be moved to the bottom of mx=
_add(). =20
> >=20
> > That is a good idea, but we then misses test coverage for atomic_t. But,
> > what about: =20
>=20
> [snip]
>=20
> I ended up with:
>=20
> struct mx_elem {
>         /* This union contains locks and lock-free data types */
>         union {
>                 spinlock_t spinlock;
>                 rwlock_t rwlock;
>                 struct mutex mutex;
>                 atomic_t atomic_lock;
>                 atomic_t atomic_counter;
>                 atomic64_t atomic64_counter;
>                 long cmpxchg_counter;
>                 unsigned long bits;
>                 struct ww_mutex ww_mutex;
>                 struct optimistic_spin_queue osq_lock;
>         };
>         /* A counter protected by one of the locks above */
>         long counter;
> };
>=20
> This became quite simpler. I'll test somewhat more, and send out
> a v2 tomorrow.

If you split the 'long counter' into a separate array then it won't
be in the same cache line as the associated lock.
That should mean the alignment changes aren't needed.

When I mentioned a delay in the RMW for xxx->counter++ I was thinking
of a few clocks, perhaps something like:
	c =3D xxx->counter;
	for (auto i =3D c + 10; i !=3D c; i--)
		OPTIMIZER_HIDE_VAR(i);
	OPTIMIZER_HIDE_VAR(i);
	xxx->counter =3D i + delta;

I may have a '3am can't sleep' part model for the arm cache.
It might be that when one cpu writes to a 'shared' cache line the 'invalida=
te'
that is broadcast is only partial; the invalidate is remembered, but the
contents of the cache line are still used to satisfy reads.
So a memory read for a different cache line could easily pick up a write
that was done later.
A read barrier actually invalidates all the 'invalidated' cache lines
so later reads can't use the 'stale' data.

Just need a model for the write barrier now.
It might just that each 'cache line wide' entry in the store buffer fifo
can have multiple addresses associated with different groups of writes.
Then the writes for one fifo entry could happen in any order (or be
merged into a single wider write.
(But that is real guesswork.)

It is nice to a have a simple model that mostly matches the observed
behaviour.

David

>=20
>=20
> Thxs, H=C3=A5kon
>=20

