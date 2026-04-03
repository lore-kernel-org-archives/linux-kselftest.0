Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDD13B9DA0
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236616; cv=pass; b=jGaNqfHMggz29cAvxg13cV1xTJOHz4GJd9NIf82G11kf65OFQcMy1UWE4spipK8zt0rm/6lAuiEpK2UGlddI9d2IrhIrn+e8NOGIJA7Gj65tQQs5LvvBjgx2UOF0taMOVJ9QXvVvsrK2nc0Mm6hn7xXoybc7hCczyzwdzhq+hcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236616; c=relaxed/simple;
	bh=1SyoVLAt1yCyzm5+Yd3lOzM3kjZo/TmY4bzd+hRNO48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPYDyGDDzVJ0NFHXQgUk2aPT4B+M31p8+HLJ0G2I1scZl8FKpcNufIXsQYaec4WIkWurErFshPcYFubT7RYcVl63X+pPp4uymZD8/frfUh6Jr+gw/caXG7qfrbUmRMRWJSAiAs9gXntAnM4WLfD3BCOlA+IHHhRDHQBJpPiDwHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQpHbFRT; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQpHbFRT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so1198753f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 10:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775236613; cv=none;
        d=google.com; s=arc-20240605;
        b=JUJjH1D/xi6CqLHimA1nzloh/jD2ROY8s5PMBUWFALEliUfk1y21V5nudv5S/b7sZe
         hshezKJUfeVm/gEEnc2Nq2MrJl64aSOiin1sjXPIW02F1AUxSlbUSqc6mFJnDebUsRAp
         h+nG6kpnKdjP0+jaUVqTz2sIj6La0uTlJcxp27bcVowjQXjwvQlD5x7Xq06iCPxBensh
         Slt98aQ7lJqQtw8pqktOIbQXRfL0jtgcADvW8GVrXun3MKWbWKuPvJ8+zz8Qp5QUvOVo
         R8HzpbGjzvflAI3m6dMR5oSsGSoRL6N6Jj6hS/oTDGvDzcRsHn3XB0vXoRpVClJC+6YD
         kY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1SyoVLAt1yCyzm5+Yd3lOzM3kjZo/TmY4bzd+hRNO48=;
        fh=7LbdxNVt0pPwGHCAIAmXGCuZsfz1FJXqAL/WRKm6btY=;
        b=X9/q0vKYnszlpznicj1195+LAsX1vSCQ/rheY1lQxzTB7qpSzQ5DIsK6/JwicSHn6N
         Mu19bKj1hTuGzfDL7Nlv7TiyiHXIwIbTApe/TmosGc7J0QCA4+jShz7dut+lpckhZ50x
         GbmmM098bDOjFlTLWcwx417lBkQulFxVxc/627i33/twAXv/XuXeX+66ufPPjHIaNGP1
         FqpqjfkHZz2oSkHERn/VBgGcvUf7sgWsvpKEIgV8QmfLWimtBcUPme8XzRgW+ESAbIDK
         paYoOj/4LqdT06x/Y4v4xLuwbXcfYDlz67KXTHHtcO1yMe5zzQhyWos4AmxnKar99wvX
         1R0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775236613; x=1775841413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SyoVLAt1yCyzm5+Yd3lOzM3kjZo/TmY4bzd+hRNO48=;
        b=PQpHbFRTxtoKy80dTJsZSjg0xOkNgXDIcXTpRuMmz3wkmVsE8sUDBmDXVkAnJ7k3Db
         0YA2PVHWXy+ER4Nfdj6gv0REdDlbpl7D52dxF873U8X0coW2CBhlC07Nzry2aiu7Wll7
         VrVtzVy9NkrMOeLMq6b8MWFttwAkxvd2F6aYQ9rU4BQrC9fXfPWbbbDN6aMJka+NNUTt
         AdITES+LCfeIDpJlp18jwyPNEjcIajalNTEXsifkLXYgFxtzIBx0S5zcl/yU1Ro+j9wX
         TvgysYB8feU6nOdZH7mXUGeIwOITniWbAmKMY4uEk9zXtDyZxhYPPF+JPx7213e2EiWH
         4Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775236613; x=1775841413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SyoVLAt1yCyzm5+Yd3lOzM3kjZo/TmY4bzd+hRNO48=;
        b=itFxgqlEOCk2SqIkEwd7CB5nwqphJesbA87Pn1Gx3HlGMBqFw1++CzmV/oZZBTsG/n
         gkH/8tVpeR0kaa3MW5416gYGthEEXAbah1wNW50qXIQ/PzOi3djCTGc/suH4Oil6FSN4
         3+RMHLlqTZOBrTTtC7M5NAJh0LIIEAjjZx7/Ms4Awlak1OJviMQnP+jgbUcuFqsCD5Mr
         5Z5uIzmlBQbkysYrNRzgDkc33oLzybXwlH7RDqfSc9sIEzVxSoGGHBTIBphaw14TmE6C
         sosyAokCmV4MEPyOEr7jEJc54yj5PvEMbGWYTyMfiTpSck+0Y/u2ZiphIkpLyt+jU7bl
         mzEg==
X-Forwarded-Encrypted: i=1; AJvYcCXOvDtn0ugATjf0Uu/K5HSJw9UsIeysbsaDSJ5tMNVVHT2RZWV/WR3ofJIxxhCYGK6PscQ4CGkfu8O2j8yevf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmlVAk/48wq0L8YKp8nhYvxEj5kS9ILeFQLAgqgjcxyZusOLZI
	hy1SJzD4kPJUrxR3EeOo/HHhWVRbJk3ermPJX7Qa7YxfVT+48a3RInq3h+h3WeG3pVYHAYPCp/e
	9KwauR5KRCTdTDL3Rn32uCTcUNs/3+tQ=
X-Gm-Gg: AeBDiev3N0uo7GyVr52NReZ6yBOcku3Spdf7kePupoI8YBs3KakZXu9tMJ/FqUeuSdR
	H5P1YhGKK/K5g9PRlb3VR0ZaIxYqbDtRdkQm31OL7epTWrOcc5vSklO8gMuL4lt3o2c34LX8Z7T
	6++8oaLw4tmag7XcnTx8h0MdC46NauCH4bAA/XTP4V2yRKDnMgBcMMByTcUH73hlPk7Ji9xFce7
	3BhH6SjHP8J85sjfjSd9OfRgobNw8QyBzYaPs2kJlsk3jUJ22NQjN0M90UyqP8rdJLjciEjrWJJ
	lD0uZrygxHf6UvJIFxu3PNmyjAu2AT7T9/vrPpzU7upw/KK93g==
X-Received: by 2002:a05:6000:2885:b0:43b:87bf:89cc with SMTP id
 ffacd0b85a97d-43d292f9ab0mr6063228f8f.49.1775236612678; Fri, 03 Apr 2026
 10:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402063714.55124-1-liwang@redhat.com> <20260402063714.55124-6-liwang@redhat.com>
In-Reply-To: <20260402063714.55124-6-liwang@redhat.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 3 Apr 2026 10:16:40 -0700
X-Gm-Features: AQROBzB0e0tCl_YCjgHALlhPlXxgnQULvs8SWo3GWsE0zwlBRZHXMDg93N-xH90
Message-ID: <CAKEwX=PVQD7i796z0unVDp3M9k9tZrWEzPTsE5hCL=s=zBna4Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] selftests/cgroup: replace hardcoded page size
 values in test_zswap
To: Li Wang <liwang@redhat.com>
Cc: akpm@linux-foundation.org, rppt@kernel.org, david@kernel.org, 
	hannes@cmpxchg.org, yosry@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com, 
	mhocko@suse.com, shuah@kernel.org, chengming.zhou@linux.dev, 
	longman@redhat.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Michal Hocko <mhocko@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 11:38=E2=80=AFPM Li Wang <liwang@redhat.com> wrote:
>
> test_zswap uses hardcoded values of 4095 and 4096 throughout as page
> stride and page size, which are only correct on systems with a 4K page
> size. On architectures with larger pages (e.g., 64K on arm64 or ppc64),
> these constants cause memory to be touched at sub-page granularity,
> leading to inefficient access patterns and incorrect page count
> calculations, which can cause test failures.
>
> Replace all hardcoded 4095 and 4096 values with a global pagesize
> variable initialized from sysconf(_SC_PAGESIZE) at startup, and remove
> the redundant local sysconf() calls scattered across individual
> functions. No functional change on 4K page size systems.
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Michal Koutn=C3=BD <mkoutny@suse.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: Yosry Ahmed <yosry@kernel.org>

Acked-by: Nhat Pham <nphamcs@gmail.com>
