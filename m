Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978208;
	b=J1eZJVr5mdLXIYugW5M3+PpqToWNYrH2sINQE2eDVo7EZtP7eBjEn6UNWuRdFwk2vsCj
	 draM3YTjTfhh9ClX302QbgBm9XXxkeF3Bba2IIKqv3jPglQp/FeKtBSk5vg/4ig8LGsMh
	 Uk4xx5e4BT48L7/YQl7/kG1v/YLYrKZbl8ExQRo8vj1q3+F8TACW7//sz+QB5LN45boOC
	 R/Y5Q+5b0Cr5OUJnp+Oa0rp3Uqjk1s0zXEFJwIuZT0B7TxzHvQT3Xa0x93PPBR+7MuImI
	 my5S+mXKcu8YgoGEfbSVraa+sJkuYiwEFKjyMLZh4kHW8t56EXK6NIFxiXbMKA9o2Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
	b=sCrBQUEKOdk+iCJbYZZH/l9/APFQvgO1zwRs9/U5Z8stRKX1P/2q9t82x2oYqd1bwUoN
	 8nAMk21ReRcX7Ojx+nGyXflNldie+f/aQQb4kSCKiUM+kp4AgzcqWP+1kUqFh4nQbVrm9
	 XKsGQEAnzELUq+S3BpFYeeFS+GojyIcQBC7pX+DEu1yvaer+mn3wPRzU2F2t5XmfNJ4SH
	 s2wpQ7xy0RzyDikpPGYCiM85/4/Xts+1Pqlq7JHGrd1i9p/D4XdjF/vVZADGCjXWXmUhl
	 I0aprncPUfKQNYD002jrEMQiUEYToEkQAtobweOjZtxTpxPpmP0tB/9R7vTMp9qvMtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=db06y5rc;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E3606A31D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=db06y5rc
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5365d725440so21352731cf.0
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978207; x=1793583007; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
        b=db06y5rc/a42Q7I6gZJqHn+6RdhZMkCe/PM9bPSIkdzdKIQhT6awBXpLvTCqXMFoas
         vpdrgYSILQX6pa54FHjgkevhT0qw3vOv7aSYEbQ9kISBjZHIWOApblEsWdkQmN6fLDCk
         W24B5RsU3rGvAf0IivQNlEx9/t6cNsuLl8yuZxDFKTzIMJoEtBNayYZmAA82jEd8Qd07
         WLcOpzJBZ1ttIyv9gx4mwMIdcqToXkb+C1ma90FuzfTAC2kL+RjBEThxU4bAZuzQSInS
         TiQlkuu+Cs+eQO0ocaFK76BeQh/XfL0G6SA9Seh5Cl/7aXXbcPfIvztM8BV9n58h/Na5
         xQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978207; x=1793583007;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLucmKFZvG1tvT3qcDSQQ2CfWxg9+UtyealuVWZ2qVk=;
        b=G6xoqA83tpdtvGgHng8foky5LZt6KRErmi/UrIHShgny3fcLXEeaIH8sCJrxMx8kan
         hLkCz0QN2SKBHI/B+g2X67lZA40Y1jNXRnN+QXMBfd9y2QBSRVuEUadGRcSf5i7vA3pk
         b4g6OlJPR+SPVx0vKRcJNEqKo9H8KuPGUK3X0HVwq4tBegUQ8Wvqpc3Cv3yhWaQz7ie4
         nZ8cy3lWxzU5fy/f+9/7jCI5Vgl2XKd8HeOsXNcOmzXYRaQMjPcRHPDApRVckwnFcTF8
         PoOpjd+2KaANgRc5VTgTjY23a+wkBXAfJcxFnECYL5duSsPHIa/I++Y6UyXULsGiY55K
         riDg==
X-Forwarded-Encrypted: i=1; AKwUvBwwLpQ+ZBjdZ7S7vjrsf37fTmlTsspxOzdbQPMpn78SKsra28LJwyOX89FrNaNw3OjuJm3KCjPxMC4PwdDXcgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwzoKhwGZsbFTr2SZUltIKYjBZrY9nTIFSYGKicdoESHk0y2qo
	/sUN1KDveATsKKzLh695RjSmp8p3fLAXvjvrpZcyD0yemssnqeAIigel7oKOya8=
X-Gm-Gg: AYBFou3OIfSsWgGQ6mwGjRuMGtHtDyscJPF6A7OWPzVjFmt5qQAyd6RRrl6uP9cHGEJ
	3bVoy2vQj80FiG4QGmdm7JyWGBLTsopU5SzFbiJhu7b93C1zbKps3FeBRedWRbb2BqT7d0d2KEA
	T7ajRhZsMz0Ky86R6SM1xnZYZ9gGe/NFH8vRiIL0tYIabUp2rRPUYD1QhJrDbv2r3tzJb75+dEe
	llYW+UAVZyhF95Gr01+v2RL54crWUDU8MJWJrAAt8th1Kxw2lvpV1+v1BCekO+knDcYq9ddJiOP
	kI/nXhs3esLnD0HPQgG9EJhWz0spniqOg6JbiAKaT3ehyU3fAsRYHKlVU0y3pIPO1sb7Dnm+AQQ
	Ec56q51/jCdyZpdnMi93vqiirh9++czqBbHi37FLFQ3/M6BUGCx/69QICBYz9l1vKh3VxTznfFJ
	Ajws07R81xDn5qdtUDhAlE9l4knCTDDOr3XILcRgJwFfbcbaHf5eWyUL0gLw4yQZoSgXoaqZXSM
	9E5qeYmgCkQqFx0mH2VC/31/i0aBs1XgsJ4j3Tarqh+UbfmWGmkipE2RnRhnjDlIogbN1yt6dur
	GBISsOn5hZILOCZfIozrPehTG6S6R/CYJxKIp5swNbvi6PnJUEBr0vpEV5H8wV3Y6LwcLCH5szy
	3OxzAVHhwQl4renUP5mtFIP5xqUEh1UguYWueWIIPbg==
X-Received: by 2002:a05:622a:5c6:b0:536:5c86:cfd8 with SMTP id d75a77b69052e-5383b5e681amr81425591cf.12.1792978206784;
        Sun, 25 Oct 2026 18:30:06 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970a2basm44270051cf.18.2026.10.25.18.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:30:03 -0700 (PDT)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
To: danielmaraboo@gmail.com
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kunit: document --summary and --failed options
In-Reply-To: <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com> <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
Date: Mon, 26 Oct 2026 01:30:03 -0000
Message-ID: <179297820301.2598507.8486986636667612321@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Daniel,

Thanks for checking the entries against kunit.py and kunit_parser.py.

On the indentation: the continuation lines in the patch as sent use two
spaces, matching the --json and --junit items (see the raw message on
lore). It may have lost a space on the way to your tree, but please let
me know if you still see the warnings with the original.

On Assisted-by: thanks, I had missed that docs-next dropped it. v2
follows in reply, with the tool use described in the changelog instead.

Thanks,
Eugenio (Jay)
