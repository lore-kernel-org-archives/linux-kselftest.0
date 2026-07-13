Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61FC43802A
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961432; cv=pass; b=PrrMpnfpbpEw7891QyA/stMQj6cS34YHCxgx9yCKPlBXuhSEjp/A9G/YQVlIElI41tbsiu3fDr83m8/likAiYn1VFtz6V4u1CW1ovm8oL/EGwCRhdUKQFwas3PyuFGqLoz7VSkAwkx9rz8obf1csYalehwClHyxHBLfajjx6mNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961432; c=relaxed/simple;
	bh=aCrBFhBH4b55ElTrOxI8l+7LTfo9SGbV+OTj6Ct9UmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9JCePgyezura4b6S/MVDx5KqvlkhRWdHfD+JFF2DZ0H/EzUlFyvShiRqpOa8wsvssdr8JiV8UYOFXK4etC+VbqF4xotdS8+K3JAYNMrYnimdGvac7TZhq9Mc3ApwUPx4wkp12jxbejF601SGX5KlvupC3DDwhSKbRDdXXCJXHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b9XNzrbu; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b9XNzrbu"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698411099d6so235a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 09:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783961429; cv=none;
        d=google.com; s=arc-20260327;
        b=o227m+jnMCnJEuYEVVm5msZ2yES1cy89KXqzEmIXi1T5D/illWoXY3K0yDBaPJvZU2
         R5ZY/X0f2rCkF+/nzJ+ctz2+INBlVx2V5/vTznzkSs/67U2fPTNfTVgUnEocYjGy1CyF
         nunSt4GbveAeXclH7IuPX75hTlgw6lp7fZvaVOZu8Sa+hDi6Z63hNLb3pjmIAc/yz3J2
         D9Gayjcozx2kZ3YeXVJGnCpMtjRmicAx+Z5c1rUSqY/r7d+7GNqj4AQ7XKenQB4KGtTu
         f8nWNGYZFR0A11nJO7eDpOjpjrPsPfyKkrSyXe1zTzrU86ZamjMwkJloPZuCk+wVpnAd
         nHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aCrBFhBH4b55ElTrOxI8l+7LTfo9SGbV+OTj6Ct9UmY=;
        fh=N6tnLgJQfMqshAIWu+CJ219cQSHWXXq/T6Qm8ym5j4k=;
        b=G7f3jq/ZW9VNrnUPrHsVMtF1HGPRs+UaTJjUPEFJyKyfjeRHEI2NYXFJ1Bt7+aTFPS
         1/Uu1ec1TGo3GA7LCpzCgEi9wCaN4w3k26bbQdcMffkWYiOnAk9iTpS7yF9vv7CS5qOV
         IQHD9TfS66Q5zsaFaOimgz2iMfAHC2Ipw39PzGSk09BYmTvEa0IrHy0XO5VlFuo3LvRE
         3DWaxDxlKlF2vAi0Nqlc+flB7AExrN89i/0n9bZJ238DUZy7gZ3yrqHP2tQNj3gQu9If
         C4rTpbxzN9ApJqZeOe/lyTFtSeeqa5qiJtDh/vAIft3MZUT63RSfScL7TlSD2ONPWCvI
         J1Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783961429; x=1784566229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCrBFhBH4b55ElTrOxI8l+7LTfo9SGbV+OTj6Ct9UmY=;
        b=b9XNzrbu5oM7fAcz/wCXSJxMRQqVJROXDEln4rrCupUOG8pYkIKfyjElLsQxa8NANJ
         XpMiNbeBxIQ5iSWFKwsNY+IfWB4INz6rRGuhiDULOyCLqW7mm5P3qBzgIAgz1Kzd/yMj
         +E/8fFNa4+fMNsbIgUPglJKjqGCnGedZj+BPBRwef3zpTaYg+/RJrm5T7XxKrzC1mgz5
         y50RWYHITTfsxI7UbGL6xE/FRZnyqOI+eF+sNDHJFMJjSBJbKf5VXe9AWdK8bRzWc7aT
         x3N4AwFWFTDl+K5+J8yu+2gynl6DcYtf+Bf8kSDj31+Eibb+rovjfasjADTs/CHAVc0b
         uJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961429; x=1784566229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCrBFhBH4b55ElTrOxI8l+7LTfo9SGbV+OTj6Ct9UmY=;
        b=gLh0P9pjQGdlwGSNchweTyPmwNb7hoQG7d47aepumfZaqxW070cFah4HYLwLFk843A
         nGyGkNJNb1VVbBnaQ3W6bAmob4ofswfbeKh5edtTpO1UF7DF44BrJSZef70xeYsyu4Wn
         RFWj5SMv17oZHhg5R9oWJt8dgfXi6+kptRwudc5dWURyJfZ8QMsR3XpLVG3mzIbOPr8d
         kTXK79+2Rf+8oCh3BYBv4C9UnjXN9XLIMUPpxJX3l13i5Zawfvz6tmK45/p8kAYD5pkl
         3he/YR7H2yDW4Gej7E8OzHssZ/LALj67hdMexRK9kknm0FBF0yzuTCLWtSSbxEtFimRl
         RJvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoL0/SHZG8f52s8+vjoq9AbQtWrRocBju6f30JwWuCJtJD8SWlhGw7jjRA22MJGFpMghnOnHKAOsQ6Bbkdoyyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLywh1zJnLwKjN9F+Me2AVedimanqM5SgwbwEfXXM0ULUhMuKQ
	rM5h8wuZYUGZxJGjM8PyLD91xCOlOktUeIdyZ6pyJzYXLMJa8+hXxocIFafZL6UGWfKKsd02v03
	Tjhj1ux7dqSna3y0MH5incX9BX2n5XeoTKoiWHDwr
X-Gm-Gg: AfdE7cnVC5sIDhpl7nhwQIXUZ7L15Jiule/OtYPlXhK3qoXAdVJGn245ZT/Q7qxRLeI
	WRbNRdf3Owdfrd3pb09lJ/T4F1DKMTiHi+rwGuZO0XzJOb0RjbHnqFjeMgNSqHCOyPYNvAuNVIB
	tczcZKjlWeRdbwxKseYgKKLHICltNVWUjUY7Kcd7IMWBlP314BoHFiw2N3viVgdNqJ2LmJQA967
	TA3ScnF/ANSRVNFJkucbfaIyIFVT/dorrJ5I8zhhKGUUqrSvw8d7TDqhnD1L8/wBDl7wPhihIwC
	L4RbtmHky7M4B50BbOpUHweuXsk=
X-Received: by 2002:aa7:da44:0:b0:672:117e:55d4 with SMTP id
 4fb4d7f45d1cf-69cceedafffmr35162a12.0.1783961428842; Mon, 13 Jul 2026
 09:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612214512.464146-1-vipinsh@google.com> <ajLtfkuMP4DEGlqe@kernel.org>
 <20260617190754.GC2704872.vipinsh@google.com>
In-Reply-To: <20260617190754.GC2704872.vipinsh@google.com>
From: Vipin Sharma <vipinsh@google.com>
Date: Mon, 13 Jul 2026 09:49:51 -0700
X-Gm-Features: AVVi8Cel2bn_2UuHYJ25Jh3NaRKUpct5Z2YiVdgR0SBKqnQpE3MSXtvH7sX7PyY
Message-ID: <CAHVum0dL+p-j1EwQf69p87MU1s8Er9RsOaMMbprFnmNeEdS6-g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Make liveupdate selftests library
To: Mike Rapoport <rppt@kernel.org>
Cc: pasha.tatashin@soleen.com, pratyush@kernel.org, tarunsahu@google.com, 
	skhawaja@google.com, shuah@kernel.org, dmatlack@google.com, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 12:08=E2=80=AFPM Vipin Sharma <vipinsh@google.com> =
wrote:
>
> On Wed, Jun 17, 2026 at 09:54:54PM +0300, Mike Rapoport wrote:
> > Hi Vipin,
> >
> > On Fri, Jun 12, 2026 at 02:45:10PM -0700, Vipin Sharma wrote:
> > > Hello,
> > >
> > > This is v3 series of refactoring liveupdate selftests as a library. I=
t
> > > exposes common liveupdate ioctls as a library which can be used by ot=
her
> > > selftests like VFIO and IOMMU.
> >
> > Let's revisit this after -rc1 is out.
> > I don't think there would a need to change anything, it's just the matt=
er
> > of applying the patches to the right base :)
>
> Sounds good, thank you!
> >
> > > Currently, there are no users of this change but it is being used in
> > > VFIO and iommu liveupdate series.
> >

(Resending below message because by mistake I sent it as HTML and it
got rejected from the list)

Hi Mike,

Let me know if you are still planning to take it as is or if you would
like me to rebase on the latest liveupdate repo.

Thanks
Vipin
