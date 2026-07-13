Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FB73D3D05
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933075; cv=pass; b=FwiPq1utyjHOKyom5Du4RFYyOY+5yv0Ee7+olcNTrQZf7bKNHkV6NhKl/2qzWtaWATvqh8nKbfPVDiuZFl6xohUS3y+zabn2hLaauV23Or596mjifWR3ZjaUQR8l7a+Eq70dK9LDTRwaOm6ZI2ZoGxpM5VLuxOS0eVPNj0bQ0Lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933075; c=relaxed/simple;
	bh=zGXlgemVtM/fd1QacjWZsPwmu1tJ8IeGxyTqkvyGisI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5brGbcAsAVLur5naLVzhOtgtpHcYgPV0vqNaKYWiddh6vwgWfIcGquGbXP36TpxPp8x7cgrZc6lHCOuNrXpK2NOuV7gwEVjbulJeOctLYRapzA4RwTmDbdf+B5vqDLHsZsr65POUKE5s298pHuc5wp9HzKpQrflmnLjXOOg/X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bhZpWy9p; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bhZpWy9p"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475417f010dso1308079f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 01:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783933071; cv=none;
        d=google.com; s=arc-20260327;
        b=UgtNkwX7Wf//xRTNfcscrlxX/dxNyAbNPCoKCSOHhFFdDC5FFy09Rcna0+oyYhETwx
         aPIsqMkNiLM5ZiU41K8jnmrRJJku9Nqeifrh3U2XqJI2wrTkTscgRzMKoi5mL1oyD3iM
         D+HGDLgtc+zxlPeod8Pc2jM39x1nZpj5Ow4yqxsgV1srUJYBXS7qE8Z6PF6tSSOooO7q
         n84vd4joXy/U9I7S0ryzNJfpnhblRLvjdBxNEuotuIjszKarB4gZOqVWK3RHTGHscY+m
         RdYCzEHF9p1MaMuKAo+HuanjmFckw6yfR6WQtxP5T1ZrKFPFgw6wn1O+yN/O1vEVocSR
         8wUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        fh=bWmArk8yXJtOtT2B3TJllgy07EALqmatDHZv7VouJT4=;
        b=s4aGBzJWoKevj1nTXQNZqXD5FOJf7evT2n6o1NHMjma+xOOL8FxHt7WLuNM/6Hp4Nx
         vykvi+H/87kpaTH4iVI8/XFxF9PEXaeBrxxZ4elUbkYhupnBJ35sg3iBqe85UxJShBlo
         AZ9nDv3kQcfApRKCg7LQDmyOmgmpknkRbIglVuDrDKeT61aoU2m4gdgkf/XfgB/gicv7
         h4EKgTodTuc88D5uPxKilP1i7693gCyvii6HXsfZnVLNJ7Qk0PdIzUBgLEpCQZLaMOmC
         NgShbp+/qWbUSeBVyuW4wheK//4EVjpOUVnNsr+eTOEuo//+zt48tr9rOQXDw6qRLPd1
         gaiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783933071; x=1784537871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        b=bhZpWy9p92MsHXolXEEEzyqO6a8taUshJqNTLDakidqvhciCwPleXpZnFFjlWiYgu2
         PD4KtR4wi8mFviwOMoQsSLwoiUrgbFxzrfMzPSO3Sybm9n1+9I9aGIKm/8G9v52bT/Dy
         /ECgJDqbQXnj9gc2kOfy3eG3Oyas3PdEqt32qqoJCGj+tlRe2CTAPATVLVaT2ZBSLmFE
         6NLrPC6nlM9BaqCBTXA2N+qswyb64G3vtCx9kHyfA9GDzZl//f+Oby1N7yx4QVQbPtoh
         MUkxAek+4XmOD/fokqGCzy3ZmMRVg9nKjm32kMvJgFt/LiXZSc+ZvzDDjsD9s3OVP1/l
         B5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933071; x=1784537871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        b=R3BEmjal59t+r1OKkSdJ08UxtdzGvoo4IyzIA5YjYr12yUjcKHyGTYGGAznTNja3d9
         wlL/2G/IvvLJYn2GtuRZ+b/heMJx9lPVs6nyZEPc12ujRLazruT83XrmibepE5zPHM4X
         TNYyS3PHL2lkj+N4AACpfPk+dveCpCCB01hYPZNv0bOQ0nzCmFFvQubst+c3iprMXdS3
         5Ah1HpfsaHNMS09H19jbjljEioLzD/pZ9YIMKy4E10/QiYeVjZq78CFjNpN4+S+4RLVS
         Qws52+i6w0FPaRNr3eM7txw9CjQCvL4FKXRm0nNS0QOL++xCWRdhKN5t42PAOiav6bqI
         F+qw==
X-Forwarded-Encrypted: i=1; AHgh+RoH2dnW/HuSWQKwVPWO4h8cEggchvCg2AA2wnRI0dOu0KTdL5FbgGLy31kx7du+8C7nMW1eZrPGsuRVmshf6cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOfZbuTi6DGMjTAFMk3FWtxQO9NSYil8QxVTMyw4U21EVCAZSN
	xOlG2LZL5QytiY4aUtLjjuqTSetnbjf4XTH5Qg4zjlwMjog9FwHDZCOlYdeIL2cMY8bfj0nNLu1
	4wa7I52aGFbNE/qZlubLupnbalSN8oVH6D4rSJwed
X-Gm-Gg: AfdE7ckUxXPIoiAw+mCMJdCe3apBg7uMv0gQ67bG6q+JmoeCTG5HRemUnnlxOSc0ayY
	2g1YaC8i2gIRaZFG5v4ho2TkYiH/XCKR3R1T6W2gTS69ksE1+njI0quX31xZcCK8Rri4D5l0JIo
	s8OK2+87c765NskDioy9WvHPe9gJVAGRglrPbdwmZPiwpmQL7KzOPEv2nUhcbyZh83PagzQxnx4
	9NZh2krd3KquPmSvEaq41NB62FjVKLBs2aKeGnkvCwYRw0exxtMPdv6/ovknzGeIuvpm5LR5izc
	Q1mo2LBQ28nV508nFntyZ4BbGH07C7Wxg2gMSkoZvpGq3cKNt4nEvj/iB0EvPFFfwPA9Aw==
X-Received: by 2002:a5d:5850:0:b0:472:55a:ef9b with SMTP id
 ffacd0b85a97d-47f2dcac418mr8602513f8f.8.1783933070140; Mon, 13 Jul 2026
 01:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev>
 <20260713-fix-fops-owner-v8-10-2495cfa82d47@linux.dev> <alSe6PsvdrSYP_Z0@google.com>
 <d7c1607f-ea74-442a-9700-7fc4f0c64b76@linux.dev>
In-Reply-To: <d7c1607f-ea74-442a-9700-7fc4f0c64b76@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jul 2026 10:57:37 +0200
X-Gm-Features: AUfX_mw1uUYgV4eMXkVflbUYoDKpPh-OOQHMx0yAVcG6yUMQsdEhmzk4SLg_fQ0
Message-ID: <CAH5fLggszOnUm7Rykt41V91de8h9YVaZt49wr52i3t5-QV84Xg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] rust: module: update MAINTAINERS to cover module.rs
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 10:48=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
>
> On 7/13/26 16:16, Alice Ryhl wrote:
> > On Mon, Jul 13, 2026 at 02:45:31PM +0800, Alvin Sun wrote:
> >> Module types now live in `rust/kernel/module.rs` alongside
> >> `rust/kernel/module_param.rs`. Update the MODULE SUPPORT file pattern
> >> from `rust/kernel/module_param.rs` to `rust/kernel/module*.rs` so both
> >> files are covered.
> >>
> >> Cc: Petr Pavlu <petr.pavlu@suse.com>
> >> Assisted-by: opencode:glm-5.2
> >> Link: https://lore.kernel.org/rust-for-linux/8ea21b29-9baf-4926-a16f-7=
d21c5a1a1b8@suse.com
> >> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> >> ---
> >>   MAINTAINERS | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index e035a3be797c4..74733de3e41ee 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -17984,7 +17984,7 @@ F:   include/linux/module*.h
> >>   F: kernel/module/
> >>   F: lib/test_kmod.c
> >>   F: lib/tests/module/
> >> -F:  rust/kernel/module_param.rs
> >> +F:  rust/kernel/module*.rs
> >>   F: rust/macros/module.rs
> >>   F: scripts/module*
> >>   F: tools/testing/selftests/kmod/
> > Is there a reason why this is a separate commit from the commit that
> > introduces rust/kernel/module.rs file?
>
> Gary asked the same on v6; `git log` shows MAINTAINERS changes are
> conventionally
> standalone commits with a `MAINTAINERS: ` prefix, so I kept it separate.
> Gary agreed [1].
>
> [1]:
> https://lore.kernel.org/rust-for-linux/DJJ26195JBS9.D3DNLZPRJYO4@garyguo.=
net/

Ok, that's fine then.

Alice
