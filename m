Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA735675D
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301727; cv=pass; b=ClZgQNQ/2QeDhB/FiAZ4+n+fQimbbECR/VrrSt3Y+tm458WjO/KnQFnsaIJnG+bUa9QFN2pkDBXTJSriL1x9+ad/RdL28ZRsyt78rq4koLt5xX4nK0wMWyNSaFFpJHbTqwehnc8ldq3b+K2DG8FA6NS+fnT/ZMOazvqBrpAaGqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301727; c=relaxed/simple;
	bh=cDAkfdaLRfmCvVXnA0yRMRfwD8UYysD3SIVaRGrDclI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuGrByaooBov741udKvzMYgdB7vbz7/5LN/wU4fiKDpABaH0iruQsQt/8FflTvr8oLXp3mURvvQWxYqYmHmvUFhb0QO9IuG47S6rtzQyhaxEKrVyYXNu3g9cdm+XK38y3HQVSmF6HVrv7jPIT5ixGBWI5EEw76Su6P6oVSyueSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWAr/ZxI; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWAr/ZxI"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-486560db92cso1120726b6e.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 15:02:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781301725; cv=none;
        d=google.com; s=arc-20240605;
        b=MmAxuTKrOU5dOYBV/wqsRZySsvfa10VqJ7wSV+1Fr6Jl5sq/duUiWxyZBNQVSA/ZiG
         Rq0J2zTm9IcI5HJ801XD8XoICa2Zfj5bfSDDHk/h4F33JGUdnQt6w/vPH3lb1VFNMKow
         HjWb0R0doj0O1b276ZvH0bfwnjUP67tsgbL3qJhYee4JUIvEcDo+86taFdNE9YuMMu7L
         0i7t4cU2X2vLciyuOR6ThvfKt4nTXSJT+rn7VSv/4J7NzTAAG4mO9HBfBzbyn2A7rx0Q
         +FFPh0ZiNPDiejDx1W8h5Mt6ca9kdn7PqWdc+3qi4qinARWliXs0E5BB+LPe73VtQrIP
         40Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lr7PuuvzhjV3VzJLoKFC38vG+nAVtfp8SSMy3aUwQ6A=;
        fh=leqAXpPxffc21imz+ez9QJlDEd+fV3iuf4ERcn+lpEk=;
        b=jH7Ij8hSGaEKFZiUhu4oIZsesQEK3AVwiZ8UhO40qMOJCezzGRN53l5YADR+qvtD6s
         8pW8pxWc9EJbq+7jJ80hSAiTlBOpQUw5O95xjwGqzQRavaOQOppZmwxW2HWfTBQMTgfQ
         vxxWDVFdm29BPTSUWbnoEuFCvq0m7K/Sfdaqk+f5uRViH7oittoAjf/6DS+PCM4ISEXL
         HW/Q/J56ogbmexo2bNVeq8aMUsYhq74hocmVYE031meaxyE9rHJ1XSn2JpCRDBREzIwc
         certsr/bu0OLurgjlnT9coxws/XadxXtZEttN40ZcJMYhylia1tNjvS2EHiVoSylDXec
         VzXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781301725; x=1781906525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr7PuuvzhjV3VzJLoKFC38vG+nAVtfp8SSMy3aUwQ6A=;
        b=JWAr/ZxIXuQbeJJwdoQicLIgIqXoXNXmRsaCQ3bAFRolJEyu7ecm6NrfBbs5BkkY9H
         bNFYsjZ1G/0Gbk3BW85ePrsLbGRQ1GxYkek0BUbGVhDKr50ody/kUXZqeUWgk0bLE5/i
         QRvoJhvtw93Dn0RfSBcQzj0m6xAnF7/N4cx/cO0Zj2Kn942WJYkDoKNGXf8GHRPJg5DP
         28UvJsseQwCRbTj9Pfht/RoUVlTteBRgcfJHi+PybAK/eBcePRvvF+L0OuVbknUjOLAO
         hwvV3sE8BixKGGep8FPlQJyVmvktGodpP25cFMhZNLI0efWY5fYmaQsm0rVmsMp/IAbQ
         /uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781301725; x=1781906525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lr7PuuvzhjV3VzJLoKFC38vG+nAVtfp8SSMy3aUwQ6A=;
        b=ebSymCB+kHzFr0idY5cNQ4x3iXwFoV/O16gXxykXrMfQWqzPF9Inbeg3hOctUOMm5K
         x1rue5csO4ofNHnAPNUJeetukP/Zva0xnRxvbpBErqqo75IWBVHyWpi0YqUs/xZgZ/I7
         nHH8a6uqTxoI3CEZbFjtV8vDQo0H8CoJFhIjq13k9xn9f3qEKVfCou44oNDdHBX2hZoS
         ZUnlorbPT2zIlki8pkmDAVBOjLvBYBIUpVcM2VUvQBCJ34HDmVG+MOOi/wa9DZJl2Xkc
         mFcnr/LUP3nbuyI8Vot/iPJNf2zE0CwmWHspWbDsISGiKD664vmzNHxoUxq7BKs0HX9b
         gsEA==
X-Forwarded-Encrypted: i=1; AFNElJ8dTVWuiyaBvJYUX+FD7pzrKx3hTLl921Mv/U4buxrqeGwzCBEV40yQjy3Q2QhTsZI0XUPQO/U3yGvNRqSDxXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2iHMdMU3LUsxDNrRj3u6WCcla4eOmsMOdenATfBKfVS32h5KA
	nEbuW+741YJa9SqRhcikRrIQUF5XKLGd/R1tDqpBZUYKyg0VwaLlxTg01NEw4Q4pUs/3oRUwmHr
	LNyjKdS8d7gl7KZRTFHWkUHnVjQ6/qq4=
X-Gm-Gg: Acq92OEwrcuppr+Omu4x3NazsHaCejQg4E6GR+xBmECc85F8kRB4GkuxVdIRKkolwKb
	1IUyzzDAjSsIAyFzuHPIclDB1b6pMwWa/SH34ickKWDfzhavV0F5TQQU13wqHYuzf6bGSpbyClf
	6NZvxTy8uZDutMXnm0tUHJrSxI+WDtvzBAMxJ6yiXBLfERL/QJ341iyuYt7AKVGrcfgMULUFKJa
	pS6K7aJsZF+DiZEnc1e9EkQ1jGO0ItL1ehsX91vbWSyEnefA/UI9Wvj6XC4/JWqCfKZk/4NuZ05
	dGvecUolYWs/X83m35caGBbXgdR2r5Xtybhpvdyw1mZmD88UtIL4pUqQLaxx7QWNIaboiz595A=
	=
X-Received: by 2002:a05:6808:3a0f:b0:463:efb4:f9a2 with SMTP id
 5614622812f47-4872f493555mr3330241b6e.28.1781301724761; Fri, 12 Jun 2026
 15:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-seccomp-combined-v1-0-304b1cc3ad24@hill-daniel.co.uk>
 <20260526-seccomp-combined-v1-1-304b1cc3ad24@hill-daniel.co.uk>
 <CAAFS_9HpxOgHn+qfzSpLjV4Mj_CURiwxFOaK9GO0DdBg8xgNYw@mail.gmail.com> <CALCETrUArQBzUS2mAhYxDS-unze_gnQ7efv1qeBke-ux=2KdkQ@mail.gmail.com>
In-Reply-To: <CALCETrUArQBzUS2mAhYxDS-unze_gnQ7efv1qeBke-ux=2KdkQ@mail.gmail.com>
From: clubby789 <clubby789@gmail.com>
Date: Fri, 12 Jun 2026 23:01:53 +0100
X-Gm-Features: AVVi8CcPCqPkDoueJ__frRsNImZP3mTgK4w2ichmgt6_4IvZ-L4SX1qks8EWNvI
Message-ID: <CAO1UbGcJEhwtHcxy5zcc8cH=YjfSDiDa2o-o8o+LMbkmL7WFcQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] seccomp: Allow using `SECCOMP_MODE_STRICT`
 with `SECCOMP_MODE_FILTER`
To: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>, Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, Jamie Hill-Daniel <jamie@hill-daniel.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 10:24=E2=80=AFPM Andy Lutomirski <luto@amacapital.n=
et> wrote:
>
> I wonder if It would be reasonable to have the kernel do this on
> behalf of the user program that's asking for STRICT.  The
> implementation would probably be trivial.

I experimented with this approach after the initial AI review, but it
turned out surprisingly complex,
requiring a decent amount of refactoring to allow installing
kernel-resident programs. The filter
itself is also rather complex (mostly due to needing to account for
BPF jump sizes, which differ
as different configs (uprobe, uretprobe, SECCOMP_ARCH_COMPAT) have
different logic., and I'd worry about
keeping logic synced.
If that approach is worth pursuing though, I can submit that version
of this patch.

- Jamie
