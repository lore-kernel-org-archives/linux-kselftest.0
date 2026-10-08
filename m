Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971E4AD7EF
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470037; cv=none; b=Efqsg0C1RN+pBlEO8p878oURSFHFGE211chutVJaDXJBClTNh8i81t+AQJ/wBUbTirQduDmRPDxZ3327+lu/akK6dd/TWsWR34kK/+mBYOCUmZNM01ah40roPSoXzwNuWqIiE7PpxRAYGqXpqmHH/b9E/i1ZmxvHxd2dObwA9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470037; c=relaxed/simple;
	bh=5lqxpESQ6V/XicaJ9Xaot+s0L3lJnZcBFbt0R2o49qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXU/I+0Hb2wrpC0YIixc97buwCDw/uKGj3LQ6THD3oByIkhMgxJbfn5ixqYHOa/jK0BzFNeWLD3rQP60hnXLbSmJrEWZwXSHoDbO8jNKRIvthDX+kihekzI87jIj0YYhIEo7VP9QWPabIUP6m1QjYJp3RqtfjY5HkrnjUAx7bRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3+ESSoK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3+ESSoK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso48767995e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791470034; x=1792074834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXPzoBizfB3Zhzp9AvQgFrXj/t3qSr+rJK2orUNhlP4=;
        b=e3+ESSoK+uCegrZcJDnhCvg7WCuK7/Kuewr08hu3JWTgOEQ8m+uSuxe/ZM9HvRVjlY
         aGz9Kr4QgttA4apt/xsDKPUhAxvzRS1AT173njrRg1BAloGlXdnpnNAdCMNwqLUBIK6I
         eVtU415adglF0fsttk0tvMI92nTII0JWz5PjS+wFrZQ71Y+9oivtp4UYTQHaY6LELMu1
         1GcKQEHDAPAcm/IBGmPfPF3N/LnQu/jt/m95c8EbBqbuje858oybzfew8XDWVD+qVayO
         tugg9467ixL8Bzrx2Kiq//W8QvU7XNzucCzuCO15aTzlwsJ76ZIpl7EKwtS5yHP4T2C8
         u0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470034; x=1792074834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hXPzoBizfB3Zhzp9AvQgFrXj/t3qSr+rJK2orUNhlP4=;
        b=h1sF7HIAeL5BKO0FL9Wt6MJykALKkgql6rKABhGeLfxf+LQVLWGRg4Q44S5+Q4UbgM
         wChmkQOTXWQEa0CTgbbRahKd8YIha9gLXN64Pq+aJlJ8uqHSlgaYsfwR2Z4/l9dpOYNF
         PI8SuAETWbaTNlgabHfaOu9zKSLE+fS8yCX5WN6IDzUN9E4+LqdTgI5Yh11fe59uYQIb
         8Mo8P1QIsVXrUAJCfnD35laimiTtc7CVTkeFLAtTimbz9N+b2frnhaHCABk7CDpPD5FV
         YPr5pBnh3ZJzWbNdOFrmu6ciO26XWs+EqfJEaFG3JPkMAhBfX002PsWyMPFU0Srj7IGi
         vU5A==
X-Forwarded-Encrypted: i=1; AKwUvBwA9lYZQSsqXPeAmROA8VBIqATcMYyFjEFzByIqti4EdOKwYl0Si1XvYiBV2gJm5TuGpEPIFeu2l728qxqHVzw=@vger.kernel.org
X-Gm-Message-State: AFuF++lt3byEqw5p7TtH6WD4OCPBT7/XuyLY2rq6a806fO7YahLq7xnO
	yPYy4Mbxssg3+pFWB8gIGyEmUF9fQiiy9nYazEP3IAtLdqJbrPYMOA4H
X-Gm-Gg: AYBFou0ddAuclQXB3u1q6aBuLxCQOU34pCv2Am9R6EJ/znt4V2V/efX+wOx4o7heynG
	WDKAkhUBjkXlvUQZS1bCoumjuBwyDjmPJY/MaHwiMjvf/CXF0OOIqvsqHle7JNW25c3nQXO+wH/
	I6yVxP3sYhpHzXje8WOAYVK7IZxwX8UkwNNGSY46bOZ4jbRScmDH2ZPLvaD511/JG/8hhfCoRaE
	pBIKLaZa7JuPTmi5MgpuPuALx0OYSEzyWS2MrKWsKaDblCDbaNzuERa0slywFLO8/oyPS95rDG6
	7aeOif7QvWgViuu30P7SR/ZSG9q5rWm0cnEeoez3ds1uesFNUW1Th5udYrZI8jwtp8nJ3wakmvp
	/LBbbzmkBtnQ0ffkOOiImZ+yxufyLAtq7evlYUjuGsA2uzNSusJ1+Am0nyyMYl2CK2MOEGSet/6
	oRCGDy9z6kNVBYCQIANrGRRNFGiKZ5TvT0q03ySCc4vTug/e7AeM+muk/UL4NR0dYkvd5/pohxv
	VcJ0pUcdPnmR2jz8OB8A6g=
X-Received: by 2002:a05:600c:3f14:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a1802eab45mr119115265e9.8.1791470033804;
        Thu, 08 Oct 2026 07:33:53 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18360c5ebsm57776665e9.3.2026.10.08.07.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:33:52 -0700 (PDT)
Date: Thu, 8 Oct 2026 16:33:51 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>, linux-kselftest@vger.kernel.org,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 00/27] landlock: Selftest fixes and cleanups
Message-ID: <20261008.ad487961b23c@gnoack.org>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>

On Thu, Oct 08, 2026 at 04:25:29PM +0200, Günther Noack wrote:
> The last few patches are a bit more cross-cutting and probably more
> prone to merge conflicts, as they correct cases where we have been
> using EXPECT and ASSERT in the wrong way (details in the commit
> messages).  I believe that the rationale for each of these is
> reasonable, but I am happy to discuss.

Minor post scriptum:

That's the last four patches.  They are large, but largely mechanical
refactorings.  If it merge-conflicts with another selftest
refactoring, it should be possible to replicate equivalent patches
relatively easily with the help of an LLM.  If you prefer to go that
way for the last patches, that would also be fine with me.

–Günther
