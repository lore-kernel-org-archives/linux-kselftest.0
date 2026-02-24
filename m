Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6174203710
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 05:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771909306; cv=pass; b=DzySUBTQH68BePsqQuspRUKtrtFc3tOTIPr4FGYtE1hyoIEItvADV9Z7rHFRbAPAVUXTbpLfMne8vKZlArMBaSF+nQ6eH98AIp9/rfzXMFakQ3P3cmkgbWHa7ITmlNwTJ/eVJ7eYjjUKaWnqKDyR5kJs6FrvAphqjBW5ogNvSfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771909306; c=relaxed/simple;
	bh=L2ttXJfkcoeJVcdKWVAE/l3LxodapvzxfEs8Na/1mgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dit0jZ27hv6avip8GMxPEZOG2+p3zXF5BIkP8rRfR652jAUR5t3xg0annNwebaKxZg4iQc4mxkZsEmyZfy1kQm3TKWUskrMw//VwhjnriCQ+A847WS00o0RTmE0WFJ4vrOuqXN0SSzipRKcMD6NXJc30TYSDuRDTsuurC/K9lj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNWy1yEr; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNWy1yEr"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79854193a54so9523997b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 21:01:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771909304; cv=none;
        d=google.com; s=arc-20240605;
        b=SwnTo1OKcuwRS8OHnAWMrRJ0U1R7K3GNLV3PR/RoEfqg0xTrObMZqEF8DdGTeDa3GV
         A75i46f8mRNNilr+IM3ZqFgY86qVq0sxJWAqE0iDLM45Htdimh1NxX/TXzkgKrkIE8JR
         YO17wYcAbJqZp13oRIFFDhsO7+DoEyjhWwnK+Ej+iahto8cYXcxBw2xNoUYgjJn89ve/
         AQPtQRFfDQmpVkVI+CIM+ukQOsJQriJLrgrJ48nSleJIVGbCEIt62Tc0tYMFPbBIvo3t
         1PR92mNJKtwsGMGF1jDHVOQIjBaLk/M8gyn7hB2/zUSr2j81M3V7trK8RBmsCU7lJhpT
         T91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L2ttXJfkcoeJVcdKWVAE/l3LxodapvzxfEs8Na/1mgY=;
        fh=RSLU06ZJx6ygAJvEgkjkk/wtejNItbuCZ7mXZqjBY0k=;
        b=U1XGmurKmDO9uz/VWvICCjb6h3GJzW+LPnNUIid0ZNzu/baz6KJ/AOAfcOyjyevvAy
         qaXiBOWGYQCYe0mdLzQjpbgmF6jjr0JpGmG3R1yC/1u2N7nladirFYNdgfydhVzhpOHA
         OozKVAW5KJPMbIoFxsFufYqllkPAU3oyRiNh+PRSExVwnXinuwhDw271/hDfBs+t7awH
         ZAkp5g8DaI6Qy0Vqbw18YfGXoly7NI731eI8XPrJ/vouMkfdGyQvhi4hX6EhDFIex/NQ
         xWw6Vaa8ufW7EMVFPQOr1fizdHSw8vcCkaBed1g5mbepdhMQ5F76P+SBchz/mg8eUCOy
         nu6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771909304; x=1772514104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2ttXJfkcoeJVcdKWVAE/l3LxodapvzxfEs8Na/1mgY=;
        b=QNWy1yErdUA6CTe+ZzPMdutofAqGRETpseLswi8T9sPolZchDWpOj6oikaAEWTAgyg
         biWpPHvTkkKWdBLAIu8cSBAp4qNaEAgLRqWJNVQpKv+dJsVObNW2qyqRAujh8kvGa8Gj
         plwzDVia9jXR9MyTrLaRhtgTgSwVf04N30eLYrSTxjMlbLOCZtEQ9OCQM2WqAG2iXgCP
         opUF+RP6v/wYk7qWQepNi7AegitkncpPfa04jNpBzxKNtHxLvEk4sV7xqn+Eyu0yFMqe
         qYE5XCXPSdSMLnMx6JfFETBxkrrnCF2NG969PWoRDFGedJ8vKzdJv0MZvycBQd7K44Pq
         jjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771909304; x=1772514104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L2ttXJfkcoeJVcdKWVAE/l3LxodapvzxfEs8Na/1mgY=;
        b=qhvMmJEWO5YMBz/FzESiF/v5sQKEfEH/xg9u32kZIgf5AHBWeGspgapr0DmjxoS8hB
         s8z4cnXTdKegPOp/vTNDQ+xUlvQlh5SESj8MSZxrouQJOhk11uYQpAZK2cxGLVKTkv2D
         g4KsFTczCS2rg5ec0UxcKD/AHlEnVQxag+PKElYOLiiDYne/ra8blKT6gyTvzEcUlMBl
         vTXKU/ecyiGtqaLJ03hxlN9nZ3SPEvCTKc3+xdODBA5GZ7ONRPYZk2xnaiHqJhkA/JeR
         KwbqFNKpjm881uaN/uCjqj9W2IuKJCdcoTC/wE2PfThkJseacsKDUBem5gIdJRS3z9XR
         ukqg==
X-Forwarded-Encrypted: i=1; AJvYcCVrarqvBIN7iv/baKTfPsjzk3zBYXmpBKO9NecRef/sAVuXFO0RpoVeelGq+fOBuZ8WqRVnQnfeNhzU667p7tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzHJaU4GN4zWgAbLc86O45eovZppRTW5Uivv5ntf6GwXte55Kp
	rppMhaenqPztn6GPfEb1Bs5q9Yy4zRncxb7MqyY2uF7JjVLkP5SfKQpo5aE+63zQaPwcMVcc4zx
	O2IHPk7qfc1pl9q+C7743eNhFNXsvb4k=
X-Gm-Gg: ATEYQzwBEfcx8Lp62ecgu+9HeLeLuW8YURHiiaw9xqxyDieZ7/G7/jiB3lI7LOFhGCX
	qgI9/+oZQh7ZjF3DYvTh0Xg0hcdHia4vHhy+hVDXn8JA3sErzNbB2MxmmPmWpwg5fP+mpixUfuJ
	Q4YTfoHEeykQpzTbNF6vUBQHueEuz3sA8S4ypncaFWXGvaxQCIuQjQeANoTjPl8o/Y2SinGcMDA
	j99pJg8831p+zFSG/ssJNMJuLKrOIjDqfD7KtvxmtZlPpUsWp3Csr1yI1tS+5zTNQnb7Gr+lLui
	lS1hi6eyQRa4qOM=
X-Received: by 2002:a05:690c:e081:b0:794:fffa:a4a3 with SMTP id
 00721157ae682-79828fe3e97mr99881817b3.32.1771909304693; Mon, 23 Feb 2026
 21:01:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
 <20260223172214.5d8ddaa1@kernel.org> <CABFUUZEuMCYYfi-SapTLT1BhYOWBk1e-OYh+h9fOZcfoSP06fg@mail.gmail.com>
 <20260223185321.0f0581e6@kernel.org>
In-Reply-To: <20260223185321.0f0581e6@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 24 Feb 2026 13:01:32 +0800
X-Gm-Features: AaiRm50G16KCDeABgvXX9N06coP-jcWkxjZu1pw8PVHh9TwTz85YTT7Ed9y1XyQ
Message-ID: <CABFUUZHb2R_SiiE_K-ixhjPVkvG4WWTjcOygAM-YBGtZ6Cnq_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests/harness: fix XFAIL_ADD matching when test
 metadata is not initialized
To: Jakub Kicinski <kuba@kernel.org>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, edumazet@google.com, horms@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 10:53=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Tue, 24 Feb 2026 10:43:15 +0800 sun jian wrote:
> > > Constructors seem to have a concept of priority so if we have to,
> > > we should probably used those for the fix.
> >
> > I considered constructor priorities, but I'd prefer to avoid relying on
> > toolchain/linker specific init ordering here.
>
> I thought constructor priorities were specifically created to avoid the
> problem you are seeing. What it is the point of constructor priorities
> if not to order constructors??
You're right that ctor priorities exist to order constructors.

With clang+lld (LLVM=3D1) I can reproduce xfail nodes being attached to
variant->xfails but with xfail->test =3D=3D NULL, so the pointer wasn't
available at XFAIL_ADD() registration time.

I don't object to ctor priorities per se. My concern is that fixing this
via priorities likely requires ordering the entire registration chain, not
just XFAIL_ADD(): kselftest_harness.h has multiple constructor-based
registration sites (I see at least 5 macro-generated ctor blocks plus the
constructor-order helper), so we'd need to thread and maintain explicit
priorities across the relevant registration macros to guarantee that the
test/fixture/variant metadata is fully registered before XFAIL_ADD() runs.

To avoid relying on init order, I'm happy to send a v2 which doesn't add ne=
w
state and doesn't rely on ctor ordering: keep xfail->test as a cached point=
er,
but resolve it lazily at runtime on first use by looking up the test metada=
ta
by name within the fixture's test list, then use the original pointer match
thereafter. This resolution happens at most once per xfail entry and keeps =
the
hot path pointer-based.

If you prefer ctor priorities, I'm also happy to respin that way =E2=80=94 =
but I'd
appreciate guidance on which ctor(s)/registration macros you want ordered
against XFAIL_ADD() so we can keep the change minimal.

Thanks,
sun jian
