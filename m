Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3D3E3C4A
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255437; cv=pass; b=FgxdVFYEuHwPB488iFr3/7NZpfReWHhL7U8aMU2paF5X2cU15Z8J7GpTzM5NhbObZShFpQLGFWhnGWEUUE1/eON8Hzr53JExLm8hJ1lM5d4G9qxdjndMdB2TL/fPcAkvSKDpBBp5Vh7TCqe7+IJiCY9OhVjYmhVBfgGx+BNGkpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255437; c=relaxed/simple;
	bh=qvtBYeP4KlpXyrALbQ/UxOhxn3q0uOWPhRETv37xqzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYsDdpQVJYIxRiGn7CdQRDFx77D9nEanYQnYCYkJGqxW7g82GjHp+IOmPr5kBoaZPk0DpQ/AaNt8m3cUw0oK4xFqAwp9gQALjfSB9EpWK+/K53wPbrZ7aGu9M8Ao0LHIsriyNSY/e8byZISymvTaN08ZGegLvnks4BTLjIf1dt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nvNAyrjq; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nvNAyrjq"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso44316241.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773255435; cv=none;
        d=google.com; s=arc-20240605;
        b=gPCRO0i9VHfw+qjVmHh7sgHMsuDEMvXpie+1gc7V4/H99LAK79XXtNUkmRyVd1NK+s
         UlKau/jrKdfLTfinFcGu+sQw7VSuNWWS+BBDtX+2JUccZGphdtzkr5eTdM6HHUBOvQ1f
         zR2ZcB4i2OI9L6ta7xMZgVnRFB9hKvg+0V/d6Fa2TU5F5cUClbU3u3K3Vu/SP3Ko0ZrM
         NTjZnEBIDEUzkSEpA9kx5yo/d52Nk82yXj7XFK++Eo8npYIMnrc7p/uT/MZmzTQKOrys
         iarPeIOocUrk/C22H43AcEr10KWdO9Dbimwe+ibvDjdL5EbF1AXsmkf310hFpu3xzblj
         MaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvtBYeP4KlpXyrALbQ/UxOhxn3q0uOWPhRETv37xqzM=;
        fh=y9AwH/+rDfvEJUaHCSu1emqoSC0AhfY0AzO5q+VFeTA=;
        b=io8byGp3SWdsWkipq7xluRK3guHPOUf/BODryUt6DdxnOpC84bREwk4UejkuWSts5V
         HRQSB6/JTIxuvKb1FVj7OXty1KoU8IlHXzjA0dlOw+i9dznTLm1mvSWGfK29vC8OdIaO
         2teK5Or01RZVxVOsI/jdILaKfX44qBDNV5EgmJe2THWHlFy/xc869AP2eAmWTI1SZ5JR
         3Oyg4/PlhUWk6PnzzcIi2FYXLgIqiE8MCeogwVXXa+K/ifJw5R5CWitG5N6ws2cDshvR
         3XcYcJXxxhcZcL6braNyni0n9DW31eOjhadgBP5EFJN1QofHhFMw/KT/k5VZrHc0Vvwm
         U2+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773255435; x=1773860235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvtBYeP4KlpXyrALbQ/UxOhxn3q0uOWPhRETv37xqzM=;
        b=nvNAyrjqYdd3zuvSeIR+amiIEvTKd0gQecft6WIy4EkCNuOJL3L70kWld8RQcMG6i5
         bxhzSQUsqvdf7VFFLITxl4HGF5hRvJm8l2ezZD2KJCtoy+AruGB57+3k5Wv1u8V2bsEP
         zPXZ5IBcgOu2ItK53/OVe1sy2C5SrJLove+zP4xMAvLtn83CmXkL9vDUiZXmRrCUDgdM
         c/jx/oeZvaDLM3W0VZIVKCBh+fvWqbYKrq7duSXkT1TdFJ5B+ue5Em81qLhnikkHuQR+
         RELjHMkjkVeEbeDzgrLpJ7gENsd2halTjv0rm1LvwG6p5TfPgr6WAwvQ7UnRKOoDcW9U
         Rk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255435; x=1773860235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvtBYeP4KlpXyrALbQ/UxOhxn3q0uOWPhRETv37xqzM=;
        b=Z1+kMz4Ip/2cRj0S+pKVxFW07dJN3F2RtZKHavmxAnfM/4GbWGlcqCT7lrvZ88a3uC
         CxsvdWZbEZ1ilIyVlgzWYq8RWRAK2bDczimclwKmqjgtvevb3w1x9CMuCjLyF7g/SVbl
         NlaXY6TqGyFScjkeTfE3ll04rz89NXQ6r1Xzm9/yHW9dHTrA0avShkXp3c2H9cox61EN
         pQb+MVBIRaTLwMTknG28R7uRT/Uv6xi6YxEfPrG0qDw4pM94l3zuvWZ7tfOBj7HZGJQH
         1y/tW/KjajcqsDv26/iMb5Ycnr0A5NZVW7Ra5eFN7vxR05yos+ytL6E/tZ7Xo92EgIfT
         qg/g==
X-Gm-Message-State: AOJu0Ywc4Vj9yQbvO3FdZPviefSn/oiwS5/OpkdbyYe7yKzrOxaSHovj
	LSmw+2dcNxYTMBiUw1XGEbpExRweZKy5hGl/w4Ssj0QzEHThpc2nleJj0k1dGX/cJ4o7mx4cRPb
	0S4/JfQtlLKftE6IfHVzbIoQjYWsCb2KvS+bl44xD
X-Gm-Gg: ATEYQzza4KjeiOZmqzvFzvptYOl5MMiyhQ43BL+tSZfgY7Itor2XTA3rNKeMCqaYedF
	mrEhWV0A1b3FokIXwZDbFGpP5XK2QCxPvnEjGeblaqsJe6COFdSGZburGSeJUHDayOrQuGsFsQ3
	IQDNko1KrRgIGTJZ1CaCzrJ3EDjzqyTuoxNQRVrAlNRK8cheYyUKA7iHny6K/BW8NUzw3339UIk
	Ji4IoQa2f7sit3BwUQegU38wHaWQC8sXPRwQNEzbafCFbXvz3vOPzGFWd/hXvs5hpCbekRK8ZD1
	eG477A==
X-Received: by 2002:a05:6102:d89:b0:5f5:773f:b1e3 with SMTP id
 ada2fe7eead31-601debb903cmr1211879137.11.1773255434411; Wed, 11 Mar 2026
 11:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311110523.26624-1-liwang@redhat.com> <20260311110523.26624-3-liwang@redhat.com>
In-Reply-To: <20260311110523.26624-3-liwang@redhat.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 11 Mar 2026 11:56:38 -0700
X-Gm-Features: AaiRm52U6gRi39vQhJCEMqD6Fd71HKeaVq5Gj2QEGWqvdrtCHKWHiC1sZRX_ppo
Message-ID: <CAJD7tkavpHuBV0zy3mS00xpV09SEq6Tz_SaY60o+k_1=S3feFA@mail.gmail.com>
Subject: Re: [PATCH 3/5] selftests/cgroup: use runtime page size for zswpin check
To: Li Wang <liwang@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 4:05=E2=80=AFAM Li Wang <liwang@redhat.com> wrote:
>
> test_zswapin compares memory.stat:zswpin (counted in pages) against a
> byte threshold converted with PAGE_SIZE. In cgroup selftests, PAGE_SIZE
> is hardcoded to 4096, which makes the conversion wrong on systems with
> non-4K base pages (e.g. 64K).

This should be fixed in cgroup_util.h, but I see how that will be
annoying as it's used to initialize a bunch of arrays. Looking a bit
closer it seems like for most of these code paths it's really just a
buffer size, not necessarily the system page size, so maybe we should
just rename it?

For this patch, we actually need the system page size at runtime so
this looks good:

Reviewed-by: Yosry Ahmed <yosry@kernel.org>
