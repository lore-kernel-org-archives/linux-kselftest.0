Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23091282F03
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504140; cv=pass; b=kDQC8V7ZK61r6P7McaLYkntvB3FRgwe6odbvAA48QNTJBFoIQHiK9RV3QvmPFtz8ABq8ZKmSRS0wRU7tB9u5EODUIrPq/Oinw3MUTFl6m2hWIvOMBNC6YfoTx7FeTCcWoJT6WKmI2Zm2rbgBFvszWA/IkUFBInN3ACiy0bbwuqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504140; c=relaxed/simple;
	bh=0/3WVRTAV68Tqab1dU46QJFgGgY/DfR2M6RH6QxWnpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVOj50bHE/rDErIU9mPycSbfSNfG9GdfRTUfMxcIdhnrMrasRxy0qW89lIs2T+F0tK7cy3N93BvDmfy/6+7xpJgTnLSG5Nkeoo95DmaiNd6J85CaesBiLyS9rQRKdvp3JR3D/FVsS1MoJixA8oWhDF1XvXtmHTyYJCOw6h5XgBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNBqPBSk; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNBqPBSk"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79800183233so70087427b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 18:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772504138; cv=none;
        d=google.com; s=arc-20240605;
        b=HmuT4zwx2kREXw1FrJZhPjb2rDAkRzqqlqgzGBwl5/6KRAXg02HXmEbCkSQ6I50SoZ
         XUp6SDL6BT4eQPrjo/cGHIG68rXSXYBvMoBI34aXHIiX7OByi14adtrL/1i2EVUPsSSx
         hJfNMiup1y+LnsCc2pjLX1jhyDKg2OXMbNKic+zjrhe7jm+vdQVaOXo1Krez+UY19kBt
         PiFsU/SC/Ekcwdu0TXsWxGuVdZIaxa9Co7xFggxtKEw8lzC2imF9AtNojusO7pr8d+jf
         bcfUYfVDlKGpFLiMizbtGE4z9yeRljN6x+APyvNLqKSsU4/2T56yLP4s1riao807waov
         K2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zoWPPOcgLHeuKkOjDta8aL0tHWF1IewgSZONMaW0bRA=;
        fh=tde7MxHk8sDkodhShLSAsqjnLPJkKKLfxfvaoGp0p4Y=;
        b=HuPah41/VTEU+x7l5QVhb8f6wUaA1NpChBfb8FcFgVWkEpCMMsUjckCTDui5oNZew+
         qbME3GAnVe6W0Lc9B9ok5XyvY8w8V4O8UzA887PZw4hW07nU7rUCEEp/zlA/NQ0NMIb4
         W7oX44LDLPTwGMW4F95PaSnflvrEEkxRrXSJH6lfzRpNgbLMxejFfxWDhCAQwon4xn8Z
         cXcwJT4aZvi8YakEX9CggIrE57/SqPwjKpXOdaaEvz8pKoy22X4yHd/97nvkOGTWXats
         fAX3CCwpdmVqSMtfe4oevQL1hFJiifvhm1X9fsh+G/Yr6LlYfV2ZRm/Gh08PbTOut57h
         deNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772504138; x=1773108938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoWPPOcgLHeuKkOjDta8aL0tHWF1IewgSZONMaW0bRA=;
        b=QNBqPBSk4KfCVTVjTyIinlZBn+3CQjBCtOmMgz7sVHE8X6rJcuqWkuwk2VIFMk6lfC
         okFmjZBtcAlq9V63neEYHHKDa+UmKShLubQEq3OvbQe3qvzarFp765ZzzX14JfPTJzd+
         Q3FyTLjGpOkJJnow84GBPw9kbasbSfq7OSuZ1o7mnFrSuhyiAVEu2AIAcRJktk2a/kGW
         piIleR0vuWII93WiG59lPDg///tJOfPtnM2/WDzXjQKRA5385ps2gClagT8iXpNhL2XB
         +m/GeNJ7P0eFQW3qnSKmRZ5hVBCbLodSSEiH6vmRr60Wa7yjWmyT+bfqfNsgMcViRMsA
         Fc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772504138; x=1773108938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zoWPPOcgLHeuKkOjDta8aL0tHWF1IewgSZONMaW0bRA=;
        b=xR+2AFVyyIl0S1wZjvmZu+DWz0eMG6POTRvymTPSF6kzYtOxPXQhnfy8903rGBFmaN
         w8kqDGPPbzQF6BWRYFRToOQaDGEfsGnjhBEnUjk21gW6OK+fm75CgKLLTdKSf2VpBvNP
         vwR9Omj3ZKQFSfS8WiNKhMBuflcgHBtW0TRcMOfdYx3aWqbLakVcmZW1LPBmDMrHQAoi
         gLzxz2WzPAQh/WEAIqKZ9OmyR/KeTbGZPpgQ7ur/hV3cd6Pu+q4unb6EQGdBl8A4d/A/
         aAn/cojpf6ntCTh0bBYceKkjMW/TOBs/jDJjG5Yi6n2K8ePclQ37XVXYrtOaLB/CdcdX
         tqvw==
X-Forwarded-Encrypted: i=1; AJvYcCWfOJFjORmAdxN32+VOBn8OiIyRf6jdusNdKc73BN7O/C85x4a0BQB9M814tmtMxKGV391A7fb/BO0oSN5fqEU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/XbSA8bJncos3esuvF9DMMPhyPAtYzjKshE+jBR8xqpq13RB
	syhvtKrVqfcPuzAbsV6/xTiorbFMOa3hg6FjyiXZf0eCAZbtF/rvdbDFAqpLgzXyQEVxOKC+oWX
	IJRHsfNiVhEYhEa9cwn7kxC58xi9JPtg=
X-Gm-Gg: ATEYQzwrXV5j3fRgOGBf7nfDc8eftJNwQ6uB8eNeAr/jGrNGGukRwLwppvo7TkJbPN+
	KT3sujaMdCKysjxiuyq0moiR7Yf4vw1SQeBAKyOyFMy4+eerVMFmkHYcyAQ+aRPvvVVGoZrBJkO
	n6x9TAb1TYYUT8qS6dXgg3x4iImBAUME8qh8YCNmKx+4pbTcWSNFk+56k9pPwpaNY0PvhPplKYZ
	mCiGae6TlBpjBr8gAG/hwXPtEqqpNKfnVp0jEtRi977X71k5lt1Vuf3ovnhZaJvm4nDHejykXmX
	B/692o1y
X-Received: by 2002:a05:690c:88:b0:797:bc42:9e35 with SMTP id
 00721157ae682-798bb3d41e5mr3992027b3.23.1772504138088; Mon, 02 Mar 2026
 18:15:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228074555.122950-1-sun.jian.kdev@gmail.com>
 <20260228074555.122950-3-sun.jian.kdev@gmail.com> <aaVgTiHlc4rXvzKJ@krava>
In-Reply-To: <aaVgTiHlc4rXvzKJ@krava>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 3 Mar 2026 10:15:26 +0800
X-Gm-Features: AaiRm51dhpzDzc25XjIGtzB1i-KYwE6RRyra8isDGEkOSSEK9SbBlR_csmNEtRw
Message-ID: <CABFUUZGAK-kD75QAc8acfoGvPVj+EuaFNLT7rcPcWP7SOnpKqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] selftests/bpf: bpf_cookie: make perf_event subtest
 trigger reliably
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 6:02=E2=80=AFPM Jiri Olsa <olsajiri@gmail.com> wrote=
:
>
> On Sat, Feb 28, 2026 at 03:45:55PM +0800, Sun Jian wrote:
> > The perf_event subtest relies on SW_CPU_CLOCK sampling to trigger the B=
PF
> > -static void burn_cpu(void)
> > +static void burn_cpu(long loops)
>
> nit, there's another burn_cpu in prog_tests/perf_link.c,
> we could add it to trace_helpers.c or test_progs.c
>

happy to refactor into a shared helper if maintainers prefer, but I keep it
local to minimize the diff.

> >  {
> > -     volatile int j =3D 0;
> > +     long j =3D 0;
> >       cpu_set_t cpu_set;
> > -     int i, err;
> > +     long i;
> > +     int err;
> >
> >       /* generate some branches on cpu 0 */
> >       CPU_ZERO(&cpu_set);
> > @@ -443,9 +445,10 @@ static void burn_cpu(void)
> >       err =3D pthread_setaffinity_np(pthread_self(), sizeof(cpu_set), &=
cpu_set);
> >       ASSERT_OK(err, "set_thread_affinity");
> >
> > -     /* spin the loop for a while (random high number) */
> > -     for (i =3D 0; i < 1000000; ++i)
> > +     for (i =3D 0; i < loops; ++i) {
> >               ++j;
> > +             barrier();
>
> what's the rationale for barrier call in here,
> together with the volatile change above?
>

The burn_cpu() loop is only meant to consume CPU time to reliably trigger t=
he
SW_CPU_CLOCK perf_event overflow. With an side-effect-free loop, the
compiler may optimize the loop away or significantly shrink it under -O2.

The old version relied on volatile to prevent the loop from being optimized=
, but
checkpatch warns against it. Using barrier() achieves the same goal  =E2=80=
=94 keep the
loop intact as a CPU-burn  =E2=80=94 while making the intent more explicit.

Thanks,
Sun Jian
