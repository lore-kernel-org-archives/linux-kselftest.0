Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1817C4E73AE
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 15:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608787; cv=none; b=O0GJDx7qDYdxwL0lFXlAiKCoZa/tmHayOmnQXkYYfATFGCNKJNKQ1VMxI/r5aIRfmGo6nTidY1uLe6ZYEVHOu/37q+9PfHwKcHbFpGB9v5aPXJvJH0kZPveWf9AN+AQq23J7B9M3wh62qXTK/xugEGPPSoVLjsfk/rrNZsIkFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608787; c=relaxed/simple;
	bh=qFYBnXNYmhhsHxNx2COBADOmOdhhnVq5vY9GOOKIOJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N33jEXk5YfKE2zV+3nECxOFJy6s9/Tr0rpUSKc2porOO0B8myQ0h7QAiH3pp81Zj25yELvVI4L+Vtqhqq04VPB++aaJgxgmDu5ULN1WUoE9tYXs2hMP7QHHnexVmXfHHFyoJpal+I7YanCBRkm5UlZAdbM3FAIy7bk38PDD4g9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mcv3pLez; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mcv3pLez"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so130196a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608784; x=1791213584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2+B+TCtU6LhjPX3KEHp5ZhDWyuT2oD8RctAdhdkStc=;
        b=Mcv3pLezAFyOR8F75xJ+N1J+sl5iObide+S4U96tO+DgnijX5Dmv30l2bJPwN1+1O/
         aDuzJbHgkNaz0lfw14o/KwYbNznQUu7xfoxAvpVI93mnAYbKzBCw1eNQDku74CY+HfZZ
         PW4KSnS4CPVrTmns0V/auUXCoQVjg+oAMiGULt1W0MA2xWn7cLmEQSDCHD855uvtV9X3
         gmimRXAP+b8P5tg4Y1swbLZRAvkFTJbDFLJEEFCREXen1/VjjyUloPUHnLfUPQXAU4AV
         74V9RqUw2P+Fwuuwm6XSQxgYih2pRhfqAVjfgoKGuEwYAv6/0uviPGmqijunI+77tcYn
         bP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608784; x=1791213584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2+B+TCtU6LhjPX3KEHp5ZhDWyuT2oD8RctAdhdkStc=;
        b=LmLJQKawfjahMvt/ulgHnjSEO9OC6gfGwcawQ7qH63UG1czrxkShSzfFEiqjfW/083
         nwzJlBgLrpNIcPi2N0YV0VhfC4iwRUx1esmiL9JFGqVi+pZY5ZB+zFekHQl0tAPHYWWt
         Nzy8m0RA8CjKa9MHes7eUFu0kNLjaMM5AVR2ZBeA/h5CCnnBKY8QuhNFMnfQPTIj4vx9
         2ZlrnrWROg3jof+inc/x2IsX55WwecXvmG+FqK+pEuEiceAnACEM+S2Yh/KVuvBpqbLx
         HYyLj1qX3igvj0/bP9hFeDOHpQs4L0lPp4eh/bLWVNnB5+ibxHx2vhxwHczBaYxyJxxJ
         Imxg==
X-Forwarded-Encrypted: i=1; AKwUvByrFPuM9tnRddAMYjKJJoUGiiruc1/uatiExllmFX1VZLoEeADUC07USbs0mCxBNtXwJIHR2TxBX5+R6VOArEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa9eVpMkwld4pTrcUhM+Ufa5B9FuiEbqCOAHw+YhyBdbsY0uB6
	UFvzbxeOdndHSNTgFyjDSLy2g1ExUMhGiB7er5qYMLVtQpfc4vu488Lp
X-Gm-Gg: AYBFou2Z8SpnLOeSJF/B3OaLhVYkYNadCyu4HT4Y6SECEuHoiQzfgW9vkJiO0VYsXDy
	KZogE2emEPZ/3uV5Vx8hUrXmpg935gvrz6BW4tyeV+6vsnnGPlnfw1Go0Ce2U6XdAwiXj0mG9SS
	YyS9FApwY2xx/lvGTvo0l258in1YRn5nUFJeqsj8tsn6znfxXdaH7luoHBnSzYsHIng2M0tVt1q
	RgBSKqtTvaGh6yd+uFbLZOPE2FAafk6dK24XYdeSBbTkrS3CXFrkOg8KQUBzJFezL6uD8BDDMEJ
	XGlKe+xvd/Fux7VrFBJQIG9F2EhysEhGqCgLdPrwtfZBKYFTvK7kvnLoRL6TQ4z5Hpo0lLuOQS/
	4eZR31mLWZeaKYCqXVx4k6fiSsvUxb4s8hYouIbDJ9mPE2N5XNx7NaA/kzg4iJ8onfJJvKd7jKo
	1Dx4OblQptfzvCky/rnPNxnACiGCVgFZut6uZi306LQVW1g7B0YtYdZmhzL8/JGTAGtoe3TfpEt
	rpxaAi6dC4dzF3CMqM3cdAjmV226zdE8gIWrA1Cy2PKsAN3coqI6yvBEIPlZLXFNJYP9fdL8dRg
	1P+xzDc62hDskhSuloBXwVhi7FdhiX9Rm5wdgy/IfB9jyAshhcc8diblXZ0=
X-Received: by 2002:a17:90b:3908:b0:3a0:c20b:2fdf with SMTP id 98e67ed59e1d1-3a0c20b3132mr6450444a91.17.1790608784281;
        Mon, 28 Sep 2026 08:19:44 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9feddd0sm7247965a91.2.2026.09.28.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:19:43 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-api@vger.kernel.org,
	Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org,
	Karel Zak <kzak@redhat.com>,
	util-linux@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
Date: Mon, 28 Sep 2026 23:19:34 +0800
Message-ID: <20260928151934.2686418-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arn4xOIxFRD8qY_x@infradead.org>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com> <arn4xOIxFRD8qY_x@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christoph,

> Either way block devices must be safe to be called from paging paths,
> not just for swap but also for file system based paging.  So this is
> a bug in the implementation, and not something worked around in the
> swap code.

Agreed that a backend used for paging has to make progress under
pressure, and the zvol example was a poor lead.  The series isn't
meant to excuse a backend that can deadlock; that would still be a bug
to fix in the backend.

What I'm after is different: backends that are correct but need
memory to accept a write, where the better policy is to use them for
cold-page offload when memory isn't tight and keep pressure reclaim on
areas that don't need to allocate.  Two in-tree examples: zram
allocates on writes and fails with -ENOMEM, with no fallback, while its
logical size still shows free slots; and filesystem swapfiles must
give up copy-on-write, checksums and compression today, because swap
writes bypass the filesystem.  I'll make that the case for v3 instead.

Thanks,
Matthias
