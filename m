Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901042;
	b=QHlFSgOiUQ9VH+0gl5xtnP8/ddhG3ZucwHtIo3pO8E2wsvIdHncYkIeP42YrnEPLoxTs
	 GhVBXaABsexFFWipx0lKo1koaU5hBd/ee9UGXQR1nPSda4NascLQh86C6WZfi3ge4VHBF
	 y/MR06zjLf+DMpnnDWABzCvSlTHJPZ0GfollI/tLjjWIQ3XGPqyC07+1XW866EwTjFKhL
	 zbW1jRON6AfSH5NC1RwQN5LzyyQnoa0UawJsbmdgX0sDCGDTsKFWbOh3jF5dweiMdlGTf
	 UtiSoZh7XN+W9Jm8yr3SCz5QHT9HQbZStyPU7kvX8i29Wv5NqooaaU4eWCEwFOnbyEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=gId09eW4/Psy0JauoROKgf712hQDkeOhkjrKn0dSNTQ=;
	b=S1bFSZAi8eqh4gqaIWF5uD8GLEzGwlcGl+JtQy9jjaWeqRt8NfrG1f43ABNsI1XOiYpe
	 YuAHFO7WEvZPzbxrwezyPCBDKuwSA8yyQcfPKBA8wUpxm3Wgz1LhnPMaqATwEpRiagTs4
	 ipr40z5cvqM1gY2ruBQG0Zmb6+JkVNQyPAcypKZW0llffvchqESeOwR6ZaaDqgUttrWi3
	 kLjvmWHe4NzHny9OLjLEsuzBVUkztFpwim0d7UK57KuicucYf1yl04F3wglkcyYkeTOzB
	 N9NfYYMRlNyAfviH8kx76XQB0UGAHL0l5UqV0fJVeVaCQQ3I7l3so4yAiFwxWa4LSPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCMZbZpH;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67A0606A337
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 04:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D67A0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jCMZbZpH
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so362121a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Oct 2026 21:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792901041; x=1793505841; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gId09eW4/Psy0JauoROKgf712hQDkeOhkjrKn0dSNTQ=;
        b=jCMZbZpHovCuF26jrCaIXkA0XyCql6/lsi0nbXXusRURQH0DQtsXwimLb5DEAkl760
         9Hk0Kgd/z3ATVXuEjixsqgG2gODGUZuD66AI8MY6dV9GtoxAgyTXSNp3UgDn9RlNvUrd
         7M71REEdijuGGI0suGbD5t/6WvaPxiXYKYuYuMvg/Dkz0hRdjZA4BMlEH4i2LXf4UEsI
         kSgqzrvqqaYMgWEX/kVBpRk60w2sOiKlqFCwY1Mtcb72hqsyboQTr/KvWkc2QObq5EJJ
         gevo98TpziMiDaevzd5fGX3hXfxu1QbaRBd2qO1hQ+IZdb35dOH/cHPVt1oHc0qo7xQR
         GMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901041; x=1793505841;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gId09eW4/Psy0JauoROKgf712hQDkeOhkjrKn0dSNTQ=;
        b=KsS23s9pL5OqJ37I88dM/0bnrYrCI+Yw39quNP4fKczf2GsJbvhkrVFbOYjpyKrmnr
         D01GtNDClbXY6Aa2Bvj8llI+L1Hy3ApX65TZJ+fxOyViqiR9y9v3pA7axI/WuRYfQrhl
         TyEGL15hQyklX6GGuo7sVtqlHovGNLRZGJzaI89bUZTj/TVdh0AKN6HY4yrXBEV2y8/Q
         0oprYXiF3WFufiuqxye6g++NLXeUqB5pZW5WGSQ4sRd7bv6QsEVWjT/FRX/K7KPY6g93
         dpKlTZ9cm119T1z9CDQSB87ZTzK0ImDM2oy/JXY+dgU70Y2GKSGQHH9cRA4qJc8FbLj6
         4VlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPBJHPMrtH7NTWj/PM0cpWCelX1iy58bGHT8MYXHzBZ4il5+yeBwtNP1I7ZI9tGg5Szc2ggJPTVAOxBYGKi1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCuxDoKgw+S09xIfI5ceSE6n5upbiFUU9UhEwRu0R0iDrGPCnQ
	HgA1Z2MmY6oSqCa2ahVpycaLoGeAd4MgeVmpaDnmp/g8x+3tWIicKZ8+
X-Gm-Gg: AYBFou1+su8ME4Q0EaTnSwyceio7GQJBETjbUqg+xho9U+hnOY5flffHg36E3sCZN6U
	4ZEVOP+VLe/j75B395NI4TLDl2l5smsJTpI/VNyV5Ru1HP9PmBhIhsKD+CcN2hEJTlJnxnYPzRj
	gfa0NMdhKH0ywUP9iZQuoF9jatjhl1g/0d/b3ol8Dvn2Hj/hbkKNgBR1xGHVlUpPo1XUog8QgT8
	jBRTztViiPoLRUe7aQXz7cHaUmqIX0GF8Tz4ASkP6IV2OaX1zUUqZ41K+QYkG1KEr0x9bXgB08/
	w4SI7ClztOgR0tRcqTSv/joiN30jpyxYSAVU+mlHabDgqXaGddkeaFHaRXmnN5NrJdY3iM8s53W
	uPLcHwbRm3Qq+cWoc0kX+volcO6pafumUpECvh5/dpio4bgVYziStfnIRzfDZtDk2a7tEyFKRTy
	Bh84551d9HyVSeVVgle2lAt9TTZb1paXdgk+NCZaEz4v/qgQyS02NoSZAKj53CwbGCD0+u3kATA
	kTvaDwOM/Ca2nqBDEL8FEkb17ptpgZqUQxIwGpLYx1VqqgWJqTZMl3GINrcL4y2FD9soOg+HXjJ
	SqX+O9eHSEwAtFup+ZsTxxEkWh70Eg4hj4q7iizNele4YcPJCbu2HKXXBE9a
X-Received: by 2002:a17:90b:4b05:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3adeb197eafmr2849652a91.64.1792901041321;
        Sat, 24 Oct 2026 21:04:01 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb1e37esm2940351a91.4.2026.10.24.21.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 21:04:00 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 04:04:00 +0000
Message-Id: <DMDMDJ9IQ9DC.2I7GCTCJYZ68B@gmail.com>
To: "zhen.ni" <zhen.ni@easystack.cn>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <akpm@linux-foundation.org>, <vbabka@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <brendan.jackman@linux.dev>, <hannes@cmpxchg.org>,
 <ziy@nvidia.com>, <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] mm/page_owner: add bpf_iter and kfuncs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <7f9a9da5-1250-4be3-bfa2-70e4b6051197@easystack.cn>
References: <20261021112437.1799213-1-zhen.ni@easystack.cn> <DMAURQCKK6CG.10CZ7MFXGJO3V@gmail.com> <d39db4fb-e511-440e-9065-72c34a1a295a@easystack.cn> <DMCCBEPCIWH0.2JEDKE64WPJRQ@gmail.com> <06925440-8df8-4f2e-aea0-ede1a98435fa@easystack.cn> <DMDAZW82I9LT.3FNX2WI80GNE2@gmail.com> <7f9a9da5-1250-4be3-bfa2-70e4b6051197@easystack.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 24, 2026 at 07:16 PM zhen.ni <zhen.ni@easystack.cn> wrote:
> Feasibility isn't in question. The question is whether we want every
> prog writer to reinvent this traversal plumbing, or let the kernel do
> what iterators are designed for.

What the prog and user space can do on their own stays out of
the kernel. The reason for the nack is the same as before.

I'm done with this thread and all of your future patches.
It's auto NACK for all of them. Pls carry it forward,
so no one in the kernel community wastes time on this anymore.

pw-bot: cr
