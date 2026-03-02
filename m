Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF737472A
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455241; cv=none; b=rt3J/QOG7uhThQJSZMARPA9LZtRO3o9n/s/78f+k+5gQ2gNyh4dQRaAZhmnQwD6A6ZMxTJZux1EdF6yHMC6XZpbWBygG+jjFcwbdpMtI8Uokd0aah6tjOKEzEjIu1oYgPHYiPDcoWGFI/iwKAsqdL1k8ZptSi7HAbM7h7b5IPfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455241; c=relaxed/simple;
	bh=JMbovVkIHjyw1SkxJf+jyB5p2bx22jbBcT5wRY+P+dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swVjuDJDPfndPPoVgmUNzwE9KViTZMt5farx915a3Ms6OUIyJx1mX1qfkSLPXqn7IKJ4IiW8yRWdm4rxn2QbWlg5Oo2A0rLcpZcmRTbBEnELL2AShD00n1nnyUInfJW/+hEW16xpBSuyOg9VH1+PD+qquw4PFBhp9qE4NciXaQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgFWjEzN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgFWjEzN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ae4d48dc2fso4404555ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 04:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772455240; x=1773060040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEZZVDsX2jfTU9OZR6R9bxtazsvL2oFzaTbwqEvIxnU=;
        b=YgFWjEzNFn6IhEs9pX8fFxIYZ8cotPD2pWWy1pdsBPLiy1z0Ax47HBrK+qnce+PNDf
         633YtGqXjVYSuLdyfY+uF7GcrOQ3xu4/TDLSydQpzxOXZPP9anNwg21DsQyPWyE+nVRY
         63SA0iSbxSFobsd7ap1ulhqtCFXIFOlDBwRsgmfwZiqOhe2RfBDL7hvtZb2q92hvgfXM
         gjeUTJmOOGqN9jQ78hfs0BgDEQaV56KY0COfCnC2JeMfVdINq2jMbpTs+IAWxJrwc54e
         6pr2B/ZLX4tMiO0FNkGTkdgN+QT6fGA/7I/lAf/xxcCCNXdJ0GS2o9nCwxTQlzVPrGLL
         MHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455240; x=1773060040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEZZVDsX2jfTU9OZR6R9bxtazsvL2oFzaTbwqEvIxnU=;
        b=ia23fDR7hcOGZyzwWaX4oKBcPOYYpKju24nsfMKHUM+ZILBoPGL+igDMQWgMBZGUv6
         EfDUQ0PJ9e8YFTIk1c+0hHxZr/qQttjbucKjVGq4M3P3NrKFzhZp2stAurCa9YvwrUuF
         pIacFoMj2g18BHZE0k5nHK/jdq1IKOT1nzhhY1FxMJL1Mx/cQ0eHiVkGU0ep7xznT17N
         Gx4m+nkUwq8nLk+jZKmo0o22AicxNzJ+ErbRbDy8JPej+R61PztbDp98acbJqcEMf7YG
         0k8u4QH3r2h8j4+XO06I87ez2l7eznUq6FeHoUbtvh1r11P6RpEyXgk91E+ImsrbrkxL
         cI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxPyx0CnX1+yUQV5q1sh03xdTtLGSmKToM16tCHoMS99+Ii16EYXaU6QvvQFBvmHtuukfimXBZhntBvp3CloE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3mzA40EQccYQYi0QyJyh64EyalCp5Dv56PXBpLa6NhLOSecR
	DiqB11myH0kWrm6BKuTFlBEQ9IG5EtxHL/sDckFUOhL8MnNVhItGswieMsvdJg==
X-Gm-Gg: ATEYQzxjylZwyFCM7cdqnIb+YNKzPFvAxB5wmPNksgKKuLq/wslIotroB2+XJ9bO7Yd
	QBaIbGPIqwR2du7I7GytRLU5TilN0/yn0Ep0EPshBk1drzfF1xWcmX/lDU7cbtSqrUDDTggW5tt
	HVpa2SXR2DHlv37uh2SgEKtOY1/RYzlKBk1nsqVB1SfUNd5bypRJQWI4sOGnQoZHqwWKDmgdPYE
	ZBrWyOOeMWLVc/Dl1b7xSB/bGL+M67Dl6VoVgR82s/iFPZHwfI8v//eh6801uRIkiW4vW/QSyHv
	7xihpIoxqQE3h2MjHdi/zknvCO5Ubznw2uJk52UCD7KRjs8Jh/LocTV7YVVXrmQsPtwpddTqUHp
	8TPALVFWrpugbZVkeDQKV+Mmh0TsX052EYz/+KxFkwZlZg7eRbK+u9WLzxARx0zbSds5uYzDt4P
	TrxLRvrXz8jY91R/+JyZLUiTuBViBl+qNQtJh2okRpQrus7h5ArEYZhg==
X-Received: by 2002:a17:903:1110:b0:2a9:616c:1711 with SMTP id d9443c01a7336-2ae2e3f75fdmr136529535ad.42.1772455240071;
        Mon, 02 Mar 2026 04:40:40 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1956absm67910225ad.14.2026.03.02.04.40.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Mar 2026 04:40:39 -0800 (PST)
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
Subject: [PATCH v3 0/6] bpf: Extend the bpf_list family of APIs
Date: Mon,  2 Mar 2026 20:40:22 +0800
Message-ID: <20260302124028.82420-1-pilgrimtao@gmail.com>
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

Changes in v3:
- Add a new lock_rec member to struct bpf_reference_state for lock
  holding detection.
- Add test cases to verify that the verifier correctly restricts calls
  to bpf_list_del when the spin_lock is not held.

Changes in v2:
- Remove the head parameter from bpf_list_del
- Add bpf_list_add/is_first/is_last/empty to API and test cases

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

 include/linux/bpf_verifier.h                  |   4 +
 kernel/bpf/btf.c                              |  33 +++-
 kernel/bpf/helpers.c                          |  92 +++++++++++
 kernel/bpf/verifier.c                         |  76 ++++++++-
 .../testing/selftests/bpf/bpf_experimental.h  |  39 +++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 149 ++++++++++++++++++
 6 files changed, 385 insertions(+), 8 deletions(-)

-- 
2.50.1 (Apple Git-155)

