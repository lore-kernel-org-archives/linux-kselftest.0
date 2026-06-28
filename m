Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CFB263F5E
	for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782672250; cv=none; b=ciCb5vymomAP+48jo9AWtC7oY5vf+8UG5uM/cik3gH6A4AB7Q/V6gSK2WdVByBBKk7eM2HbmNKfeY77x7a7sQ/PAf49ZRTHEsE3BsRqO4pisX6T8R0Ti04NY4Qo0J9n/3nRWOh8DOgrt7fkIokhDLPpVMswy+NYxO7ycYP4a2uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782672250; c=relaxed/simple;
	bh=A06CS876fxNHyN/JSGmmNhP5LxQGNTrbKC6AUt0uy50=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XCcTQvU92LNNnjeyKoXcdUZk77bdd7hCjoDZ8Ma/7TwwxMetlCyvQTgKsXTAFu3Sgpn8M5La7B2Bc+meTfqzRALREIm5iB4pUmzeg1U9W4TDocAduDyRWLwIcNN8xsLBDD7D2dFv7k7UYxqQo2KFpLCstykVOTKfyDOxh1ipdns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ocl58G6t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ocl58G6t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso9703385e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782672248; x=1783277048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpVWK3fWX6RtxuEZlDdW1KGkNIIyoL6bwAJsYAyunoQ=;
        b=Ocl58G6tX7ZRzWwyP4szT8UcTv6q9wW5X3mqdgCun11Gu5Ytg1SSW4qIW4Wmm48Asi
         EDrrSAog6cjjxrMmKQWEEgoK3jRk+i236oVzlgdH8GhdQOgMC3G5JqbdRY/HnEFFAjUy
         8opxu9LxLnMV3RtdPKK8UC7dtO2Bsrr5Zl+wrTPEjCT1T/Sdp8y4xXvUsuueyfN/edv/
         lVF9hd56dlb7PDaeaL3YVlHuv5Dsf/NskLCBxQ4YTkVYYrcBdP+NkbzH6BlR10zyS1lG
         A+m8ZPjSjIFeOOZCXwwJYg53qN2SVAICS/29H+iDezY++9B5MwxR5zEPkBj0dPzsrb/L
         yZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782672248; x=1783277048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UpVWK3fWX6RtxuEZlDdW1KGkNIIyoL6bwAJsYAyunoQ=;
        b=Pb3/nrq9hk1AmwkRjg9OVXNlof/9G8Ui2HawCcxrEzOL4lx4j+kV2xeBt+/hX57BEc
         w8LRRZHp0RFkcLSiyIi9C8MhLQn+zBF9BoDWFygXwtaIvb2dTcjFubC8BY2pRyFYg0MN
         hGJwUXsrmjqCX4nq6bksEsYZ3tylugzuhAHVCbFiHOO1aEBh5zwGr3Li2DFJGREU17f+
         p2QzWTiZi9KuMPz5s0A3gufJ948FzrQuCKypccz/Jo3MBlHtBLnU0g0BmdSbYhiSReEu
         spfwCcQNYuFitQzCbUeCeUK/793fW5ojbOAGhUWiszIWsugwNV70hxMNMTFv8ckHE8NR
         g8Iw==
X-Forwarded-Encrypted: i=1; AFNElJ8sAt2llsJGXUKhvZzqwqD264TSyG4KjnFbDFlR2fmQ6sUirD+nOwEfx1cUtBNJko6U/eevsE+qKr0obDP6QWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyycDWnvTD7wF8Svm0nqIfsYWJTxZKVFugXYaIjb/B6Ijq17bsE
	JAiro8q53SlTNspQo/THiMbPTz3P+xvttD5FdVNOk6PU9yt/ytqlRGhr
X-Gm-Gg: AfdE7cn9MlZ0XLnbu8ZrzcnRP3EeI5CEKECDlJ35ZgxeIXPmq4POy+yrqUZexZnWMQF
	7oLdg8el2wjGHJlubTJcnz9QYzam7of86mLr3y4YBJ0+6OeEJ1hU9WC9y6dQkQqaSP+kJMqyP/m
	VrB/PYJ33ti9f6BOZi/W2glwrgSAhQkyAtBTZrg0oyKLcmMnUJPSqM8SGVM9Geu4VJ08w/KoeVF
	JRAYhlzC6uS2Ab333SJAFeHDGs93cQHDW1sosd9pnGoMpW3mAXohCRSz9UICTwV2NgyvufsCmqE
	HRtpobR/RqObzPViAxmXjrdsmk6Eh8aGpRm0Q5pTdN6/a9xnhWuhobh+XFGpt7SfsXEbFmu44L8
	EGXvzx1umt33HoFEooddAtmc1SBp1wAzqa2gk3sv2zSK6rSg4iykiYdgzhXAQh4+PzhgXCsbDad
	PiOKienaFQAVZXUci3jMHq4/XbPauHWUpz8EkdradX6brkXg==
X-Received: by 2002:a05:600c:628c:b0:492:71ec:7b4e with SMTP id 5b1f17b1804b1-49271ec7baemr92587895e9.22.1782672247820;
        Sun, 28 Jun 2026 11:44:07 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c285fc1sm167243165e9.1.2026.06.28.11.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:44:06 -0700 (PDT)
Date: Sun, 28 Jun 2026 19:44:04 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jann Horn <jannh@google.com>, John Ericson <mail@johnericson.me>, Farid
 Zakaria <farid.m.zakaria@gmail.com>, Jan Kara <jack@suse.cz>, Kees Cook
 <kees@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, shuah@kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mm
 <linux-mm@kvack.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] fs: support $ORIGIN in ELF interpreter paths
Message-ID: <20260628194404.40253a7d@pumpkin>
In-Reply-To: <20260628-debatten-vertagen-amortisieren-3bf518773e75@brauner>
References: <20260622043934.179879-1-farid.m.zakaria@gmail.com>
	<sfv7zc6jboy2oxv7zuyofysas4ncbzenwsuzveiyduisfr6i7q@mx23er7uxdbg>
	<CACCo2jkDuwy5w_yhX8833m+s-rY736pk8xtKjxg3_y_7BCOHeg@mail.gmail.com>
	<24420045-a6eb-4999-ab19-1e344eaba8a4@app.fastmail.com>
	<20260625-atomkraftgegner-hunger-kursbuch-b452ff2becab@brauner>
	<CAG48ez2X1p5Nm2_sU=SK9wUusUO8c3_T-=FGrrOhkm7Kn9Y_7g@mail.gmail.com>
	<20260628-ungeordnet-orgel-stechen-36dd64038541@brauner>
	<20260628-debatten-vertagen-amortisieren-3bf518773e75@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Jun 2026 15:20:11 +0200
Christian Brauner <brauner@kernel.org> wrote:

...
> All of that needs consistent, easy to reason about treatment. Reading through
> the glibc implementation of $ORIGIN for shared libraries in rpath - even with
> an eye on cutting through most of the complexity - doesn't give me very warm
> feelings. It feels very hackish and full of edge cases...

I'm sure that NetBSD refused to implement $ORIGIN because it was full
of loopholes.
You'd need the kernel to hold a reference to the directory inode and
have a 'magic' argument to openat() to be relative to that directory
rather than cwd.

	David
