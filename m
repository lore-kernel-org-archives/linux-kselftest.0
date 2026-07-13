Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D5A17993
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946209; cv=none; b=ZQ8jpDwXMyZkM+L/hDd+iSWyUOpiPUT4bPlONrPVVJo86I+RkHVk0BzoDyE+PXbu+w2z7ysFfdblMXUDcyL+2RPBh3bWNIH52PXvVjWcsQyxyB0JwHProTak3z6KMSGOblLPE26rgMUZtmuMKAhAOP8pMBOg0zTCz9qPU5Od2Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946209; c=relaxed/simple;
	bh=eP+6L9APW6Fk/DPuUcN47xss7LE2be5MSQjekTkQ5uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZCM0mlmHSiOLKgXIKZH92doE5CxshmdYDkFyhXAxr6yQJ1TU9pyV4TBBJ1TUYUxyD11AqqZGm7n2MPyDFwcPyNy3Y3RCADYgIASXfbsrhJbOi1mbZCNFMshKHTfa/Ztcqps9MsnKuDnEYUkX/FhIKJoyXr2PjXgbNsDqOX5tag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69ccd6483acso355872a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 05:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946206; x=1784551006;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t/6DNcSK6X/uGZ1IYS4q2R1Z6al9GC0dZL0uRll37ZA=;
        b=pJhrH8F8grrY/lzOby83MCRy9kVZxoPQ/mq6pRjqfcQaZqyKV3dNuZoc+NATP8HVnT
         o8wtOqBI4tZmJqkQSt6XCQwGqxMKeB488vLNmIVCsd7NADt8+nelWZ2NDKrFnwoxemk5
         EnhjCGaxdXhp1EUrGl/NVXIDnUAzsqwOuJ6Mtl5zaipfggEvZ8N63jJ7VEOmLjy2qCWV
         z6ik8IwcDIiRmXFIAkhuEwsOJsZR8S92Q5YaqlGSGjMR8s9PpIMLu462+e2Xx1e0jNqn
         GmzCMjwmM92WkUbC+NUmtg/uNrlwN/4wxa3R/CoQdgMvUH9UANAjs1AoEX+IncMq0bFs
         wftA==
X-Forwarded-Encrypted: i=1; AHgh+RpPYPHF1Xm/igEwt32rzNJBVXumX+4Nm2DbSV05fF3UpiPAmgU2TxJlS5qb/aHV49jLxyo/hHD8VqNkx+3/JE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCdlaZb1UXgTJR2UkrXipEWMlbYV3IWwks7EsY1EwU2Mc4pii8
	wzoVcVSlr0C/EAkHTtLUMl4TdA0LTNFwBNqQ12mfldJNi28UE036uiZq3Xoa0oPB/9I=
X-Gm-Gg: AfdE7cnYENJ0okuIdqIbIwrT39hS3dpMZ1VT4NE3MIeA3A0JaaDrYLv4y3Nl4bmvCQ+
	TD+vL2iImgfR/p/mUIy/OCAj3hZYAhpKFylvTRzH93JsvSvAhbnLlBodamxnl3DhZPZI6CVTnaB
	vazqzmnXd4BACCJwa50dqoMjKkivCozDvSOjzq2VNU7mxDjUjBzDA0tNhkt837LVBG9EPc0CA27
	sllkfefHOM9sG7xj6P8nZ6f/DpkYNg057aWkvgG3xQ5iVYgYxMHw17OHq7a2pKLazrkX+YknLbt
	mLLxdk3pvAmFSgG+qishIWNdXe8StruHkj2sQjAsJyUx7f+Jcxpw51S9xUSMCpENbZQuEs0eIvj
	WuRawkr640IaPxqcrPB5zgrbcba5EHThTvsJMCiAw6NUwNNP/zPemF42Ef6NmSi/vwYlupRpfwK
	oRGGi4NjwZzRmrybe9tGvtUBhHkUJZlgvs4JplkSwXB4yz2ysA6A==
X-Received: by 2002:a05:6402:524f:b0:698:3b7c:7e4e with SMTP id 4fb4d7f45d1cf-69c5f24f9a1mr3865653a12.36.1783946205617;
        Mon, 13 Jul 2026 05:36:45 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm16545944a12.17.2026.07.13.05.36.43
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:36:43 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69ccd6483acso355738a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 05:36:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr50IyrANJEmv2xQN6EXbZAuALGFoZeti0fkSmOHeNi3ErJKyTokNw1Yvpb4qiquvPf4Ap6FXJy76XjGK9NZ8o=@vger.kernel.org
X-Received: by 2002:a05:6402:a29c:20b0:69c:7ac7:c740 with SMTP id
 4fb4d7f45d1cf-69c7ac7c96dmr1680487a12.13.1783946203526; Mon, 13 Jul 2026
 05:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org> <20260713-catalin_pto-v1-1-5b93b1131089@debian.org>
In-Reply-To: <20260713-catalin_pto-v1-1-5b93b1131089@debian.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 14:36:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBQ-Vn4XzbrfV31adY7cEjLvmGuwu5_x7rn1NBkEC5mA@mail.gmail.com>
X-Gm-Features: AUfX_myop1qSR0uweNQ9TGaDUdl1iHj4R-fufo4jIbPM1JPRHa_hqCZvJROVzWA
Message-ID: <CAMuHMdWBQ-Vn4XzbrfV31adY7cEjLvmGuwu5_x7rn1NBkEC5mA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mm: kmemleak: confirm suspected leaks with a second scan
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

Hi Breno,

On Mon, 13 Jul 2026 at 13:48, Breno Leitao <leitao@debian.org> wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
>
> The kmemleak marking phase is not atomic. While the object graph is
> traversed, the kernel can modify pointers, free objects or allocate new
> ones. If a reference to an object is moved from one location to another,
> kmemleak scanning may miss it. We have explicit annotations like
> kmemleak_transient_leak() but identifying and maintaining them is not
> trivial.
>
> Given that such transient leaks are short-lived, rather than just
> reporting such objects as leaks, do another scan to confirm the
> suspected objects. If no new leaks are found during the first scan, skip
> the confirmation one.
>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>

Thanks for your patch!

For how long does this postpone the reporting of a real leak?
I am asking, because I have a few known leaks in my local tree,
and it already takes a while before they are reported.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
