Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73340D565
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821061; cv=none; b=HNnbQfUfMLMiYkkziZcCDTp5h9Y4C92xBM0Ekv+MD0JkSKRSRBFv67jYSphvF09v8qWLt+pUGAgiFm80dmPmaSb4njYU7ddgJpskH4xiasA21NUU3eyql4zL3qEbpVo5dKL3HTjZAXbfTzdcWy4hYTkA4TlVaPSwOgeLYLbaXJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821061; c=relaxed/simple;
	bh=dXPbsyRJWWoFEqMWFib4Cysn4+BaGubLkxC2/6qBhEc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YH97pN53RvjfFfHl0I4yaJfYBHkVQuKlyfO11udx7dSfFtdHqgNSLyHfaxY+O81qBEjuvDWv3zmKQGRIg+BlmBoHEp+9RC9O4xbtHi/JATl1aQTcfWAX+VB1MFTaI2tNoXi5WHeLtprdNAQKHiJRxFXLmnlnCk6Hrni5JLa/Id8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWa6gZad; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWa6gZad"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d560775ca2so16547005ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821057; x=1788425857; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wjW3UBtBE/XmT6KkSplPYiM6V7zSUQJYuA80LoB2NEA=;
        b=gWa6gZadG0TFjvHesOiMXEvnYgcfZym38CURq6GZ2x/BBolxc57rSyI1N3axRM1BS0
         OYq5YtoXdAASgl+vV6aCKwcD21LpZvg68bM5jGoiUn9Tc5JX5/dgJIfmNoTeVXDsgqqJ
         IDBRXrTDJr6gcZ9GkiWHCccP9F0mQuDkWJzF1zwNQ9pkD+0wowm7KDYjyJ9qMysiG8GZ
         PSDeAUzJtaU9EjERVyEIzoLXdSHlKPHN9Azxrwt6Jhe7sGhmCxmP77KdcpdJ/jReFd8h
         wqUrHiBVV/5YDiXV6fO5h9iKaAwvGjpraYm13INRL3ThKhv3C5iu4tBxjJ1YzVkGlc8a
         qx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821057; x=1788425857;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjW3UBtBE/XmT6KkSplPYiM6V7zSUQJYuA80LoB2NEA=;
        b=WreMo7FofrF2FQ6Epsz0sbClWY6irFIUkY5T+Q87P35UPMeQHCOYvpYv+g2PNH1XTg
         xWeESDydy7Q3Tb5iG689UH7qRAacmStMKLMl2JE2vcx20T1fxWAkZgwUx9knvJ6JgmGQ
         7n9imlpntm2L840wzkqvbM9GNv1q/h8poyqqPe0d3LX36jrdfeXMKEA9UAfqjEhmQclb
         ywMaECpOAedVPJ37lyDeTc7Ankf4izGu5ebGlVwMLnsEI51RlsW9QA4JJO8XA8BrEKxJ
         v0rtObTwNzxxHBVdN8XUkxAcxnG1WXgjbYAIarrjGdhLZVQm2whI4/8ojITeJmAHCre4
         /QXw==
X-Forwarded-Encrypted: i=1; AHgh+RoEhli0w7GSJDaJkwRblIK8E58fQ/eOc/TEGaba4a9yozwOiLGEcGcRLnN3/RdgG1cZauqPgfHn24LIPyUUI08=@vger.kernel.org
X-Gm-Message-State: AFuF++kivquyKvEFLFl/esKXRtXbMrwO2ideFu9TZnvZ4TvtvhCp4+cU
	wZ2DolaQx7lWi9druKMeBykSAlbzIsAf26H1hSotzsUt9NZCMgqXRqKY
X-Gm-Gg: AR+sD10IiBkumzR9Ptyla4s+uOrbKThhNGn0LnGoWS1mv26NaL5b5a92ug6cCL/vpDM
	ugn/ORpYmDbYC4kSIlSD54/rm4aKZgvxQYZ7PGZEgjhzN3jOG/TNJFtSSJegWEUWa4Ffji99VKS
	PWuiiAzn8j9Xy5ZP/x6zBsxAqahV0FjWUzf8qxzFzYJeUrSiIhBtfNq9PIvDHryz7UrK+4P+Wog
	xp+vCH0Fv0t65DEwWMhYgn8XICjE7XXzi7yuO7GF+Wc+4As0eJ2i2VuEVKyopCcB6PgsyKpUw8E
	qS8xe6Odv6RpHaL4fd/TUHpg4qKuhtobRs1eTd+FX3EkbRcTkrJVANAPXM1+Y00zVIdL586+sGz
	2s/6GkhbZqW8t3zoXpHWzXpF5gByWMDqw2eiP/P0h1AipzQsGZNxFQDSqNo74/jCnG950Mnr+Pj
	nnx4o+ToAQSh28EfWNJPmRU8f3MBX1NIRHQrVONTAd5lxTilqL2ew8Wf1CEBK41p3MAITXivlmI
	GvzC5PmmKdj2qT/npzi8uftDZJ5DL7y22D+bi4nhjSknn+yha+dyR2wbidfGLLVf9OtgMQCvRUW
	ShorZA==
X-Received: by 2002:a17:902:c945:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2d72eddd21bmr80438055ad.3.1787821056640;
        Thu, 27 Aug 2026 01:57:36 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70493caf4sm15181155ad.8.2026.08.27.01.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:57:36 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:57:32 +0900
Message-ID: <m2v78wueir.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: ljs@kernel.org
Cc: david@kernel.org,
	linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
In-Reply-To: <ao_541nBaa3SJS9F@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
	<f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org>
	<ao2Tl9CLL7WjHYun@gremlin>
	<bb9a3add-4849-4928-8b6a-0afc0c73b112@kernel.org>
	<ao2l9Ao7BQI6uRKC@gremlin>
	<m2y0dsuf1d.wl-thehajime@gmail.com>
	<ao_541nBaa3SJS9F@gremlin>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Thu, 27 Aug 2026 17:49:58 +0900,
Lorenzo Stoakes (ARM) wrote:

> BTW did
> https://lore.kernel.org/all/20260723093633.140989-12-johannes@sipsolutions.net/
> go upstream? Or another UML nommu mode? I've not been keeping track of all
> that.

The current consensus (IIUC) is above Johannes's patches are in
progress.  Another mode which I was originally proposed is postponed
in order to minimize the impact to UM tree.

-- Hajime

