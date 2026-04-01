Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472562E6CCD
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052569; cv=none; b=JlsVvC3tuf9U3IP9foYeLLgPDPMq7EJgq1NN5zF6KWG1ArWJl+D7zjpiw4LClsUxJ7oKi88gFKNrUQc31vjoVrx6QHSj34xWeC/5OCLjDBYx2VkdCzcV67SQeSCQhSN+xWfJrkGK4TvNlKH5w03wJI4sINMqJUpp0U11Lj+432E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052569; c=relaxed/simple;
	bh=FkHhl5SAKIEruahir/S4Yn91EO6ZVJU7/+9TaXQ8gB0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L81XpDNrANYaC/2WSadkZPsN97gfIQK4YChZnGJnb8fvFn9P4S+LWn1zjoNrrOzD96JQQKwgIckm1X3itL562z3cnOsedEBYVDaLRRppCADXEz9HQ518ht4tE2HukD3ZN8aZpE26b7yretDwSOxfdxslaCumAmOnWehdhzqihkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH9UZTjy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH9UZTjy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so57016315e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775052566; x=1775657366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7S8G0jPQziP2icNG+Xq9AlGcKIFYSGaYnHCga7XZDY=;
        b=YH9UZTjy3/pdQ79lXxzABHUThvXHPlEoBkr2uM26hOMLonb0pB4TOTJFXYkqTdqUL1
         uAmYbJwr/TTHkIl4EGRqqZAFR86rl5d5WB8ao+h9PbLUHExLUo7WsR46VV//tkeQP04m
         De+Vaaz54awqHQj/7hixZSVaZACSjjJgwmLvTA45KKDMZmulYc+fN+5tiyTDQn8PNx3E
         KJoOk9Oeai6SM71kEMALniwZJUd5nZ7VUhv/m03Y1YYOJgOrvsic1hAN+Jaz7ipNlw3x
         O8J7QFCxHEBvhLzdGqOqtvmmwhJ3d3IRLanmIwT1v09/tTvzatB+tB6yAKELkUQm4l3f
         NbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052566; x=1775657366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7S8G0jPQziP2icNG+Xq9AlGcKIFYSGaYnHCga7XZDY=;
        b=lFg6bmAlNde5qShUxJ7XotWBbXSsxUpl+enJmkO+wr7HlQ8qAiogRJfxtHGPzT4FCO
         JDTxt7qJ8kh7pS1CDl7hIfLO6Ol9S/zcZSOzvdUagovVKgnLqJQptw2XYYEbL4iNjzjZ
         Q+d8WoYuPOMYINjC6gFuYxliPtT9InWB4SS+7fQUt1QxAzyarFRMgZJ6DAmVowKK3y2s
         Vl14wbyp6SxNwh6HnLmI/tfEI/Uz5I05GCgi2lpzTWntWU8kKiYE3T/OUMjuV33vluux
         UfhQnzTFqDB7P+KjsSg3+fmOEHrAItUx+yHXSuzkbf1e6N8g/2h421u9BgphbIR647AK
         DzuA==
X-Forwarded-Encrypted: i=1; AJvYcCXBgAJhob8KKl5HzAKfn3DNOGdh01mJ1g8WDf5BT2BBcjLtQFesMf1Y3t/yDSPNJk5a9V/doBHiSz1cuolYTLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqlArV4tykCZjuAGHNCk63RrtA9tKaS5DmFr9nZUThNphcOVUK
	tErSz6mULzO4JHN3tkp8nsUiX4foBrsYxCKuCVJo+FYwFWLDU/72eW4x
X-Gm-Gg: ATEYQzyargndFtctgeeCUc3sjKr4si0yeunHqtYvDn7s0zFhtRu1zO26nvZaNnx8RsC
	s4ry9MfdZyUBsWlbUY6V9wulvENNj2nIFhZMuiFE0PsgP1IIh3YQ1FZXmx2P/g9rOpy0tiu0JqK
	cLx4dyTI4TH/Ed4xkp+I6inExBIgp8NKyE2E35pJEFBlszVTcsoAKLj+6POS3wEVf/fuZ8rYLYP
	wpI0fwXorqWK3t54ua4b4kg9CKhpSZqp3mDIe/HXiA3lR7iShiU6b1DTej1JWQZJFzxxtmTjr/3
	pNiYLt6Qc6yi8FLNxLsO62YZl34nm/pITZcD5qTKl3dn6U8Y9ZD/Tv2cOFnESTaWI2zSxPxfKX4
	L1wWssPgYqY1aFo9KDMfMz2HmFGBdUuz6D0YMJNMB03AGXrktp1loiBZBxrf1AGGhKCy2TDDVQu
	kWRdaInYOQMKzHkI/QUF8TBONlUuJOa9jUAg3A6sN9E2EnaUwbHQ1jTTKZ3RGF
X-Received: by 2002:a05:600c:3e1b:b0:485:ae14:8173 with SMTP id 5b1f17b1804b1-4888355e47fmr62749425e9.1.1775052565221;
        Wed, 01 Apr 2026 07:09:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8b12aesm40093505e9.22.2026.04.01.07.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:09:24 -0700 (PDT)
Date: Wed, 1 Apr 2026 15:09:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Jori Koolstra" <jkoolstra@xs4all.nl>, "Andy Lutomirski"
 <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, x86@kernel.org, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, "Chuck Lever" <chuck.lever@oracle.com>, shuah
 <shuah@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "H.
 Peter Anvin" <hpa@zytor.com>, "Jan Kara" <jack@suse.cz>, "Alexander Aring"
 <alex.aring@gmail.com>, "Peter Zijlstra" <peterz@infradead.org>, "Oleg
 Nesterov" <oleg@redhat.com>, "Andrey Albershteyn" <aalbersh@redhat.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, "Namhyung Kim" <namhyung@kernel.org>,
 "Arnaldo Carvalho de Melo" <acme@redhat.com>, "Aleksa Sarai"
 <cyphar@cyphar.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, Linux-Arch
 <linux-arch@vger.kernel.org>, linux-kselftest@vger.kernel.org,
 cmirabil@redhat.com, "Masami Hiramatsu" <mhiramat@kernel.org>
Subject: Re: [RFC PATCH 1/2] vfs: syscalls: add mkdirat_fd()
Message-ID: <20260401150922.0990d935@pumpkin>
In-Reply-To: <c2ea52f2-b232-404b-9ec6-75d8efae6bea@app.fastmail.com>
References: <20260331172011.3512876-1-jkoolstra@xs4all.nl>
	<20260331172011.3512876-2-jkoolstra@xs4all.nl>
	<c2ea52f2-b232-404b-9ec6-75d8efae6bea@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 31 Mar 2026 21:13:34 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Mar 31, 2026, at 19:19, Jori Koolstra wrote:
> > Currently there is no way to race-freely create and open a directory.
> > For regular files we have open(O_CREAT) for creating a new file inode,
> > and returning a pinning fd to it. The lack of such functionality for
> > directories means that when populating a directory tree there's always
> > a race involved: the inodes first need to be created, and then opened
> > to adjust their permissions/ownership/labels/timestamps/acls/xattrs/...,
> > but in the time window between the creation and the opening they might
> > be replaced by something else.
> >
> > Addressing this race without proper APIs is possible (by immediately
> > fstat()ing what was opened, to verify that it has the right inode type),
> > but difficult to get right. Hence, mkdirat_fd() that creates a directory
> > and returns an O_DIRECTORY fd is useful.
> >
> > This feature idea (and description) is taken from the UAPI group:
> > https://github.com/uapi-group/kernel-features?tab=readme-ov-file#race-free-creation-and-opening-of-non-file-inodes
> >
> > Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>  
> 
> I checked that the calling conventions are fine, i.e. this will work
> as expected across all architectures. I assume you are also aware
> that the non-RFC patch will need to add the syscall number to all
> .tbl files.
> 
> The hardest problem here does seem to be the naming of the
> new syscall, and I'm sorry to not be able to offer any solution
> either, just two observations:
> 
> - mkdirat/mkdirat_fd sounds similar to the existing
>   quotactl/quotactl_fd pair, but quotactl_fd() takes a file
>   descriptor argument rather than returning it, which makes
>   this addition quite confusing.
> 
> - the nicest interface IMO would have been a variation of
>   openat(dfd, filename, O_CREAT | O_DIRECTORY, mode)
>   but that is a minefield of incompatible implementations[1],
>   so we can't do that without changing the behavior for
>   existing callers that currently run into an error.

Just require O_TMPFILE to be set as well :-)
You know you'll never regret it one Apr-1 is over.

Can something be done with the flags to openat2().
That might save allocating an extra system call.

	David


> 
>        Arnd
> 
> [1] https://lwn.net/Articles/926782/
> 

