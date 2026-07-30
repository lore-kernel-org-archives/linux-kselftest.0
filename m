Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915D401A37
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407148; cv=pass; b=rln6GFd1NtS54Z5ONnApZSWhaGegvShCnlRO2F/35dpTkwwyZt08L2JBxQzgPK27hD4rX7LYZH7xCaGSNNnrqSVh+JkN6uIsex04rYxp6Rok5EHmwNjrRM1dVcI6JYUtB9tx6bwVWg292moc58ZdIQZPuU4lV9wbI6AAllJ1EoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407148; c=relaxed/simple;
	bh=zcf/407tfjvynSAPl+YAoc8Cm/PJX5Tjy8uRWRPM6qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qq0vKRaxahX4MUUzz3w7xXMGoX+73YFlEEN5iAt9/1bx12GIrYItCPepqMbeYPny2aAQy0sew4txV5xVhvkemnGNwfQSVsYyaFKQeCS2fSr0eMxTpItSnVuICATzGrqpNRCPJRo8pG2VpQ0eGse49QK/JP3NgeBYCvr4iGHlNnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wdrlQrCl; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wdrlQrCl"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c2808dbc3so12513231cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 03:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785407146; cv=none;
        d=google.com; s=arc-20260327;
        b=fUhu8bCsyNwgfC/piWvvpmWorr5oiwKXivUfjVPFnHYQ2rnzaBGCNFUMvdVNc0miXL
         EaTp2jW8YcGGWEcUI47aiR62MiK9jTE3p0mXMwwK3mCOQ+fOwuY6FkuM7dB8gTJwSO/4
         MdcQl9nf6qrch9fAKum9uwynkzpl4TqkHqGkPDr2f01CQDJSiHRBwCHq2DO/JakgbRCW
         uRYBXa6pDtb3uDufVQ+MVE0juZeVdWkTBRksEkTE+uRSsUD68Z/j9Y8Ypw7scsg7dTAi
         uSD95PmL1Y/yxpZj2TOddp966D+/3LLcsW7+awac5nCeCOZgqpEPfCHs4BC342rRm6Fe
         tdmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fc7zx7iwgnSG9lznGKB9+VdUr4JPn+D6O7R6mZyWR/E=;
        fh=Yl2YmcDXogVnmDYNEZxRMTHlqiHdxkk+Da9Pr1/RB2Q=;
        b=I33i1Hq2bFf8IfiA6SdF+5kehOhB8cITfkMjWn7fWApYs/qsXUaSsWrS86gMepcAw4
         KRP3UkC2CsgZ8DOGhAicUuHKchfmFKoJWODapHnVQHTLLh+uQyHDqXGZn4ltTbIBknW5
         UNrHERFJMoim3qySlDZHt0Bv/XaEnox6y3P6OqmenB6OEuZ1WnxDfcBVztGa2Z4OABun
         OCh1Ga8CnEri6laUGDkStLLExEvPGIqP8XTlzHj1XS7Iik4Wh0mONC45OtrDrnFb+nWi
         LtYOUwGaoHoTw3ehzJQFWVF8L45X9bAAf1vgsRn9T98JuKuZk9T4NMub27afTuZfqWAz
         7fnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785407146; x=1786011946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fc7zx7iwgnSG9lznGKB9+VdUr4JPn+D6O7R6mZyWR/E=;
        b=wdrlQrClj9zoGHNIFptmnZyfbdsIbcw1VUxX1XDG3HM5CSiy6R5bcVqs7oCsU4yo7Q
         U8EGcjvP9XFBA/R8N7xBTPKDJufmXz3L+9+do5uiSHWXuxnWXuOTaLGrWb9GHkgwBkl2
         edK3pKR34kjArOe94v8QHAE6eiwWRU1cv+A3bswHMZXVblOksiCuaPWhITouMBRJrKOc
         S+Cq6KSeXpNBUJjp6TZk1lJDtRDBljRzWwOwrnJgANgRTFNl7NQ0smdAbNoE2lTCYzxZ
         iAYXA3YfaEGw+Uq3F5EANFG6VsrNoXVcGkGBUb/sUkCSL4JVLvnB5mvXrJzM9YcSNpC4
         UR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407146; x=1786011946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fc7zx7iwgnSG9lznGKB9+VdUr4JPn+D6O7R6mZyWR/E=;
        b=sR2YVg7763KSMihEJOXkvT6TNrhb+eJxsd2CV8O7R/Iv3X2Ii1i4+Wp0kRbGFsvVc0
         0hH7Wn3xyBT7OLLBpnTV4Al7A5e7jj5zChkM9cdd5fjKtx83ObAcI8Aijwl6MjZa2gDM
         3ZLKtB8BT+Ja1N9e5HvuSLSlZU08L6O7vO1BiMSlv5ZuvrSjJs+G565X5uZn1dyPE4VV
         aSnCGqYAu3K5NGP2vRVBiObkqV5fTNGrRdfrm2gb3181J7bG7uxvveh0tNO3XmZ34XWV
         R1OfnZh0pBeqNyAp27L7gk76ACA3WRYyJfJkpLh7UY7NVSMFyAhdkJjE1J7ZI7y6hK+M
         qhiA==
X-Forwarded-Encrypted: i=1; AHgh+Rrck+W1J/I+pO9YosxVSv25uLj4NL4t7YYX56HOYIiBjLz0VFy8APqQET9AbhfC/IalPckAJJ3oD15HrQDk9VU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJzhPpUwj/+G19wk291pHZ18ABPFFw8gaZivZTNDsVKcqexgN
	vwiHmmtjmUntJTsqYR7/yyDhDN29AXYQONjKQCexTrAL0rFlIgPwzF16/6j95hLjVga4SKCAxU4
	J39IzipnO9/FakevscbjzjFXiJL2EsYqh3K0LT5L0lCSGwfYhRKHjcqpLij0=
X-Gm-Gg: AR+sD10wK0WR61y3icwSkx7IMIN14q1jZB3VrEQOSjsajuDRYVg8G1mceAqScDyjSU2
	bxruK7N3u9mRR75qd8Lkb8G15p1me5H04QGCRC0jxXlrThoix+WUN9kdlO/NuhtDPsLZmKyng0i
	LG87g90DQ7XB+nboxAg9cDu1aLKttGIQZUAecG47Hp+lT06n8VSqYtOj4ViULKW1DSOoH6OZ4Pe
	HzytenrNz9ccZKRqvkOTGiAIJwDGxsXWyUh/nCbX4HSAcEXBVKbJrf89Dc7gZcylAnqqnFSzyqX
	9PPNueERI/zIfxI2zNfQjdvieMOJgJduIff/rN0BCtWERrhQgO8fzWmy98MPIJZRnDvMb5X6G0x
	JDu5C2czUpBOhvzy/n2Av9a5i5B2Um2AqEv121woPUvbgsnmUE5zGPUA=
X-Received: by 2002:a05:622a:a16:b0:51b:f549:c706 with SMTP id
 d75a77b69052e-52b3837884emr20867561cf.16.1785407145313; Thu, 30 Jul 2026
 03:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730100006.3547944-1-reshmaisat@gmail.com> <20260730100006.3547944-2-reshmaisat@gmail.com>
In-Reply-To: <20260730100006.3547944-2-reshmaisat@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 30 Jul 2026 12:25:34 +0200
X-Gm-Features: AUfX_mxdU0hxe_5irveWIAWK6FUEPamSnd3mzndEsX-QxM0SRYdYJhcy9C-_U6Q
Message-ID: <CANn89iLqLYAE_ZbK8F1HNop7nVPAR8AaMD2ojk+XuCNomJPEUg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net/sched: flag inconsistent qdisc dumps
To: Reshma Sreekumar <reshmaisat@gmail.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 12:00=E2=80=AFPM Reshma Sreekumar <reshmaisat@gmail=
.com> wrote:
>
> tc_dump_qdisc() walks every netdev in the netns and can span many netlink
> batches.  RTNL is only held while a single batch is filled, so devices ca=
n
> be registered or unregistered in between.  Since 748bbef5fc6a ("net/sched=
:
> switch tc_dump_qdisc() to for_each_netdev_dump()") the walk resumes on an
> ifindex rather than a list position, but ifindexes are reused: a device
> created between two batches can be given an ifindex the dump has already
> walked past, and is then missed entirely.  Before that commit the resume
> used a position in the device list, so any unregister shifted every later
> device and silently dropped a run of qdiscs from the reply.

I dislike this patch; it will force dump operations to restart on busy netn=
s.

Most devices are created with a new ifindex (dev_index_reserve() is
called with ifindex =3D=3D 0)

Forcing a given ifindex is rather unusual.

I suggest detecting this specific use case instead of slowing down everythi=
ng.
