Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335625;
	b=xL86TNUiIsj64aT1ChYR4mkQ06SHni2ehEaihjXapgfbNm+TlYr8tIAw31v7laZzMb7z
	 X3QVgJjf1XlftIA79KQoPu1AtqLKUtcy8SUXMwPBzwC/UbNvuubtX9QZ9sSCzuIV23pAZ
	 JE6L8Uvnz7arTtNgrrn6lwonpot90jRzfIAgP5X4AtZiGH3PcZWgDvhnNLwXavTtbATIm
	 8e8s8by7kWwfE2yimCpfjw3MI/EcIinoXU2ovdOvnuYWiiax1Zj1QBmPbK95Luf2U28fb
	 w3OYKjXIXEiTuaL+//XL2eVmGAf/h9ee/IGmazrx9/fWcrimELtsfZ1092xwgM9EFgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9REF9NRXOVx9SK9lOEFtyseicoUgX0zz5kc9LuhiAJc=;
	b=gaARr3lyiPTX9KUEec/Bywc1gd3vm+smkywRXHQBDjpYGt3Fj54QrNAqJAqswIm2vzn5
	 nvkgEpuEFBTHuV0DCcSlowWkE7DUw+xK7RMPvb51XzHubiPzGxJiXLd+mX8aYic86ksA+
	 //RBCj5aphQYY4nOPt0BGNz7OVujwNLc/EKe0KWOiLdTRxM5QzjdGqLj6smiZjNDaWLZZ
	 DBHwxMuyEJsr+OjhEZnosXOK/ilvOlGp4KeWseKA/JWs0pzR7dAtgfYuB6q3PJKAf+SCR
	 NIHd15cGu8U0BKHcQC4AMShEVc/NLypFEZyhvc7gstBVjJbTEjNkGZX2ou3OKyut0mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FUoWq2mI;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C803A606A32A
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 08:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C803A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FUoWq2mI
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2100296c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 00:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795335624; x=1795940424; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9REF9NRXOVx9SK9lOEFtyseicoUgX0zz5kc9LuhiAJc=;
        b=FUoWq2mIRI887qT/hMqIrtXzxZEJq0bIvvaAWUSJH2IjM5lw/riU+jqTG+o13x+7no
         cLasYg8/QuNDSJEpBmohv8HnY/CKxlBPA+6R/FU9/ZQokmIAyU/cBmF1f5pwDWautN/k
         O2HTlDovpYRbpZt7MgFpRZjuFNG4hyMq0q+ORELc7BnelOlldEIGSEApU3qvWQsknBVN
         pwQfLkNOXkFHTFT3a4/WmCnw0pMf14t4n3gXTG8e1og4ypGIMXMxjE1Amzc7mhTIhVDF
         x8ypzCUj19cdpy1asY85A+1NNWljlM5VWaNCJWGRX7Io71OydtLou4BGtXVOZmSMXGnS
         5w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335624; x=1795940424;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9REF9NRXOVx9SK9lOEFtyseicoUgX0zz5kc9LuhiAJc=;
        b=UEVkP+SeT/HrmlIaNz8EETbp9wgt3Tf41fe7JuYq51SGvr8EOEznCq252J/NchHO/7
         2UUth81YqoOgwk5PLU7nKcWKYW7BQas0mUsfA9mC6s2I3XipVDLxJ4mSG9CyUjVvE0Y2
         Xp7GhoBo6dUk1SzzjzBkZ2rjk3Smo/ivfQ5vxxOVuwqXxZ0skex/h7dYBBRpZsnv9gIR
         switngEMVXaJUTzjBGcA/Ezw1f2qkCUK8PldRn6ARNuhQ/di0+IFHwZJJqzueZEMUBmu
         8WOJPeVakn6IqU7UTX7G1bn4hOgEP5KkNuBPYYaSGuFPltrP+oQtm4cQJ0bFn8LkkgWJ
         5egg==
X-Forwarded-Encrypted: i=1; AL+hErH7I1LrYIZ2CzsOCDh/qhcxG830Cmt0KaP0voCXr1QQTakyZ95b0Zki9OWJRL9KINOoFVER22MpGAesjmDAUSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zb1y2xh+Zv7Iub6Cf6HcSwiV6vtBBdTKIcYfxhdJ3LGORS4IQ
	JKFe3uhpLQgRJQseLFNoqIkb8B1CP8Sve4ikttAt3vaA1JO3le2zOnvJkn653oY+ilJaqsdNRfb
	5Z/P4lHMQRlmc8gL8v/tLGUqTQA==
X-Received: from dleb8-n1.prod.google.com ([2002:a05:701b:4248:10b0:1b5:5697:15b6])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:7e8c:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1b55689eb35mr9056801c88.13.1795335623311;
 Sun, 22 Nov 2026 00:20:23 -0800 (PST)
Date: Sun, 22 Nov 2026 08:20:16 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122082020.1255434-1-kaleshsingh@google.com>
Subject: [PATCH 0/2] selftests/mm: fix userfaultfd tests with CONFIG_PTE_MARKER_UFFD_WP=n
From: kaleshsingh@google.com
To: akpm@linux-foundation.org
Cc: kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>, Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kalesh Singh <kaleshsingh@google.com>

With CONFIG_PTE_MARKER_UFFD_WP=n, userfaultfd write protection only
works on anonymous memory. uffd-wp-mremap then fails its shmem and
hugetlb cases, and uffd-unit-tests skips anonymous runs that would
pass. Patch 1 skips the unsupported uffd-wp-mremap cases and patch 2
filters uffd-unit-tests' required features per memory type.

Tested on arm64 device: with CONFIG_PTE_MARKER_UFFD_WP=n,
uffd-wp-mremap goes from 26 failures to none and uffd-unit-tests
passes 78 tests instead of 70; with =y, the results are unchanged.

Kalesh Singh (2):
  selftests/mm: uffd-wp-mremap: skip unsupported shmem and hugetlb cases
  selftests/mm: uffd-unit-tests: filter required features per memory
    type

 tools/testing/selftests/mm/uffd-unit-tests.c | 42 +++++++++++++++++---
 tools/testing/selftests/mm/uffd-wp-mremap.c  | 13 ++++--
 2 files changed, 46 insertions(+), 9 deletions(-)


base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
-- 
2.56.1.750.gf70dc682cf-goog

