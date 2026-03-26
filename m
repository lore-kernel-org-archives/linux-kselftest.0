Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E700405ADB
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774543188; cv=none; b=GXzfdJMjFF908DjSE1tyf3MaGdPU5xcfJM9peZFNGuCg5o2bfuAWR7d4hg7qZBAOR7nKTWf+vWUnb+rAzVwgV7OGOB+kFGJCLplnZIO9d3IYlM4QE5CGA6YFI/WaMFe4W7eaiGB9yJLCkIgyiArcAIFl26R013bdw5A5uVSl/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774543188; c=relaxed/simple;
	bh=HlhieSNooMEaqJrlzTgPMM8AuAUqiMA2JLJcRkswezs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Chc9Vps1zPV7dAUeWv735u+08CfXKQMjDwzVbtIDRSwx3YfCLbDZPVMF+LeqAfAxLLufucFi25Z2hDQMC8sT+njww7uIMsvveEDglCwQjLnXzPKIZlkT4gcYh5XHCYs251sctSPzGUzyDMeoZBU5UxouWKQEgV9dZ+m9tOQN71M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WHoWmW7Y; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WHoWmW7Y"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50b2ebca625so9978481cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774543185; x=1775147985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5teIlBmpIM4CFlC0NlM94VBdqPnG93qpl7z+RCqm5g8=;
        b=WHoWmW7YVS6V8qrtGaRRnnd7jjUtO1YstF6eOwt+x5n9tuz/9Gv+Er1GRxS6HhDlds
         YLHX6ybIinVO51zkAIpyAc/60me3wly85PmxAWC3b3D9HQC1gQV+Qg0AcvPWT0vVuliN
         sunEJlewKe0Xhr/+n/AlsImo43jX4psY9VMLBmJ7qMX3OMuupFjuoqOXTX694QtIeJmg
         ioFALBRNlMqSj1Hi6rnb0J9pF2k4NOJkvj61T0aA3+HnOupI7iz/tnVS3w571IZ5tk1X
         rzpTt/UPa4m4Zgy9CRN6fJ7JymJGPIq0lTjLdLIW2pVwY2jkoRjzO4Bq59ZXvdZRawHq
         oNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774543185; x=1775147985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5teIlBmpIM4CFlC0NlM94VBdqPnG93qpl7z+RCqm5g8=;
        b=UyfL8YTihApjSOaT5h5pGjbX67EhtDbKW3nTYXclMSt7YYaHMbLg9nTNngHi10VB0r
         4xi8TxvBXZAoUznPoCT0vwytd/dQyTjQrtQe5xakmQkuz5yJwRKa5zNxo5N99wIpR3Yo
         if8fZ+AdypafYfVSnCyKzINfJi39z/shTKB9LhlmTppCDnY7xYQ5bIT170L15S/LeYrF
         zlfqRpK44wm1fVcdMr5po/8/Qj4eX5FbOxYC/HrS4ErvKMFNbATtKWVKzUqZvKLkwxGl
         QPWBJL+wNkGUoo5TeffLzERY1yBfvF/cCpUPtyY27OY83p8JysbZlb/JTMs3nKFdwepl
         k6RQ==
X-Gm-Message-State: AOJu0YzVOxMo0s4AIOt2imFLkKc0GQg9QPW2/pgTxIoxEkY/BcwHiG23
	KwXNdSM4fOg6K89fY+i4Mfkb80eeZJkZ1i1h/Tqp8QLd9Gk3L/BXJqQ7IwWWa3IUmZTag0ZoIYp
	vySTP
X-Gm-Gg: ATEYQzw7AMHa/aqfY5QW6+sPykohwNq9ILMijYws4sCxYp9cA1+rPWeWytC8DVO45Gp
	lIutEqBQG8g0cTI+bCs/bo2BYdyM/XsndJsWL2tg9tOZ1N3V3OSgAk07pPaTMkPniaQuTgw/8pw
	pRaHPyzQDkhEOYZ8VdOvuDYuDvThulbanmcnj1mrO1aKyuxbcQDHcWwDcZ48U5oRqbIUqiQ7Sgy
	lDNfZ3dD1yJ/Kn0Vq0wd01iWwHIJ8Qyxi1Mpd92ytCPszGVYRljUCbff2m/vslwJ8NIUitbByOV
	lnGI+U92UQV2lbnp9NJHpDtWO8RbNq2b/sLrQRxKUFtv3DlS6OmV6Qek5SuxKqIaopr/LB5Lf6S
	rtC740DGy/yVfCqbaMayh5OoGN0a5YEkS1RRuIdtG9LZ4XnJ6x2hOJa8+Vs5azGOsVOwh4VzOQq
	cpkrCjR2ptYGzyDMSUdTMr27XC55ZKUkpslHlzIeA0Akfl2rO+njKQi3mNFTu91YdXVWmBk0y+X
	gRw
X-Received: by 2002:a05:622a:610:b0:509:f1e:41fb with SMTP id d75a77b69052e-50b9938d03emr25978071cf.6.1774543184726;
        Thu, 26 Mar 2026 09:39:44 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b920f77cfsm28238251cf.6.2026.03.26.09.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:39:44 -0700 (PDT)
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
Subject: [PATCH v4 0/3] liveupdate: prevent double preservation
Date: Thu, 26 Mar 2026 16:39:40 +0000
Message-ID: <20260326163943.574070-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, LUO does not prevent the same file from being managed twice
across different active sessions.

Because LUO preserves files of absolutely different types: memfd, and
upcoming vfiofd [1], iommufd [2], guestmefd (and possible kvmfd/cpufd).
There is no common private data or guarantee on how to prevent that the
same file is not preserved twice beside using inode or some slower and
expensive method like hashtables.

[1] https://lore.kernel.org/all/20260129212510.967611-1-dmatlack@google.com
[2] https://lore.kernel.org/all/20260203220948.2176157-1-skhawaja@google.com

Changelog:
v4:
 - Added get_id() callback to struct liveupdate_file_ops to allow handlers
   to define unique identification for files (e.g. via inode).
 - Implemented get_id() for memfd_luo to use the inode pointer.

Pasha Tatashin (3):
  liveupdate: prevent double management of files
  memfd: implement get_id for memfd_luo
  selftests: liveupdate: add test for double preservation

 include/linux/liveupdate.h                      |  2 ++
 kernel/liveupdate/luo_file.c                    | 32 ++++++++++++++++++++++++++++++--
 mm/memfd_luo.c                                  |  6 ++++++
 tools/testing/selftests/liveupdate/liveupdate.c | 41 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 79 insertions(+), 2 deletions(-)

Pasha Tatashin (3):
  liveupdate: prevent double management of files
  memfd: implement get_id for memfd_luo
  selftests: liveupdate: add test for double preservation

 include/linux/liveupdate.h                    |  2 +
 kernel/liveupdate/luo_file.c                  | 32 ++++++++++++++-
 mm/memfd_luo.c                                |  6 +++
 .../testing/selftests/liveupdate/liveupdate.c | 41 +++++++++++++++++++
 4 files changed, 79 insertions(+), 2 deletions(-)


base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
-- 
2.43.0

