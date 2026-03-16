Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E406834DCCC
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660538; cv=none; b=Cme10z6PogcPJqf6sYh4pRshwmC/04qoPKM6DUYuPP4qbF8QQJPy3QZ9XvmmnEgxeCygccyHbkTAysOVKc7sY4EYmWLXF3Nx2eB/7njxeo6IJN+RA/05HVqSO0zEbJXQDLgmtu6WDE4/b+C0gYYKbzOSKEbBcc9h9ioFyi//q/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660538; c=relaxed/simple;
	bh=1O+LEkCcALqHcjZwSpKQxGV6mvhgBFLNsSL9qxtZpNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQqJ7tdgy6aLHObNpYUk2faYhGM8UUHvMqTkDUQQ9cTJzxm0sqRN2rPA/zaiUyLPtLsscHzr3nT/rQvK9I3X9xMPJ0vXwtV103aBmf0CpunVrtAcZ/2FET12cabtZ5mC4zbMWzC6hGC+ZwwH0Zm1tiYti+8RgyZcdC6dsuM1l8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzJQopGs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzJQopGs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35ba749f441so322148a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773660536; x=1774265336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ntIiD+GdH03++TVgBGF+pBQuOhfJiM87likhblk8EQ=;
        b=mzJQopGs/RKtIDhXvrPisJO7Emh7R0GUHblMPaBeaH8KoJUIgI89/eWYYVUbvN0V33
         80UbliMs1oEtdyKyc4xYrRW8KrXbn6mNpfcPhU5eyebOYhob78lknH01y0SmwdEnAkG6
         CxUJ5HQCrfinCLbNyVDyiNmHthzzxhu6VVJNa2SXIgVAndFGBY+xbQoND5/d1fSouoLc
         xB094FCwDxPTPY2u7PU6k5KLBnc7v1fpnPYMBN788eJZTdq5rVyBauZJqVDf3fbZP2p6
         AVX0JxH0Ys9gyrVt61kf9mdh6GL4kHjRWQLK39TEdqZSR2OosDIU0RaVQ2Uedq+LAfU3
         t11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660536; x=1774265336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ntIiD+GdH03++TVgBGF+pBQuOhfJiM87likhblk8EQ=;
        b=qFbaBep9CW1/Z2ihm2WcUCksvCLzWeqveBUJFJTndcM7sPkeFTwp/Z0W0sXMK11Ks1
         b/v0lDki7j/F4bZsGwujzymRmsUB/60o6kzOe/j9Mu7zyOFwrHVwqh8cYMFvllcQRhat
         HBnzr+zIbeXV/GBORxc0EAnauW3Rt/p1fJkwhYxsqUsBVUQUZ84Q/lgAaaC4Z/mFeU5R
         rmzLAeSt9shls3tk7W9oSfw2oxVFZT2YO0OXrDv+lrFLkoakLjXsw78tYapiiDxwwqfc
         5N5UESUrLj/sWUDQRKAARq6EAyj/FoC4m0Ae2e7NSiqOiNIgYSyo0/qDXnFJYUQcgbxr
         bfxg==
X-Forwarded-Encrypted: i=1; AJvYcCUeX32ufsNI/swoUyILEOW9jHwqI4MNYXExcXWaTbb/Ua1kvB3WT82DajZXua9j1j0G3ZKLvRwIyfodjaJjtB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2vJl5riZDTvtnl5DMx3oRqqb+M/TrwVYpOStPmhaQjUWjvG0
	fJtJqdLbW0aAavgSWon1w+4yU4Mq1neOaMagSR4DYwFOVODPoCe23rwW
X-Gm-Gg: ATEYQzyWk32TuDSQ79ofHppY839ecGGnlZIXDmQSmq3i4hs59wrtqJe0CjdkjUkiq7G
	1tMxrmsCR0thpZxa6RIUkArlRfV3XFOHG9dQZfWkDY1dboZxcY5dpY4kNmu3AzAfbwrtxUvCbI1
	arGd0reqgwTaQgZhwSwaLzutRvqRHPSXXEf/sHxJjvpawbjGR1Ss4+9xos4hZg8ND67uR1IBK7C
	42ZvCZAJwStEwohfU3Pa2ye5JdocgZJksDAmyvX/eQfoKNWkK0NaKloKB6cVJMsl5W9g/BQdKRT
	xqkfGP7tF5ePq9JPoVsSsDu1aj/+PUaT/Y69LgXUQr7fWkYXKPMu3simkTCJ41GOFptOnj/H58o
	6tkdMNuUPrlzxLSkl6eUZnhbJ5rFHt327/qru1vV/Pg8MKoGNO08I3YTcV9lRh430sMW5hgnqml
	J5TYyDARZodjRVEv/lQwHu3QBlpDlyG4EdDjisEW7h2jQW1PBxxrvToNg=
X-Received: by 2002:a17:90b:278a:b0:35b:9719:b7ab with SMTP id 98e67ed59e1d1-35b9719b972mr4306322a91.23.1773660536304;
        Mon, 16 Mar 2026 04:28:56 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm4684940a12.32.2026.03.16.04.28.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Mar 2026 04:28:55 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	chengkaitao@kylinos.cn,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v8 0/8] bpf: Extend the bpf_list family of APIs
Date: Mon, 16 Mar 2026 19:28:35 +0800
Message-ID: <20260316112843.78657-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

In BPF, a list can only be used to implement a stack structure.
Due to an incomplete API set, only FIFO or LIFO operations are
supported. The patches enhance the BPF list API, making it more
list-like.

Five new kfuncs have been added:
bpf_list_del: remove a node from the list
bpf_list_add_impl: insert a node after a given list node
bpf_list_is_first: check if a node is the first in the list
bpf_list_is_last: check if a node is the last in the list
bpf_list_empty: check if the list is empty

refactor kfunc checks to table-driven approach, and add test cases for
the aforementioned kfuncs.

Changes in v8:
- Use [patch v7 5/5] as the start of the patch series
- Introduce double pointer prev_ptr in __bpf_list_del
- Extract refactored __bpf_list_del/add into separate patches
- Allow bpf_list_front/back result as the prev argument of bpf_list_add
- Split test cases

Changes in v7:
- Replace bpf_list_node_is_edge with bpf_list_is_first/is_last
- Reimplement __bpf_list_del and __bpf_list_add
- Simplify test cases

Changes in v6:
- Merge [patch v5 (2,4,6)/6] into [patch v6 4/5]
- If list_head was 0-initialized, init it
- refactor kfunc checks to table-driven approach

Changes in v5:
- Fix bpf_obj leak on bpf_list_add_impl error

Changes in v4:
- [patch v3 1/6] Revert to version v1
- Change the parameters of bpf_list_add_impl to (head, new, prev, ...)

Changes in v3:
- Add a new lock_rec member to struct bpf_reference_state for lock
  holding detection.
- Add test cases to verify that the verifier correctly restricts calls
  to bpf_list_del when the spin_lock is not held.

Changes in v2:
- Remove the head parameter from bpf_list_del
- Add bpf_list_add/is_first/is_last/empty to API and test cases

Link to v7:
https://lore.kernel.org/all/20260308134614.29711-1-pilgrimtao@gmail.com/

Link to v6:
https://lore.kernel.org/all/20260304143459.78059-1-pilgrimtao@gmail.com/

Link to v5:
https://lore.kernel.org/all/20260304031606.43884-1-pilgrimtao@gmail.com/

Link to v4:
https://lore.kernel.org/all/20260303135219.33726-1-pilgrimtao@gmail.com/

Link to v3:
https://lore.kernel.org/all/20260302124028.82420-1-pilgrimtao@gmail.com/

Link to v2:
https://lore.kernel.org/all/20260225092651.94689-1-pilgrimtao@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260209025250.55750-1-pilgrimtao@gmail.com/

Kaitao Cheng (8):
  bpf: refactor kfunc checks using table-driven approach in verifier
  bpf: refactor __bpf_list_del to take list node pointer
  bpf: Introduce the bpf_list_del kfunc.
  bpf: refactor __bpf_list_add to take insertion point via **prev_ptr
  bpf: Add bpf_list_add_impl to insert node after a given list node
  bpf: allow bpf_list_front/back result as the prev argument of
    bpf_list_add_impl
  bpf: add bpf_list_is_first/last/empty kfuncs
  selftests/bpf: Add test cases for
    bpf_list_del/add/is_first/is_last/empty

 kernel/bpf/helpers.c                          | 121 +++++--
 kernel/bpf/verifier.c                         | 116 +++++--
 .../testing/selftests/bpf/bpf_experimental.h  |  16 +
 .../selftests/bpf/progs/refcounted_kptr.c     | 311 ++++++++++++++++++
 4 files changed, 519 insertions(+), 45 deletions(-)

-- 
2.50.1 (Apple Git-155)

