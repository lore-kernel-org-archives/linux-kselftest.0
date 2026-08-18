Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD993815E3
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096964; cv=pass; b=UddLyksJOLD14luEnp6UeLnih/yEZ3GlVgAAYdYTL5nu/cCcGDnvpq6MoosIEG48+dVSAWZY7gE7kWvFgTICO15XwvUbs3XNG3xgKJM1dvxkajJ+IIB6FUWsEdg/LJ+IaWBppBJ8jgITXfiNLO/HmZ95VKYgPQ/VVeV92HD+94M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096964; c=relaxed/simple;
	bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDPsBAEfJ8jZPVxizlpgHGTXmmXCM+IH1M151Ckv4YwAF0kjkvrt8w6CtFOHnSp2Z+179fvNvdd4SMhMjhtgk+ixb+BWzxgUL9BtdiAdo3SoW9dcJvK0EwKLxiJU2pTBnrxdzfMseY/SXPc+dtsrjtV0JbbWp0y+MC5SMV40P7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT2x83FR; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT2x83FR"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso50857e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 16:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787096960; cv=none;
        d=google.com; s=arc-20260327;
        b=DfL50XoMAMZBOflxeGxVyd3D9j5o4w5XEM++RqGKf5CVLDdPAleozA08ZmEvUrVq/w
         jftMCDxWvGDt5YVtDch2jiKVFVwdTun4a50/7jXFZAP5ApQYYbNYxFsWjQh9NlKmBtMh
         QPzZm4HJFgfrYu4NvcwEH9Cd6g8oFVoYNnoMNq9Q4yS/24RdRdI+drT61mM072D9rbAX
         3VcKODFx9YhHJQLhuNk1StOJ1gVvB5CkqNpDLM6mRMIsC53GT4BbaHBYrJ0YSK7qQV/A
         pC/LBjJ3zfV+pB6n/glRqZfXyyK2RcXlC7hp+hcJIpFjIjirKSQSUXg3HXtzl5Bv00ol
         l/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        fh=/ZTGZ7zcXKTKok8ipU9/+saiDX15eMJxgbsx/qvPfj0=;
        b=LCIY5gP4Lmej9arp58dkoe7fCYhZrnW8qtF3XO0cOMKRJdk6Mmu8isS83MJhtdJT7X
         g6ReCmRet/baGLTdzxlzTDRI8lDw2p70sXtGLgb3BT6g9AtWO8TfQH94njAOsCr6KI8/
         fMd4HdoMcMPFpOH8R+YyQytymWz2UUzydFsqIi6luYd0Wz9GGEZRulr2REv78BtAHIzR
         SaYw8G/dcUPq0eNb3Cla8KFmIvYtysUkyeOIFrc3FQcRNhy4DqzUKn0wRj6+UF3L4idw
         +zPcWdbH5y7fEQeSxZB58RmwYkh5WZVes37YkLpOA5iYurNSL9J7y1PQg1u16n0wz6Vs
         WGbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096960; x=1787701760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        b=ZT2x83FRp8XeVgI/X9EmOA1Ew8JjyaYhox8S4lnvW6U7RqeGQCJlGyS5tMhzR3bHm8
         96Hv3bnZ7EnUfT21OJMQ9lneNWUXnbLIWYF5ncH5K1+rkCKHIe3c6yQSionqqXcdlSs3
         DCLwFz/+UaKDYAeuJ3pRxt9vLhy/AQBzXTa1Pi3IfWsu8kdATYyzOrrsPIw0MUY75bzs
         fzRIq3ZX7RI1tw4HOox3pMnxUqf5AWac/f6g1BvTpXXaMOxKevtE4syKA3sd84iPNDyX
         TsW1bjzb6Kx1a42W+EqKbswE0uusvAYfnEh8d07MVNvW7fGuv20VLXAqDdTSBiL/w1pz
         hk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096960; x=1787701760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        b=Dq/BKPB3rizIUCo+WFt3zpr6b3+ErpZOmHpJI7UeCszePQ8oU18KLxFGvfTUZjHNE6
         eM1L1xcVWCjLPN12hdyGVgTbPDtn3sKmJVWdc7+2zoEE45/M+1ZmfDp/v3z34XQr1pMp
         ypj6ApADijB/Xkt6Tkkj5xqI+ItgKNCg9ZCDC6kWv9RPcVVk9ybtxVG1x9W0PWdojvBo
         BlCOrpDsbpZRlHaHwNauCTtkk+z3O0o+26KRES8sJca/GfBx+3U1PfifzgmlD4hbmoUu
         9Of4J29SZv1MLmwPrUkmFAlDUb6e2hMhNaMzCwYvIVMjc5QO+HwCxHSMRdjqLphL99B2
         KoBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaLfL82S07YETt6tPSZFef5I8463DI9pdxVjSmE/73Tsmi4/In0WvCKV1rV7qMH9LAL5dOrRieQ7NXspoNrlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLn6nSB60BMvXO//DnA5rbezM5KfjrlB3gKuLrJPANw71/50QS
	7l45xtWJdZZlmAWhGFaat0NXO0gwdydElR8ChGgucuXSevVEEz0MBIQofYKs48QbMIJdszswYbE
	AzdDApJk1LVBlKpwnLsuFXMNcF9RboH4=
X-Gm-Gg: AR+sD10y84gO4D9rNgJDwZB9mnG7a4q0pOHraFQN1y+mya2D2PxXI9geOJHROeXuYOI
	RpbHEOKsKzuT/Dvta9MsoKZLG+zPmbqh65ya4GKMAXu+dKNsl9gGFaSpw3CWDtHry+ePDLl+34r
	761iXm2ELKGGDsFhv+NwzgUwIpzGzlCQUvjZKu54arvInKYCBOavzV7CGjUoqETRKoaLctF6kT+
	ohPv26IGuWexcbrxiuK3HHjzo1vakAQ4sJI/9Z1xtJXcUnQmE+LjGHKqaytdqwhP3MiNIxJ3rKz
	q2GW8zrbb2Uwyh9TIHPgpomjOs9q02hul/SzoPp0BDOwUl7XgGvf1qs3HrFUmdjj34wS16KGScY
	u1QwoKd8WEZ7vrLJpI9x7ksYorFNyzNrB3rRMzF1aSbrDB3n5E9MJPMOGRe7L
X-Received: by 2002:a05:6512:3409:b0:5b4:740d:6daa with SMTP id
 2adb3069b0e04-5b478b82ec3mr66034e87.1.1787096960202; Tue, 18 Aug 2026
 16:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818152324.587932-1-ynorov@nvidia.com> <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
 <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net> <aoTjHtiSHJAuDQ7B@yury>
In-Reply-To: <aoTjHtiSHJAuDQ7B@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2026 01:49:05 +0200
X-Gm-Features: AcwNN1WRSakbfVQ8U0riTSPzb9OJF0aufUcbMY-OEMi-rmUv3-QMTzisl7KpfDU
Message-ID: <CANiq72=9X_WmkkRrrBKvLKBatgOnmAO2L=LbijzwzTv_Xoc5Hw@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, John Hubbard <jhubbard@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 12:56=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wro=
te:
>
> If there's something more complicated... Let's wait for at least one
> real test like that, and not speculate on non-existing cases.

I asked because the issue is that this enforces a policy early on,
i.e. if a user happens to need it, then they will have to dive into
the implementation to change it or, likely, work around it or assume
they shouldn't do that.

In other words, there is a cost to enforce something too early on.

So it is a balance, depending on what we expect, which is why I asked
David about his experience here.

> This series begins with "enforce", so it's not about being nice. The
> generic kernel tries to save every single bit of memory and nanosecond
> of runtime. That's a secret of Linux success IMO.

It is great to save bits and nanoseconds, but KUnit is explicitly not
meant for production.

> pay for the functionality they don't need. In Rust, before e74b7a3f5a
> there was no way to throw the tests out. And even after that, we still
> have such tests.

False, you could disable KUnit (or make it `m`) -- which is what you
are supposed to do in production.

So, no, we were not bloating every Rust-enabled kernel out there with tests=
.

> This is not a coding style, it's a factual error. So it should be
> caught at compile time as an explicit error.

Klint and lints in general are not just for coding style.

And lints are also compile-time, and they can stop the build too.

Cheers,
Miguel
