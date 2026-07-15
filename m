Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321F1FCF41
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131653; cv=pass; b=W2yK/NvImMyzdSPYZRMRwpyIjKvddKj+3ZeiwVJCYMcfSgMCrue78W5oFD9uUhSyRCmCRMOhW2cV0UtVhk7hB7QR7OJ2v5ArbwfkYyR7DNfyb9EicMJ4OFpUuQjVUGOA4nCV5knWVGpV+j/qe5ROIz4FMVTgbfeW4oJMBd5ygM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131653; c=relaxed/simple;
	bh=HJQEKCViAQqXKFGqMHAnjJNWD8wzpW5b0Px0rcjj5wM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7zHMtuH+E8y8OStZDlvNpP6flrZMCnp6yAJbggqpJJ0AkSVx8GHbV2YiPSXiwIrwymwqDWY5y3kJwcSsFbrdGPQ3mqJIiOroilbYJbqnyMRy+hZ74gYmkVc0mQbT7hGaBaYak94QVeN6tjyizOB0NJwQ+Rxl9Q+lh+9dHCtNQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mwDqzXlf; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mwDqzXlf"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9e7391839cso2110993a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 09:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784131651; cv=none;
        d=google.com; s=arc-20260327;
        b=kAtcTItnqPlF9sPFKaD+5nyM9Gf/XoiE/mx2zsfqveKGwg4thpiZUxEnXbvF5ydbPD
         gTFOIh6K8QTduixsv+qpnDfBoTnKozpACX8F09C09Zpe7mm+RHL4yWzCZtyVtBYxynmt
         J9+tk4DG0PpOSQTy8FcBrsSmLGU1Cq34Me0zRy3Hcbx2jvUojmyD2RyxBEXLiixqbjQt
         CRI96/bS/iB8QQOCZ0mQ3aVXOu+J/1vUXOLprpdU6VfRpU7Dj/VL7qIr81YvArbszM13
         xksOlPTVl1Qvuk9I8550ePt3MV0tACn4Zc3u4kc/FdT8Po6Oz5BdtKtcf6j43hZEyrIh
         D1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H12olXVq3F1RAP6MWw5onyOkfq0/I6cz4mvSnYOiLBA=;
        fh=OPzhkPga0M5okoUbXdsSBAE7ybFbH3vg7/wPu6bib2M=;
        b=NnW6Omr5PWa3epxUyFUm8oZvB58Vt/32UFB471LEJY1P0dlewbfGvnGZKHd0hoNFHz
         l/iCN8ik7e4d0ZK+ykEhIfxoqGDyz6jeI8FDueBzYd8qGHYLpYV0yUm39yfCLlZfYmuT
         4wa7gEfqaJChGAAokZtDe73SbNLQXGF2Czd6uVQ4DppYYG7HuLAzYTslBWhgOgJX27wa
         61XkvaI5kqgmllKBCmPvsLHRBe69BXZR6BoYY2KxPtW54bw+GRCQud3VM+8YKgAMIFIf
         Wkor62O44Adws88FAYjUujRACBeEK661RzzKc0Iq0tJWXH4zLN7k4tEZXcSiZ5A8zihd
         MM2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784131651; x=1784736451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H12olXVq3F1RAP6MWw5onyOkfq0/I6cz4mvSnYOiLBA=;
        b=mwDqzXlfWAf9NfNpDTAJL4dU/1MQ9xvpQNu/BBgP7SMs/yxD3AoApqupbszn9MZlKi
         gxhcTIXotwPLNX/q3JKTyTb0EwFkOVrBMZsclyWon4jP8/asgErRRhVaQTTXPEateOaP
         38op8b0+qO9F6QBfNWMnTdhVxAaE6lQIIBGpd6ULD2YTS0gQCTdo9rdHX52bzErORA9G
         +s5jepYLNqiJ92xQV4u9b/qX2FvPfFPhgvtPwooOCNsAT9sFkSMwqAPel/Kt9GXucDRB
         fw+a1TWyKG7xcCnorHvI9ZoF0rciFyO0h/kK3RrmnL6UIUYX6EDcXWE+y0AUx1mJ3/p+
         c6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784131651; x=1784736451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H12olXVq3F1RAP6MWw5onyOkfq0/I6cz4mvSnYOiLBA=;
        b=pc+d8anX+qAkHBDnHVhEgVxVkqytlhumR7p0+qCdUQw7IQJMEwl0rGC8kPCpzNTUGv
         187YlMIPeYYWeb+9UEoAkhSM1RVjhTXN64HzE7JezEj2RbJTp1RtHXBUKHYgsfTbncse
         I2I9O4JqIykhmJ2I+kPsT/UnnJVRkZpjymsZUZwW6orhZPdrA0zpABe6caB5qbCNkP4l
         MG4lbcw4KUssSxt0TpZCcEcw3YRcNIR6fFCvaqxzCmey7m4Q1mPWzjRKx+0L0MJGHVse
         2tpb2LUt+gThr3vr8QicV2m9aYyO1vBDb7y0mPojt6n6XzlHeOZ3YI7fa+sUsbWMz5Ux
         n24A==
X-Forwarded-Encrypted: i=1; AHgh+RokYgPEKNeIsii9/Sy3H5NipcoQtlsLkXcdXdnoxNLZXxlp9SsPx5en+b6Aw4jyIE/5r0s9dRCmUa2lXAKr4eY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6EywVKRsrpnARxNdee/oOYA2t7P8U2W6V+CQyi0vi2Zw/A6wl
	+ICRZxYE0UcahHd3kWFsK+00mvUVwrzBUp2MEjk6E2AhmTA/O4UjW+7Arm5LGwG9j7QYFWEHrS0
	qC2/wWHl8ZbTuKdw6LZVxusOlD5UjUrLbS4wZjnyw
X-Gm-Gg: AfdE7ckCqkpLiLrP8so1FjwlxvRfOg7tUaKUf5tTwDWfEhQBLTBI0UXXp6HH7rDg6t3
	4DL4dADVIQZCsEvro0Gn3uKAUb1bZWdqfz/pffFAQb1GFNl5Ool834NWZwRaqF0cJkURFQE7A4+
	TqShsQbUzi7IjUgPjv0lpoC7+Hon+Qx3xM6lgI89FDoU9h7RZoPMfuNfsUxY3lP3bLV+ctG4/AK
	Tv+520KMkkWRyMk0K7r9SRZSS+HKUPPIYn5H3QUY2flQDToGdx739JIdWcRD09/Qx6RNr12
X-Received: by 2002:a05:6a21:3988:b0:3c3:821e:1f84 with SMTP id
 adf61e73a8af0-3c3821e43ecmr718389637.41.1784131651046; Wed, 15 Jul 2026
 09:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714190356.190328-1-dmatlack@google.com> <2vxzy0fcicpi.fsf@kernel.org>
In-Reply-To: <2vxzy0fcicpi.fsf@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 15 Jul 2026 09:07:03 -0700
X-Gm-Features: AUfX_mwWLIIwIbCORwPju6JjaZTyqkA_jPyoKhqBFYSqQTZxJQormdY_HQIDbQg
Message-ID: <CALzav=ev6KVOM_BckL5poGaGOHfWFMn6=tajeph2GwcN8xTY6g@mail.gmail.com>
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for /dev/liveupdate
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 6:50=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> Hi David,
>
> On Tue, Jul 14 2026, David Matlack wrote:
>
> > Remove the single-opener restriction for /dev/liveupdate by removing th=
e
> > atomic in_use tracking and the exclusive open check in luo_open() that
> > returned -EBUSY. Protect luo_session_deserialize() with a mutex guard s=
o
> > that concurrent open attempts by multiple processes safely executes
> > deserialization only once. Update liveupdate selftest to verify that
> > multiple concurrent openers succeed.
> >
> > LUO does not inherently require a single opener. There is some
> > documentation about it simplifying state management, but the only thing
> > it actually protects is the session deserialization during first open,
> > which can be easily handled with a mutex.
> >
> > Relaxing the single-opener requirement avoids the kernel forcing a
> > design pattern on userspace that it itself does not require, e.g.
> > allowing multiple userspace processes to create and manage sessions.
>
> Agreed. When the kernel had a global state machine in the early versions
> of LUO, this might have been more relevant. With sessions, even if we
> later add a state machine, it likely will be per-session instead of
> being global. So I think letting userspace open /dev/liveupdate multiple
> times makes a lot of sense.
>
> Also, today's systemd only supports preserving individual files, and
> does not hand out sessions. To get sessions, userspace must open
> /dev/liveupdate and create a session. This opens up room for one bad
> process to block every other process from creating sessions. It also
> imposes a need for userspace to add a polling/retry logic for getting
> sessions and serializes their execution around this point.
>
> I don't see any architectural reasons for doing so from kernel's side.
> If userspace wants to only have one owner of /dev/liveupdate, they are
> free to do so by unlinking the device from devtmpfs after opening or
> restricting its permissions.
>
> So the idea has my vote :-)
>
> Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>
> That said, a comment on the code below.
>
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> [...]
> > diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_se=
ssion.c
> > index b79b2a488974..ca4d0639d39a 100644
> > --- a/kernel/liveupdate/luo_session.c
> > +++ b/kernel/liveupdate/luo_session.c
> > @@ -584,13 +584,17 @@ static int luo_session_deserialize_one(struct luo=
_session_header *sh,
> >
> >  int luo_session_deserialize(void)
> >  {
> > -     struct luo_session_header *sh =3D &luo_session_global.incoming;
> > +     static DEFINE_MUTEX(luo_session_deserialize_lock);
> >       static bool is_deserialized;
> > +     static int saved_err;
> > +
> > +     struct luo_session_header *sh =3D &luo_session_global.incoming;
> >       struct luo_session_ser *ser;
> >       struct kho_block_set_it it;
> > -     static int saved_err;
> >       int err;
> >
> > +     guard(mutex)(&luo_session_deserialize_lock);
>
> Do we really need a new lock? Can we re-use sh->rwsem instead?
>
> It can block session retrieve (but not file retrieve) for a short time
> though since luo_session_retrieve() also takes it. But the block will be
> short since only the first open of /dev/liveupdate does work. After that
> it just checks is_deserialized and returns. And session retrieval should
> not be very frequent anyway.
>
> I don't have very strong opinion on this, but I reckon the less locks to
> keep track of the better.

The lock here is just to protect the local static variables
(is_deserialized and saved_err) so that's why I went with a local
static lock. But re-using sh->rwsem should work as well and would not
block luo_session_retrieve() any more than the current static lock
would (opening /dev/liveupdate must always preceded retrieving a
session).
