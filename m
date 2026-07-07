Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C1423798
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460126; cv=pass; b=lL2H7oitYC3o1/Bzefk/jcCaW20285PvYmB7PWkhAXJOZvPPSzG4tratSpV/ncU3xq0Oz9yw7AUYuvxnsD2UM78XoUeYCqZZT5Ygkhk1TKpU1juFuRu+U/osRFHcML6SsQJe2H1i6YyC/+rGN7D1mHg58vGxX2UYf6D4effq6ZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460126; c=relaxed/simple;
	bh=6TvSEo37Ek9lu9N2ZPyjBCqwdDE/+51lgxZ/UejOrQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvuSLr7n4DECXNlgyLahDsyyYmjArR6bR106RjDvUYb7VPB8qkWuD4VGZYHWgjIhAd5X14xh4mt7o9KO1wtPxjqYQoC72zvbgvIGeuUUVjWcixf4o/zqemMxQWWoAef7RVXi6cU4NHf2818pwV4jxQhsaqUDPakKssGOXleS5+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjCzsYNh; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjCzsYNh"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39b237fb695so152841fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 14:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783460123; cv=none;
        d=google.com; s=arc-20260327;
        b=ZB1YVKkN+WQaMgNrYoyrymQFFdmvGIIahFCvKKMPUQVsUmjXx0SKEtbWZXmOe+ymDP
         oMv1gj/E86RBqqxZILCQIl6FBRBhL2Kly2MMmxV/oV3iRk7OGbrY5Ld+H3N+K1wOivp2
         xQcR0xzV4rL70W3rR/ANARA5C5+1egnaloAtpHPzUhvW73Cxj+ow8m4ir8G55h5HHON6
         w5iPqOHwFkoCSZB/3cwdx6MvH/SAoz59mOgFWzmRCIGLLQhSjjj6IoJ3u7sVZCibeyD5
         dcqizHs/Kl9xqyu2CgmHXlDA/dlAKCqyESdLRC42hXdcz80I8HG2b4I+rGsU+4PuLszv
         HU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6TvSEo37Ek9lu9N2ZPyjBCqwdDE/+51lgxZ/UejOrQs=;
        fh=3Km5n/oDttugvoB+3H5agwZngUQmSCEI7Yj7LFgnzpw=;
        b=KSrRKzq0XitpDu0ARYcCwBJeji7yLXnw2L2+KOuai8zbaNyU2e+OA6yV34Mj6pUnn+
         QiL5pMrpeCIyZpdCNL+6ztjRabTMEWyJpNBsVUCeQ1CeZPafH+totTnRck9CxXZNo0nU
         izHIn7ipcj32n4YFuecvLzm/PSX2qyXHUR5m+AuRMmKQ9vbsXKQZfL23MpCp/f7A7Qgd
         hKARiiEdTenjbWIqDjHRkTC68XwGlszEbJRx52mtNMc1V3fE5vrT0oyHWiEl08QZXdr4
         HdBV826XIKvMfPDIFPwayPqSAyccENy5Vx6CGSaYp84pEOv7QUvaTxP+/DQmCw8llFhJ
         LClA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783460123; x=1784064923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6TvSEo37Ek9lu9N2ZPyjBCqwdDE/+51lgxZ/UejOrQs=;
        b=ZjCzsYNhE25WrU5epO1JPGoPjEXvLjwdIplph61GHD77P/4woC4xd23Gc5B4qVz68A
         Pn/g9MJsWWeE5C35ssN8dFc4lGqAhIvD3Nh1bX8vNjCWpmHMRXRJQ9qXy0XEV1bkhqMX
         7ETpMraxlSGvEBn5UeHHNF47EKcy7/sUtoI/OuDg6LGdVwsWn1YFYq3+8pDIkHobx3N2
         Ap/1aqArv/vh7wntoDmElEcok9ja6y5bkxC/PrQt5WgJVUD+i57hDm56vI906DR/9v7V
         Md378Tc3IH0Zyuky7OFPjZRgJrieBwDIFeppYqzvfnNYcO0XGrn5LA+NePYfmiZAMP7n
         3Wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783460123; x=1784064923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TvSEo37Ek9lu9N2ZPyjBCqwdDE/+51lgxZ/UejOrQs=;
        b=iIQlm7uwzjxqk9flvjezQpSc47nFp0uekP3zZ31O8TIIu8+dSLeI21r1yojjsilvbI
         gQ6ikHEjcGhk3t48R5LQgsNKAd7oFLkXWMWqyDLR9s8IpWkEyDcKUWdUd21rTh+loQL+
         +fNjp81dFOS76/T40x1Sl8HUNlU9tsW0+5e8+f8uupOfLlodrqLbG12D47eAml+SMy5y
         3Qkvpe8aOxJ+zCUomrMhIWcF3L3+M/qzw3/2bnwXld60MEIhg7DPuxfs6uum3gDm4wxo
         xbZrccK8om4wpBYZVe7mvi1+LV8lrUDuU/jRH4YJQo8BzGY57/fmaRKm5OvXMl2cfPvt
         SiBA==
X-Forwarded-Encrypted: i=1; AHgh+Rod1Er1UbqYliRMrXAosXbxP4Md7/TB8cinvJtuuzdBgs+htwlqmthWByxNnOev/w2gJDIvMwIPGVAy3AgoIb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy5iGGGEZIEwD2lmo2vV/3ZCmpU/MtINHuO093XS9f8M5vtIW6
	kt7qBLcE1Dk6dpaYKH6jfsmgKneHdwIeaw2qIXNiMQzdDIgnfrjdfdma+z5Pw0dSE9vhU+e0JaE
	bhZPjPgmT6QHJKjWCKB5sAD8o3CGP1+w=
X-Gm-Gg: AfdE7cmqAVEih5sqdEIhMWauLZ+3c5E9CcPeZ7zU77AfbiLGUWaY3qRbn2zP9M+o2lc
	/WHjGs3vth6tDxsJzrKMiQZL0FIHJtf/MtqytLyzwD4sVOMaT6UdlscJ+aRlhACnyppdorjX+AW
	r+ZjgzFMg9Rr1SaidGbjiYJ8A7rLV8X73jC6YmBTdw2oEUpW+EnDwMFXPiXOov02basb9jkAl+W
	FhVj6qPwT7+eqN6EKP8NcnZIN9S0PTAiQwBaQVJrcipn9rQGpNwP1+cRXuMq5IXeYURUcxaYReO
	TMz6+msfPWfzEa2gD4yXKYLTdTy/
X-Received: by 2002:a2e:bcc5:0:b0:39a:cfe8:dcbd with SMTP id
 38308e7fff4ca-39c600386b8mr15519841fa.30.1783460122325; Tue, 07 Jul 2026
 14:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev> <CAO9r8zNJh65SZzdW8Cc8_8N5Wr+ORuRtU3kuaAX_DhLaESFYTA@mail.gmail.com>
In-Reply-To: <CAO9r8zNJh65SZzdW8Cc8_8N5Wr+ORuRtU3kuaAX_DhLaESFYTA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 7 Jul 2026 14:35:09 -0700
X-Gm-Features: AVVi8CcuwF-DUySIS23BW_Gdh2R_ilIjcwqI-GE5L8_I55ZKEN4Gc8qN02pks1A
Message-ID: <CAKEwX=MMXdq7KTzcEgXfNt2L-eTmAVa+nijdyiujVOAhXQsHSg@mail.gmail.com>
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
To: Yosry Ahmed <yosry@kernel.org>
Cc: Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hannes@cmpxchg.org, chengming.zhou@linux.dev, tj@kernel.org, mkoutny@suse.com, 
	Shuah Khan <shuah@kernel.org>, mhocko@kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 11:25=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Tue, Jul 7, 2026 at 2:38=E2=80=AFAM Zenghui Yu <zenghui.yu@linux.dev> =
wrote:
>
> We were discussing a way for userspace to explicitly trigger a flush
> before, which would come in handy for testing. However, we decided not
> to expose flushing as a concept to userspace.
>
> Unfortunately I think the only way to "fix" the test is to allocate
> more memory, enough to trigger a flush on most interesting setups.
> Perhaps we should scale the amount of memory with the number of CPUs
> so that we don't have to keep playing whack-a-mole.

I don't have a good idea for writeback, but for zswap out, would
MADV_PAGEOUT work here?
