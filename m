Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34781EEA8
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795457; cv=none; b=gzUuWhork1OtlnyZw/tIHqehPZQBCYQgqDp5bU8vEQ6lfsTZ7xvtagf12cw1DWUE4dwvPzz6a9QNlICcJrLEuq7VEIhtPfqOqs5KOfzS6V+YfSeMlv25U9vEagnVVHnAXIA5wWe5+cgx9w1Jzwn+CCF3m5Dp5c04bkmRoWxIizQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795457; c=relaxed/simple;
	bh=PuOW7OjIeGTQhTC5nwTJCPJMOPF97oQ27G6NO2n8+o4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JPih0MVH4wDLUkngjQpts9Xydu7OCgRXUf5e/T4fYo80Ht+MeG29wOhKHwdKXz1jMR39M6+DNA1+GZh6WvaiHur/lVgXr4HqO2bSeV9F22lTJAVKlNtb8GGqtATciFTtPIU0jXkjm+C389eBvej1F2+2NeJrS0bJZUhc5LGCPeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CxOsn4YQ; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CxOsn4YQ"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so3841995ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 15:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785795455; x=1786400255; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDkXq62PUaK1OEdpjdaABy4j3I9dWut5oFZmmgzetIU=;
        b=CxOsn4YQ5fO7U4NMgG0MTtxV2FsblYFqMLcs0kKBxwmxmctupIikHVEhDQ1KflV8WD
         rCwj9L8xQy0DIy8/PJ18iWcVjy4gv8fOlYtADtWRSCBFXYfPOyROjzHpJ0cc/lmx45KU
         6YxaLHwuwmdSUbJuH5g208ZF/GF4YYyEqv8mvTf0GthGB2qxhcmX503DNOaVC8hkgMUM
         V/MoET3Sgn9lNFXWQcBJn6sBktmUP2g5icoXgnnlaBePJLF3OxwwvVQcTA1jokI4a8+S
         mRyJUBZv3pJRFEfln/LlG0l7RtRkAYRedI5PJsbDeH/I/C/pBcTk8zDO65/wgl+UsnMO
         QE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795455; x=1786400255;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wDkXq62PUaK1OEdpjdaABy4j3I9dWut5oFZmmgzetIU=;
        b=n9mrS/0zA17j9Q7thmgi2Rp6ZiDW4PoI+4Yhi0DVeboPDh/mJn5La/hcrniYxvZA6T
         7sbTgOEeMmznDzmDsEXNx3PW/bAWj0O/gghUsZfQGvhWoSvmJYJzXN7+1QmkPdSZ2J/n
         8tjBS40b0Z2HcxdsVNET3PKDC/OwL/aO7z3x2HkwvOqu+lOfJKXHeljy1bE3DtAlcWtV
         4dbattq+dv4KFdHacwIbgTCg5iuzbYA6/o2WXGJ+PSM232IQAaB9KDqB90E3hmSnTEUY
         hSVoYHEPFfPBXjdTrioyZXXY/o4RAtBsa9V9pm7g45rZtqI01IHF/CYGZd+UOXlk5+2x
         waBw==
X-Forwarded-Encrypted: i=1; AHgh+RpNjT84zdyYtqc7b6jzphWhfoaT0xmbMMSZswqbEmpH02ztkojnjrj7zH8bOa+RI6OaEcF6mmx22dstMmZ1aB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGjY5p+yz35DGJSrnIlA6KZPqCWy947FoHoNtbBROVV2z1aiEp
	P372u32dJ9oInw35o3sNJoyJFNNPbJOc21Ei7b9q4pbM/z08hfMQg4ln4577nZDLZIA1mhrONHE
	Jwzwe123CFg==
X-Received: from dycne3.prod.google.com ([2002:a05:7301:c83:b0:2f9:af7:504e])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa0:b0:3a2:d316:de53
 with SMTP id adf61e73a8af0-3c92a26b16emr11210688637.0.1785795455279; Mon, 03
 Aug 2026 15:17:35 -0700 (PDT)
Date: Mon,  3 Aug 2026 22:17:30 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260803221732.3651981-1-pratmal@google.com>
Subject: [PATCH v4 0/2] selftests/mm: use pattern matching in .gitignore
From: pratmal@google.com
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pratyush Mallick <pratmal@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pratyush Mallick <pratmal@google.com>

The current selftests/mm/.gitignore hardcodes each generated test binary
by name, which requires manual updates every time a new test is added.

This series switches to a pattern-matching approach (similar to KVM
selftests), ignoring everything by default and allowing specific source
extensions. To accommodate this without tracking generated headers,
local_config.h is renamed to local_config.h_gen.

Changelog since v3 [3]:
- Reordered the patches so that local_config.h is renamed before
  updating .gitignore, preventing local_config.h from temporarily
  showing up as an untracked file in git status (SeongJae Park).

Changelog since v2 [2]:
- Split the changes into two separate patches (header rename and
  .gitignore update).
- Added Suggested-by for David Hildenbrand for the header rename approach.
- Dropped David's and Yosry's Reviewed-by tags.
- Kept Lorenzo Stoakes's Reviewed-by and added Mike Rapoport's Acked-by.

Changelog since v1 (RFC) [1]:
- Renamed local_config.h to local_config.h_gen to avoid conflict with !*.h.
- Updated Makefile, check_config.sh, and affected .c files for the rename.
- Removed *.mod.c as it was unnecessary.

Links:
[1] RFC: https://lore.kernel.org/linux-mm/afnMAaz1jY94db2n@lucifer/
[2] v2: https://lore.kernel.org/linux-mm/b6717dee-486b-4c61-8ec8-0e4269959469@kernel.org/
[3] v3: https://lore.kernel.org/linux-mm/20260511173411.267628-1-pratmal@google.com/

Pratyush Mallick (2):
  selftests/mm: rename local_config.h to local_config.h_gen
  selftests/mm: use pattern matching in .gitignore

 tools/testing/selftests/mm/.gitignore      | 71 +++-------------------
 tools/testing/selftests/mm/Makefile        |  6 +-
 tools/testing/selftests/mm/check_config.sh |  2 +-
 tools/testing/selftests/mm/cow.c           |  2 +-
 tools/testing/selftests/mm/gup_longterm.c  |  2 +-
 5 files changed, 15 insertions(+), 68 deletions(-)

-- 
2.55.0.571.g244d577d93-goog
