Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435432;
	b=0JiNpT4wlHjb/DslcdYHiNKMxjW5ygvv+3sHzYhK1IvjiHfHcBVjkQF71YMnzko/XsMz
	 hH6SADhScPwtnwgzSaHl+rDmC6059ivNCSEeGeXb/uBLJGSfFbf6lspygLnX19u6ggPiF
	 R6IlTPwNDgtLHxOXaEXQU98z+f+6XxzXVjxdiWgI4i4ogqH6P/mtDIsasNy1wFmgNkzfN
	 TCBGZ2qcRiViohHp7v5C8NkSk0lEhP6ooKN2LYuBUjT9yXp3WmGVEatRDN4ttFX+46H2y
	 xSnvaIbsc2VUG1FI59zU9l1T5cVTP1GB25lge/4/9Y79zroSGOlb5xofQ55Z7JvO4pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4yKvLgZfFwS1iVko5Zbm10jwWwy25iLk7A9hAJwSx/E=;
	b=IVdH/2Uy+1BudcE7nPcRPttrQ9cmrgs5A19FOZhc87/ORdVl5WpNH9UDusu6wJttcaWB
	 bP3tl8K3hS7bGSJ0kyNF2DgTzRbCii8GrNtoYhRXQweKLb5gKjMm/gGRBh2m9MVotF8ou
	 pR4uuexvXHss0F+OtZo+8VkKlTWKJumbbF0oEDWLpLmkjmQ4WkVfu76UYyMgSgAdiN3BD
	 lblji1BZIJPQrL0lzDAH8RYYtrvC4AJoJapKVfBtRktKIUUX+lt4l51936kG5VZAyQefb
	 4VhZ6zhVXZ3KZE8nqZbwe7SIjKHKw2AiwLr1QZOCCuk1nQ+6eMbO/NmgvkKLzCqE9oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zhE8b8MZ;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685D606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 12:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C685D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zhE8b8MZ
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b413997581so2666000a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 04:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435431; x=1796040231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yKvLgZfFwS1iVko5Zbm10jwWwy25iLk7A9hAJwSx/E=;
        b=zhE8b8MZ5ItU7MkUXKD9iJ+ImkQ7shcy3F8YmhLKJ/BVVGWvbr/lBpvQueMNjesUeq
         PFALt3ZqvbYgI1A2/dAmowaicBrkgyHOcH/uyecwuJv1fG+olNye5QSQZS4c8ZLg2tBE
         yezAJ4Z15jaEHmMVIvq0gpRLxdjyxs0zBF4B1b4LqmpEh4z1dnk5aGHa3bP9dvmm4+7L
         PBfwsG8ynAa/F9wvEPD9mb1I3NHa8BggzntL6ZpggEgJ2LMrYBvjiHhnyqzGJGcu2ukx
         E/RSlvcJ0HS6YHHt/T6rAp5vNnRPtj/hKX9XnCgs/oRWvfNH7v2Diszt8Lfop9pFyTyD
         y5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435431; x=1796040231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4yKvLgZfFwS1iVko5Zbm10jwWwy25iLk7A9hAJwSx/E=;
        b=t+YgmI2Ge5WM3Wej65FotCDWGKFCcKejSZS5CXBlpdGbYkLl4ujb+VXhEVGZLbGYrz
         W9VoYhtZaVK7lhTMJbCBtEsmTkf/EGtenBQafRo7iAjfH7YB1f+gWvHyyB6gVaXRmZPq
         1CQ1FqxQV8Rkg1RffqfBO9AXSrrVsFpZWl/RxgyakFnMPoU3FTjlMPAgHR4TpUX9VsMF
         gSrGgiZk23B+8FmXE4t0ZKVzz8n+StapNRsiLhyi5iFSCO9+fq7hXSoc5FnNYyYGID38
         cDJqgS7ojRnSQzbqdR/qjmMni9K2gQVwYmNiHaCy2n08GNHaGIG0mKKdsLntUltMf6k9
         Tz4g==
X-Forwarded-Encrypted: i=1; AL+hErFYQywyfWCvrUhJMoD5aWjARBLrXx2U66dv7j9IVnPWZxwHEK5hvIGlh5Y2qdK5/WJBdaK8C2RZBoyHpNXRtQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z4c3vgoq8wW+p3DkpFkAXry027MwZsQ0BK/sUNyFURszn/STI
	/c1fUGCLCGCzLnLFFuVqbUlY13uRzfkRXkNiYqtNLG7BtrPf144Qhr/6JJRSfmOb
X-Gm-Gg: AZFdTZdM36J5YxZMFxf037N+BeInVVDMk2bwkEm+Pi+BLv+eaAsaEfA9HKgCboZts1/
	cVs9uTyJ9wO1WAF2vbHeHQsRI8MMR9SXLOjAhPUtE6N2fSioW/9lwreibCDCnIFjgKlQYLUBrtj
	fV3LVnrA8/PLBHlB1VEQFqvaSDuS0gKW1RXRG1dxdcFxyaifeL67RElKCEkxYQhKCEZAUpm57RK
	j75zc2wv3ENMJF3tmV6VPWGIS8SPIRhzEwToVgSKccLDEIdLg3u2sx9zFNwlIfTie5U6VOhzD5y
	MW2cyozilwBUVsNVdol0i0h+m3njAZCEnM3BksFFhhdOyisHRNJVTC6EhFE6dq6562ue+Uw58H9
	9DkG3wHdJFJCaaTfZiwqGjgZHXPyUog2Q0367Ak7zcVxNPTrTLZeIZaKkeJLPKFstCNLcqGwUrw
	chxea0wJBUktqkC/I5eAn8V8BuR6HMm0x4Ebwn2QYDUpGh7s7/VAiC5ZuRM5oV+sfaaMi+KrKoh
	ODCi6N29H6NvnS4Ei1r98dOQvECDctmpY65/14AbyBMx83nvEyK12hZ/tYSzeuAzDgn8CLqajVX
	v3/+zIB+KDM3xEkGxFl6UL7CgnQU8tuMqyFVsfc6zI1oIEcvXUFHgLKx2tqI9es/PIHP1g==
X-Received: by 2002:a17:90b:57cc:b0:3b4:f23:43f8 with SMTP id 98e67ed59e1d1-3b41c908fa4mr9358128a91.20.1795435430862;
        Mon, 23 Nov 2026 04:03:50 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30450974c88.6.2026.11.23.04.03.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 04:03:50 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 24/27] selftests/damon/sysfs.sh: add basic tests for admin/reports/
Date: Mon, 23 Nov 2026 20:03:33 +0800
Message-ID: <20261123120340.9486-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121210013.130397-25-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org> <20261121210013.130397-25-sj@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Nov 2026 13:00:08 -0800 SJ Park <sj@kernel.org> wrote:

> Update sysfs.sh DAMON selftest to cover basic file operations for the
> sysfs files under the admin/reports/ directory.

Makes sense, so LGTM.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
