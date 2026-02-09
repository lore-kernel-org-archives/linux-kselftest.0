Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702191B4138
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770605583; cv=none; b=ZuBrroXRY5AbgOuD1wQBOIDQ4k+sgqVfAOwKwicAwyy/sp+2wCukA3tRwkr76xTDbKIswXtluBlNnykWoCRxv2Aj+/KvdO5LnyE/K63J9KD3r4w3uBS/V2SPMDj+FEgHxGK2IONim9/1xu5IvtqQtqMChIUqbsYBFXWwxPtf+9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770605583; c=relaxed/simple;
	bh=dJFXZ8N4JWJZscr14sAaw3digTqHt1nANcFmMFYBbA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sWhdc1u+nMCMWhCQ47V+rVSA9gwO8TrmBzgobE6xEd0AgleD14L9Aqb2Rf80ivhmqJ7zlDlrxFzcKWJLiQthlwqnFwF7AOP6Utkh4+GbpQSmRL5wPW+gf0xzt5zdNdCtAzLAOUIk7fLuAvxnBDEqGGxw9uSkVo94P8XMKjlZxpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fthIFe6m; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fthIFe6m"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-354b79a9ad5so1099157a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Feb 2026 18:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770605583; x=1771210383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PcQrXxB8xFn6uOssbnZNVp5Np7J4WmkCCnxi5G5T/ik=;
        b=fthIFe6mIB3lavNYjMY29p6eQBfHltaPOa/QlQ3e9wPaWCVXxAItT01GlLHiWSkb5a
         IHvlaHv8oEq70K+h5QiSD6tRY7kR9Y3GxnN5ixZ5qvjLJe9kPO89bKj0ztuMb0dx1hk7
         iibT/jJOIowfgYjSttA4zRMLV7RVMCpendFOEpQ52bCV2PZT4YZKnz2TtJIe0EA40wvE
         /6Vu1d5RsWrSBFLvSEIu8rV+ez9ahwtqttEEkOvKWevoa2KuKFjIT1qgbE9OLS+xcTVl
         H9z8XE64o6sEzQ9Aq+kuLfoLNuGojLxFhkhhGDQNj6r51sogRqFJdBMunC0SjPuCOL4N
         1GQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770605583; x=1771210383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcQrXxB8xFn6uOssbnZNVp5Np7J4WmkCCnxi5G5T/ik=;
        b=LJcS4z3D0Z9DpMVDim0hzOMtJycM3TvEoG+mngClVzyVFuHlFmADW91UQdkkgxqzoC
         j72SPhQO7CXH31pRrbpqK/TTcTk03jcqfXmsZeOxVaRBdNgAtHsyfGZs8UsYUlYEqZvA
         14MtoHxK3zsgMcbM9gz1ryR2HqpQntohre+RVapH9/FpsMtX95TtCjcACkfypBfyID1o
         TDCT3kjmVhXf4ZMZGWKdLFZqvu9c3gwSWX4bAfqtYKNCJJcXZ7JlZ27tvnbNEzsf8wxn
         gQfYe/8BscVtAspJ4GSQh3LAjj6KUbQ9Dvlr7vT0iZMzrieujFeHiKGVmdK67LnicGLj
         Rt4g==
X-Forwarded-Encrypted: i=1; AJvYcCWaYxXQj7CTrQGuZ8cwPcGHFw2rsQgTJM+4MtDEKI+suFmfBcGP4PCuwHKbLJt6OYcTlOPYFfuy6do6VGIepIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjQ3DDwin/3Kqq7KjVdQUtziA3AqlLXoI/LvKLYB8BT/NuxgHR
	tJt5zWu+qU+NMayYfAfjliN1QAzvj1Y+y4ZzuXGRD+f5GVUEmc0I86eK
X-Gm-Gg: AZuq6aJa4wpzkN6KZeT62Qc/hf9Cclhzd/lgURsKqlkY23G5a7a1D8goEVjuNmi8wGt
	SjQgw7bTXhUj7XZmpx+FFlEwDRc15vDtbew8g1lUdR9ufd6QqUeREXxZnTjT5SVSyu53GdfEhQp
	US+XrzAg/iqOEgkokd2jPJGYG74uXbtbtlAXYsAvWFKQLrTgANk4wCqxGF5WP6RMV0QMWqR/VFt
	Lk/ilTWt88g3s206Wy14JcXgnFKyD3+dMrMWGIz1o96w5wFPx4tRkNlUVD4SJ9G+o4gjr2jlGZo
	vHz6pD+lGKw4cs7roH6o9fn9uwJe9vOlgKA7ZaqwGR6HBZ7QzUTklLNzeWcMCbZNCkagfSsWJta
	WyHzwVCGntyoqQEVo9dirzYimprDc9T1dleZXsTt2yW3e3t8kMhVHdpIzqfkynzeurzzyXqVfea
	5u/lzPnf+q+yx1KhDpH1DL7YQXxQr21/b9fkrQ5c5AMg==
X-Received: by 2002:a17:90b:5648:b0:356:2c7b:c010 with SMTP id 98e67ed59e1d1-3562c7bdbc7mr4273704a91.11.1770605582741;
        Sun, 08 Feb 2026 18:53:02 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35621177896sm6302649a91.15.2026.02.08.18.52.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Feb 2026 18:53:02 -0800 (PST)
From: Chengkaitao <pilgrimtao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org
Cc: chengkaitao@kylinos.cn,
	leon.hwang@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] bpf: Introduce the bpf_list_del API
Date: Mon,  9 Feb 2026 10:52:48 +0800
Message-ID: <20260209025250.55750-1-pilgrimtao@gmail.com>
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
supported.

We propose introducing the bpf_list_del API, which allows users
to directly remove a node from the list if the node pointer is
obtained beforehand. This patch enhances the BPF list API,
making it more list-like.

Kaitao Cheng (2):
  bpf: Introduce the bpf_list_del kfunc.
  selftests/bpf: Add test cases for bpf_list_del

 kernel/bpf/helpers.c                          | 19 +++++++++
 kernel/bpf/verifier.c                         |  6 ++-
 .../testing/selftests/bpf/bpf_experimental.h  | 11 +++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 41 +++++++++++++++++++
 4 files changed, 76 insertions(+), 1 deletion(-)

-- 
2.50.1 (Apple Git-155)

