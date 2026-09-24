Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC0849E5E1
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262775; cv=pass; b=QQvLybY9oIMRKfHpE+fdrqrB0Qhfxp85tEuOYumCRRHYKGkDJsmzxAQDlqOa3DIrVMp67CDoOCJBqj1exMyNgzce3SncKq/jcEaHNgKSp6I0vNrWijMnZn/emIz95/QrqMEbspz7A0pdBdw0VUd6hXaAIsTjZfxliwTjLen2aXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262775; c=relaxed/simple;
	bh=ayzFfb1FouTGWibje+shic5Jd8f745FFhgi5JrHZ4pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGBxTnreMimhUGqRAOl4YtJutcHWiavPgmvRgDup6ZxFGir9A+dLVT7o5TqrDBUPxE94HGJTI47NaPgHw+OfEZnXxzVmJycc7wpSwydhiy2ySn3uiAEpflSwYKKSFKn5ghtzUlm7LS7WPtyhDkFSxbM/AE36Rj+2VQIKiUwwZQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sy9vj1LE; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sy9vj1LE"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so13892a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 08:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262771; cv=none;
        d=google.com; s=arc-20260327;
        b=nPNOUSXUybEB2xGM0E+9bmHA/T06Pjs1VV5mF2dUWDVrhs9T9IUgPI+cW4P+bMdFwc
         fpk0VdfI7dyg4ToAMxv02pcsm3vIOUQ9vJfRxmY7OW9Gfhf0Q6s9fnm+Q07WSzBC3qSd
         GKavLZ6xh9/C54i/SffOggfRq4Pkvw5+41b7O+2b4nDfYMoYKd8h3zQR5r80HnrHnUjb
         L5+Ngqkx/tu7Yr9Gq7G312HipYLBbLp1CKKKTgbbdNrUgetgCBY70Hm3yaCcH7tYV2NY
         rVlzkmjzP+dUU0XtV9oK37xSErj/MG+VlE5Y25VFAt5I6gMUvUreGwVKFaA3okXmdtnT
         +I7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayzFfb1FouTGWibje+shic5Jd8f745FFhgi5JrHZ4pw=;
        fh=XH6VmTrcmm4EswSLXYEE5uTpQ30G+zyHOws+BvyYe4U=;
        b=Ftsxgyou6zohwZxrF7vlq+SZC64U3fnxBn50p1eNKKnDcWTa0SuN0IctyD3hqb9Prq
         XUCcXjU6CkY0ul/KOlU3iCUdCnCSn8Np/osYH6dJxt1jBejBc0GVBnURqP51AZ8OL30S
         KngVkArXN0SDKezyNs4YLQBOCniVSeLcbMGJUygqzVf9m48B/LNqbaQDfN+kjEPKOdHJ
         ndmaw96kOEBWlR0OyrJ+JGK0E69T1Bj3R4AT0IIh1nLtc2jjotpJVPfuic6IfJlzlvUE
         jQV04d0TUnHhUJWzvST8fvE2iD7SKxUeMnx/ivNRRvhQpKmTsVN7aRGSHx+j41bHY3Mm
         6jSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790262771; x=1790867571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayzFfb1FouTGWibje+shic5Jd8f745FFhgi5JrHZ4pw=;
        b=sy9vj1LEQ+/AmkcRo8gPmc9zlePmqcOBdevpf0vlpfompH9jFw+khCDXOc2VJng5RL
         nyRBWpTe0KqzQ/JYXa0Znj1GS3gah9JMgzY+XiSTgdvms9w/csbmvCtvsK/XjTcq+LYh
         85AZ81LsOaiWWONDQv/ODngWOqpG6dvE26NZAbvFLZVkZtqBzdOfK/PFGo44JKXU7L+r
         ZJFTh3etp+ZJcom8LcjHtCTIic5WAd9hbBuYdkHAiPv/pHM1klvhK+xpSCOe8LJncBWD
         8rXZwxl4PSkvzNW/Ruilt6c1VznDUUG10xHp9Rfhq/TGKcfq4W1YD2leccspnxTprXVo
         739A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262771; x=1790867571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayzFfb1FouTGWibje+shic5Jd8f745FFhgi5JrHZ4pw=;
        b=PSnyvx91+cKJABLXbCUd1rF9VtkA75vZNlNC0uvMaVb98dcQMKys/EVVCN4+zyQfd6
         6S9L/nodZkUnwGLAN2szldU0ulKMYSKu+NP+5vnQexYNx2R7SZExbcwCw2tSzcTUeXH8
         4J2NFzbnNv1C04eL3qJ83bnGNGylKtLhJnrsqCnXao98eRy55ksJSwYkED6ZrABlHHeu
         kYDH7kyCQV27smmunatV2hyWsp+VwA+G6ooMarPDe9xfrPJjc8EF7nTG+YWPNPxzvd1w
         aTkQqT9LBn70wPdT1LLfugcfCEM7QJzWe6zM+/SLwjEtlxXYMjOAx7HfLXbof30XHUdi
         vhXA==
X-Forwarded-Encrypted: i=1; AKwUvBySZqIuF+50g0zenHVHOOS/1FUZoMYtSGCT2QGPbXDDrYYlWp52W0HnK68H22+zU3MJ4rULy4JhajovHHfTlZo=@vger.kernel.org
X-Gm-Message-State: AFuF++lexGMNQrLjXF8gORFYEzA9H+zGhkimhkLzHIvO6G4ZfDMq78dp
	kLVfEZXGwg883g1Qr2lTj21A/RgsTtlQNqlmb7d2/Lk5KSmaCqf64IRR0jc0OJeW12N1cORQWBT
	3DY5iEHNpIMoq4rvDYT15JMyeNHn+RUMsMoeT+6oThM4xLW6wMtnM35W8
X-Gm-Gg: AYBFou3EDL7StTfq0ONvbFQIW7dtlXrv/ft8zdCIeIXKdFyHG2cPEiynlOG92v56qZt
	+2upG6SKShnG3uGvJGXSd4ZCqzEkhZQnjPqtjMebnvaaa+lnxigZ3weaBUk+ip92JbPYrIvfRiM
	kFrXETvttmhemux3kRhW/7rPqZjUeN0wZIWr97w03x1TK7Komn776RPBgRaWCjqYo/ni/rxvpzD
	kueAFLetj6MnL/XRm7PWuUiE8OK2dR/ZXWIVZ+UB9mEkRNG5EBK/jemiW+qKq/3rtKgnLFf2euC
	1ZFF3vydgCzPpL4VVzilweik4Rsifc39JWtDU+kvWbIGWE4RBQxx7OfwqmK0keIQOrBnx2OhwJL
	DxRGkmgUlVS54GlDsQstM19sSdDgn3CEUxvy06uZu79FHflk=
X-Received: by 2002:aa7:d899:0:b0:6a9:e652:ee7d with SMTP id
 4fb4d7f45d1cf-6aac7d310c8mr56832a12.16.1790262770450; Thu, 24 Sep 2026
 08:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921222609.50824-4-jeffjo@openai.com> <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
 <arIE_i8Ysz5nOI2W@com-94485> <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>
 <arK0UmX8qJy3O-rS@com-94485>
In-Reply-To: <arK0UmX8qJy3O-rS@com-94485>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 24 Sep 2026 11:12:30 -0400
X-Gm-Features: AclHuK8kdadyxKWpIT7s0hVkEOx-xmt8QKZIpbxbCbWF9vh84qV429WJhqE4KQM
Message-ID: <CADVnQym70oFVCvcsGsf1PRcKX4cPK5N60uW3Masf9nNV3c+yrA@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an old ACK
To: Jeff Jo <jeffjo@openai.com>
Cc: Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:01=E2=80=AFPM Jeff Jo <jeffjo@openai.com> wrote:
>
> O Tue, Sep 22, 2026 at 10:09:42AM +0200, Eric Dumazet wrote:
> > I saw you sent the packetdrill patch for formal inclusion.
> >
> > Let's wait for it to be merged and our runners to be updated, as the
> > kernel bug is minor.
> > This will allow us to get a nicer packetdrill test that exposes the
> > issue directly instead of via a workaround.
> >
> > Thanks!
>
> Sounds good, thank you!

Thank you, Jeff and Eric, for the fix!

I merged the packetdrill TS ECR fix patch into the packetdrill repo here:

https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d206fe4d7c=
fab5b6d872

Jeff, if you could revise your tests, re-run both your tests and the
existing packetdrill tests, ensure they pass, and then re-mail the
patches to the list, I'd appreciate it.

Thanks,
neal
