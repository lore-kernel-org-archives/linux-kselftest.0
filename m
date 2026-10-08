Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71E63F0AAD
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465226; cv=none; b=m29RuLer0xKNOtNGPUowze7PoLVv7KV8XrX3cOEiyebHlfTzf+BdIaOFOLnXK6yoTiS8AlXHH/Kl9rGwO0wBr5eS+b+T0NzVBKyS7pzXyRwtacGfgvxMzX1UOHBlfIRbdIDU+KmB0ixPJFv0xvvPKrIavqH/rM/BuP2qCDUyje4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465226; c=relaxed/simple;
	bh=7qtI5gtgg8HMBmacX6qKEDXcXJKwtRBJ+yKlbMqIu+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtnhoqorOu2eocQ85mq+fuFdHCeXIWBkwvj5ZcJafRcB/T+2u+wxXx9NWsangaPF2KbeTd5Q3cqzmiIWVilVc7wEziqkbtE8y6h285uVyOL033SGHUIDJDiXexkyB4FTZSp7U3k+n4LEME89bCkoA+7uv3ZFwGGBK+RhhY1LGuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=D1SCMzeS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="D1SCMzeS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a020e65269so23129095e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791465223; x=1792070023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
        b=D1SCMzeSC+3lNkcoGtnd5MZUOxDZCN3wuNj/aDJI/4LcSRRqrhAqs/Hi9CUNMcqHFF
         scv7iSSgs0pq4DXVtxK1HcP+TX2UMEUKqgjygaUCO4jjwffdRYQ35mFnULVYKtlpTSr2
         NHsGPcZZ4Ck5RTw+UneynMefAFGqW4jY2LdZvX3S5iBQvtZZpf3hZOieucAkZf24jP9V
         NxADxxZhMnMZ1FL/SL8HTUDY6ROMGb323/c7WVSmvIz551S/ndHuV25o7mDAi9hg1ccq
         PKvBQP/BYKJM244I8ccBCcDKG4NhIg676rJptZyeAXQKxlYl94D2DZjm9gOjO6SQD5pl
         U8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465223; x=1792070023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
        b=F52hTDuPmqJl61Lyy5EVMmGjMA22oqBYJQmB6nOU7l6/E+degoeamomZ7jk/yYlQHG
         xZ3j83gCQAdbB1jC0wHYr/u9BsNqeYbNuFf0P6BheGtlQy6UGZmDpwhmzxCX15g39YFD
         6CT14JShr+ZwDaOiqt8VoEzlL3ZNMemFQEy6ayfD080fTZb7htNxpkh7ttraI0KGj7vU
         hA1A9Y8XRsH5heFMec8lGVc+IB9rn18cnjaYK0liAakpTJT/cJdEPTwdQA7dyt0Zmn6w
         /oMCSq3qu/NkerZ8szzL0EHvedQZLGi5Uf/LQds7eqeEilFg+uTPyyYyjriZN/hrSYgz
         Hm8A==
X-Forwarded-Encrypted: i=1; AKwUvBwjuSyZlIFlr/PCHGw2PROqVFMf7aUiaTB3ksQxjlpgsq84NvE12/00div/Ru3Gbum8WoRYtNFl6rpCh+T6CKU=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ7xV1S4EpRlEbRN0U8KlS71wXurXBZufgZOQI+x2tOyEHZEyd
	5vNC6b730i8um4FrYeMf+Qpt1a08uytYx7tAHOtOeb3306iN4rYzzQzLDldwY6dwtOo=
X-Gm-Gg: AYBFou0wXS45OvOO4/uxwDvYobfwytIfPrntZvrt36Q+6IHMscKdh7cv6KpjtvIThr+
	P5gYZ+UXhmVwo+gKk8+ulwHljZS0Z0ESzaMvtR/KxOUHMZsfQvZE8OsxhMp+5Owny0kD6WAltHR
	VK7ob66gB20HCgNHAxX0CJX0EFaLuG98hehD3M6Byc9u+oLUq9ZwsE4PFGqY2+9pZwQiFtvdaGf
	Gr4n0T+tReWD5uYNARwIaWApaINaEREzBE2jKIJGA+RqmzODGuZaA8UIt5Jm+XXdN5W252qwE4T
	79SdgQGpS/+9xVEjJXfK+r485jPtqazBckMg9cGMdPUg9+nwv7HpDOCTpIGpIpYNuNa7vW/B9Kd
	8Ycyz/KxvVcvWh7X3EZpkoAavwXmkOBnZAYhbTeH3qKCF/Txuh4KR7VvIRua+kaMQ4iASYS1KFN
	qzUqbmXkwxXJPT/4kThEfao+fOsRy0uYXbxNpEzo/LpuzH1yyWT9SSZOQFq+hg++MnORQ2d0061
	5FGDc0tMg==
X-Received: by 2002:a05:600c:19c7:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a180648d69mr101498205e9.24.1791465222920;
        Thu, 08 Oct 2026 06:13:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([185.194.184.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm221404825e9.2.2026.10.08.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:13:41 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:13:38 -0400
From: Gregory Price <gourry@gourry.net>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Dmitry Vyukov <dvyukov@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v5 05/11] kernel/api: add API specification for sys_open
Message-ID: <aseWPV6ZRQM3JOMN@gourry-fedora-PF4VCD3F>
References: <20261008084956.2911790-1-sashal@kernel.org>
 <20261008084956.2911790-6-sashal@kernel.org>
 <aseRXi7hMWBBc0tB@hallyn.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseRXi7hMWBBc0tB@hallyn.com>

On Thu, Oct 08, 2026 at 07:49:34AM -0500, Serge E. Hallyn wrote:
> On Thu, Oct 08, 2026 at 04:49:45AM -0400, Sasha Levin wrote:
> > Add KAPI-annotated kerneldoc for the sys_open system call in fs/open.c.
> > 
> > The specification documents parameter constraints (pathname, flags
> > bitmask, permission mode), 24 error conditions, locking requirements,
> > side effects, required capabilities, and usage examples.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> I know Kees and Jonathan and others asked for exactly this.  But one
> downside to this is it makes just paging through fs/open.c a lot more
> painful.  Maybe it's worth it.  Maybe "noone will ever do that again" bc
> that's why we have ai and tools.  But a) that's how I've historically
> done a lot of code research, b) IMO something like a manpages section 2
> under Documentation/ would be a great place for this, and c) we can also
> use tools to always sync these, or even show/edit in a single view when
> you want  ('kdocedit fs/open.c').
>

In many, many other projects i've worked on, these docs are placed in
the header as opposed to the .c file, but I understand there is some
pain that comes with ifdef.

Keeping it in the header ties the definition to exactly the location
external users import to find the function - so it makes sense.

But separating the contracts from the code guarantees they'll go stale,
so I don't think shoving it in Documentation/ does anyone any good.

~Gregory
