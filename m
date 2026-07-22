Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84133937B
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728022; cv=pass; b=uRkIHjO16wph3MJh4Win4AAXYx7xUM6pudqEX3q3w++okbX/fX7oSSVsfJHSX8ZAjZ6hgscot7qclVZIQUyO372gx+u2XYEYsw2QuCRhYN2SDimdvlekwYMNpYLiT2glZS4C2LHW0j2smWkRQBIdv2/Da89cIX+4v10BxcYiT5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728022; c=relaxed/simple;
	bh=jOYQuVEhe8w3B26Nj6IksKG2qHxsWwmeUaHRx7s3Y6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=upoQTlHYGiXhmmKxOprIPeWzI4d2NM99tAilPOGBfNsehKF3mIb4Tec/mAn5GkOrmr6Am434wl9SqPnAVxl/cAMd0HhbXPPYr7xt0hMp74PMFt759SIvTd5EUtcQw0kazAf92YCCeYpg+JDyeHcvb3nyCPZQlhhqxPNXmNYQ4Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BIQu1nw/; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BIQu1nw/"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c05dcdf49so19941201cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 06:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784728020; cv=none;
        d=google.com; s=arc-20260327;
        b=jV1Ou+Uzyd7BiQDuuTg/CjBZHd3dosIJSqtHhOKHyO9uW/JUr50loTJbN11nQij9zn
         tUAZjgmhPgHFsmMPQbAvmphZZrSy8ZeInfJhDvr7LYeX9zg2juwA2XMQfXD+QEBIjXe2
         bJbpC+xVtcws8Ge81q9AUpK4Bj+a/G4bcy4sJeaPpaK2d6ws9NxUz3G8/mAnxbNmsHpA
         IRaI64Ztnr/KPR874dEbNhbMlmzgzHwSoEQbHPmtRwOZJQnUmWRods77Tfr2NPCyVI3L
         bWlttOfjPCyze9UAN+2x9cCtXch++QTuKYyTBFu+ddbAu5fpU9qM6C3lnpaSn1mB7HQ7
         snGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ygWq6V23prC5KqbjFljnH4YQ+kPoaR54/QVzcXpLx4o=;
        fh=9lz+cijiXRYRTS9Nbx8yByhutpZwCwoFLCZJ/Ssal/g=;
        b=CzwA/OVQrrszXJNHYz6DzJ+fVd2bcfGYiJALjy+CIgi5Hp3LstnHIp8cx4tIkDoPRp
         tycvg7qTU273lwEwxCybzPvejU5zyEgVZNtBiegtKfZ5T7iG+RJnHclEcyzwOOT2Lmdb
         N9hT8PAwXU7g2aRveASLujXE/f+7i8gH5lrtw8S1WmRE4D/R9+9ipqfrFXdCXfXduJAl
         +Mhe8OhLaGOMPRFDAXD+KkVaUkU7UedPdGfdrYfFkCl9M7rYKiadFwfuRear5PhL91ec
         SAHHKOCgH69hleC6jlOEuEJFUs9nMS8Yf1e++VMk5jwDG3CYQBWFAcf4zHg4ArizxBfP
         riyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784728020; x=1785332820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygWq6V23prC5KqbjFljnH4YQ+kPoaR54/QVzcXpLx4o=;
        b=BIQu1nw/RVgOa1yWKPc7bfXYD1ssuK7LX4Z1gZWPOjcplXt+95BWqi0v4YreHgZYQa
         owuefwZatwbnmWSBVgvwVLaR7jbvZ8P1/FoLeB9rp19IYSck94/5vpqNk9hhM7gEQd1M
         g9T2/JUNZ3ixNxX+wVAa67DdSC3+DLk7tyxddnzJm6jcvx/sGJ36dRObjr3IYBdXfIHk
         8AdBaiPdR6Q6diy+QdZ5voWJKmOW8WUBB64+4FDJ+i+/s6Wf3X9n/r06V7m00S8edV/s
         3jCpxlimAJCqt4nkxYTRQ8Nv5whGTquaWS9Q7VUJNzcnnBw8ha+lt2zE5Yp7T5ZficwK
         rOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728020; x=1785332820;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygWq6V23prC5KqbjFljnH4YQ+kPoaR54/QVzcXpLx4o=;
        b=bhbpHWWE0mIUa0F2tcwpHZAlhxFvbDlO14v4nYLnWFLiWq/mtfpnX33+UZlz2g0UQH
         /dn0oB7PyUXWcYTjJ+OM+oGGYk4fVNUpOT56WE4hL9IhAVMni1ii5GF9EFQBTjNJy3L+
         LMUlR5vHj2pWT+oxJvkCu5PSYoH+lHYkR6UBUssyBusLq1EONhZmT/IRrf2I9pjxtd5c
         5ufBtEdLa+V6urb8KKdZ0mvUUzH+OOCUCN8J9M4P/Noy20eJEGRAMfsKKW/ZuMWfdx0t
         OmT0+4fbFdEhimk4I4XvRFgt8ctMACjw0bJbyb9Xl7vgCOA09fP45pft5FFi/dfnVbmM
         XQoA==
X-Forwarded-Encrypted: i=1; AHgh+RoSieg/4Co10EbQsOrH4I0SxnkZawgIolNbrqcK05TzMen+c5VHw3VsBPpIxhAI7mrlTdrUgOGSyt+kmzlitHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMzAi/fWC1pFP4/jDaywbOokJjJN1HPofv04iGbzoNrPcr5Dum
	JAzMGqxANHKKqUofxko1NxaDaM2wVdxFxSOfQ4SYYjdKXe9gaAmnXVM198gU9FRKyKawOT6DKmn
	S5XuQNtBbc+1J+lKxeiS21hLF/vHJ9bbixcjVr8u9
X-Gm-Gg: AR+sD10QJNzfX4xqgCS2fZJbF1LDztbaDeoBoQEa3actRAC2E6Quo9m/fD+FsAS3toi
	A05+9rPVmnUDs9rRqtUDQURn4peS6OdNaTvUSeLWWAw0EjuefQL6rrA1sTENsKak+0hfNMmgfYw
	xmgxqAu2PdzoKV7ziMaL+iqIHbWZjpgZAlVE4QqEbW5ytOjxdtGf8MYDAZSnj/LITiOMdgk8FU3
	kcByHNYcYWBWs9UWC+tAUgsvzm8BxehBRSFUXCL81lRApetyJPF+FyIZQhgGYHSF3skV66e0Ngu
	Cs1M6G0sU1cRnYRx4D1OC8fpeIlnobY2NtM9fsYDJR3DvH2gflA75N9jmZFOOzwU/eJKwBgM
X-Received: by 2002:a05:622a:48a:b0:51c:9ab2:dfd2 with SMTP id
 d75a77b69052e-5213ae555ffmr223765481cf.33.1784728019641; Wed, 22 Jul 2026
 06:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722015129.916-1-yanlonglong@kylinos.cn> <amDCZ5t8wDtqNAIe@devvm20253.cco0.facebook.com>
In-Reply-To: <amDCZ5t8wDtqNAIe@devvm20253.cco0.facebook.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 22 Jul 2026 15:46:48 +0200
X-Gm-Features: AUfX_mxcHk7xgSRJVZJlkUyJITANWQAilS7A1ELIqqoIUPEbdk7UP24_6QDPH18
Message-ID: <CANn89i+P5pZr_QFKgd1uX7r=r5M1nVRbuynytzcEXbp_HHPr4Q@mail.gmail.com>
Subject: Re: [PATCH] selftests/net: use MAP_FAILED instead of (void *)-1 in tcp_mmap
To: Joe Damato <joe@dama.to>, longlong yan <yanlonglong@kylinos.cn>, pabeni@redhat.com, 
	kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shuah@kernel.org, horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 3:15=E2=80=AFPM Joe Damato <joe@dama.to> wrote:
>
> On Wed, Jul 22, 2026 at 09:51:29AM +0800, longlong yan wrote:
> > mmap() is documented to return MAP_FAILED on error, but tcp_mmap.c
> > compares the return value against (void *)-1 and (unsigned char *)-1.
> >
> > Replace these with the standard MAP_FAILED macro for better readability
> > and type safety.
> >
> > Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> > ---
> >  tools/testing/selftests/net/tcp_mmap.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
>
> Looks right to me. Not sure if it needs to be set with "net-next" in the
> subject line to make which tree this targets more explicit?
>
> Either way:
>
> Reviewed-by: Joe Damato <joe@dama.to>

Yeah, I doubt linux will ever use a different value than (void *)-1
for MAP_FAILED.

Reviewed-by: Eric Dumazet <edumazet@google.com>
