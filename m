Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC5D37E5EF
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 20:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787343297; cv=pass; b=FGpjFgJUykQpJPGB3yYrn+cKTKWUKVdpbUqbj5aeZ/FoWIJtkaf1VZ+4JxugB/Ay7Id8nt+dBgyBGJyfE9OCG1VtASJo8bKdO9+7PkExhTipj0yreFJKMbd5I31Um0yfk5qoNaG0Bq/hvGGjgEJCxfTYHXVJndoLqGqAwMI573c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787343297; c=relaxed/simple;
	bh=T0pIspaluorHg++9gMtKSvKEaGqS0Ixlt3+2tHvNtV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAhDW0Yk066kNvXV+TjbqZhznWFe38/HyBdw7o0UwmFtKgIhIFt76GNPS32E7JR+ngqYfoGMXM04ZvV8+aDJlzqMdtabd8ev/fUov3SmGFaNp2T/vVUOHzGdHQwXvmg9QZRPtfK1aYtGQnDzjccMOT86N9UeY15fcfri12NUPMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayLdLvdC; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayLdLvdC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d560775ca2so12353575ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 13:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787343295; cv=none;
        d=google.com; s=arc-20260327;
        b=eZiHZ4gJVsYL7Hcxm2x+KLPpoOHu/NYC7p9QstY1VrZooysXHLnysH8toBJA/LGK30
         XXrJZNSEsNvIS8+UTApXC85XJPRUUO/hE4xd9i1rVe946AaZlOex7FBOaFUXp0RzxR/B
         4sq41qEm/53JoYe39D3GR0vwCMYevL/WLsNxMi8BDSsSQEkJPrDdXqY9Hiu5bOAWcIZe
         24lLxKcihlYxqleRv9fdiFZA6wVsvWbKH7BJEtaJX2L6QMNVDh+4qPakFgrg7g1KhUfR
         b6VbfUfrwJ+Jizt8aNJ/5tK3RYVoZjpphLCyySvUlIccumAUlATbujzdoMSF7WEsp4T1
         gGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T0pIspaluorHg++9gMtKSvKEaGqS0Ixlt3+2tHvNtV8=;
        fh=P5iZaUt40vBzEiD/cB7i+kJyTUc4RTBvK7h3Z8clvEs=;
        b=QzI7k344+QEYrTr8xCIETz6QNdCHV/Sj5zjN6yzksrMCvak6YzmBOMAxwXXGYmEt1e
         TpUxKm7weo3HUKvBxryR9VcuJsDE2v5okY4Tv3ONFdQoL5HC+jMaWFI51GD1PspxX4oJ
         IYjdpUqP6QDkEqvAMTNIBS4EsHwlXDQ6UYsKCNruMN5lYpBm6L7DZw3r9IGBQAkJ+ZlO
         YdhuGABmyDi/Rnfx9k9OhWJMfRUN0eT3afJ2XZ86S6KkQCqy9zjLGY1qqloCQMZgOQDq
         YeQi3mnesAa0PkKajqALrM0sdEQhk/eCaLv/uPxb0/hcOW9JmfB4lntJQj6/VTUm1uvI
         OrBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787343295; x=1787948095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0pIspaluorHg++9gMtKSvKEaGqS0Ixlt3+2tHvNtV8=;
        b=ayLdLvdCayWfwf4hVzlFA3xATXRdqXU/No7274Mrp0hddvMcdok1PzT6JJMX7kIsqF
         enE9qio3wopCkw7ikotvprCMfk5vyN7D4/R3Ge8IoNwfNJzSBvOmMNFj4KDh9IEaXFfR
         eDVqWNcSWrmgrsYSjIZdTD/d0SwhmNbPZM4HtJBMs326jEkYulofXONIQAI21ih4ScA+
         /aVY/GocS+XcJKyaNSr7YcV9aRr9YR9mCoBozU48LSjmhtbXNqvlQvsORf2c62vef5c9
         AteJnZX4vJvdFQj1tC5+NZ0XT+N2Qoo8o5+SmiawcGwhQnJSl1iNdK/bkLXfYgVEi5JU
         sJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787343295; x=1787948095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0pIspaluorHg++9gMtKSvKEaGqS0Ixlt3+2tHvNtV8=;
        b=FNAtjAdGpaSYmdkci6rMJTutC+v6z1mV5zP4b19MjRy96zKQkMnCrLtW0aIHuaUpTB
         KSu8qoqoYKLi8Crw5ggUKkn+5I2Xf7AVWJLuT1sMjUJ8ILOyhEym7P/bv5tvVSezkyx+
         qG3qHEy6/xQGrvpr3kDlMEVq/ltEtm8OGftxgg2LkkgOrnlaWWW4EJ5m/sqKil/vh+qK
         IvByuvL7cH6SBW0FnCIem9HQGW2VzPRhktpTr7B9lnLXN/+rnq66p/mjHZ6yBz6ZVRG6
         FdsrPZBuCk3kU3BcEe7Sz1XNaEaIY8wVqikc2/2Fodo8JSnDPSM3ULP1CwMxzq6xeMuu
         YqzA==
X-Forwarded-Encrypted: i=1; AHgh+RpZOWREkzmbbJuvQSCsPizNKx31McMdSnGyE3f/hlyQjdVar2sSuxXtu7yd09Hd0n1zIhm80FJcfbBVwD5c9sI=@vger.kernel.org
X-Gm-Message-State: AFuF++nFn8gZ21ePkVVcNkfP1dsSsy+t8IEHkgQYTxz63m8YZ3GD9aqu
	QePbp2ge2Lfttp9ijW20ZiCXt5oc8ol+A8dzzojg8D15AQpdxIGFpvAV75tLFA7bZn/P8w83ALH
	rwPDpceErdPmh35R2Jt+PzFTv+Ql2roA=
X-Gm-Gg: AR+sD13YZEjZ7W4oaUSWqycuJwRJ0bLdag0KOSwy0UKqQ1oKOUcj3/HhP6Vuewk4SQ/
	yw/PyUXopUCHGXK8Ue6R77Toortuob8bkIaXAULAMufpaEaHvgSRmac7Xmsoj98vNrHytC953sN
	hWiO6K/Uls1JEoLTm/bgiCdyOaXZ3j4VhILiZPMh8jsgVRn/JPaNnTB1l8iELBiagHdiu6Rq6tB
	pVaGJ2WNYlCngbgsioWgk9IqeAO5eYY+7W28gEBbWcXF27lP5AIi/wi5ffexadgpmUjH2MOpYjM
	i9anX8P/nV26iI5uya2b6aEEojHVJkgR5shxeXJ+/LXr/c6Dxfd//gQYV4trCBaDSWrrg4IXJ8Q
	tcIa1xyg0VBhp
X-Received: by 2002:a17:903:a90:b0:2c0:a555:80d6 with SMTP id
 d9443c01a7336-2d670b60ceemr14987675ad.2.1787343295021; Fri, 21 Aug 2026
 13:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114416.12255-1-anshumantewari123@gmail.com>
 <7bb2d581-924e-4a59-9955-b8afa2b51268@kernel.org> <CAJqi8kJf9EzfZWBo=1KpEzGiq+vGRz0J0mN+-NXAjrtq9HDrMg@mail.gmail.com>
 <e7c339b8-b936-40c7-b121-1a4c14838dd9@kernel.org>
In-Reply-To: <e7c339b8-b936-40c7-b121-1a4c14838dd9@kernel.org>
From: Anshuman Tewari <anshumantewari123@gmail.com>
Date: Sat, 22 Aug 2026 01:44:43 +0530
X-Gm-Features: AcwNN1WbQ5JWhMiF_GD66C2kxCGh-FyD5Ug_Cenhm9XuMXanDweiD-QtyfaJotY
Message-ID: <CAJqi8kKaNsxBM86Hg4W09gLo2rj0+kc9dAvps48jmQCshUkxqQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: check strdup() and fix buf leak in parse_test_type()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good, no objection from me =E2=80=94 happy to go with your version.

One small ask: since this fixes the issue from my original patch,
could you add a Reported-by: Anshuman Tewari
<anshumantewari123@gmail.com> when you post/apply it?

Thanks!

On Fri, 21 Aug 2026 at 21:48, David Hildenbrand (Arm) <david@kernel.org> wr=
ote:
>
> On 8/21/26 18:09, Anshuman Tewari wrote:
> > Thanks David, agreed =E2=80=94 strdup() is overkill here for a single-u=
se
> > parse, and dropping it is the right call.
> >
> > One small consideration on the approach: working on argv[0] in place
> > means strsep() will overwrite the : separator with '\0', so the
> > original string (e.g. "khugepaged:anon") ends up truncated after
> > parsing. Nothing today reads argv[0] again afterward, so it's safe as
> > things stand, but it does mean correctness quietly depends on that
> > staying true =E2=80=94 a future change that logs argv[0], re-parses it,=
 or
> > echoes it back in an error/usage message would get the mutated version
> > instead of what the user actually typed.
> >
> > If we'd rather not rely on that invariant, an alternative that still
> > avoids strdup()/free() entirely: copy the type argument into a small
> > fixed-size stack buffer (with a bounds check against its length first)
> > and run strsep() on that copy instead of on argv[0] directly. Same
> > benefit as your version =E2=80=94 no allocation, nothing to free, no
> > NULL-check needed =E2=80=94 but argv[0] itself stays untouched.
> >
> > Happy to write this up as a v2 if it seems worthwhile, or if you think
> > relying on "nothing downstream needs argv[0]" is fine as-is, I'm okay
> > going with your version too. Your call.
>
> I don't think we have to worry about other such argv[0] users. If they ev=
er
> appear, basic testing would reveal them.
>
> --
> Cheers,
>
> David
