Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FA286425
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406632; cv=pass; b=STBeWE39OOlGePz1ZY/dHVtKEo34W5/TlILOcfA1Y8rF4PaVH/Hh+nd2sKxcBABSSbIxVgHvoyCeruw8pW7nRtklX0MYCJuKed0puZI8yEFtD0YmYzsDFvv0ybexmoAunzaibq9ME4OIyXfPkdr6iIPJOqNPeElfJVRwGXwoS8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406632; c=relaxed/simple;
	bh=fWvC2a/xqgh1OldCwgrsGXahk8JcrWhz5yP6DeSbVtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dV7YqwnzQp2sF4SqxO+UA1zhkl5fSkJVNlIsB8D2ZqcfMtbWULhhCBmZntA5qAlYeD2YdZo9lWAooNGd1wUbjEbEE55mMnei0wcRr9oSrQHTenKPB5Tfr1nUd5QoyM0jkrVFTVDqDdmCLzJs/RJnXg2LHhS/oP6LR7NE7SCN0No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=InrYOueA; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="InrYOueA"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso7953753a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 19:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774406629; cv=none;
        d=google.com; s=arc-20240605;
        b=AUvBERjPcOn+Af+FeWdLUxHIb3rrfOPUS78curLhmDKE8CUOZw+6AjK+UOWyKt0wXP
         80IwElBRjQaAQwYBudCfV2ASB9DlP5cQ92uiJ2KL+ta3wtRrM8ZF03cLrdmZ0b6Qxpuy
         SWzzP/egmyH9jsRpCtaqhjlNPsB9TNFcj5r7Z2+58isyqHGeWVA/IJS+gyl+U9ScAyJ2
         mT3cFJpKUlBxw3AqbirJJJa0ZxMSQPZnX1oPxLLZZbCtUjzWBhSDb6hKGrd90Mk1bilR
         2VRxcXpfsvwNbtS+Rz8ND7Zc9hdd7hbs6XpoRw0omGX+oBYQO1PnR+PufidQE+PEhXTS
         bTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S49Ro2Awewt8DGHII5530iVBK0Fi/44fxcec5lAc15w=;
        fh=0/xsFIZDK37x0BJK66i2/F9q9iIhkoYGSYqcjRmBsU4=;
        b=kBCiumAufr7Yn9IjhgcsTkZaciHuVUMMlHS8bRW+9RZLsdrGJudCsx4qUlLGNqZh3p
         cLJ2ZSnf/OSTgh7o5Xj9F9NLYNT+m7Fps91XAw1xP4vmD52Fg91Xq09E4YWLsL3x6Q4s
         d8J0jSoDFPYdWaDHD0EyI3jvpx1pVstCCvUmQCr23unMUWUdxkxXBW7AG0FEZRjT5za6
         obGE/Ic5v5FcveYJXxmg+EaeyR9t0AS/kMqVgHcA5XVYu8S6VSfdmCKXtKlKcO5RZ8+7
         K47c3k5B42f7uxhadqe3K8XUaWcG7AGHrE36Zze5UVRotMUQfb24kQn2NoEELpQn7cjt
         +uRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774406629; x=1775011429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S49Ro2Awewt8DGHII5530iVBK0Fi/44fxcec5lAc15w=;
        b=InrYOueAM8rS8V9B9labB28oGnLc1ZWHbERKsc+q6TxNc/2ZFvRaEJClBav/bAqUlf
         XWsMabUul7UubUDGMw2I86BGfnul3g+kmqQbyJYWXjVES7sOAXsiSGjaVlvu9iilNeR1
         Vo1YHbASiKUwgPMpEA6GcqkxYZ9KLHHgXst6hQN9LkJd4A0/xetwnP3dPztSr+jxuChk
         akn6H2lZ9OoxiPZ5mFG+H9fAjDpV7jUidzCqMmVxEk5eblGGkRetiLpCE6UtT2QRcIEd
         EqTDcAnU9O4OIukDmf8rPXQqr1UMyn8/JSc41BIIFTlqt3j2Qne5srE+f2A1WpXVcgs8
         QjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774406629; x=1775011429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S49Ro2Awewt8DGHII5530iVBK0Fi/44fxcec5lAc15w=;
        b=CSt1RMUR3DdbveT8R15JdkXHE2VUaqWtbCiY2NSMpZpSV3b+T1NaFV1ezl8+s43Eae
         +TEdOzEn4rrEARvHAI38OyY5gy8A+pf0tKh8D8UamFkF+GmS4hZJQYTO3onxPVVYrHWa
         SRJIhjum+7ZJugrMAH0BMzS7+cl65zYebkFLiMufDyNwZXsv6cYIGSX2T806ngNAVu0B
         kgaAOTgDyrD7AndjuyLET1h/edVPBRoaOqrGhJ8qb6z84N1u0AWyo+3scbtJasJUgpIU
         H9vZCN7hX/pcFJ3f0bfc6JOmpptbIRscha2VtPN5PxNsTVllGeTjdDK8qrFjYzn6K1u9
         TaYw==
X-Forwarded-Encrypted: i=1; AJvYcCUukzUntmCSLeVFjE4O5nQRPiXKwoKJ3BFIsSJPIDEyp+Qu7C+gh/se093zo1G/2a43L1NjR28bXtidke2H9Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAEHuP9qnYSCpgKfitjoWCg9kfYs4WcTPeDlb/+PmJ5F4dDufH
	T9zVFqJGU7osY8IurwxF90NTj3x4ru0aZAYT+fFyuPxxaOsffucmw9llZOozAzGhBmc1HU9BBdT
	7Jun1/9hg43rQnlhNb6Kpz2djVrGkPm/uAgibgxi3zg==
X-Gm-Gg: ATEYQzz2jA09hxtSz8HMRUKLV/iMtoOueJjRUpyNpRBQfL+9EDAeZFmbNsA2Mcww7+R
	Mo1zU+oGnhIuxwNGAKyRWWFRdsIt5n3nSsW2BqYYr1h2RJDHwADNiaI2LsGDDHN2NZ7CVVxbO8z
	TfsDDmUkmmGxCi337ybhO2F8hCknrEV/QYXbjSarL2u640ZSUxEkeOCIm+ZlFNtBvyqUmNMoKQ8
	b5uKnjwfW/+gda6eLHkBNMlaXIF5Hh4KSjXwOznTneg3vlcJYkCzETbvI41mXUEdtZ/RgkW5RJz
	3F7RWAFD/P1h/2Fja0szu08i/dp3KFUIOo4pjQ==
X-Received: by 2002:a17:907:6d19:b0:b97:98e9:1b17 with SMTP id
 a640c23a62f3a-b9a54254cefmr104541966b.28.1774406629257; Tue, 24 Mar 2026
 19:43:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321175808.57942-1-pasha.tatashin@soleen.com>
 <20260321175808.57942-2-pasha.tatashin@soleen.com> <CA+CK2bD2aNu-NByET4KkBP0n2j8WQE2zjxb4g-1cv2hYfjaRZQ@mail.gmail.com>
 <20260323-leibhaftig-blasinstrument-58ec408b3c40@brauner> <CA+CK2bC6S7pFCYR0XS1ZPxw9HKjWgxy=0DkszYNjMUi735o_1Q@mail.gmail.com>
 <20260324-langzeitfolgen-altgedienten-ccef17d19349@brauner> <20260324114021.f5546d2de5b6a2b0490f63cf@linux-foundation.org>
In-Reply-To: <20260324114021.f5546d2de5b6a2b0490f63cf@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 24 Mar 2026 22:43:12 -0400
X-Gm-Features: AQROBzDD_dN5K67m768ffew-lTTbV5PIJ8L5d861vCwJTCIzcd1-cpNV-0z3o_s
Message-ID: <CA+CK2bCbgXHnZ0PhzfKE=NkykyqMKq6KBXW6JqMpq2R3k3RXDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] liveupdate: prevent double management of files
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, rppt@kernel.org, 
	jack@suse.cz, shuah@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, 
	dmatlack@google.com, pratyush@kernel.org, skhawaja@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 2:40=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 24 Mar 2026 09:51:34 +0100 Christian Brauner <brauner@kernel.org>=
 wrote:
>
> > > > So, I'm not happy about I_LUO_MANAGED. I don't think we need driver
> > > > specific stuff in struct inode and not in i_state. Track this in th=
e
> > > > driver please. I don't want this precedent and I'd rather have you =
get
>
> Well dang, I just merged v2 but Christian wasn't cc'ed.
>
> > > I am planning to use an xarray in the next version.
>
> That's what v2 did, and I_LUO_MANAGED has gone away.
>
> Christian, does v2 look OK?  It's at
> https://lkml.kernel.org/r/20260323203145.148057-1-pasha.tatashin@soleen.c=
om

Yes, v2 is fine. Here, we discussed about the previous approach, this
is one of the reason why v2 exists: not to modify inode, and also not
to rely on inode being different for every preserved file.

Thanks,
Pasha

>
>
