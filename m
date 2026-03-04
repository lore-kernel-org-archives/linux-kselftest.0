Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3B3A1A54
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634922; cv=none; b=SLnLTnjUsq3qjeCX9Pos8hc8asUWRbSNT1a33CVyChBg65QXDC2CPty3VJmCM7jMjSTmObRzwQPq4C49mxAkV/WV8xbZCaWaiLNgK75kV16rgndvxSlXmQlLeEHb+2NKECX3e56ckRe6ox2DPKZjq1HGSIU3YW7TkRvbIUyuSFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634922; c=relaxed/simple;
	bh=tm9z4rhCez5HLQviad/BMnNVmKmKuVcBpkwCJjwSoVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sHqXOqH8YhkJ9pRUKoERUuhgeqOXc7kOWMFnjHGmNiPuPAnmC7MtExiX2rN7fYZa5RLIVurj3G7DQZGz30AtlGVgTSGnVuHPtafqmHIm1OS+UrCg7cLR/oxOQWfKh6fZknLZI0sknIBtooDFyOvjMCh71iFdD/cnNdsI5858V18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCkZjH6K; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCkZjH6K"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8272a56b91cso5807407b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 06:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772634920; x=1773239720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww9Gg44/nr/4wT9Ug3u7VZF84qM0My1cXsMZLyLTfi8=;
        b=cCkZjH6KDc3rfZSUR97IZCxY49d8uBPWZhxsbCjwQ0OU+Fz/7kydz6KFZ5+w3K82gl
         bKC2d/JX2B5qZmNgmuBbWi7La1zss6d6CpDdDuqMlqJLISxKGxvofJRydk59cNYyoSc+
         cUMKefLrlCsOtfIBOPcmhheOzTqMsZmCGk4Ny2ha/nBuPNF9fqmeGjLzFNnTR16aOd61
         1GnnUCGzfbpE7abrI65jCEdDmKljFC21nroxEo5uAjQmiisFwtayfiJ91bL5HhsCO+2D
         XVxHUT7I55tUT1s4LhYUK4QEeCFJzHpE9PoZuu/r1bS2Ki9IJl29jbuzu7zmazPB7SjE
         AFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634920; x=1773239720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ww9Gg44/nr/4wT9Ug3u7VZF84qM0My1cXsMZLyLTfi8=;
        b=jM48gkORKDWpYgUON9mA1BuRaNWZ6KDFmaPfvfLzYsGOF+LYy3lV9Mc375gBRo9Qb2
         poXYo9QlnK1+Z4bqWvw3VKoZq5YoIzmxwmvKUeYYr4Zva7FO6LyXNfIF0y6YnTAfcqU8
         qcbFpYnDt4FKOEfKu1LdOwhSK/+AX7AgpFd+V3SRV19g2e/2D11wLP53x4+2q1n89LFv
         XSBM06mXfk3JKbA+vL8RfqYnH+5S/t6yI/i6Ti7gmYc0MJonAISzcqmWq3G6ynEKAib7
         X07pFDSj7kGTsSNJMclxZFwC8eu6h9nyz4zO7Ah60lpo6wbE37SH+B9oXpm8im+hLHQE
         n6Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUH6d+RD7HE7O6bhQ/GRcztNX6wY/3rYa495x/uI4v2s0/RN9PNGZn0kimfCDewJzcnoHkdkFjqM8gQ66wxoDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa+RkQwE5hJUpDfPTH5+rlJNnyQRc3bbdSL1vRJxnAM7l+cGEc
	c4aDgahqrjypCUe3aFuv9Lc3m9kZBurxNnEwBBxC0qHyB0kH6hNv1hLi
X-Gm-Gg: ATEYQzwnJW9gdAQrGyghuh0UKktkTBxIlWJf6j78bq6H9BuitODW+NIZO/UHxCP+a1W
	BbyiKFAdVXpGlLrTjc5Vp4yMVR25GSu1MinfpM4iFTNmkL4hkQxp5Pl/DteAnaBRcsN6EWN9oT1
	HGkOMPo2gStLhNwhprKOm3xQz6i9SswNsH7ex/V7ru0orUBKDXIM2jvuNGrvS5Ye5QM2cqONilC
	i28OWhz0NeK8V8SL2JE4apsIXaRzNgbuBsoXXh4cu5ThEepJa+SmUNvRyXsGBBCTy2Qz3HRCbvM
	2cMyjn3erIvUas5oOvr04g3FXJRwcghjEO/xQcAeifVduvh0T4r4YH0iMNEnixJVmFBTR8BT8+2
	N/z8nmH3kWG+5VqnvMvP3hTghDx+paEzgGUQgtT0jU9Qn+xGfeCWIm/m2tJFIPR6lZNxpref5Yg
	nXtclP6tJD+9bb85sH4dmycpa1SkxNr4csTom/TNbYiLGPc5BcIyBDHg==
X-Received: by 2002:a05:6a00:94cf:b0:823:1d04:e280 with SMTP id d2e1a72fcca58-82972b5e2camr1819011b3a.22.1772634920093;
        Wed, 04 Mar 2026 06:35:20 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d87e4csm18470184b3a.15.2026.03.04.06.35.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Mar 2026 06:35:19 -0800 (PST)
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
Subject: [PATCH v6 0/5] bpf: Extend the bpf_list family of APIs
Date: Wed,  4 Mar 2026 22:34:54 +0800
Message-ID: <20260304143459.78059-1-pilgrimtao@gmail.com>
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

Four new kfuncs have been added:
bpf_list_del: remove a node from the list
bpf_list_add_impl: insert a node after a given list node
bpf_list_node_is_edge: check if a node is the first or last in the list
bpf_list_empty: check if the list is empty

refactor kfunc checks to table-driven approach, and add test cases for
the aforementioned kfuncs.

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

Kaitao Cheng (5):
  bpf: Introduce the bpf_list_del kfunc.
  bpf: Add bpf_list_add_impl to insert node after a given list node
  bpf: Add bpf_list_is_edge/empty kfuncs
  selftests/bpf: Add test cases for bpf_list_del/add/is_edge/empty
  bpf/verifier: refactor kfunc checks to table-driven approach

 kernel/bpf/helpers.c                          |  98 ++++++++++
 kernel/bpf/verifier.c                         | 103 +++++++---
 .../testing/selftests/bpf/bpf_experimental.h  |  39 ++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 182 ++++++++++++++++++
 4 files changed, 398 insertions(+), 24 deletions(-)

-- 
2.50.1 (Apple Git-155)

