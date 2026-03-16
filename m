Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501CD20468E
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 07:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773644769; cv=pass; b=H9hx1Al8fAvmSwSf8LoaaoI70NGpwPhHWWvsU2s1yt1ydGXEgDqdT5Hb68Gmmt3E5Dvbm+QINduxkEymaCyIEKBmjh3TUUwZ+Poc3a6pKa8F2C/JRVmrGAgBDHGC71XK78jhck//zB6YoVF8iCtAsjC3/6zsgOr2ayz/KAfoDEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773644769; c=relaxed/simple;
	bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGxDwCfQnDggsFARzItD5A7X6ZUezKxEf/JE38rINShInrXpI/Y5Nz8AnbVmereSE4iofY94MmZGt1O6ooEFre3mG/NPiqNrrnhDDM7oCq5uGKLfBaY7Uw4HvUyJ3UjyNS7t2t92gZBhPxqt97YuIE3iUYYyjZhr3b1st5KvYqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrvNm/sp; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrvNm/sp"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a32d36396so36575211fa.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 00:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773644766; cv=none;
        d=google.com; s=arc-20240605;
        b=krZFPY/OYQDQAsYd2jfIwXOrcdPTZuJbO7ecGbrE7oxXge3y7kWAjUv24TkbATTD0x
         TKh3Za3LfcYNRSPFbwEwMJO/XrJL+SUESn3NRLegacRMn/RUqsl/QxfjvF8eWfexkpH/
         KIfw2AmB8y5QVAYP+7LolXsFYLPBBq1adYCf5OJAiBwGYmdqRUqgwhgvHAhgsWh1bm9i
         CP5fe3UUZRVrU7pJntBJeR5qvjUX8fj/iM+qejHeKAUGFJr8Bx1kVeJ2A6hY58pThqfr
         iVmAMfvkUtDxgIrFLDs2z2dhh8fMfT80fal+mqNpn2xJswAfA6Y3Y9B0QJwLqo7LCBZF
         CpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        fh=wwl9QIIWG5di4wH8Ld+a+J8bWkaz2Dg37k/vrnq9o7A=;
        b=THLxe9I7ORZl6N0M0Upw5P1UDUfr0FThYz8CStnLuVyiq/PXJOapiVkyRutzA3xvvB
         5RtbqwaROWZrfqd7brSieGRwvrBT+LliP7ZSElGd1k8WKE87jpeSFFV+3jPuJE6VreTB
         r/fh5GqwLzTqPZ9YNl/OfCrY4FTGcSdigNkQY+yto6uUa3h2gKL7jwJPHcVB48jMrthV
         jQVBz6L5NPwGgcCcRFVPDKUof372sfTyEnWIJBR7WdW3CYrWRs0njUvr5nYlSqb5/7KA
         Hz8E5HG6O5W84Fhqhm2DOIDq7OYZB+BRG8JFX9Cxq1H7qyQRmPJIcXzASRirHu/MwcUJ
         Q9gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773644766; x=1774249566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=rrvNm/sp0ejqtQpts4YJvKIZJai0U7h6SimZ1+626FCi7l4L6Dzs/D5AfC15pRBoWr
         kv/dIm7CfHnm9HMv/wH+hAenKg7VAAA/E7tVULHXPbxFq6YGS4qlbY3FPnHscS4jfzMo
         D3dH3ecOve/eQGzSnAb4Ojy44wq5Nw/0FFYtscPxcItm710bCdD1kjJ/hOB3448XZy8f
         K4xi4VdbUD1F+Vo4MhfBcbKbgnUdds5xx8LCHziC6xxbqHA6MvyjhOKbbiisyPVocwZ3
         KxoLuACxgOlrc3AY0BNPbelvSOBLVO9w1iQzbOC3uVjI5svhEljwS33qC/sFSOyzUjaG
         pJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773644766; x=1774249566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=gRaXIRgRrcMw7lSFENumHsTB78YqPppmqGFoIqDe9wSqc0X4KFwzjfEd9X7hqFvikn
         eDQ40TUfH2hZ11ac/iGLLbApUsSOimMEBu3jJVqnWozRuLTlAXFJH94zpZgGtoSZVjhj
         Do8LecNO1At3tjZPGYpUoLP7POyGGU0RfLGirBR1kNiz57lOA/DhqMsvS9Pca+0+zrCO
         yy+nhu8sTCw2XRs3TgigMLryNinK1E1djtAm4eJkOAfWA3OirGRhEk4e32AYmG4cW2Bm
         s3JGU2C9LDf5sG4voKgyTTudjXy0LT+KFu0/PL2/oTgoDn/nmPZANz43Fh685/ot5u7S
         1xNg==
X-Forwarded-Encrypted: i=1; AJvYcCXz0gQjBh9bXnvJDDoXolQZ7Kqtny9k+rQjMNQdTbCMc6tbSkucUnI1W3MgktC5d03Tds+ArUwdmk6N9NOYq88=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAZR1X8VKUGPsS192HkcUcTVPiBno/ASp5dKHitSTWXalCiXEx
	EgtYFrw4da7EcuinbJ+8gYNl8bvoqfs7wKFSZG3WxPgcemoyTPrszSgLw7cMK5Em7Fz6rPWaAlw
	3qx+55OZvHOzt15YDiHKSe6onE6PgkwXD0iqv8gzl
X-Gm-Gg: ATEYQzxeBBAh/m9w47B1acAC/JWaxYtp9Sdq3hSwQ7IElGZ4p5H73vqUXnAasFzyaUY
	RzZiMVcBvNYE31Mfj27PLhMkuO3bfjatSRVuTC5Fpnb20wgi6J1QXKLGoiOTEljES1q1Zmnbrr6
	IL9VSxTPMj+zxzsOWgCq/oVmBR8rccJsZiRMYMv83xnBo0AI3mz4NpwvNKP81FXp/q3NYpa2Ry/
	WsVQ2/e1I0jHg+KhMu/LfypgFT2yH15lO4ZyjQH9yqfWpL0eJkrc3rmDJcLpMQ/7vYkeimlWw3t
	8K1E/1qVxN+Bq0xOYdvwiDxOUO57U+cUaGOpXtEgG5UqLXSBzQfAA7c7WzzJn0/txbrB+g==
X-Received: by 2002:a05:651c:4356:10b0:38a:2db9:eb72 with SMTP id
 38308e7fff4ca-38a8864c94amr30667511fa.16.1773644766146; Mon, 16 Mar 2026
 00:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 16 Mar 2026 08:05:53 +0100
X-Gm-Features: AaiRm53tuutFjpddzDm8MgJQk_X6I9zzb6Uz-8-_BFX3BICSXZm9HxgKcE0xoPQ
Message-ID: <CACT4Y+arWePyxnV3hWk5RanWZpoc7=ALQ6DV_2MCuQkNoTtJUw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Jakub Kicinski <kuba@kernel.org>, syzkaller <syzkaller@googlegroups.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni <gpaoloni@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Mar 2026 at 19:18, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.
>
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

I think our reasoning wrt syzkaller was that not all interfaces in all
relevant kernels are described with netlink yml descriptions, so we
need to continue using the extraction of interfaces from the source
code. And if we have that code, then using yml as an additional data
source only adds code/complexity. Additionally, we may extract some
extra constraints/info from code that are not present in yml.

Realistically system call descriptions may have the same problem for
us at this point, since we extract lots of info from the source code
already:
https://raw.githubusercontent.com/google/syzkaller/refs/heads/master/sys/linux/auto.txt
(and LLMs obviously can allow us to extract more)
