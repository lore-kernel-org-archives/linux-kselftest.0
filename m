Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0877836C5BC
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770635601; cv=none; b=tAHIVZRa2VSV0kaLfgfOaRgLFqjSyJdLXBwo8rnshxVVXoUTk8h0hH33r9yYdW6Y3a6L6INERJylRxZQpZu4NDkKqmInLxMbE3TewJr12sNZ/GxllEr9fI8qJsKxrmD8h3iOIesEn4tkkzQiawmmhC8FMgvNvSNdbeGPRIvjPG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770635601; c=relaxed/simple;
	bh=NkMtpRjtbmMqMXs9idMpVS/TdtREf3tJY4hj0afQ+3Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+wsnu/4IoDPSb7FQn6nvaQw26+gwM9vY5E5haH0G+djF3A7n/HkKluk3PUpFthuSFCmq/+4cqG/C8sZMhqe6H+KqTg9PavLAFFj2cH6cCLQNb4iV32fmUdGzuY9QG/fPe85BcDriLcyrFCC8gZZsODuwZq/Dz97J7DLzQ9k2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njKL8Zzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njKL8Zzx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C641BC2BCB4
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770635600;
	bh=NkMtpRjtbmMqMXs9idMpVS/TdtREf3tJY4hj0afQ+3Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=njKL8Zzxxs04qI6WpsbXFd3IiLmbqHvvN/jPco/bWiu0AV+OKtZ/dBGKWTQd9ZV+i
	 qz66xHMSAdmk0z/X6b9ZOprwEu3ABcyw7n1ukLPaMkUDQjguDOIhRv7NAxm+2L7KRt
	 i/LVSBALj+KeiqMe+lII/pyHjHBNwVV8L4c26yoZ8tETZgPMcf3Tj4wmR53pLL8v1o
	 rog7H7Nh4oLVqX+DwfyELyyGpbyBAH6EANndqT0+BZy4x8I19FqG735otC4W8pBI8i
	 4eN8DpyX/nPiqbuO35FRqLQ+3UZZuMJSe2CdKJ5ii7sKeY1zevc4MEjf7KMh1UBNZL
	 krNXo4K1ZgPFw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-385c23b88e8so39521931fa.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 03:13:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWD3wpyCeyGUAltLjo+F/hVN0/Y551uDg9F7XJO+MkSX00aD2lYbpC01i1/aRcmeUg3Z4+skGCAKe7CPovXNGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbY/PAOlNt2065k0pc2aIWf97RUPKxtxZLwj5LUpguwy3UCeQ8
	gs2EAwyWXDRx0i2WaJUCq8sXgV8c7NDvDDQaYw+XjSbyBR+sNeILAA9qYkHz7amyU1NkM6vUJNJ
	FDopRrzR1mTuz6EuKGU8qqdXrb99H8qzQOMNt8kTAWA==
X-Received: by 2002:a05:651c:1541:b0:385:bc69:fc5 with SMTP id
 38308e7fff4ca-386b69582c5mr31162311fa.20.1770635599279; Mon, 09 Feb 2026
 03:13:19 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 05:13:17 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 05:13:17 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <fc68da89-7c2b-432b-9a78-6ab55fcb0e9e@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206103216.38623-1-bartosz.golaszewski@oss.qualcomm.com> <fc68da89-7c2b-432b-9a78-6ab55fcb0e9e@paulmck-laptop>
Date: Mon, 9 Feb 2026 05:13:17 -0600
X-Gmail-Original-Message-ID: <CAMRc=MeHWkDCi0GvXFYxDhCeWMydjT9wOw3_d1d+c+VE7y0-7Q@mail.gmail.com>
X-Gm-Features: AZwV_QhEYlsTci-9edYj8Z58EtiET1iXrpMDkFvzcLGWQ-1qOQ4si7urE9qyJ70
Message-ID: <CAMRc=MeHWkDCi0GvXFYxDhCeWMydjT9wOw3_d1d+c+VE7y0-7Q@mail.gmail.com>
Subject: Re: [PATCH] revocable: hide the implementation details from users
To: paulmck@kernel.org
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 23:02:44 +0100, "Paul E. McKenney" <paulmck@kernel.org> said:
> On Fri, Feb 06, 2026 at 11:32:06AM +0100, Bartosz Golaszewski wrote:
>> Revocable stacks two layers of SRCU on top of each other: one to protect
>> the actual revocable resource and another to synchronize the revoking.
>> While this design itself is questionable, it also forces the user of
>> revokable to think about the implementation details and annotate the
>> pointer holding the address of the revocable_provider struct with __rcu.
>> Hide the real type of struct revokable_provider behind a typedef to free
>> the users from this responsability. While adding new typedefs goes
>> against current guidelines, it's still better than the current
>> requirement.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>> I realized that one important person was missing from the whole review
>> process: Paul E. McKenney who wrote and maintains SRCU. I had Paul look
>> at the SRCU usage in GPIO and I think he should have also signed off on
>> revocable before it got queued.
>>
>> Paul: I'm Cc'ing you on this patch to bring revocable to your attention.
>> The series that implemented it and made its way into v7.0 is here:
>>
>>   https://lore.kernel.org/all/20260116080235.350305-1-tzungbi@kernel.org/
>>
>> Could you please take a look and say if the design looks sane to you?
>> Especially the double SRCU on the revocable_provider.
>
> The first patch in the above URL adds SRCU, and the other
> two add various tests.  I do not see a double SRCU, just an
> srcu_read_lock() in revocable_try_access() and an srcu_read_unlock()
> in revocable_withdraw_access().
>
> You are allowed to nest srcu_read_lock(), if that is what you are asking.
> *However*, nesting revocable_try_access() on the same revocable structure
> is buggy because the second call to revocable_try_access() would overwrite
> the rp->srcu value written by the first call.  This could result in both
> SRCU grace-period hangs and too-short SRCU grace periods, more likely
> the former than the latter.
>
> Or do you mean something else by "double SRCU"?
>

This series didn't have it yet, it appeared as a fix to a race reported after
it was queued, sorry for the confusion. I'm talking about this bit[1] here.
It returns an __rcu-annotated pointer, forcing the user to keep and manage it.

This is because when revoking the resource[2], the pointer storing the address
of the revokable provider is also managed by SRCU - in addition to the
revokable resource itself which seems to me like a weird concept. I understand
the race condition it fixes but I assumed the whole concept of revokable is to
free the user from being bothered by the implementation details behind it which
leak out of the API if you need to keep __rcu around.

Bart

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/linux/revocable.h#n25
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/base/revocable.c#n123
