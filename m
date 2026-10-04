Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C127480959
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791137653; cv=none; b=TzrSiHB0ZONrQF9aUMFeAYoBIzJK6HGbrHf1pxcz+mD6Vl0pBNQeBbJsBcaQgbArJe0FUffmPxZwE6zPU34JMwzYirP23NDJdbPKdZdEazdl25nyV7YqGjeOfEDLwtK0bTKzAtmYg+flK9Ex4+aqHPKN2zRv9TbjWsBX10VcAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791137653; c=relaxed/simple;
	bh=sjH5S0CNZClDmqdFY8S86gTYCINMCORIQDzBcILuZbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqbqAQMgEk+NfjI6O+OIFyWG4dyWCehLZXpVLNxdUE2Xk0arJDz8mPHXWd26a9zkGkdO4WB/kGudYfuZ3+IfPwiO37/zsuTt+5M8wmUyjgnIPA9DrMPSFXEqLlFobnP0gKhKngVSQ+rIRDPGfY6iVQC0B0bneU6VCjJQwlqYLTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4Sa1s33; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4Sa1s33"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so808862a91.2
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791137648; x=1791742448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvp184+VDrAAELa45MrIVjzHZuD6h0h7teUaAj2z138=;
        b=K4Sa1s33e0topBLGrjJINZJoi62x44og/j03tLJmjWt2c/pJvzX2HTGqfrHcMxLOGo
         KxzYBuopU972XPuBVEcR0ycGt415fw4raN5VEPo2z6muL17lWZ/HIG88g123LWJTPd9Q
         rirdz9jjIW7qf6CNJ02pHhxBu7iA1urwiQXBk8Wvo5pIeMbSY2jZaZ/D1EBhVzv2BTh6
         jqs959cePI9HiTQN5HMLqSTDbZ4rKf638sNEpvZ7ucTiJSi0gF2+JfvYODsxEmFKBRLK
         o8+oSJ+fc86F3abO3LxElskwxBc8NX974Oso3GKIkN2Vqx+k+AED2wHfPestHNGGQ+cW
         BnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791137648; x=1791742448;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvp184+VDrAAELa45MrIVjzHZuD6h0h7teUaAj2z138=;
        b=k8F1/f++ZsAHr3u7LBAhQMXEzVscO6xLHkCrRv/WGG9yKYR+o/hEy7BlXpDGsyGmUh
         qVS9ovtA6QqtQybESzZZ+qo4W/5DwjuMjPiNpo62m/B4MfxqnXLYChWaq/PkxbxsjyPr
         Mgo6bVr98yeJLgaNyJRatjrOiMrvx/XRen84A44HIyZkqPiSpvm/aV76KhYT2iATBTPJ
         1euaMu5ogS0620Yfk5D/56Lc8JFOaLI3yMlWrnNmvi2pjfmLkHx4XqemiMQDylWgvJOU
         8H8rI3RfRGsOM8WL4uXcFkdJdLBHJ5e8KCgu1Rpg5Lnkbk+igQSZz3A1lLRqVcJhfdM5
         D/mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTyJyH9nqqRucVdGj1DZRsVXFSlq92iaoKuFMmtrGyXvIVtGupSDYw1b3fPOhjLl9WAJg8kPSCs5O7zgPwV+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvuJDxbPyhRL+yzPLHdw1kapC/fxiQb5howziIiMZNM+gPU0eM
	tV8BpRUmoRmif5J+F6TxBsOcBT0h4CyBjoftyPIwZiwiUPlobfFN5sP7
X-Gm-Gg: AYBFou2hRzVIvdYujsd3gqzukLff13RdGmhhi/bIBSeHSUd4jX+Nzzw/cZwcRui2X0K
	MA6hCQNpfuoVqXhqdEnTAO5R3FDQowS+991Q8lkKZoo6uFfuIWSBpTRUv8vpnDzTpWulIgaYE+b
	Cnms3SFySMt6YCdNyIDbmzTL6iEJLo4QJyjShmqmmKKhw8ARhJbMViGn1xl1lIE6hF2RCzT+hqi
	A3U8u8GZahsyO9+fvB71YcLQX95k0a5Irr4oQxc1/STuL9lRfVXb1I0M37f7Br8ln7xn0b3Jcf0
	U9+58jE7W1AlF2vzNJpPCkTjxCSqUl2ChGV/Q8m1smxA0XEK7oPuypmDSAN/vrBt9Qa3vCXHWbY
	P++QeXxn1ulZBqZFKTTP77yF7/muiC5ecsjZYXpLKLie634Hq1qj+0lJwB123b86tfP247ANI2X
	gVUnS2K9bGEUXmWoSQZkfElXz5doKYoRF0OOgBZmcfOlNeZ0hM7mHIfvKYR12MFkj+EAYV/RV6W
	jcTAv0/kvgwQkKmH3DJrNqVjQ1edSwOkuNW/kdbQw==
X-Received: by 2002:a17:90b:4ac3:b0:3a0:a781:2c39 with SMTP id 98e67ed59e1d1-3a6ce3a978dmr7662178a91.7.1791137648512;
        Sun, 04 Oct 2026 11:14:08 -0700 (PDT)
Received: from gmail.com ([220.85.166.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d59f1cdsm7460304a91.0.2026.10.04.11.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:14:06 -0700 (PDT)
Date: Mon, 5 Oct 2026 03:13:58 +0900
From: Youngjun Park <her0gyugyu@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Kairui Song <ryncsn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
	Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-api@vger.kernel.org, Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org, Karel Zak <kzak@redhat.com>,
	util-linux@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, Kairui Song <kasong@tencent.com>
Subject: Re: [RFC PATCH v2 0/4] mm/swap: reserve swap areas for deliberate
 offload
Message-ID: <asKXZv5SxBtxQxqf@gmail.com>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
 <CAMgjq7B7jem_dwtUEX7ZJPQm_pKBegR6WS9+B7nFp-gZugpUng@mail.gmail.com>
 <20260928151944.2686626-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928151944.2686626-1-matthias.goergens@gmail.com>

On 2026-09-28 23:19, Matthias Goergens wrote:

Hi Matthias !

> > Just like we already have a "swappiness=" parameter in the reclaim
> > interface, perhaps adding a "swap.tier=" would be better and much
> > cleaner to achieve the same goal? Based on Youngjun's work here:
> > https://lore.kernel.org/all/20260916183437.2946306-1-youngjun.park@lge.com/
>
> Thanks, I think that's the right base.  I tried it: on top of
> Youngjun's v11, a "swap.tier=" argument to memory.reclaim is about 40
> lines.  In a VM with zram at a higher priority than a disk swap
> device, and a cgroup whose tier mask allowed only the disk, ordinary
> reclaim in that cgroup stayed on the disk, while memory.reclaim with
> "swap.tier=" pointing at zram went to zram only.

There is an earlier attempt that may be worth a look.
https://lore.kernel.org/all/20260618044857.69439-1-jiahao.kernel@gmail.com/

If you go this way, the discussion in that thread worth refering too.

> What it doesn't cover yet is reclaim outside any configured cgroup:
> under global pressure, a cgroup nobody configured still reached the

Right, so for now every cgroup has to be set to exclude zram, unless
another idea or more code covers it.

> zram tier.  So for v3 I'd like to add a system-wide limit on which
> tiers pressure reclaim may use, on top of the per-cgroup settings.
> I'll wait for Youngjun's v12 and build on that.

I have looked through the whole series, and I will keep this use case
in mind while working on v12. :)

Also, to share what I had in mind, I was planning a sysfs interface
for each swap tier, /sys/kernel/mm/swap/tiers/<tier name> (exact
naming TBD). Maybe the system-wide limit could be handled there as one
of its use cases?

Let's discuss it in more detail after v12.

Thanks,
Youngjun
