Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDEE37F72F
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 01:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787622988; cv=pass; b=fREs00Z/eM9O+yaezSTx1YHHt4eDNvd/Gh5qh9QiMBD/ezvdn8eM/sglyr3ktFVcuu42EZ6NidXcSwbpnI5qIhZclQiIfSKsXJGFh9Bs0sFRXa4J4X8hkTAEMj+9AVvK6J0DVavg1JGUxd+i1HzzEgPft3MNEBNFTXJI09lQtUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787622988; c=relaxed/simple;
	bh=CgMeQe+HrIJJ0uFrYOINDFEjOYyugXhcq0PoTpD7ldc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoNeQXInXS4x2yHkeMLHnAjdInZ0hZBNgUoEYOHOS7W+pr/W6U0QGzURI8yVZnzp+vIl+mHJ+cbn5Zeymfasjzu9Afk4eRtSGIzmbEfp1kafclx/MA65EebTfYnZ/eeYI1kf/1g8+XJj6zrOAj0m97Ox0HdCz9jmDguopF8uJls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Xwm9rvp3; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Xwm9rvp3"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedf433a99so4055474a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 18:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787622985; cv=none;
        d=google.com; s=arc-20260327;
        b=pfTDa8z50XeOIkhVL+D7fSJyej2Xs//CGU0gr5UjnrpdhNBupjIyvunSjJ3V2ViseD
         6Z8ZNDPCTLK6Ha/9Pw+S9qM7qbGXeNtooPMZeJMuhco20RU7CK4U0DfyU1iWeYdH4YHH
         WhISs/OXmadnULjVZUKgFshP4JNS+OftgcgRvuZBZgSZzkVYwRYcDFrGVLnsQXePF/w8
         QTVj6blEzQZcd2ZMogVOaBxbOeF8VdXwGYH6Dv2SXIhVC+i9h7pok5ilCrAEogBeluJN
         RxhQyI+fi1b4T7MfGwrn5LYSZ3aGnzqD/pLkEBTkmPwC1ifx26LHcncKeVhui7PyV7+F
         0YGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eL8Em3XBkkB3ByuSL6hH25sdEU2rIpfCZLeesDeBJPg=;
        fh=HTW6IbdtXxiefmc5EIpFK9iYxi8KXR6to/etL8OAqU4=;
        b=rYExLo21ejGWIZ5f8333pt7qWOAnwtEAZ5lsDCI3iAmU4fgvIMT8uwbHvafaaN6sip
         L9WkqgT0fJa6bjspYrY+W53Byr3C1oCbIe6kYL4q/Zpepgbm93XeTPFpb25wOyaQyOZX
         v1oj3CN85HzBt2u3QdFoYLckjWtEahs6UpCmnIklA1CDQ3XsdGMFadOiMJbmwlyoAi7Q
         RSWx3+AbIeQC9YOssc17Yp2Csz1fR+wZEry0YhC1QA8pBe1VEz4VyGBVg/HyQIrf43q5
         bbHY2JDswrm5PX70rNcZmEi2uch/WiuIxLk43+bbFwtrdFT7SEGPOZpwnGSRjxICfCfU
         zj2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1787622985; x=1788227785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eL8Em3XBkkB3ByuSL6hH25sdEU2rIpfCZLeesDeBJPg=;
        b=Xwm9rvp3UgIObC4KaRfLWFsvvq7Mh3Rq4WPTbTUC1MLXTNAIQfMXP3hQMrf5zfjYMX
         1OJp0xylF1zaUoJXVqoqAUiZwDoyJQWCooi8YkTZJeJ5C+CI6senVRJHrEtEQ1jZValV
         VtaI4WFw1Oqcb9xse0dfTPU8Geg5392gwqkeVkXjJ2lAyL7KJZlLa1ixId+NkJbaAl/T
         NtzUKuOtKeqtIzXUuxou2bppezRiJSlCGAQfvmfwe0SGyKAozI7vjDV9WXF9bvcgHG/P
         I7yPKPPTevbPoNmAyerSna77drso7at40es8jtz8yTlGtPG7ztrMl0UVmVxFzx/q27wP
         hw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787622985; x=1788227785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL8Em3XBkkB3ByuSL6hH25sdEU2rIpfCZLeesDeBJPg=;
        b=ecymhKqkynO3klV8tnw0nzmLVnJH1+uiCddtF0DnwOtCFZ8B4+JYo/Ga1qWa+Hg7nC
         ev/Xmp3E8UO3tqQEDwZr8NZA/RNg/dOzBNEI4opAd6hfT6pVwcsIFvXUkGdn3rv8HK7X
         DdORgM0B06goktbUUG2h7QihVwG80mp+gqE/OS03QDUg60loy58hMdCOTp0+KY6CjFF9
         f48XSsAmQaQI6wP0ZN9VTcNzqWV1QJ6yZCvyzelEPpap9ediuxxSxTtHEHKS7yqwDR7A
         qFOzoqpyqqUTZBUV1u5eaxfiazuv8JuUwzMiwpjW+ge1ZEqilGfDMoyQKPWmoEuuF/qZ
         eSrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8cKChHr0EDTr9dIFuhtjg/NsNEO+538fHtp2/a2k6p2+9D6NtraLW3ogr2QFetvxgVZREVJWAG+XgfDJGcUc=@vger.kernel.org
X-Gm-Message-State: AFuF++lcojdKIl76uSGoLQ9Z2pNv3z4gPE0qx/Yl/MIHmhUM+iYcjp1c
	x/3CROzhSNTsHTw6Jsw1ko8+zFPVtmcikPf3XrVvDgjlo4sNTMWejqVrWLQ1ZxFiUgCSW9mN364
	LdB8LMAS8ukW1ROrb1WPXCVm3UNreMv/1LNTZ+p21
X-Gm-Gg: AR+sD11/rw9KXcyPHLy76lQ6F1ChCb3fljltk2Cu+WJhC5VywRPsienYsoZWQ4pueYW
	GJzYqRV96ifItja/GR2tiFqCg6KwJDmbKzk/ZgzZcl23Ruj/pUfpqynsFhIcKf7KV6qCZm7QRKS
	5NYPY3jgasbx79cmkk43qHU6oLR55ZV9ht1QotbfcTOh7xRMnkE89NetvQYbjt46be4C1v0RCE0
	2E1tvEb+n/3t+gb/TiA6sJKXmkBg2E9i3xc8R7EaF7Mw1JndZeqCKe1PX/0NfETQ/irWGn/2BNa
	0ncoSDJ5+Nx/cjxNyz+bGqMAJDhewhc3Pwc9H8w2cvxS0w==
X-Received: by 2002:a05:6a21:3391:b0:3cc:ebeb:3efe with SMTP id
 adf61e73a8af0-3cd91299690mr6192258637.9.1787622984659; Mon, 24 Aug 2026
 18:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-audit-v1-0-ddd0d94ff0b6@gmail.com> <aos3m2wG3To3wCeo@skinsburskii>
In-Reply-To: <aos3m2wG3To3wCeo@skinsburskii>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 24 Aug 2026 21:56:11 -0400
X-Gm-Features: AcwNN1XsyG_yPfa06rOw21lMzHNipb4bKCM3LRKTxwonjmy8cD3qALFuwXGUsko
Message-ID: <CAHC9VhQUsJyvbu85Dzxobb8wN48o9v9TDCQ=m5dpWDGMFmbTNg@mail.gmail.com>
Subject: Re: [PATCH 0/3] audit: Measure and reduce syscall filtering overhead
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Eric Paris <eparis@redhat.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Amy Griffis <amy.griffis@hp.com>, 
	Frank Hofmann <hofmann@deshaw.com>, Noah Orlando <orlandon@deshaw.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, audit@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 2:10=E2=80=AFPM Stanislav Kinsburskii
<skinsburskii@gmail.com> wrote:
> On Thu, Aug 06, 2026 at 06:01:18PM -0700, Stanislav Kinsburskii wrote:
> > This series adds a repeatable microbenchmark for audit's fixed syscall
> > overhead and uses it to address two cases where audit continues doing w=
ork
> > which cannot produce a record.
>
> A gentle ping on this series.

As I just mentioned to another submitter, your patch hit the mailing
list at a time when the audit/dev branch was closed to everything
except for critical fixes.  We have a doc, listed in the audit
MAINTAINERS entry, which describes the management of the audit tree
and our processes:

https://github.com/linux-audit/audit-kernel/blob/main/README.md

Beyond that, while I have briefly looked at your patchset, I haven't
had a chance yet to properly review it.  Given a quick glance, patch
2/3 seems good and reasonable; it even cleans up some macro ugliness,
which is very nice.  I'm not sure about enshrining an audit benchmark
in the kernel selftests, as you do in patch 1/3, although it might be
worthwhile as part of the audit-testsuite; I want to think on that a
bit more.  In the past others have proposed similar things as you've
done in patch 3/3, but I really dislike the idea of adding more
filtering to the audit filter; I'd much rather see what we can do to
fix/improve the existing filtering.

Anyway, that's where things are at, but it basically boils down to
"yes, I've seen your patches, and no I haven't finished reviewing them
yet; your patience is appreciated.".

--
paul-moore.com
