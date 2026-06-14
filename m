Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16511E8826
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781408819; cv=pass; b=X+hQ0HwJq3BhszUU5M1ZCqmFuYpK6JeqH/wxLC8YBbQtTQUX+N+rJ38vNcR6QKkYqxGviTbNpzU4RAl7v9ySLg8+j9gsqCigRWCpfxxNm9lYmsE5n480fv+X7sOQ1drqOhGErrwDrkOEfFiBKdAySDZO6oKjsRf51eRlvrulvjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781408819; c=relaxed/simple;
	bh=eRVFYlLNmeSGg3OY7gKvJQsWIErX/iR++Ro+lG+7u2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivxudQ5e/9fCsvaPn5vopgZDANQFem7bWLIkVrUrMHS5zKQiCGCaz1j+PUs9rK/dpJt/1qY17gwQXGT0nybUo3kZv+tYIfOiMw9Mp+/uIp2H8hS7LtYCPpHV/K8YE6MNHDsXjHAm1XkCZ/OO+5suNE8OQlcOknoTAe3xlFcmCxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLzKiCBv; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLzKiCBv"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7e266714bd3so24782657b3.2
        for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 20:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781408817; cv=none;
        d=google.com; s=arc-20240605;
        b=PCqSzQmoxdzqO0fhe12PtYJQfR4B5H5VExjyAV8mecpuLOfjvXuEqhj/dYZ8cOhKR/
         JDM6U+T/g/rvocq77OADBJ2TZkno4seidCrdPxWyMk1ycpsH0bp7iwqXLRGZ2ohWt3Mo
         RZ8+uesvQHNg002zW4UtIPc1I/QPsmYPqLCbbJPS62YfEzBTYPq3Co4xFj478KWldZcB
         QAUycA3Zfc+nuBb/X3Uony7bBPvOP8byDn7Q6FGz2cUyS20EtkCdAHfV4t+klSAUcXlb
         BBNojvQPkwtldK29hwAwZLyGMRJ4XFoguyLMcfGsj1gxxBr21FeDp9hQYztLfhmsPVpk
         KnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRVFYlLNmeSGg3OY7gKvJQsWIErX/iR++Ro+lG+7u2Y=;
        fh=CAP+0DOOZ1qnCUJAsDEKDeNSXbZP9992jy2YLSGv3HY=;
        b=S+kMdZwV7eTmyj3HE1P7VHitPpTv3zOvxPOwZ+aloMAs0lugf3ulg6XU5dvEBL0V+M
         QF8i78aD8RyaxLrYZArJgtWlwWbyYDaEPq/hefdWj52y3eKnQeZ/NQFkDtkN/MF5AoLd
         O72ebmXgsorYHXW/9EAJgTC2kDWOTRUu3bEOTkuO0+8Sakpt9ry9fC8ytUBe1PGkmoED
         tyGY6WGyE3SWqZF8fJlXFELRrglWROwO2H6Dwzh1/Ugu7Om6rDmkQARK0FlDm6qVnu1Z
         rv4fBZE5zFl/p6oGNNjrOHyQb5Mp6FP8YExQdPjh+SzNh3roomtp4mvYHZp0jYaSQe6E
         kgyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781408817; x=1782013617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRVFYlLNmeSGg3OY7gKvJQsWIErX/iR++Ro+lG+7u2Y=;
        b=NLzKiCBvHBcuw4Q5i3phBnygyZxRE1PTbUnT0uRi1oaTxA+DYtMdX5YyX3/UIR5N6N
         qpnhdW6Jy/DGgBqFRqW64IHK2B8BHPgXORkNmthYK82/9+nB2TP01UfVmqx0w82C2tZ6
         LGSstKyCdeo9dbbBzY9InGtBYO+XQqjdyJ6A0gTBvueripynuCUUY018H1O3ReDu3tXi
         QxpHbhbBneOZH6JFcY9kuKYbKUJKulI5EPoqQnTFpSjHRn+bEjAnkdgTKnuuAdJsqsX6
         ieoyv8jMBmIngk+ar3kWqKZ4Q0i0cEmyjo8Jco7anIiObAzl8itFZSXrSfZ9JSV2CWir
         1oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781408817; x=1782013617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRVFYlLNmeSGg3OY7gKvJQsWIErX/iR++Ro+lG+7u2Y=;
        b=h1aspQ3A9DfGUKDpph0dRnfY622UvU9X+X7VqkpHCRTBbBj21lVFrLR0WFMmJMOOj2
         UfTaguPG3qpMS3EbagRscv+iSzE6NmHi2CvZiIpfi7c0PWbjO4ucRmv2WMCtgNS16TK3
         GlEB9RDem7Jp939KlhyuUty6ROVOa9nnzI3Bg2NPRmDv8u0Am/zyPGy3u4SEB3Yz5N1O
         pT8nSpAFcINotGWhHWxikYqMcBEBz5PXSZarRSG6q8+fJr94vAGECYdK+5ym7s5T21Uo
         jvIS/t1b8fFkpD/DGWCMWLbL2/iJxvQAQ6nNzbtBEckKc3/2q0hCw3jLD5ijUshhXppx
         l0uA==
X-Forwarded-Encrypted: i=1; AFNElJ8WWnao3sEi/J/Ojx4OzImi0U9IkbdyOtFIQZ7FM1pnNEyA0UIpmmteTXKEu2JTvZNNe4XWpl1n6UA7kvEWFKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWFkYN5301oQQPaL+EJhNRYL9/NFyZDtAvSyrT4y9wk37/oOb
	DpaLmgm8rc4K0FhsMredZcLCmRbVCad0YMrGJcRZsA2lsrNfp09N+jbw2qBbUax07Wn+WWnBMJr
	y3opq4Ts9ib1CpaS6xm6iDsu33qi7PZQ=
X-Gm-Gg: Acq92OHRJS90KitWNPt4nfaQ7jEa6UgcIDeFdCqWz0xzKFnvO2pgLVV5kJSDmv9sdcE
	Zhw6S4uft/kH2hST4LrGNi3BKjPLaul8C/F+hiph8gUtWeackaqZK9v3ST74B5AQ6UMoB+edzf5
	v/77rFkYLY3wBUqHMQZU62cs/XjPL7Zrm88DpLZI7Mdo9/7H6isBAoKJWc2gbwZY0IRyfIFRVWy
	2aVAhNukWRysp5+x8VkBISdk6LR8MCNkiKVQU1xczKMacO0RYIT5aMVnpBirp7JieVGlbE4XaAT
	N6B8drbH5b7fUI1MHfE9ZxtxvgjFsNUHtY+ou+l5301Dob0IDxAi+Yr/m3DxTw==
X-Received: by 2002:a05:690c:6c93:b0:7bd:9ce7:164c with SMTP id
 00721157ae682-7f8c3fdd5bemr51633187b3.43.1781408816861; Sat, 13 Jun 2026
 20:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612114032.244616-1-sun.jian.kdev@gmail.com>
 <20260612114032.244616-2-sun.jian.kdev@gmail.com> <20260613102549.0061a875@kernel.org>
 <CAADnVQJyOR0hppTmhbTRS8Sp5ci-L0fmQ6V+R9eiJDop_95rVA@mail.gmail.com> <20260613130343.3984878b@kernel.org>
In-Reply-To: <20260613130343.3984878b@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Sun, 14 Jun 2026 11:46:44 +0800
X-Gm-Features: AVVi8CeuSoLbqKZ8hO8Mj4s69jiQxW-2c__whedvojWfFSqVia9mVfTsO1WPvBM
Message-ID: <CABFUUZFG5fybb=2A_2x-aa0Y2zvHn86sTV-ZBoLSzxLw0VLvGA@mail.gmail.com>
Subject: Re: [PATCH bpf v5 1/2] bpf: Run generic devmap egress prog on private skb
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, "David S. Miller" <davem@davemloft.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Menglong Dong <menglong.dong@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 4:03=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 13 Jun 2026 10:53:35 -0700 Alexei Starovoitov wrote:
> > On Sat, Jun 13, 2026 at 10:25=E2=80=AFAM Jakub Kicinski <kuba@kernel.or=
g> wrote:
> > >
> > > On Fri, 12 Jun 2026 19:40:31 +0800 Sun Jian wrote:
> > > > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > >
> > > I did not suggest this
> >
> > ohh. I didn't follow discussion closely.
> > Do you want me to revert the whole set or just remove that line?
>
> It's alright, I was just being grumpy.
>
> Maybe we can amend Chris's prompts to catch these?
> Noobs tend to add Suggested-by for people who simply commented
> on patches.

Hi Jakub, Alexei,

Sorry about that. I had meant to drop that Suggested-by tag before
sending v5, but missed it.

No action needed from my side.

Thanks,
Sun Jian
