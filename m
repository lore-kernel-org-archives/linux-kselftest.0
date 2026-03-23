Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEFC38656D
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 20:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297909; cv=none; b=ire5pXvdBTk3Y5QT1ONQJ9j8ygZ3o3ehamtus1UgMPiHOVCN35b/M+j1XDsBnE1ZuleARjgpv2SedI9bMCCmAKBR9xUsfSImRFi35mKCm3O74ve0K+4MxwCfHnvEwBi4MQMaiDE0Fqy+fAKl8IFkWUDBGDQia7bnimJbulPuWvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297909; c=relaxed/simple;
	bh=D6zWtIloBtEXh+4W8DrijEEo4mR9tdS9bxfOwltnv1M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=n53F9OP/idiip057phPC3NhJDuXpcb9S7K2+dK1C8EjjzYIjXNIocQYVlM4IlN6wlKxGbZFGfISkRxsAm/KEpTXguo5qSnlgLpNSx5ismH4t81aoRiTZBhCQQDSq9kuDRAR7m7+MQ5ES1tD2wZ5F9kBswXHXuTnvygrIVxQ18io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=QP2Mo3zk; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="QP2Mo3zk"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so2809540d50.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 13:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774297907; x=1774902707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lwhk6av2PkVV2YHn7RPTrkcAgzWJduOS9hmc2v1dRNM=;
        b=QP2Mo3zku7KVnFxLzsBfZxVFDFRIoD1Y7o29eVOAO5MkxuOZY+bc0dx8ndbtbnfsIu
         nFfle35qkmdRLO7BmV+/bn70iNgTenGgCh5Gj05vwJ1k7pTtqRbnybseDu/tw9ukWj8G
         NpbGL9cZ+FQwUXp5fwKT9Hv1j0DvuS6eRX/bhpyezY0E9ezQoa4gylno/9yf0Z5soNFn
         Rwdh/J7Eqki5isGHNSoygVo+ltJtLc1WlSANchWCGKy8viTcZFhvYEWgxCgYm+bj45su
         TEkAZ/tlp0cCDmhUR/ZIn1XmvUreDnwrAEEZ0F/r7krJziox9rvyu63sEYV4cbwMwEni
         /JVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297907; x=1774902707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lwhk6av2PkVV2YHn7RPTrkcAgzWJduOS9hmc2v1dRNM=;
        b=pEBmRrl/+gIFMJtU1VLl5oi2egDA6KwOUjFQsf14Z9AD1l/qyRu6VH1mi7g5kiusaQ
         G9JLx1iAf7XQTivdMifxiIAZcxenvm2uQ6zzHK7V26G2Vo1GYp53iYkhT0jS40c4D5uL
         jCTod5/ei/UOtdHtk/bb1Q8gc8GpLcdsmXV3JP2ZKYMjJ3UyBy7L+mPWk9f6zbT6QqcQ
         nDaXVecVnYO0XoGPK9WEMRSPQu29g7tsMWY2Cefz+YHzNq9IkY4kmJUrO+Bu0aC3wbV6
         p/i+g2VG+MX61tt6jMQi4S7FUHtPXZjfoT3TxCt+wf6I4wA6HKTvSCJ+WwLiIKv7AaYV
         Y+gQ==
X-Gm-Message-State: AOJu0Yw5UyP/eePBYLI58NwhiLQ6hnHGlXtATaja4zOGKoUXVZrpEzDE
	yA/PRfwzUU1dsJ/An/uXZAy74xBFCEvnCz3UNozEp0+gt5tIp56lFo1lQpsZ6vqhsPgsUtumoaB
	Ha2EX
X-Gm-Gg: ATEYQzzjdkiHD3QhQWYImfqZDOS7Iw0NJaeH9KK9UlTnHopOALo8pqXkMRvaaxQP3Zn
	u3icnI6fDaxRPcX1MJrPDHCulXpwa7lcbiiim0p8jwIeuiRFOpY672+uecr8jGR8+AxtM6/XRjB
	5msumA7KAxp7eSbmWve0is9VCeFU2uaAqfZLiws3aWus9Igz0P/QaiUGTx0RVLteefTe0Ot9237
	D8FkmNmN97h8QeZdHDP9Ne9RhajPNjJ5AevVWd32vmqJPHASPq35TKS5EhCAx7dSIn5tgNJ04Bw
	0nYNayiBByjpEInkX78OSk5i9zTQ5WJrQBr1VyKVUp5G31rkUXGum56OeZ454DnhX7ji+SpqTqJ
	TMGqdcva1+OSVuSQpJebzUJoctBoBzSMKs16vqZJrzvx59WDIVKYfTLOvFKzlsOvNexRiuHI7IV
	zM5N056sD+9izF5EzT5qNIvy/UjkYWh67VyCAxZPT8f1NJCcmWC1JDgFi36ZgAu3TToA==
X-Received: by 2002:a05:690c:e3c6:b0:798:2629:85d7 with SMTP id 00721157ae682-79a90aae42emr128303507b3.9.1774297907010;
        Mon, 23 Mar 2026 13:31:47 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fb9c10sm1014271785a.19.2026.03.23.13.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:31:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	pratyush@kernel.org,
	skhawaja@google.com
Subject: [PATCH v2 0/2] liveupdate: prevent double preservation
Date: Mon, 23 Mar 2026 20:31:43 +0000
Message-ID: <20260323203145.148057-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, LUO does not prevent the same file from being preserved twice
across different active sessions.

Because LUO preserves files of absolutely different types: memfd, and
upcoming vfiofd [1], iommufd [2], guestmefd (and possible kvmfd/cpufd).
There is no common private data or guarantee on how to prevent that the
same file is not preserved twice beside using inode or some slower and
expensive method like hashtables.

[1] https://lore.kernel.org/all/20260129212510.967611-1-dmatlack@google.com
[2] https://lore.kernel.org/all/20260203220948.2176157-1-skhawaja@google.com

Changelog:
v2:
 - Because inodes of preserved files can be shared, we cannot rely on a
   flag in the inode. Therefore, use an xarray to prevent preserving
   duplicated files.

Pasha Tatashin (2):
  liveupdate: prevent double management of files
  selftests: liveupdate: add test for double preservation

 kernel/liveupdate/luo_file.c                  | 17 +++++++-
 .../testing/selftests/liveupdate/liveupdate.c | 41 +++++++++++++++++++
 2 files changed, 56 insertions(+), 2 deletions(-)

-- 
2.43.0
