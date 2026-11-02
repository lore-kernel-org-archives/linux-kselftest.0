Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607107;
	b=xLhAGQukJHfLGNxZp6Hbs2/GCzfDp03VnM854PKlxUmecYI9OodMs8h8GbOCz9UTYgyp
	 91/Kgs2Y7FfL9YjkbFBeTWt7miLnWcbJDFh13yy5S4RAQhqgAUUB/tCqHoh5ybG9NZNiv
	 4wLTEuFrEozDb0h07DYBz4VEeiGXwgSEGMoaKsVxpsIB21zM+9iXdxU+Shksgzr7sOyrU
	 vsQm22vYE9cI+yDJMLqn1zXwXMDYb9dNHVVEF/RN7rII7Pif2+oXK/aNFxuLUZbTsWCwL
	 iuqQS/yJDtDc8N+lb1+sU6/SO9XazlTkBPMKp3s0l+l2v9v807GY9fTg6uv/vr+k8YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n45aLFyavI2LtF2m7I+VQnPGHMyctlLmfLLfzdcQlpQ=;
	b=bbrOwgdPaE7i7KHaGj/ah80ot42I0SAlBuYZP44f7pyYvBM5sD94EShHt6xdIE2yo+IG
	 zssRTEqEQCB0zvs1R8W86FtwNC+UcDrQUd5Q4ASNnBK/Jds70VbxSTSQ3y8tXXznaU2Ya
	 zYkxb/z4j+kbfGpYZzFHRQevo/3HLE6iLyis9njFRG3xCS4nycHwqb3d5eOb16Sqq5BfT
	 Q20BFAUhL3i9l9QdVq8jpM+yez2IhXxBhdM2uqV9AaY6suYtRso2HnhTuupXW3CxFbboV
	 PYK47JavC7XoSuYvnEFApmOgtpiIlydsKOVgDctqCcin3ir1gkeOwLpmEY5zp3oDLYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XUS6RQPy;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98CA606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 08:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E98CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XUS6RQPy
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso30577565e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 00:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793607105; x=1794211905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n45aLFyavI2LtF2m7I+VQnPGHMyctlLmfLLfzdcQlpQ=;
        b=XUS6RQPyb3otLnmDTaqJaQXOx+d5IGnB97gdhyJ16YFLMBS9Oi9L5ba5RebRSivImX
         xUKMnCVgsV8Zo94W80KHvK8Y6iHgiVUyQ3mxKPGhDQ8t+goiA1toTD7uDr0dy4ExQvbf
         UkqXJFec3gDJSxPjQiiS3zCpiwwd2IV3+dCOsbo2vQndD0h3weBG6qM1+8VyU3zYfRDB
         p4F+vHBU3+378wo8ZVn6soA6X+CfQdNY8KXaJZfIQ8zZizSbpiMf2ARPB9ehyNNWz8pN
         tEqOOt04zgi2h4pWjc7qyqfFb1693V/mCU9IrLV80LXrwFhLuGmv7fJzKMUdGh6t6pi6
         VEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607105; x=1794211905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n45aLFyavI2LtF2m7I+VQnPGHMyctlLmfLLfzdcQlpQ=;
        b=WY+fWtv2d45kdG4vc7ock2BxvKgaKDQMwNH5mi43cUcEOFgavgVceE1bnDh/oAcmU+
         5fYe62oHXWCIaQ9qjEVqXRp8P4bo9ItES8p5AetsbP6mYcTcoo931ma+kpxAju0w8OeA
         oTsxI3NuPAwXigtOfd/EAVrl42XIBmvG4UQm2rKqAdqh6dKlAYDppmd17KNBX2TWPkxu
         TgJhi38jRpI3v7pkx/tmZ28sQCPxo0cLAHebkacNK1m6bbFKGD5JHCBp+20Ku5zG4ULN
         2DbnfyD28oFNSuurspr4z0b4opSIAPQK4NA2sRX2cnA2U9eTIIXrqVfdEvribyybnwKN
         TrvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjaCRC1z6BUTWYuJ5I0u2YEvxAl000s3Ls3z8UuXStM5HBGPaZK6BWJEKmGfvdyzmd/IwXHG6oaUnQ8gJZWNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPq3NPT4OjytwW+WjfKv6GgQA2Y5EAJv2IanmKEMYlZZVDojot
	DJtfoK9h2kyvQQegbgBQX2/MNZtd2wJfcmrjD/AwFqpR2EgJ09pGCMIQ
X-Gm-Gg: AYBFou1/s5uO8MBEtfhFEoSkVf0suhUnA05w1MPiOohct3GhivKfqmqmfG0VZWSIrC2
	bJwU12UwsQ0MUVO1fiE0530VNTb1NgRj8b26U63+ZLHre02VGk9Od4IQZ69S8HPk9ryeYkGTyVh
	XiBeujHwCFkCdSQP4r8nmjM/dYN4vPyP1ELSJa8MeSPCB+EMnKnhyWnaVqbOylXgkm5fEEIQO/f
	kS9frxmkBtRqTz0hbZ62QuepIwj5pWXiItOzmDCQKiRQJLFB/Blzp33UK3/1WR9foITc/zLGjYO
	P0xaRCbKhACXGi2y3Ajbdmv2KD/6KRJighHjRRJuSXWiC3Z03byMm1ui8rVgpzOLDyAbkkYsMdN
	qtcRdErhZKYFYrsPUkJWvUhzmAsK71KTnLjXDuFxhCVmQhdECvB48jNikLjdx2B9TSjxEeOFe+w
	8reRv/KKGWqxlJOLRi7WFdRM9qilY/KWsqZkVevaTRETCLnu87iet6V8S0U25fD2Vei1WFjr5+F
	7zTqI4qxRGFhbB38SZklqKt7lZOAxbDIJ5Y7CRclUQ9NT4yF6mmfQfbKNDiu3UC0eudzzM/kPeF
	xo6u0jYTLrpugeWqHH6uS7kKze2qubFUzSs=
X-Received: by 2002:a05:600c:46d2:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4ac1980118cmr202498175e9.33.1793607105171;
        Mon, 02 Nov 2026 00:11:45 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm333331005e9.14.2026.11.02.00.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:11:44 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v2 0/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Mon,  2 Nov 2026 09:11:29 +0100
Message-ID: <20261102081140.201987-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The urgent fixes made hugetlb_fault() tolerate uffd bits left in VMAs
that are no longer registered for them, and asked for follow-ups that
remove the sources [1]. This is one: a hugetlb UFFDIO_COPY_MODE_WP copy
that has to fault in its source page doesn't recheck the WP registration
before retrying, so re-registering the range without WP in that window
leaves a uffd-wp PTE behind.

Patch 1 adds the missing check. Patch 2 adds a uffd-unit-tests case for
it, which fails on hugetlb without patch 1.

The other source 6/10 of [1] mentions, UFFDIO_COPY in MODE_WP racing
with UFFDIO_UNREGISTER [2], is closed by "mm/userfaultfd: write-lock the
VMA before waking waiters when unregistering" [3].

Based on mm-unstable.

Tested on x86_64 in QEMU.

[1] https://lore.kernel.org/20261015-urgent_fixes-v1-0-42796911043b@kernel.org
[2] https://lore.kernel.org/20261015-urgent_fixes-v1-6-42796911043b@kernel.org
[3] https://lore.kernel.org/20261027-fixes_core-v1-23-6f74bec9a5bb@kernel.org (v1, now 23/47 in v3)

Changes in v2:
- 1/2: drop the leftover sentence and the non-hugetlb reference from the
  commit message, add Mike's Reviewed-by
- 2/2: "all memory types" in the commit message, rename copy to result
- rebase on mm-unstable

v1: https://lore.kernel.org/20261029221129.89068-1-azpijr@gmail.com

Jose A. Perez de Azpillaga (2):
  mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY
    retry
  selftests/mm: add a uffd test for re-registering during UFFDIO_COPY

 mm/userfaultfd.c                             |   4 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 2 files changed, 109 insertions(+)


base-commit: 34f88a114888c9dba49e45f2b0c2a3e83c4c871c
-- 
2.56.0

