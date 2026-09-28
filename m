Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E4E4E73C7
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609090; cv=none; b=q02qdtzMunWAsJPft6sWkFKNO89xPnPtFWV1iRf0g4zkAzbOE5izFOyaQxEK7DRwgSaY4FP9DZU6HXaW58JFclCuCSYPdcW9JlFatBRZcAPhaUD2iT3CsCrR1SSaoC53EF2WhVSbHRqXWjDHTtEBXU/PryAROujj0ZoE+jHuhx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609090; c=relaxed/simple;
	bh=yxtx1EJ3OSLAngmQ5We+tQv0+fpWAPHQncr3wp30thY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBinE4Nq9h4AKXthqStIuIrAKBw6i+g9t+UBv93NsJ/ZCrpxvnsuoqSOqTT5AXOfEnsxfUCBk3A9ywqX0IpO2twH9mQvFzfEE7zmR5k7AkdedW10oremtS4EORoLp7qey50K05TNVoKiXgXhSh+m9/0G3PJzHOtuxF05ZnR+rQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pn9ZdRYv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pn9ZdRYv"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd53691be5so21540505ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609088; x=1791213888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6Pp7UXENL802jIZX5zKHy4TP058XOOA4yzitIGnZCM=;
        b=pn9ZdRYvlkN3EFcS92im4IWq4r9xRxvYrshv4Q1xuiS+F0Q6TInugqBpxE1cCJPEKi
         RVnvKxFS1fBtxAP5dXGzfj1uRL/0XT/zYu7+dpWXL6cxBHyjc7qwQlhGgJyVuYtsd5Zm
         T1z9Df90tFp8nafD49suOZVEHH3GaD7yr4IyMaP19h86GaIdOlDfE/FDPlGGEASfEkm5
         t0QLxT1NgymuxSqRuD3XxyuCz5nnfAhOHQux10k+lL9Sd9I4/uwSmdIlwiOftk17if3l
         AUe1qpcJPApLvztKFL4C343Ugtdx01iJQ4uHD3SlX9uzYFrBv3jRZIm2L9/Qvn7qpdD9
         6FGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609088; x=1791213888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6Pp7UXENL802jIZX5zKHy4TP058XOOA4yzitIGnZCM=;
        b=oxeEsLq+PLfD53vkufzz7k6h0N2VLiE0A3kZtTrXogtjEaSkpUd4Hh8nSrBq8AGPNo
         V+rsfSk8JD61+6OPI4U9GakBIyiKP3IozClLYVgEyhSxvzvtcUvNJwVDgNogzEXD33oy
         /iXYKlIHRSd+yur8kvEFDt8YJu+lJuzNCgqEMrZ8KkZKHmr9F7hj3kly93fuFxyMuczm
         Gb/5ctQ3JoQdlkZ4XOgvLffY1h4aF77IViJG+RqUsMnH3STF31RvaXVW+84w4iykCEso
         Hm58+8U8fzWXv0PMntVJTp46MHAbW0v3gQEZhbygGWjM5P9Goy2375R0bblwEU2bxNwq
         MmXg==
X-Forwarded-Encrypted: i=1; AKwUvBymJEn7jV/n+UAD2u2x+kVWkvr0zAxs1SJRtQIvEBYx4tfipjdu6QUJErdCx2CT/dW2MKfCLcIUTZoy5SlfEmY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDwd+pUDVScQgbABq/EMbgtcNDnGYQeocQX8fvAqaTgveKbFuf
	0ppP+YFbYl9VJL86eqg6sTmWqYJaEC7Fnits+PmXXcesSlc7thOQNgY7
X-Gm-Gg: AYBFou1Ru/h6SftFzLKRd3Q4W/cxSkkRelKc53W9+RusaBVcDBZky7Pex6aWaWvnVAF
	dVKUjsICWEYi6ECSGJ+UtPadJ1EeZoQfidN6SLC6wD27izkerYADFPg1k4/fFaeY2RTc3+ZoCUl
	km4ULsXG62fV+cW5RDgYfqkf6hcQpd5EF/bjY18w+SVRoN2SsRtqK9+bq5MczpCicub43NnbF6y
	UpE1osjImAbFqxHdLPGh94a+4ctTOe5SQz0fQozdqBCpbM1u0F7FFGNqGdLa0eme/Wbyxg2ANmc
	LuupajNJmZp9LryAbzp/EVU/HyE5LZZuEdxeB30HTRJsIy+jI/2+GwdZKV3QDZsaf/57xii5nHu
	s0rgmAtrxXBBk9iiae9DImV41Efb49Z2y8ZQgO+OYUXuboPJqJtJq0YFkm3ZbkM31XSgGhZFSI9
	lLukJ3gZNWD6/qtHpgm91ogVoigahC2bdng98afRKZAmtskb3b7EEE4OP19n0uJkyExA/Szk5TZ
	nKEqhFfhdqgqgP1TTyZ2KGZZiF6Su1y9jBCcGSTfXM+IJSgrdVYzLp8d1Luaqu2Cxg/1RTmT+kh
	JtCy/T7ZxQhQmkhfF55mzjUqw4Mo4QAE4neLIMmEX+JFP9Uc6YTmygEIx7o=
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df94c1bc19mr71037265ad.51.1790609088305;
        Mon, 28 Sep 2026 08:24:48 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfafe765cdsm25166465ad.33.2026.09.28.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:24:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Andy Lutomirski <luto@amacapital.net>
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
	Vivi Rodrigo <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rafael J Wysocki <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate offload
Date: Mon, 28 Sep 2026 23:24:38 +0800
Message-ID: <20260928152438.2694783-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3FDF3191-94A5-42B3-A33E-12021344D7BD@amacapital.net>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com> <3FDF3191-94A5-42B3-A33E-12021344D7BD@amacapital.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

Thanks for reading it, and for the direct feedback.

> if the system is under overall memory pressure, why do you care what
> triggered the particular swap operation that is being processed?

You're right, and that question gets at what I actually want better
than the series does.  The goal is: when there is no memory pressure,
swap-out may do more work, including allocating memory (compression,
copy-on-write, filesystem-backed swap), because moving cold pages out
to make room for page cache is what swap is for most of the time.
Under real pressure, swap-out must not depend on that.

The RFC was the smallest change I could think of in that direction.
It used "who started the reclaim" as a stand-in for "is there
pressure", and that is wrong both ways: memory.reclaim during global
pressure may allocate, while kswapd with plenty of free memory may
not.  Building on Kairui's suggestion in this thread (swap tiers), or
on virtual swap, may well be the better route, and I'm looking at both
for v3.

> Why can't the kernel figure this out itself?

It can: the backend knows whether its writes may allocate (zram knows
it compresses, a filesystem knows at swapon whether the swapfile is
copy-on-write or compressed), so it should declare that, rather than
the administrator setting a flag.

On the practical questions: v2 does nothing to balance fullness
between areas or to empty conventional swap, and does not change OOM
selection.  Those are fair gaps and I'll address them, or say
explicitly what is out of scope, in v3.

On the recursion question: within the reclaiming task it can't
happen.  memory.reclaim and per-node reclaim both run with PF_MEMALLOC
set (memalloc_noreclaim_save() in try_to_free_mem_cgroup_pages() and
__node_reclaim()), so an allocation the backend makes in that task
never enters direct reclaim; it either fails or, unless it passes
__GFP_NOMEMALLOC, dips into the reserves.  Two things do need care.  A
backend allocating there can drain the emergency reserves unless it
passes __GFP_NOMEMALLOC or fails fast.  And work the backend hands to
another thread, such as a filesystem or zvol worker, runs without
PF_MEMALLOC and can enter reclaim itself; that is only safe if that
reclaim never waits for the write the worker is meant to complete.

> The remainder of the writeup is IMO somewhat incoherent.

Agreed.  I cut the v1 cover letter down too far and lost the
definitions it depended on.  v3's will start from the goal above and
define its terms.

> Adding "eligible" to a bunch of calls does nothing to explain what's
> going on.

It exists because v2 made "how much swap is free" depend on who asks.
Reclaim itself checks free swap before scanning anonymous pages
(can_reclaim_anon_pages(), MGLRU's get_swappiness()) and before
allocating a slot (folio_alloc_swap()), and callers such as the GPU
shrinkers check it before pushing objects towards swap.  With an
offload-only area, each of those would otherwise count space that the
calling reclaim may not use.  In v3 I'd keep get_nr_swap_pages()
meaning "usable by ordinary reclaim", so those checks stay as they are
and only the offload path asks for a different count.

Thanks,
Matthias
