Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3D5437D8
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080886; cv=none; b=eVpWgdFO5rleoup+Gh9kXHWxbyCzvqm3i5BfJsgHWG2tC/p5ndzLIqNLwFQ3jrRfUQnpNIiSZhi4UOOFd9QVMckPXFrdkEiGIjESyi0GWSdoaJVzAYug4qh9wS4cyxxG10dhUyrMb6fWUYaaRA4AOqjtG0sPrssWMRyy+5AdxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080886; c=relaxed/simple;
	bh=QZXui/sNrmgEF8EYt9qJR72fsL3JvuFjYWH/NetcEM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LumbkZ0PfHFsZZ/Y1K1OVSRb1r6VK/p61Pm7D5/C5jfJe+cIdfKP0pjzisrl0zIxj5JRXKAj109GswQ3x1PeTWD6pkmSbqHHOZXeHfhiNZUnImaAbD7N257sKq7OH/kWAOhtbQdSmaA2vXzecpV7otWHKCexTine7ZCZw0FvoEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yckl43p/; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yckl43p/"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so3651732a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080881; x=1790685681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw/dw+ccTq952L+vCfsl+Z5DyyMuf5zXMzQFZZc0Va0=;
        b=Yckl43p/X1qGl9jsdqKYhbPDSUBjFoDIEqjPfz5Q2LQZVt492bLshmkDxge67eJYOh
         qGOOFo9T5yMZOht4YlRNL7ndvYFk5akmskD1UjXM5MxZ6cJmqW6Nfu1NPRV5rxviKB11
         xA22aUOz0QCkoSEXoThhLaiPc4416Gs4kCLHXON7lRNXpP09n016wUN+Hsol+jWutkLh
         x3HLNeEdHu0sgh9ifwaMgatCzJUxdFal0wUpqV9AatNpf+cyXBJx4nDKT8NJoQBbsdcK
         16f/Nz9lNM5tnqdbSSeYZw3FTjTwNRRw2Vdv+Z+/fdu1CHlYbnA6Kwd3it0HycY57MDf
         i4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080881; x=1790685681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iw/dw+ccTq952L+vCfsl+Z5DyyMuf5zXMzQFZZc0Va0=;
        b=K/efUODiA4Ur00AwBGwZOGSrUX1q/c4QbrS7GWu5wK3sIEdWjKlDuEbVNmgBm4xn14
         L3v+VAVB4sCuGmvaQsIxdh/hoBteeOqR1oFAezEfmNl7Z8+ZBU+wa4tq0L4EsREN4qSV
         aOrzs2AUcHNu5JA/sju5WQg9mkJFElB+P7nP8YZ4HZ9GMZETmACCcXFVv+KE7vGRyhEJ
         553/JNtZtUlWqYidZWNyc1wYVbVfa6iAJ4jSMkqh9/ns017D16j32BiL4eYXcrUb3S/j
         fTvKOMerPiDUjaZgSG487XqjbBZkWjg0MrGGXXursJ3yhHwrLJ7YJGL0kZgK2wtfxGD9
         1pRg==
X-Forwarded-Encrypted: i=1; AKwUvByCPv2egLWZ/+iCV/3rO/KsMnB4MH4LEY9C4KktiHqRnmp7BuWCOmMlMu1eX+3Hg387r/2Sle78dgO/hszBOOM=@vger.kernel.org
X-Gm-Message-State: AFuF++lJu7tGfrF767WQQIXmmV2kpwwTAENvHfVW2FWibshZS03fXeId
	j4TD6EGoiMeqps0DWnmFQ6iFFyfwxUU9JwoQqj5hUw0ga8QV/ZxUysQ=
X-Gm-Gg: AYBFou2rWa/XKp9+aB1Y/UArlhXrDYO8uh8P6Nr3wK6A8XEaeFIfNzBnHGRSPa+k0K2
	RDugrwQ+QzNOmU2kr2SliNAmjL+7dytGzknhxgW3jnIkqYbWQi8nthSTuoC4c1/28bS8LsaJvtD
	D9Xtlpb4kzpKIouoowtXrAmUNVb+JANE7/Z9Pc05R+ov68B/qZt1TfLHX56AzNvAcFJ6JC9X5QQ
	/f1vAAp4ZXX3KNoPgleCnRNBUODnonwffdwlRyxhMj8qFI6obuEw4dniR7EyYAfC4B54cfztpdP
	Mqyiu0BEynpQ1sbiq/Xd27y6ZNvN1rwEtyZfy0vzszCH2tKYXkOEivE8RIBHPc+Lh1RfG5jDqgO
	HIU5dCXDcPvb4bOl0U4PLr2jcBilGNmBiFXm5WCKXb6Hs0e8L+totBCEiJCvG1HAuGtyvnLJY6h
	pob7inuy7KaYz3IUS/WPwFvvVdCBP6iX6LlJcJOHZo2+zGelxJZZ8kFhij4V/ttXaf4PiE1Df9V
	r/D4OhKjMn4qkklBxdW9OneSO8=
X-Received: by 2002:a17:90a:ec90:b0:39e:4c81:6c65 with SMTP id 98e67ed59e1d1-3a0731f717fmr1052233a91.32.1790080881311;
        Tue, 22 Sep 2026 05:41:21 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5cd2e4sm3134535a91.16.2026.09.22.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:41:20 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v1 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Tue, 22 Sep 2026 21:41:13 +0900
Message-ID: <20260922124113.1675993-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <49208ed6-6c20-49a9-9c0d-0e1cffe1898f@kernel.org>
References: <20260919004630.1159895-2-donggeunyoo.kernel@gmail.com> <49208ed6-6c20-49a9-9c0d-0e1cffe1898f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review.

My guess is that wp protection always leaves the destination PTE
non-none, and the move path has

1566	if (!pte_none(orig_dst_pte)) {
1567		ret = -EEXIST;
1568		goto out;
1569	}

The move fails when the destination PTE is not none. So there's nothing
to preserve for wp in the first place.
