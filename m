Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616068;
	b=5DY6C/O3DQXeDL9fmJSVZoiyavnND1cKuNTisjbeFbd/vrYb8dp8Enmh354xdxNrZbvY
	 RRdGr1Xq6VN7a5T+RP6TCxXeGirDBEL8Wve3u1cdxo/t3fJA730FPnJcHz11QMumXY6ai
	 QY889Pcv3MBdrWT1gZqAic6ldz3A98Ryo2sAT3O7LUZxueWe1Ic5Hw8vp9OHecSxGc30L
	 uN3bOlupXYk2wBCRE7p93lvdWFDiZAPsDUWpsRvFWwQhOXYE0BnyZpXKcfA/VM26nAjMU
	 pfGORwZ4Ra3npL9Jw1U5iij5R7VjXprp1HDTJIvXGcbQVrTXCVrU43hdDSCWf8MCnEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cBjUGHG8kbdoyzZbGr/iLJi2HGc+aHIvJeTBRuTSpM8=;
	b=QdaeEIQM53mxZBsY1f7OjrMTMtJaliovW+YRydvpaSvD5Cqa/vyx/oTVzEz9ZZxTaJ/8
	 qjLf15gGuOCUB+e9D1KzWB5v8peYq3m5Gm0B68bae6LdAxwa7oN3CoPQhvZXXUr75LeZW
	 zgHGRhrryJVqGOpytdHwdk4nwVkTMBa6YJaL0NmkxVtWymmgEFj2YFU/B65U4jOzJcUPP
	 Je+480S4fXnBMn0UIHd5lnu30QcLTg6Zjqcygs3QL/0+NbUn//mfuhxoI+GGucnLcIHIq
	 iHwcdfDt7RLhnDU/BlxXeP8jm3IqohtZv452HIBXbBR+B1DNB9vCurEie/hh349jZ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWytMOOf;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955D0606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 10:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 955D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWytMOOf
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5378b281aso15927865ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616067; x=1794220867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBjUGHG8kbdoyzZbGr/iLJi2HGc+aHIvJeTBRuTSpM8=;
        b=qWytMOOfUicPwRY+FS79HBPw85D8Q3674+Rm0NB5JU3h+WdGR5LTOMOgpc6MGuBZRH
         LpLMMAADPzdXE800ESbNjE4KStnU+0LLZMKC7sHqm/Dm3FPO9rBJFCqrzSdvM5sPJjic
         ba/HXBj+1UcFfnxM9oqL3IXYuAnLfx1Kyiz60x9LWb3LFNOfNFM/CX1k/aSoBl+e94xL
         GLCx/A84cSjKsheLl76EBBys+ad3vZULXSISB0Dg2cwHlDWZGN2yW0MxpRLkafyLaYSH
         Yrvz+Iid29sRrfvi9Dm3aJ/LCcRHhZkVBH+Y7jQYkk6NqPViSi0/wlG9iYFrqSIBbLc+
         QY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616067; x=1794220867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBjUGHG8kbdoyzZbGr/iLJi2HGc+aHIvJeTBRuTSpM8=;
        b=Q94Fyn5PiDkBvTifEzg6WkyYXk7h5GVwjaAtJD69kiQ22Sjem/QusSxCBQLQuW7R5l
         7iXjRtPt0zHyzX+gDdKjeg1OV9jVsUxsfF3b87GS0i9zvdj+ZE8Hg5WCLH2JPM472zSD
         UctNbnj9Js9goCWHInJYKVD2qD/t5o/y5LdORrE9KLSmNyzslkl1J5BiI5NKCNy/3fXH
         1GhY+/s05XuO342D+nz1zcwB/vaJ+EXHpHQMglhxqtBx3AYrgxzEDL9I9z8zwqv6ELk0
         0RhA6lLdROfjBx9pfwA6K5kojoAfiE+pJUG8y4IBdWX7UzvVf+uaOPdvjefzFnyLXkdb
         oK7g==
X-Forwarded-Encrypted: i=1; AKwUvByzk8n41iOtBStpGPPTpr885ybxOrDVE8K4mJlE9hRtmHj/CLRUNO8tampyQpXUHPeTFX7yWggp2dGn/BYR3pE=@vger.kernel.org
X-Gm-Message-State: APuU4Z98O95+dYhT58Y0IFBIM7SPEAFPznDzVxKbvJU00XB4evDSTRxD
	rI6iyheBxYwEB8VAJtbfLiNQTmgvU8ntdkVcvEWuc/vpW0ssoeu8bKaF
X-Gm-Gg: AYBFou3/KKyCnofgmWddH5GCZh0WQxdPKZSnbeqK1QTEu8svh+NYsHLv6YycGIJsqFw
	+SAm19e3g+9sPcybPC3Cqzbb5si/Uo7NkDX5mop7enGMDhZgnoZ4jOP32yDSb8i488tw5byn9Ri
	iPjWkYhFf2TH8g9b6I4sKMVbMo80VUsTp0p8zicL11eo5I0FWWBzR9nO17QGWGH/rJQAdFi8Nnr
	3M6rO0JB8WuuB6bwPuE1TwNtBVbuWxE+AaoNT/qt3BhDtXOMdP+/CCAN3mrRB4JEe/J2SuxFkZf
	+f1MZ7qJBRv9GQaka2qYuRkKx8/lsJQOyEhnPE0VzdFRF9R9hBevRsSElD6MnWLT0n4D4k06NTg
	iHRM8Y8Abb47pCZuTT4gWKx9QN9FHLrNgyqZsLW4A0JgN5iPnCVf39BfT/KF3fHIT1KU/oL7qy9
	ssh7LLejbchKlJPW0Ua75WRvC8UuVPWu+NUl6g+4su5mi8czgh/ithsq4XRAKjPRvCZQ6WMk1Tn
	cIyERIMmiUFeBJnZVMdipniQxMSryHmtuFa42le7l9A5cE7Qv/q0V4/w5T+tAMsvz3C8pbmmnrI
	zfruEYOLpGrZtSHI6SVyAcbyyiSuq9tYlLkpRtGNIVfrOUy3ehePg8xQvQM5O4WiV1W9Ww2Y3g=
	=
X-Received: by 2002:a17:902:f607:b0:2e9:4b32:fc66 with SMTP id d9443c01a7336-2eb3649be71mr94161175ad.10.1793616066876;
        Mon, 02 Nov 2026 02:41:06 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1f3a:7c59:eeec:de7d:b077:9b9f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3925ff38sm25195465ad.36.2026.11.02.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:41:06 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Pokhriyal <umangpokhriyall@gmail.com>
Subject: [PATCH 0/2] userfaultfd: validate the whole range before changing write protection
Date: Mon,  2 Nov 2026 16:06:19 +0530
Message-ID: <20261102103621.156928-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A UFFDIO_WRITEPROTECT range that spans an unregistered VMA fails, but
the VMAs before it are already (un)protected, and on unprotect no waiter
is woken.  Patch 1 validates the whole range first, as
mrwprotect_range() does; it is open-coded rather than shared with it so
that it applies to stable kernels without RWP.  Patch 2 adds a uffd
selftest.

The problem was found while reviewing the userfaultfd range ioctls with
an LLM, which also helped write the patches.  Tested on mm-new in a VM:
the new selftest and a standalone reproducer (both directions, and a
misaligned hugetlb range) fail without patch 1 and pass with it, and the
rest of uffd-unit-tests gives the same results with and without it.

Umang Pokhriyal (2):
  userfaultfd: validate the whole range before changing write protection
  selftests/mm: test a uffd write-protect range with an unregistered
    page

 mm/userfaultfd.c                             | 20 +++++--
 tools/testing/selftests/mm/uffd-unit-tests.c | 56 ++++++++++++++++++++
 2 files changed, 71 insertions(+), 5 deletions(-)


base-commit: d42dfde37af766d1c272467352c0a56d3169ee58
-- 
2.53.0

