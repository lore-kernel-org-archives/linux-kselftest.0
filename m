Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A443793D4
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635950; cv=pass; b=ntI9BO70k1V6F//Ic6MHpMy4sGaoTuw89rcBpUzDJpobj66gOks2gIwUlpoe1iQjSKHcpHxRHhhNasoAkuunS1554/DSb2uYn4jZd3YXBXgpOtTb0AaFLLy0YGiw7iUiLkhXpGKQ8ut7bAnH8D25o2hKQYIaTVUh2xS/b6AerLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635950; c=relaxed/simple;
	bh=MQFlT82o1KKHbKz6TFpl8l8K70J8PunSX93MZQucGnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0YbYtO0FGNmZHgjcSkfMbjgBDI0Lkw5RQK5isvs4WODL/kb34BxLwhWvVusKVQRdFZZG4iS1wbtUpzDfGe8plyDHE59RfeN0iXno9nTgQfBg3RBNb/M3RWiuBK11iPXbwNYvZliJ/Q8fR+dPEg67P99i1ZjCm6H9cB7XJiKDow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T68fQ8wB; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T68fQ8wB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b87970468so2308239f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 11:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774635943; cv=none;
        d=google.com; s=arc-20240605;
        b=YxR3MVcoHmus9BbP2AWhkAgzNUde2CPKdsDfSCY5h7Gh0wrvsTux1nLkFOCT5XjNrL
         57a0qv/9tH/2wVjpn3RfhZS0q+YDjVW3A4N+i/v9DhpF7mEEsKK0VRDzQCPo+Y0m2xIx
         CVETiVSa+GI1FzqbCDU2WkKHqluxkJV47qwVwCKFSVHkwVczOMbzomwlahdbBiYT3Eh5
         +wnffT2RLtDSEIf1mJYJtrBTugPSM5550EEB98ZpvEciDaqP03cwxdlWUzKuAbUMqDW/
         8CAtObOhWkERczeuRdi2Xk83aRKKDYC04cNYBQ0l+/RrjLH9xbf0nFUHZpw+sZHBvbUt
         ImJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lrNHzYm4qPXJNljf+cYBVncFGgCG3er6U/W9P+ONJIo=;
        fh=V5Aaok5RPpHhRu2NwGHtZGJ/hPBGto/kjCF0nRGeHps=;
        b=DYLDryjaGOWt+bVGthk0NB41bRCoP1Kxj+y40tccsS9iJYlM4eLKz5EwKIax1euaa3
         GMH7gFr85o69/VXue2RqZAMM2pJlhEvMEPVbRpokY9W57M/BND3PevQU4upccN5Inei+
         P8vqDnfqI2d5aDH7QteD0D+/ONkC7WJWv0KtkhIwF6orJcTWjRijodYq+cc+aBpX05/d
         xIAmWHe++d/Bc0wrKbFlyHFLWVZsbfz8phr7uOq4WoOna/zfAGlOiHv1X+CFKJJUc+sZ
         kSmppV1y73x0+BzXuiQ3R56EN09bx2/XATEdioZH2aC5BvFCueGDAk8XsRiVjd+mPHwW
         RhoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774635943; x=1775240743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrNHzYm4qPXJNljf+cYBVncFGgCG3er6U/W9P+ONJIo=;
        b=T68fQ8wByPODu1m1BexHDMmfEKvHCCs2+94PQW7tlQqHtnz0FI2TnWCioBEZvM15vB
         piXjdglUyb+y9sAznXwsCJ/jn9viSNgTOHR80snfVuFjGHpDTtKzKjBKB8HF/nDX6zSR
         DXPK72ZT+H2ENBKFj0dY5U6QPRvgRwWsnDYNYMG77FKcmYJVVpVahME9c43Scqbkg9Ga
         OgSN887flB5205beVENtciW+/zJ1bpNe3Fk0etofsqtEzCK0EmxCCthStZt0HZWrDqnU
         /utrHtj43lcHtpnHmnMWJC0991JPKHeSt/L9xi6RwRtRKhlXylbTwewY17Y2IaGw55EH
         SIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774635943; x=1775240743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lrNHzYm4qPXJNljf+cYBVncFGgCG3er6U/W9P+ONJIo=;
        b=CBXJdhVVEUGmpPbgBCMN+C0BkGyF4ERwhf8Fjrfo5Or12Exi0X6GjGFl8HIXH+pAez
         H7pyEVyFZ4O7/+YWwgtfFikXfLiQzfQnZsgtj+KK4mORe/3Htq4vlNAJsmMI2OAP3HZd
         cr3ZrIlsic/W0AVEiL+9Gt4G0qwDKJk7c8SQueyZGjgb3CH5z89D/h94YWPVsPRxT0zs
         uTnOWovenRJ2o2dvucpFO22iY/3fpDY4qwvegUDuQ0M+P6c64FSIp/MdYpb6abJ6Khey
         r4zT7e+4EBiFDaEmh0ra/DhNu1ok2TyUFRR/geMgAtToYrEG5qmglCbkTF/a0ILNsi5Z
         ZH4g==
X-Forwarded-Encrypted: i=1; AJvYcCXOJxSoUQX7zGQgZwcpLNUqplqkImAsgplYqy/O05RQkoAOHVcFxBAe94ag8itsyafeX/uHVC2j386Y0I8+UP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhbl9d+0sezZ6uO8RgY0ApM2rNx1922G/rKx69gtI5/pzUk5zJ
	bnde71n5kdIDFzCKNv/pg9Y5PAo6UBXIX3+ITegPU75+vSgjIdItSxK/AGIYZ8auJtqUqAaekDD
	tOGB3Q9p1+xDov+Qt1sSboOq5STZbd3o=
X-Gm-Gg: ATEYQzzUsZxwvO5MMJKPdZT4d1TImokryl7YlEb9BI9SK54XcqfaKZyZqi2h7Vqxaig
	MpRi3UgwLGZ2EDoNqOn7s6Ynp8gSNlo1wSPvrk3e2eZ0tSCDV9EaH37OFayfcSSF0mDrvyii39e
	2cwJg1xM7m+7pXNPpqfYpQk7XDJ5HrV93DH4aHP4DvPC6CcdibuRyA9Ii6M7LnFLR8eCDH6inMc
	YzZZkKLG+Z27OzPmgpa1AhD4ABKBox3EoDKFkSBIIsS6kyjel3uWu7jxzYHWDUYwixcmnbjbXlx
	l2FQI8DJNvjvBMZ8TtLy0I2Nqz5NHJD4W66dY05MNsZGEifWZiQ0ZCpNu256
X-Received: by 2002:a05:6000:1883:b0:439:b791:f920 with SMTP id
 ffacd0b85a97d-43b9ea347fdmr6458348f8f.17.1774635942629; Fri, 27 Mar 2026
 11:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326032658.96819-1-liwang@redhat.com> <20260326032658.96819-3-liwang@redhat.com>
In-Reply-To: <20260326032658.96819-3-liwang@redhat.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 27 Mar 2026 14:25:31 -0400
X-Gm-Features: AQROBzABEeMvL6H1sUXu4ojkCZzUjAhuivgyunfvA6vxdRHNvLE2VWA3mFOyn1g
Message-ID: <CAKEwX=P4kt93-5iG6o34bjG7jb7CAmSRBNvjKHfMTuFN7v8gQw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] selftests/cgroup: avoid OOM in test_swapin_nozswap
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, yosry@kernel.org, hannes@cmpxchg.org, 
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, tj@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, longman@redhat.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 11:27=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> test_swapin_nozswap can hit OOM before reaching its assertions on some
> setups. The test currently sets memory.max=3D8M and then allocates/reads
> 32M with memory.zswap.max=3D0, which may over-constrain reclaim and kill
> the workload process.
>
> Replace hardcoded sizes with PAGE_SIZE-based values:
>   - control_allocation_size =3D PAGE_SIZE * 512
>   - memory.max =3D control_allocation_size * 3 / 4
>   - minimum expected swap =3D control_allocation_size / 4
>
> This keeps the test pressure model intact (allocate/read beyond memory.ma=
x to
> force swap-in/out) while making it more robust across different environme=
nts.
>
> The test intent is unchanged: confirm that swapping occurs while zswap re=
mains
> unused when memory.zswap.max=3D0.
>

Acked-by: Nhat Pham <nphamcs@gmail.com>
