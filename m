Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C037B02B
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 20:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530006; cv=pass; b=m2lCWTh1Ow6rQpAZgPEex6DF1PxknkQv1UhEiZDd+kI6OdFnZgzvWCGvFtC6CZbxYkgAESWNJqgO/dE1Sf5aT8LROPmHh3lNc9lHm/7MMaAbyLLBLujWHWIdF19zHm8XZ8TWuOI4zp8V4m9TKe+3fT5fLSudI4zKoEcO4mMBycs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530006; c=relaxed/simple;
	bh=yO/EmkVIHkBBMRUcngEKNItvEXSsSe+RskyQw5Jk4BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/7yIgPqOVyqnO0gOvbwsdygya7bsIVcA1b5+vq+XWBcX9pYktKKRyfOwzjT5Wyx0mo0dM58pZBRsRwHs3k5tmNV3U8R4tvG4kydYgzUYytL8W3T2MHJGtjhS6TFNOee8RrCGusvc4Wp0/e0sKotceetiCTlWEeRnYbY3/cf0VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Drx9z37t; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Drx9z37t"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8f9568e074so731526466b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778530003; cv=none;
        d=google.com; s=arc-20240605;
        b=P9iwcZUnkMflGqQMtInITSp0AN5VyZ+TuwUqE7ZGkE5BY3Hb2V/yfIcehPp0EAOzEx
         NKR7S7sRGicccmVelSxceXGyj4QYHqIhAA+oaRtkaoisFx4yKUCzmPXe1+2pj16xJSU9
         pQUfVGfSf12df+A6Ds/kiP67mpl1ZbC/8nF4ORXFVkhipY9uoCb7Xq5faPCILd21v46V
         2yeyKZGIFAqQNPjma5TIRCuS5IJRXB7p3AfuX3HhuoTosieElZcwZOhPP0zh70+bppkg
         9vrUDK6Yfo7bmN1kSdwct0mweL60OIbJxE+juIDphGaLdRJPEiqq8GyOr0vqYjxT4Wc1
         Z2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iaAiWK/jlnXrBb2kmro41iMZ5g6bVIAs0Q/KvlSqcaU=;
        fh=0z75puljuXoUWLYflXKwpAwo04+4R8w92AzGHRK1C6I=;
        b=E0vihf8NNQEoxzvlt7Y2V6AZSkI0gjf29hK404Od0IGoY2V8+LyomRLzBQo+GiMlmm
         2p/+eQTBzZZeR1QmsokTsUtY0Pg7sbKvepC0Q3500MtXMto147f4TBibTd072aMEAU3r
         DXIME/z1vw32LqOoaAiUpeGKFiMPjfEowzDDXDu0EGgTujqVdKLzn1XVKXgHRlDDX9xq
         JU00l1LC2Ihz60tG6snGXka/HfDiUgSYcOm1mpKB/lQnGzL9OCpGmEewhp3lFZ+l+2ik
         DATsOuxKZZ9SmHL9IQdlnUPc7pAORKLVFX21AHwARyCdBc+CHglJ3AFq8ZXCLYknzOSP
         /cHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778530003; x=1779134803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaAiWK/jlnXrBb2kmro41iMZ5g6bVIAs0Q/KvlSqcaU=;
        b=Drx9z37tjgAgivR2RVKT/H9Sv7ixVQlN/KhAusGYtP8LlQtitsR0dawdRsNY+3HqVD
         kpnu/PXEvgimkVea2I0ypN5vq28TMWq+Mn/O6eoVfJ2kkQlY4gY6kBeu1V0j+sbfvFiR
         a7Aweo1x0EhgwSP0jaKts73VS59U4we+dp/vyDDzzmaJ1lo/AMHgQ1umHM3n2vkYyBV3
         XSaRbaLZ08UWe/JCkHK+r6FBHYEYMZrtYvf+vXXeUmyOLBVQinc/9HdfMxp4ZBjcMsZm
         R9HugjF0NI8YA9yVroNjNWgDUm0G8hV51svKgKEVNhMnz+r9v1xQTtoiIDyIRGd5ONCS
         Rqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530003; x=1779134803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaAiWK/jlnXrBb2kmro41iMZ5g6bVIAs0Q/KvlSqcaU=;
        b=DP1cq+UmE8VAtcYCNAYnLll+TiiaXJI+sKD6jtm6zobf5UXfJ8rIsj/2VIUPa3TeSc
         gze0Dlz2QzM8j1PTPQQpLrEjVS95lR+hQk8WEE9l01Ss1K50YS7vmdiujRX/q0m6wy/v
         L+6WLHnekKKNU6RzTHxO+XeWbkeOc/Y9rWycXgGjeLcU8+QNxXbfWoODEdhzFlIF3EOn
         hP8baiBZ89CV5/zBMibdqQTqa70yGXV+Ic7gnc9GfvB1tazxVZbtfaB+Y3/yMkRenXn8
         E69pHaMtzmNzmHYPz/qVjq6EOENfWJGliGnMIefOBKU6WYrxdsC9BBnQpGplNXAN4tQ1
         tFYg==
X-Forwarded-Encrypted: i=1; AFNElJ8aSzYyG2w4sWrMugGGKzJ49xE9SRq76i0NIgEjH49xfeqGErcNaxPD/5T1T+Iv/YnIWxJS9+YUG5MFtPwf5hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdYH42JZZ45XMm7WuPUptoJiaWd+BJbcSc6fCpBjhszVTE3A2S
	AQw1ncU9zvYhZwUn0sCrZRBYLbmzt1qmYWPXZRtSL1DLd5taArLevgZo+JTWW9MI+Vv1PTJj5uC
	FZZWIUP0lPOzgwmkG4LqS/Zgh1aH8NDKUzUxqfFTG
X-Gm-Gg: Acq92OG53ruKB8+uWiCz069izlmdO6cm6KZmB0Kt/GdkbYEGsULVkodJcgVTDo0UMon
	DUpGS77iOEVY1BTyE1Bdbh4u/Odg302DVtjHI2JaaZuZGpk7XC5D79mbIpm04xKFLYB8Z0O2wfE
	yOZ1mbQe7Zgydr8aKA+fwAAMipLh/xTMUSHL8qYqI1cSXpbQaC5PCdrdwWkVBXH6KnqnNOjyZ9t
	r86qpAvPmgZfbVBJnOkjRoazcDQbDWf3Jo/Jan2eUKIvtJULt7l/E3RgfFXeTjg5CtNEkQjDYvj
	65ayJXMsucSXg8h8mERxj8SFfVJup6g9w5CDybOfqnZp3OtiPDRO
X-Received: by 2002:a17:906:7944:b0:bc4:c901:20fc with SMTP id
 a640c23a62f3a-bc56e5fea09mr1393779066b.30.1778530002409; Mon, 11 May 2026
 13:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511174559.659782-2-wusamuel@google.com> <8ca6f748be9913a2ced3e9f821153bfa914c206e089626e37e32d7d27c83be09@mail.kernel.org>
In-Reply-To: <8ca6f748be9913a2ced3e9f821153bfa914c206e089626e37e32d7d27c83be09@mail.kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 11 May 2026 13:06:30 -0700
X-Gm-Features: AVHnY4KeO5w6YEpmsSlgr9DnnAi-F6xgJF0AMvkGoo5f5Q_Eg8n5b2_v89jUAVM
Message-ID: <CAG2KctqDYmVORfikxr=NJbyMS-RVq_ZRhStJ00Y8vioXCSmUxw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] PM: wakeup: Add kfuncs to traverse over wakeup_sources
To: bot+bpf-ci@kernel.org
Cc: rafael@kernel.org, pavel@kernel.org, lenb@kernel.org, 
	gregkh@linuxfoundation.org, dakr@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, shuah@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 11:27=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:

 [ ... ]

> > +/**
> > + * bpf_wakeup_sources_get_head - Get the head of the wakeup sources li=
st
> > + *
> > + * Return: The head of the wakeup sources list.
> > + */
> > +__bpf_kfunc void *bpf_wakeup_sources_get_head(void)
> > +{
> > +     return &wakeup_sources;
> > +}
>
> What stops a BPF program from using bpf_wakeup_sources_get_head() to get
> the wakeup_sources pointer and iterating this list without taking the SRC=
U
> lock?
>
> The current API design requires BPF programs to manually call the lock/un=
lock
> functions, but there's no enforcement that they must do so before accessi=
ng
> the list. A program could call bpf_wakeup_sources_get_head() and directly
> iterate the list without proper SRCU protection, which could lead to race
> conditions or crashes.
>
> An open-coded iterator would solve this by internalizing the lock:
>
>   Iterator new() acquires SRCU lock
>   Iterator next() returns next wakeup_source
>   Iterator destroy() releases SRCU lock
>
> This design pattern ensures that the list can never be traversed without
> proper locking. Puranjay Mohan raised this concern in v2, but it was not
> addressed in v3 or v4.
>
> Reference: https://lore.kernel.org/all/m2y0jeg5sg.fsf@kernel.org/

This was already discussed; the response is at [1] and the BPF
iterator attempt is at [2]. In short, BPF iterators and their
tradeoffs were explored, but the current form was chosen as the best
option.

[1]: https://lore.kernel.org/all/CAP01T74KNVT2SVRR+XPbFb1vy85W=3DJkp4_yD6xv=
TSg2avQo8AQ@mail.gmail.com/
[2]: https://lore.kernel.org/all/20260225210820.177674-1-wusamuel@google.co=
m/

> > +
> > +__bpf_kfunc_end_defs();
> > +
> > +BTF_KFUNCS_START(wakeup_source_kfunc_ids)
> > +BTF_ID_FLAGS(func, bpf_wakeup_sources_read_lock, KF_ACQUIRE)
> > +BTF_ID_FLAGS(func, bpf_wakeup_sources_read_unlock, KF_RELEASE)
>
> Should bpf_wakeup_sources_read_lock have the KF_RET_NULL flag?
>
> The function returns an SRCU index cast to a pointer (incremented by 1).
> If wakeup_sources_read_lock() were to fail, the result would need to be
> checked for null. Without KF_RET_NULL, the BPF verifier won't require
> null checks on the returned pointer.
>
> Looking at bpf_wakeup_sources_read_lock():
>
> __bpf_kfunc struct bpf_ws_lock *bpf_wakeup_sources_read_lock(void)
> {
>     return (struct bpf_ws_lock *)(long)(wakeup_sources_read_lock() + 1);
> }
>
> If the underlying wakeup_sources_read_lock() could return a value that,
> when incremented, equals zero, or if there's any error path, BPF programs
> would need to check for NULL before using the lock pointer.
>
> Puranjay Mohan raised this in v2, but it was not addressed in v3 or v4.
>
> Reference: https://lore.kernel.org/all/m2y0jeg5sg.fsf@kernel.org/
>

This is fine, the underlying srcu index return value is guaranteed to
be non-negative, so the return value of bpf_wakeup_sources_read_lock()
will be positive and not need the NULL check.
