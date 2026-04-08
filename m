Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203D23BB9FC
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649956; cv=none; b=Hw/VR5adBI5IqIHsWl+ZDyQ9Z9fiY9m00/iDRJ4jy7Hx9Jr3jV47P9mRewT5anPiSTcxsaN6BCX7iSFJB0HfoHnb7zYvvErDSIujL159drYT993VpInDrId60SWmhcuWUNNTo/7hMuzZENM73CIpAdmiWZFDC+DdRt5SGPGMNcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649956; c=relaxed/simple;
	bh=8scfsOfxjJCA7PsheVSzcMVVAN4HZJ5wygd7fo905BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taQgaJg7DPwFuEYgksPkbEbZZT5YMCfhtw0jaJLbakVtQVlTUT90FmCSf3pOpoUustN56zj+awGrjhFQV9hUVQ+9dgMRT+bXMqr9mFZ590S8fK2IaMmsgFMC4tAlp+zjE8kvqL0P8rhiT0yfNNkaqfSmU8zHpaDhe4sZfP3Ubsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-604f327bafcso2181738137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 05:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775649954; x=1776254754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGRbYznGbDw7bAVfW0akDmACi6u2DoC61pG2AP+p98k=;
        b=WFSWkxVUK8qU5eEz44XbwWVs+UarEA3m9PuaAMilICVfEdJdinfH3gsyW6psk7/Qwb
         GctYaq3oZqnX18xUj9aSv8ZmaRbzQ8zw4k233bcsRPwZq0Il+b1hZ6yMtpp6ksP8xqCu
         fsytL2DA9XrjB4sjz92lZlz13vGHkb5DQXscSPNsfBEfWnJeFFIBBmzMlsPMrULewdIm
         XY6yyr93w8I3IuFnSVFiyQVLSYY0aBLVIreSt3OPdFDY+tmbFlsCoTHrL+7OXUfpQCjf
         jQo+EnBTbzXzaW/g8N/7twPvjmECapamVRqUbU7bRh4mcKxDChy7cJ1noVM1xtH7v2n7
         hlVg==
X-Forwarded-Encrypted: i=1; AJvYcCV7LA1lwoeivDOrTIvR+DO8vxXXHDLHnnGxASQ1qvfmxS0IRPvVaXArGrzK0A5y8Z/9wb42QFe5Xyst6G9hZzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCEO7uUlDgOG1fwovjXQFOjPoTz0aG/gjXBzWUQ9Azl6ybV0Ha
	9z3b0MSECNUiL0TwJf5hxEK7NTHsCSdx0jNVyXQUo3X86991BdiHh51RT2J1n2jb
X-Gm-Gg: AeBDietXOCpIjHDYq9ltoTPcwhEvvfrb5EvIqwRchgBH3YXMSntNNobnfIl+jfzZ/1+
	UVm0Ei6Oa9rIvWz40dNMO+galmtW6OES6Oi4jpwqpxuaJBB4UUhGZgFaaBYFxE4LcMfJuvqCFZs
	aW4r2B7hKP5VR1Q6p0GeaOEGp8auv5Ay5A7PLp88theVhwjMNgFyPMok45j05DZ6YWc35HebPmH
	tQepzVgK9gmTL7JsBblOrD4OtGMpCtcWrsKQrY2HD9gn8Xs6xK1S2lPfNhga4gPVaqcCv5V8L+a
	I3iStf3YDX82d8nwKVGxT5S3bER5NIAo0O5DmgY9KOrDyaa7RA3RgH/eCXYXJMSRXd7QOEDHFHL
	UqFT2uASMKZaIIHgvlhYKHGzszqOzB0OqZOZQuS6GRC5f7Jzj3G2S1uJpt5OWUaumWWdCVz586r
	I59ntr+tQSXBqx647CBl7z7QptmoS7ly9/yw04AQDTDHBcq1b6oA2zv0M6BuI0MsRZ
X-Received: by 2002:a05:6102:f89:b0:602:a9f3:74d7 with SMTP id ada2fe7eead31-605a4dbe20cmr7534530137.13.1775649953944;
        Wed, 08 Apr 2026 05:05:53 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1cc7dsm20121119137.2.2026.04.08.05.05.53
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 05:05:53 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56eec951db1so1033345e0c.3
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 05:05:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7M1oHr9AS5AE86BTRD9PJuByhnJ36AnzkrYVWx5lw1XjpodpoypAL91SL9UumSrohiE7mF2ktH6/q1DQaStc=@vger.kernel.org
X-Received: by 2002:a05:6122:3784:b0:56d:92dd:a0ad with SMTP id
 71dfb90a1353d-56daba970e8mr8020585e0c.15.1775649953503; Wed, 08 Apr 2026
 05:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
 <abZTg9ZwnE5J4qXa@laps>
In-Reply-To: <abZTg9ZwnE5J4qXa@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 14:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
X-Gm-Features: AQROBzA3VNDAkN7JQ2RBFKXcNeNTnnQqU_cNeGRDhYiY7nC0FR4lVKTSqS90qsM
Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge <jake@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Askar Safin <safinaskar@zohomail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 15 Mar 2026 at 07:36, Sasha Levin <sashal@kernel.org> wrote:
> On Sat, Mar 14, 2026 at 11:18:22AM -0700, Jakub Kicinski wrote:
> >On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> >> This enables static analysis tools to verify userspace API usage at compile
> >> time, test generation based on formal specifications, consistent error handling
> >> validation, automated documentation generation, and formal verification of
> >> kernel interfaces.
> >
> >Could you give some examples? We have machine readable descriptions for
> >Netlink interfaces, we approached syzbot folks and they did not really
> >seem to care for those.
>
> Once the API is in a machine-readable format, we can write formatters to
> output whatever downstream tools need. The kapi tool in the series
> already ships with plain text, JSON, and RST formatters, and adding new
> output formats is straightforward. We don't need to convince the
> syzkaller folks to consume our specs, we can just output them in a
> format that syzkaller already understands.
>
> For example, I have a syzlang formatter that produces the following
> from the sys_read spec in this series:
>
>    # --- read ---
>    # Read data from a file descriptor
>    #
>    # @context process, sleepable
>    #
>    # @capability CAP_DAC_OVERRIDE: Bypass discretionary access control on read permission
>    # @capability CAP_DAC_READ_SEARCH: Bypass read permission checks on regular files
>    #
>    # @error EPERM (-1): Returned by fanotify permission events...
>    # @error EINTR (-4): The call was interrupted by a signal before any data was read.
>    # @error EIO (-5): A low-level I/O error occurred.
>    # @error EBADF (-9): fd is not a valid file descriptor, or fd was not opened for reading.
>    # @error EAGAIN (-11): O_NONBLOCK set and read would block.
>    # @error EACCES (-13): LSM denied the read operation via security_file_permission().
>    # @error EFAULT (-14): buf points outside the accessible address space.
>    # @error EISDIR (-21): fd refers to a directory.
>    # @error EINVAL (-22): fd not suitable for reading, O_DIRECT misaligned, count negative...
>    # @error ENODATA (-61): Data not available in cache...
>    # @error EOVERFLOW (-75): File position plus count would exceed LLONG_MAX.
>    # @error EOPNOTSUPP (-95): Read not supported for this file type...
>    # @error ENOBUFS (-105): Buffer too small for complete notification...

The actual E-values are positive, so I guess you want e.g. -EPERM?

Note that the actual errno values are architecture-specific.
E.g. EOPNOTSUPP can be 45, 95, 122, or 223.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
