Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691523F58D1
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708251; cv=pass; b=pc+ltq+qscH5tBavnl63umiZ6NywZOtfLxVCceKMYDDobCZ7f6hTBwzwSJLZ97gxKP+Mf9bFWkXIv2/fR0vpKKI/+gMdRyw8eCVupjZaFvJMd5c3KyFB2ZJv+hJSjGZdhrdedQTt+rf2TuZUDmxm5vQFoop4BVh6fQP8ezaWkJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708251; c=relaxed/simple;
	bh=7Fn7rQr6uDiBa29O6N8cOyu6iL0JrBCT1spb/eozr/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJmbmfAJNcd5Zj7rWYeV8vlhiL3NtQRZp93h8TxXaLhaLC9oRdb4bTHWJp0rK4P+BJ0WWED5b7q99aTvvEJH/vAnM35eJyZKBlOM5/s5GYJIoY8hipDp2FcWevLBv95vwRvSPYMc0AceLQzemvROtOx59QJbC0IpvR8SG20CJFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ/6QCRw; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ/6QCRw"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bdb3fd39045so865881166b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 07:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781708249; cv=none;
        d=google.com; s=arc-20240605;
        b=RBLREV4G3Dae1ByTz5A7X4MaONS3Y/UdixbzjDBB6Z+RSmQMQgnYgfPFUFeWvCoUGD
         6X+SgVnDBVuRiHmA4inn157Ib1NZOfGFzAIzx/6RjuBCYaajlXeP3+SExyffvp/p7E/V
         gOcV11giFreaG3vOlc3B8IlJ2uw5ZnM+CTaIuL5kVuTYuFoc+ix61OLvEF6y7IKtPj4W
         PH1gAlNUply5c4d5itltM5qQhSVWduinunIPgYSppemYIxFfjoYHnbqsYeTW8MWiW96d
         cSNoSyhgrvDY1HTt5xjvLyU2nv779S703yLULCICau1d6YLkWNJdx6rTP/eCo0l6ePNE
         g4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Fn7rQr6uDiBa29O6N8cOyu6iL0JrBCT1spb/eozr/U=;
        fh=s4lbRa6S9igiN6w4Iw+Xaq259bgTmvhkAO4aIy+3dME=;
        b=EcGgORDnam0m6cC+FPWGeOCyE2tnef0b+ZY0QZoWdq8fqRRGhsL+sZXt4E8VGzzoVl
         kPac+pgdz6hK34EewR4Q4g25CIzj+R0uXDvQHA1LF9VFSjty1bQ9CvW/otQki8UQ3DtL
         5BtIr2jSBZxspeJS/MXG7ukckEHCFNezauFUbwuSYx5QXzZVAJHRqaZFG4694X1G6079
         9CpmlvnqZazdryiL/AN7nRQd4qZeWd4LvA7exihaVLyigwroVfVrY7mc5fh8UY8IGbd4
         EE/YS68jCUmpTGi+l7NmY+nRh255lHv22MddvbT/jEZNKLL3L5bVr+ZLj910NArkEcmH
         X/RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781708249; x=1782313049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Fn7rQr6uDiBa29O6N8cOyu6iL0JrBCT1spb/eozr/U=;
        b=ZZ/6QCRw5zImU5/bxhXjCnZKvGsomoI6Kf0hSgliDEeM3OWE/xpL6p+DyRpv1ke/0O
         YcdJmkevtLUdoeP/0chQLbl1CD5dZrXoyZuCqX4IQHDxalYKN9jEJgTJv38igxn/COHF
         zsclKBLFD12keD6O/BjcrkIxGXdP1JiBuVUDuPiKD7zWR0YRZ9jAN23k38xVjtbFdLmZ
         kI93UZiZOP/pZ0CPnX3oz+GJyvrkWBu76NIg8xvM445SC3c3Kix7GxpMC8K1MzuVeIxd
         gORjUwHL/ZYFAeYWGezGsuHjrVYr6w3DiJzOu/VKu3hSIJxx7J24Yvn1E7pW0mFMxmE6
         vC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708249; x=1782313049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Fn7rQr6uDiBa29O6N8cOyu6iL0JrBCT1spb/eozr/U=;
        b=q20i2vHxVPf0TQu5f9lK4mTU9BSyzf2eaMHuLRC3G+ED/JkT88QfQeofasNfG4ZTDS
         z8bwFEFM3ktTv3y0Eq0/+Bajderh6viDgoDrKU7xOrOOCAQ/vLS+t8u58dv1SKCG83VT
         Fk7DPw06i9ulYq2iJ3AVXKACRDY+OJJlobr+yht208FNRzhwsFFe8OwKl/aIxn6G2bEp
         qKgH9mD3pEGviNMEQ+6Vm3Tbc+8OqTyMNw41M5m9mi3H/ByxVkFtpAe+ub16k+ZYxJPV
         H0BEZvHdMo80BSr1HiNjmZ4rnFC74gvui7sb4b3cGZj9QLfX2nlDB/vXiEfdyuFj1mpS
         Hk7w==
X-Forwarded-Encrypted: i=1; AFNElJ/RVp4/eu/rrG05fhw+l21dbZMjK0tvYJibFbrZPpw12qbA8VVvvKs75c82H3LdkjBVSYg4jxEyVDAZH0FO1dk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/DXxwLUD9LItmzuCjnWEFX6xM1cLqEt267YMy39vWLLRgKOrO
	dJPUOgI/QR1NGHJRyOMJNK2I79/dR7NTIsWyVYwd/p6eqGPMtmTzvbIOFoA574eP6WRqc0LcL+S
	X5b8kBJJ60M/ERHBTZEeJ5A28wuqszxY=
X-Gm-Gg: Acq92OEPEp2Ndyd521dWjN2/eE/O8mMjwNkvX6gN4PyfvMPGx0PUefriXDSHZ8fi2mj
	vvO0F71UYBBzLzgeyCh8Jyygu+pfGeP8JAwl1YBXOh+cojBrcVfxVdaJMM5bBmc8gcC04vdbH+s
	sds3E3Ehd+BwPC4ZFDfiQieRX4xEF26DcgznWDOg9NBTJRsKv39dY1HEDafhBk4Raqrke2R3tgC
	64ElSCtyuoZrQ9+fDKz1EZix3oBqWumsnx0hIGVxs6zrHRtQ9Dd8Bqg2u6IRRsPffW3gD5U9Up2
	aFiBS10bE+9da7JTDcsQiv0gwXGaHY9sNfiEGw==
X-Received: by 2002:a17:906:5149:20b0:bf4:37d7:d47 with SMTP id
 a640c23a62f3a-c05a85a64b2mr256112266b.26.1781708248470; Wed, 17 Jun 2026
 07:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524-fix_pipe-v3-0-bb4a75d23a90@debian.org>
 <ajG2bmhu6j9UWvh4@localhost> <ajJgWBCFYwz9OIo3@redhat.com>
 <ajJ1Xi1p9UhQvILi@gmail.com> <CAGudoHEyDz-Tbj=CZFK5XMLuLyE8B17NumdFVLf6MTTekFgRRA@mail.gmail.com>
 <ajKxJM5k9U5L05AF@redhat.com> <ajKy5ghjlgyN4tFv@gmail.com>
In-Reply-To: <ajKy5ghjlgyN4tFv@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 17 Jun 2026 16:57:16 +0200
X-Gm-Features: AVVi8Cd8XzLyKTV0BVt6ddQATwIVjpJ95lzrBaEw6eoAbEr2y7xXrAQQ4A48W0Y
Message-ID: <CAGudoHGKyN6k+eSAUm35_WDSZcxxtm4QL6fO+4rYJTvtObMqzA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] fs/pipe: reduce pipe->mutex contention by
 pre-allocating outside the lock
To: Breno Leitao <leitao@debian.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Josh Triplett <josh@joshtriplett.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	shakeel.butt@linux.dev, jlayton@kernel.org, axboe@kernel.dk, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:47=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> Hello Mateusz,
>
> On Wed, Jun 17, 2026 at 04:37:24PM +0200, Oleg Nesterov wrote:
> > On 06/17, Mateusz Guzik wrote:
> > >
> > > There are trivial touch ups which can be done by adding a bunch of
> > > predicts and inlining kill_fasync if someone can be bothered.
> >
> > I was thinking about another change, see below. It assumes that in the
> > likely case another writer won't steal the pages from ->tmp_page[]
> > before we take pipe->mutex.
>
> Do you think we could eventually eliminate the tmp_page[] array and
> consolidate everything into the prealloc pages? That would unify the two
> page pools currently used in the pipe write path.
>
> When I examined this previously, it appeared non-trivial but potentially
> feasible.
>

I think I commented on this in my first e-mail.

In order for this to be acceptable there would have to be a way to
reclaim these pages in case of memory shortage. Otherwise, say you
cached 8 pages and the pipe remains unused afterwards -- all the pages
are actively being wasted with no means to free them.

Now that I wrote it though, I think this is very much doable.

Naively you could add a list for all allocated pipes, but that's
terrible from perf standpoint even if said list is distributed enough
to not have contention on pipe creation/destruction in a real setting.

But suppose pipes are allocated from a dedicated slab. There is
presumably a way to walk all of the created pipes, regardless if they
are is "allocated" or "freed", in which case such shrinker could be
implemented without extra overhead for the write side. Someone
familiar with slab (slub?) internals would have to chime in though.
