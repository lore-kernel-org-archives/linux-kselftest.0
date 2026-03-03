Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE11356A0A
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545958; cv=none; b=pwblzklEsjfZprDCJXrNWra3z5mtk/1Pms/XX3fpQjILfUiq+lFfha9cJPtU3i2VHyvY1G1ySka8vPcwRRbMMBJnIxG6S2WpZl8e6sCZ8gCYR5T+VLAi6qD8bUM+OTxS3NOYcBAwgiRb2i9Bo3rykFU+sdo2fbd6GjcjQDEb7bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545958; c=relaxed/simple;
	bh=Nkf8JlPVeJXLKi0iPhGG4eo4Fcm0ni1f811PWvrmEF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AB6sWoJYn65sKdler7nw7knAzQY8gdm5rr5TISz4c6q4QIV3j8EHa1g1TTrbzEtdTsSPeb5pzxtNUXxxuyQUgC/jrncbwmU8Rqepijk+aB0hLNRIWj8sAPB30UHqh3kJuBHO7hPGRMw9QzmpZEFOyvZJHeOVL/ISFl5a4vXhkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lk6hJbzb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lk6hJbzb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2addb31945aso42142685ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 05:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772545956; x=1773150756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDqgDDKpTGV+mlW/ZuWopljs3ZXh/rIIG37HcjmrN4U=;
        b=lk6hJbzbrEk7UGgTG8JwNxbKqqi4AsDHcXs03ynCVlm0uixiZyHiAUW5ymmAGkwJDA
         MilnL1Mu60aTM/IOePHSQBK9/KtEjcM50m76wIdLkPXzwByoFo8DXY3SrS7ZTwt0Z/0p
         JQy6ePBpT1Gyd9NEJdOvpK/T83CxVzfyb4hqkBjXmqh06C//OYJzwreiufZQIYqOWhyA
         uVlemrz3RGDvIHpBa0joL5608qZ45XCes7iabR/ThrTv5u6JukqA9u3gaeY1f2+oBaWV
         i7+FnszbxQxBi/bvfkYAblSj9uupvTbERwv7meVBfUsEAbevXdzIE9h8ZKsawL8YTDyM
         9E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545956; x=1773150756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDqgDDKpTGV+mlW/ZuWopljs3ZXh/rIIG37HcjmrN4U=;
        b=DdX39068UQSFYYQD8G45no4eKynLr7d1+dcAK6gCJGqfebawqXMNP9kOKXDuAG2wc1
         vifhvuVVdAUdsSMOX2GiVPy1FPH7tLKJb4Dp4TGFX4J1sKI7Wn34RkxqfR9O7Ec4L/nD
         780jRvxAkAlIBOarTwZ8FyXlBqgi3HcEJ7T7YTsGy3rm+faS710fykXssEUgCpAuf/TH
         UOJLGVzIpVW2JezKlo2EXMl3tpsVJ5fUCAVScKvCrBRJ7/2HUiCEkY0idFZ5uO7m0+JN
         Nb7mxKgnk0XLygyQhN4UqhKA/uqBL0+F0rR+pDOTrXzOT86pYSnIIdUsLv1mbkb5Uh8B
         xDyw==
X-Forwarded-Encrypted: i=1; AJvYcCUF9QS3di8gHMWkZ1gO181CJ43pir0XEv/Atet1bgO1i2gQ2DCO5vWXggJz6/lP9GpOf6sT/VuhJ3dSGr4r8UA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr+0DsTldQrX3wFCYLOJ7ZhoI13E/Vd/9GZ/ICGRyqYBC0JAfJ
	5L6ZqsVoXv8qa8s7qwzKFL1BW4nYmWFITt3Jh9aODL14jPJ1iWBXbXos
X-Gm-Gg: ATEYQzzcaPL8LctsL5Fm4URAYkiXiOjqU+eC1JmHqFMpa7t+NYaXyS3qalKfkHswdT7
	0vQK0K5Em5HHbT3+jiMTe4OIIN7bQsvyOuvibyclMi3pUAeE0N8zUAqHoeO81HyfpKeDglVAj1W
	QJWXZd/LisMFI/ah/6T6OIdLvnYjZlJr6zuLdJpBgeAWH9cKyGGIysMeNUGA3V9aDUe/7WR9Bb+
	LzNQczswP50uUcwlpV4a9FAMaWuIebt/xGEAIjC6b38V583tbJlSMEmgrsmo63L8Iv2ldsFkx+v
	eBLajZdsvo4R6bq+p327BAJnphXZyj8rh8rRSh3aLhjOFAhr9gGHX1nwQCiJ0McA3OES1eI+8eC
	/dvqRl9FmqjVDiSsVpApM0sSXwBM4q2PQCjDl7fyWINKPPunjX7MVXiVQIBLqAipxcd3PbwitCc
	EcRJrMsTI4Tpv/jCk9e1YMOPTJX66JSFExlwxYQF5y7QNXO6uk
X-Received: by 2002:a17:902:c943:b0:2ae:5426:da3f with SMTP id d9443c01a7336-2ae5426dccemr63203185ad.28.1772545955680;
        Tue, 03 Mar 2026 05:52:35 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa62147esm14689782a12.12.2026.03.03.05.52.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Mar 2026 05:52:35 -0800 (PST)
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
Subject: [PATCH v4 0/6] bpf: Extend the bpf_list family of APIs
Date: Tue,  3 Mar 2026 21:52:13 +0800
Message-ID: <20260303135219.33726-1-pilgrimtao@gmail.com>
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

Link to v3:
https://lore.kernel.org/all/20260302124028.82420-1-pilgrimtao@gmail.com/

Link to v2:
https://lore.kernel.org/all/20260225092651.94689-1-pilgrimtao@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260209025250.55750-1-pilgrimtao@gmail.com/

Kaitao Cheng (6):
  bpf: Introduce the bpf_list_del kfunc.
  selftests/bpf: Add test cases for bpf_list_del
  bpf: add bpf_list_add_impl to insert node after a given list node
  selftests/bpf: Add test case for bpf_list_add_impl
  bpf: add bpf_list_is_first/last/empty kfuncs
  selftests/bpf: Add test cases for bpf_list_is_first/is_last/empty

 kernel/bpf/helpers.c                          |  87 +++++++++
 kernel/bpf/verifier.c                         |  29 ++-
 .../testing/selftests/bpf/bpf_experimental.h  |  42 ++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 182 ++++++++++++++++++
 4 files changed, 336 insertions(+), 4 deletions(-)

-- 
2.50.1 (Apple Git-155)

