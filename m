Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25A351C1E
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773528284; cv=none; b=E1wmyd72ytFsbIeNKE4mJ16NlxVqk75rST0KVv4ZPNPBdwBuyZ0kpxXFXbtvOokfHuulDLTOFrcQm7ylOLinTt8AceOZr+8odSvLD1LaW+kmyYz1x4REqzLOW8vAoLB4a0HTTH0zPC7sk11dxibh2J4aDQYAmMOlzQiazw4+jd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773528284; c=relaxed/simple;
	bh=+BzfWIbWutBn9FVLenIu2cDO6fBukYew6iGg+YJ9bLU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0Se4qNJsku1BqBzC7omxBxo09Hnw0pA2qj/RoVIQmzV7nqQ+bo/tjVmJEyyhmmrhy6IXBpcLMsbUd2/y1aCVHjSLRx5FpKkfkwNXi6n7NbvoQV63TYp1a5KEFg92nZhwS7kAnhAN1rBUXr4xpAXzJW6PBN/MJB65bxsZHODdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUHvKzBF; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUHvKzBF"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89a14be4733so42369336d6.2
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 15:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773528282; x=1774133082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuJUhym4M/ZFIJ+HRVLrIiZVMxaVq6Aogwi4UFclA/I=;
        b=HUHvKzBF5hhX4JfsIma2dg7iVHahQVXvhnXj8AsIHtXNbMgTUuSYsPwy8VLT9xnEzF
         EeX7jt9RC7YfoK+BU25zJMWlMfztSjsh3LnnNpj0z0DyMWJqPXNAXYzgXzCr8TyUV0E8
         QwN8SbxvwIoa1lZiVk+/ugNlZzDW5T1SeilDNtenbONU4IVtyDb5jrAkYPnnyjoXawjR
         Eox8mi29T0lZpOE9gmj0Fedk5acbLbj8L20uDD9X1MIqxRUUFgjHdJj4pPZRH+cX/WKG
         FVAixQnIPaGULYn/1rQ5NgpgG4pP3cblsCvSepBTlhftfQ/CD85LZ15xbYP44UzQuVmT
         HPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773528282; x=1774133082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuJUhym4M/ZFIJ+HRVLrIiZVMxaVq6Aogwi4UFclA/I=;
        b=c8p5Qt+HeKbaAUTrqRap7ZFyL9+VITIIu0wwLVckqm+1M5eLzl80oVT28lmBJVNwge
         k4QjYx7aZOxw0KZHx3+LrHlVUxUSHdQ+1fdF5ZDHIpz/7joaD2LhfU48MoGuG2O5P0TG
         hV1xEVLhAhrWXnQWGa3+buoJhvDTeAXlmOgQpzf1ITT+g7GBr6GedXalFe8Kf+HS1+T1
         bUYbto+TOG50QKEvstoZZ0I3ekFM2ZKbeiyN3/NFYpvPpPkzBL/Fu2HkI8qFYo5qWepr
         66c/OMI71SnYesE/hXGnOrFoz0K928OgbZ0xqVxrH58PWW8QylgKJ0Ob6eAFAnMA6LIa
         zq2w==
X-Forwarded-Encrypted: i=1; AJvYcCXnJE5jJIpziCyuZX4IR29o23J/1yTbRP/5syCbaItr1rhi55iyrVwOPQFy0RhgsTqXVrsPjEtxkQmYEjXWgDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzII7iTSq0Jo2WnZqRaUQWr/RbbaUwGsi0Pq9hjLlClxTALItN0
	U/nLlhERMNAOvc9DxTNQiVcUzhgUP4Z7+clhXRi/TD3rQ+k9sq2lJ/tA
X-Gm-Gg: ATEYQzzNKPjK3rzBE1DN0XAPMTHo/qq9vraZ70JHFRScQGnxXhYBbCZTE3qljg9VXOk
	O3AiGkIrEbPQ2D21/a/bCMfQWl/dGtyiOWrORaYg1pi/E6zMfNDqHJxPoazYAa7R37bDs0Iw+Dx
	IExx/YJVOwYCpAmo1ng2G8XFmwEA8V1drIeK9w4V6638MyCF3lX7e1ekZ969rKwalMW/IHQJIDv
	OYSNfFXDszWkbt6mH0VFB3NTZ/8LI8KjgM/oiB7z09+/rU9qRZfg2goS0yKzJVV6blUuEeZBgR0
	8k9VUxnuNZq4fZH00BYlyjYOGCyzGfTuP02yLHGTGtscG3JzL4LablnxtIIFXhUToOVg2xEjvuO
	DyeRR0onlBb7mDMDF1Bhj+8Sx2l5ZkiAPy+C2SHKrLacKsMPpf/8K5HgbQVcyUHRFwtjyt2wFvO
	fRO4d7QomaLXWBJmopZLEdsjGxc2P//VwAZgdVOYd3j7av2oHiquRQ5PNnUkKoVCsc
X-Received: by 2002:a05:6214:529d:b0:89a:173d:9c54 with SMTP id 6a1803df08f44-89a81cb9be9mr117730886d6.8.1773528282565;
        Sat, 14 Mar 2026 15:44:42 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c43bb47c3sm11296526d6.14.2026.03.14.15.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:44:41 -0700 (PDT)
Date: Sat, 14 Mar 2026 22:44:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Dmitry
 Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, Cyril
 Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge
 <jake@lwn.net>, Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni
 <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
Message-ID: <20260314224435.35465615@pumpkin>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
References: <20260313150928.2637368-1-sashal@kernel.org>
	<20260314111822.63a2ba4a@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Mar 2026 11:18:22 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.  
> 
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

The whole thing reminds me of doxygen comment blocks.
They tend to make it hard to read the source files, hard to search
the source files (due to all the extra matches) and are pretty much
always out of date.

The kerndoc comment blocks for trivial helper functions are hard enough
to keep up to date.

The only way even parameter descriptions are going to stay correct is if the
compiler is using the definition and only the comment part is extra.
For error returns you'll need the documentation to be at the return site.

	David
