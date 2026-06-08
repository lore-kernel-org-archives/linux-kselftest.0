Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B9E41323A
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930971; cv=pass; b=m/La3T4TSWuFAa5YbmmzMrBp28FnS4pzlmartv+ftF9VQpmEEXB4y58r6TsdOk9UmwLW7b0jCH7UsTMLEsMPhy4x5nwWP30VhEGHeLaqh7HkYKlSjVnkdrKSuGV8s1gaQ5jWHweLWwanynOudcD8q6nQ5s9pNn5HmorpYDfksd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930971; c=relaxed/simple;
	bh=g51x3Dke8m4hq5BD7mWP1JIENWwriEm4dzZwpkBeih4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCj732zxNpgWWTVvPpMB9wYKwHohirBWvQsCfV8JDvWWT1Oy2uc5deu3c0Z/Qpe0cpBSEY4oUTZzILVrGOfsjJ8Gn4U8OuY1vzf7LSy49niKGM5oODMGTbYeHocCSofqqiQV9ofHaXJl1dg56dPDC873Jeg/IapC+EmSRFqxdaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SN4g2w+7; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SN4g2w+7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so29126a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 08:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780930963; cv=none;
        d=google.com; s=arc-20240605;
        b=JQThAZg4QaCh04p+V7IwGTPfFxSXMUIs4r227p8U+nW0oBY6wCYnA0hj72J71fNAfi
         4jFYQjLTzSNGrbL65CYnXX1StKoCMJvqikZTZgIvif2k/8CSbHO9Zta0NSAiHHK5pSGL
         aqIEgQAIVjftBDjCiQ/SLt6Xq/ZjDJlu55XuYB2TEeajEaFclVyP6FxdqO1+9ucr31Aa
         8Nvi2TG8q3fHd6BoCf8b/saT0S2UfwcDbz8FbxRXdZF81YR8kZPtXi+4MUsQG/K+vd8X
         cuzUi4+SoLANcA2pKfD2KTTN8PI1aPfvis6qI+6UUGtLvzJbrD2tDlM5R+owl/A+MzKB
         6tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g51x3Dke8m4hq5BD7mWP1JIENWwriEm4dzZwpkBeih4=;
        fh=+8T0GDv0H6u8IyaJ26TNSLp7gZcLS7KXITK8mdTcXEs=;
        b=lI86GvFy5csRuhVynD23ZdIlfW0sgR7xzZlYr9gF7hVhh7JOkS0a2Af136soGzRuPc
         446ft6zyTraeh0QyP/DBwQWWJyhgcyla0dcsplqegH4BJ1LYhLHKWZcsNdzUxpRPJFJn
         n17CcUXHt+p1SdLA3juzAOW1/r3kKphQfiWylXTFc5sYbPnmeKUwTt9e36OVytEOLrvJ
         u5uxtKBuPsyR372jQaxuLgkVaGOmzV2tKukqep4zZYrm3Nu8/yh1ff/0h2B1r0rYqPJV
         1nmd7NR2xj72/wvK+lhKMIZci4rOmcD6TlPEB2alzrPt6pBSY7HIiUhWuugNdmT8SU63
         X41w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780930963; x=1781535763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g51x3Dke8m4hq5BD7mWP1JIENWwriEm4dzZwpkBeih4=;
        b=SN4g2w+7L37u55NOHnH62hsXGmHRkvICDQ97Qol/4mqxJN6kaeE8TAGexGnPVk+0Sj
         vOwhOYMqgm/ZclL9AVkos/+Rx8n4xUQp6WI17G0GvGaF7oUhQmM6qa4pgZfpehiTajlm
         1SDyEkqnzK56xnyHFwufRSwSX0EjLVEUE9paFJ3tapzaLxxpDd9MLsnbyCvYHXQ8eyRx
         jqeFQF/H5AIlNqAkFEFS+VpK/60tXK9rrfMmWz4xC7aWMinwx328dqWwShlEraX65KC1
         MjGPFslpEltXzdQ+rgN6o+Eovk1f5szk3IXtjEeBQEUbHxqXHqaAtVntDNampvk7JuT5
         Eqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930963; x=1781535763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g51x3Dke8m4hq5BD7mWP1JIENWwriEm4dzZwpkBeih4=;
        b=Ozx3PCJPm+gk8pTVpnXohlVIWZ9fZ2IgJbTc5sbwYLEOviwM+adWEDdNXRXVKC2GBd
         dO6URf98nGnRmXI1iVk6ibVUkG+fAdVzImUDotLfHD+N6jTnYKBfZ6DSZPk+fu6hurHT
         6PPJ1HuVTjJ+tY4KdLdNRIllWjlPgUZsZRvW7DuLnG9NxbXQ9b+DTPkFaKBhCvX09srl
         mrv0jxALegxxyri2xshz+INqiIBFR65DNpAkTkN7goqKq+DRBeMBFJP0LZ+NJT1qArLp
         YLVgWWtltQzCq6HLPeDlnl1qfToaWh4RQs9Sx55lJw3tqrm4GzZZdfCJxrsp3aZwL9EB
         +8yg==
X-Forwarded-Encrypted: i=1; AFNElJ/2xTcTQDNO67ZY0O72kwsWO1DcVUOTDso1H7QWZG2P2MRSatbigJsIR8fFhWMcoonyywO7ogs30E+nZF6M+qI=@vger.kernel.org
X-Gm-Message-State: AOJu0YybqZL0f9W4aackHYyU4mmNzsk/RzJYYXVrl2OBUlZeW15y7h+j
	Vhn+uihZwJYmO6NucXm/To/dbiHpRBp7Q53E/lAyiVFhmlAelk044M1KF5F5/KtSe2MCAhZOIOh
	d3D9jUumgxIV3CbvM8cX4r3vZXFyvu09yC2LHGLUI
X-Gm-Gg: Acq92OGbB5n0qbZEt52DvUNWCywipgnKQ8yfc7JtUIws9JR4VPz2FnSE9kPjHDbq73s
	XOm0OeKQSQ7RfsUXXtUWN23XoK6ej2s7jwKINdI+Czegz2nQADwSufFec6tPQ2VM8qdM2HWjYfu
	bZyb7fnNRp7crMK2u+Kpy/ZL+LUkTNPlq8mC0nzdmRWTcHY0auQeIw9nRU1aKy+zxEFU7U6ST8Y
	Fte369E7P1qFv+uVPg9842DRZQ/fyBGOJ7CCscBN0ZJoZOQ/csHcnHS/WvSGLTacght+6VK5e5s
	vaN668BbDegiE4dllu63HcmKqijLndzJpHRPWKZPP1cYxMye
X-Received: by 2002:aa7:d848:0:b0:68f:d41d:ca5d with SMTP id
 4fb4d7f45d1cf-68fe907ab8amr167661a12.11.1780930962621; Mon, 08 Jun 2026
 08:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528095235.2491226-1-me@linux.beauty> <vealb52tv5suireenkke4lul2l3wbnaul2rp3ea545ly5wa5ty@yk3aksvp7skt>
In-Reply-To: <vealb52tv5suireenkke4lul2l3wbnaul2rp3ea545ly5wa5ty@yk3aksvp7skt>
From: Jann Horn <jannh@google.com>
Date: Mon, 8 Jun 2026 17:02:06 +0200
X-Gm-Features: AVVi8CcAEOXMmuMTSZ94akkMqWU1PSwZDT3Kns1-hWwyFL18yvP1h0y8fjumjnQ
Message-ID: <CAG48ez38OEE8ZPLyU6nr9=cYx-hMsdoh5WRrv-GMZGMDKyyOTA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/13] exec: add spawn templates for repeated
 executable startup
To: Mateusz Guzik <mjguzik@gmail.com>, Christian Brauner <brauner@kernel.org>
Cc: Li Chen <me@linux.beauty>, Kees Cook <kees@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.cz>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:55=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
> This problem is dear to my heart and I have been pondering it on and off
> for some time now. The entire fork + exec idiom is terrible and needs to
> be retired.

It seems to me like vfork+exec is a decent UAPI building block, on
which you can build nice-looking userspace APIs, though I agree that
this is not an ideal direct interface for application code.

> Additionally there is a known problem where transiently copied file
> descriptors on fork + exec cause a headache in multithreaded programs
> doing something like this in parallel. I only did cursory reading, it
> seems your patchset keeps the same problem in place.

I think we almost have UAPI that would let you avoid this issue?
You can use clone() with CLONE_FILES, then unshare the FD table with
close_range(3, UINT_MAX, CLOSE_RANGE_UNSHARE). That is not currently
implemented to be atomic with stuff that happens on other threads, but
if we changed that, and it doesn't provide a good way to carry some
FDs across, but it feels to me like this could be fixed with a variant
of close_range() that removes O_CLOEXEC FDs except ones listed in an
array.

> There are numerous impactful ways to speed up execs both in terms of
> single-threaded cost and their multicore scalability, most of which
> would be immediately usable by all programs without an opt-in. imo these
> needs to be exhausted before something like a "template" can be
> considered.

(I think probably a large part of this would be stuff that happens in
userspace, like dynamic linking.)

> Per the above, the primary win would stem from *NOT* messing with mm.

As you write below, I think we have that with CLONE_MM? The C function
vfork() is kind of a terrible API because of its returns-twice
behavior, but I think if process cloning with CLONE_VM|CLONE_VFORK was
wrapped by libc in a way similar to clone() (with the child executing
a separate handler function), or if it was used in the implementation
of some higher-level process-spawning API, it would be a perfectly
fine API?

Or am I misunderstanding what you mean by "messing with mm"?

> As in, whatever the interface, it needs to create an "empty" target
> process (for lack of a better term).
>
> In terms of userspace-visible APIs, a clean solution escapes me.

I think we already have relatively good API for this - you can use
clone() to create something that initially shares almost all the state
that a thread would, and then incrementally unshare resources and go
through execve().
