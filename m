Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77999301702
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417532; cv=pass; b=KR5IFTn8v1ajTljqjLCf1QwbAQ2PzY/fUVW1MytvN2XsmgqqM29KliTi7yr9I7KQIAbUGqG4W8WMM0tP7OYL5Fpp62kFucECGVx6jGcjjAckaUS2h9RfiAmuBWKvYDFEOigi1rrbeWTSrSLG3zwppMOY+/LOcBBETfe2qcvd5zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417532; c=relaxed/simple;
	bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibJi6wG2biVLBi/aO1FzsJALsiF9EocS9+tEXzxLMx37TMt0VjYuXS9L38H7LwfZphv1Kj1JjGgGIvAV0c5/Pt/x26cHADHP89aXKqWvI9g+KpHGgu7vThooC6C21pJ6t9qce6Uo64AQkm/U5HROErxwGnozEzw/3L++ufAdInY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jM4E3kMD; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM4E3kMD"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so144774eec.3
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 12:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417530; cv=none;
        d=google.com; s=arc-20240605;
        b=O95ClZDkSnBxIVSb+0V3SbTysVvUeZ3zZPAfHcDD4WcaUQz/O/kB8aSDcr++ZixOAS
         or3ObGpK3ZYAGTJxptCDbcVnzLk6IkVIY4A8No10Za2XaY1ztO+pcdh9P/EhsYGf1Elc
         dQlLvinpcgz3ImgZnPI+sGP2DQsw07zsPflK+E5lSvos+1rjVO7gpk7bCGWagLVcieZB
         EazwPSPMGveWqFbu1WCv7MVdkol0EhaB2HY6pbqvD9w8qIHJiEeIuSQDMzPiD9/iJ/RV
         vZYY8W5ZhMytGhlkd8TUsO1649uc699lXC/bjocg4n+Cr3bJctflCT9Gi+9jNEoqSoYC
         7YSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        fh=mxPGORRwvu+0sbiOv3dOlKn3VhHIo9oXsPQi7tn/mas=;
        b=eWkGeM7Y0UQVem/d+Q7/YWbpNYlAFaubiYsjvP+4b6/TaUyFawBTxm4BTdV5mtWEGz
         rFWAU6Co3uroTC3ZbqqaIXlN0MUhHw44r17l0RE9wHFJmchw2lQ3XZVrene64swV8BQG
         8XOXpbTkcMb/wJlA1rFgcsnOapniIQcI5VZyoUkhJCr1EMjLLkSxsGXw9tD5yegkabgk
         XLwRnj27xSutm8VdKfFyvhHSy0lScVtC+w/nQgSKfDXU2IdDfFDjPA+rDirK5YjldP7U
         rB69y/uHapfo8I6f1dCbKT/nu1L/KmFj4il8Uu710Z8sC4EhEEZgETrYNvKoX0Hfb/IW
         dyyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417530; x=1776022330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=jM4E3kMDqms8VNJHv8kbVSfyTEZTTKjtGooGApmTiF9/nl06mKbaW4l5qIrYswnwpT
         Kh+4uqPBEQCls44ciwK6q97c6RKkdhRDyH18GzzB3vo2S/H+Keo9XO7noiMkDp0chNkY
         oVvPX4x6uk8b0yagBZvRgeuVx38qA85crjHfPf+OpMXap5ch23Cu2O9SIacAvShK4RSI
         v/5nvGmWcIZ9XLN9XSXX/rtp3Z/xvyPg/yADjrkoUeFg7nDBaSirxtRcasaRJz6mxvND
         Zu5NAABnzR6ScrYjUxhifSEHfR1D8AOj53N9+osYsUGSSV8LyJ8h58n2OY765I7uh+ho
         g+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417530; x=1776022330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=SzVHo3uqJqojqS69iNBBdWcZYMun8dbCzKVHYbd8ykVzDvMIEOQgYoAhpVymQqNOnI
         sFl8hb/XyjvJU4ZmGPT72HVpXTF/npZKb8hQDLGVbIfs3SNwoO3H8puDsKRELg7XXs+8
         1x5rDwoYHmz46KPy8WDWuQaFutlnx968cVt1m4avhFn5FY7mbm0YY0WsUfpTq54nyyeR
         DOos0/I3nsgNEUzFstT+ApgqBwzUzOietFXne3TL5MdLKBaLaQaHgNglDc1ZhwRDc1cq
         q8aWwXkGvF/ZaRVKMaeRXE8CAJZrxtTMl/skiYBoyNHn9G31H2oFarQFqBzKxDU/LHm6
         KqSA==
X-Forwarded-Encrypted: i=1; AJvYcCXTr4nvhFT04lGmL5s/PmFOoXLJB8p6QLH+LGZtYLC8/drks0SypvNSgzkP9h+2OKx2Ne9wfOXvu5sLu3Ci/+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySYt7Swym4KTXs7l9pKw/g8/QcASLD3vuaNdiX+RnUGwRFvJ/U
	y2tE0dm694Z5m2tVAs4+CemfZIeMiDd+W3Wl+XgIL8PRrx4SBeMbGEfW4GKKI5YMbLx2ioExB2h
	KOoEoxlO3haCtX/o5JlkeZ/gE2vvkniU=
X-Gm-Gg: AeBDiet4u85Z1OGHajAvg/cAbjdWWqAKolxG+UNOViboyrYmV6m5y+QbUDy8OZ5PS2R
	gUyRBUJYfiE5aYHwKzTs6un/VkEYB4o0aLtGkS+xdAxeOlLt5hMNrD+rrqEVsM/Ec6PKOgKZaTt
	x6eLxyGQlWXjOgW031tsOdUm1quBq7pEk9OVbi3ZjvPR/IFIJF2NGG8mhnMh/X8/XWuY3ZQPyUp
	T9BjSS+mnpy1dISEJm36SYkCkS53KX75lD9h3OSBnxRUKEh19J4Cam7TZnGTrA6Lvx5W1IdWcuL
	HVuE9T70NgvtJu5TKTt6wKDvthEDhyhFt1NI1G/ri2HkMK8/rYEjOOr/5OjRDG4Oejc0XuzTM1M
	dMbt1aXlbxfkXf0o6oEGpRTA=
X-Received: by 2002:a05:7300:cd86:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2cbfc768bbdmr2210515eec.5.1775417529556; Sun, 05 Apr 2026
 12:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-21-ojeda@kernel.org>
 <177508434460.73816.4231801886718165891.b4-review@b4>
In-Reply-To: <177508434460.73816.4231801886718165891.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:57 +0200
X-Gm-Features: AQROBzDsQvgh2EDKUg3LiGNTUf-8TUQBnEeLR3UEGt8KzpEPnOxtdZC7xsmuU3c
Message-ID: <CANiq72m9bsXZnMJv2w9eszV5DGUG1Cq0NCEUqv60=4Op__Uong@mail.gmail.com>
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> How about ordering this, the previous patch, and the next patch ahead of
> the version bump to avoid the need to mention it here?

That is reasonable, yeah.

Cheers,
Miguel
