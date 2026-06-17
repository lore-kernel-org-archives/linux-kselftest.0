Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A503C8182
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688985; cv=none; b=UtKzVIdsSK0vClyqf3/Gge9Mqfhnrb3tBKkm66lCECXPo04jgFoUwErX/QPw7RQpynj3ZSt51rTGHvlv+kn+lMQ2oziEVXJqlwwPDECCQYaH2GDaGuChQrhtd6c0J/pxHrfyxYmvj932YZq1EN53d8zNrzzKQkQnUWGuiK+P7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688985; c=relaxed/simple;
	bh=GWPzChxssxZOZZc16sSu79iLhuD8mO4BYO8UX0Bsfzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qtDtOiNYgKrtkgvCBaOeiQAH4NZll5oRMuTEm5AyieGHEOGmSKeaTym4MDbIHajuicvnAUyjshd/nxBU4eMFfXKee7ZKWMsf5v4ghvOzL0LB6UDCFrVKJ9ZtcBr70iLJBihg89uCkeY8eYnhY+sl6IYx/+U6RsBIjPU+2lw2Koc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQZXW6Qk; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQZXW6Qk"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84275887a3fso522019b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 02:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781688983; x=1782293783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qntz5nm5yQBkXOVak+SMgSBWDeLqTSwFLoQFss37lnc=;
        b=HQZXW6QkEni9oUS2HrmMWKAVOqywvv4fc05+eN1VjACgPlPM+21udefw+vlzxwWadS
         JpZUeJH6GYNm2iI0ZxKZT8Z0H/mB6uYleZmNJZ8s1hubC5fQHkHFmXmJEqHA+5K7y0T1
         1XGxrRkV3XgaZ79DJDUmieBoLzw1tqwjaoS7E/ALD3bQVDbSQBu1Sl8ssu63TM9qcEo1
         H9NOJ6VUzNP4Vuz8E4QW35NnEkKpuJdK+aqLaUIIyXnElDYAR90r8DiONIf7cfVr63Yi
         tQVrgQa++6TJyEAzJg+LFh23XcTy0tkVFEvptdaI3g66v5bsudelKRFWcP0oYSW9LfvO
         YtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688983; x=1782293783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qntz5nm5yQBkXOVak+SMgSBWDeLqTSwFLoQFss37lnc=;
        b=kvy2/GoQVYw6dKa/yEo5yaQHmDhQj2uGQe+TM+AnOfN0SWnsxwLtaT57L9Zwdboj3z
         S+SAe7ppn3+/bd1NdciNiV0m4iLDjqLFuyCewawAxEKSNTsbV9pZe970AOKu950RCkON
         CvRqpMoCcaqe/zhzms+7NDy7zroHupJPKMYaFjZQKKctWAnjb7lasayLU+EqUpKTRFEG
         25AkLFmN2wuLoDcfkE6ZHTkH/j1ygJWGdMfsRA43iCInKnAHuY0RjFvnrMMoUK0QUU/f
         NPcHZT/lAK2gCZ2Q8m22XwZ4kqCvqGzCHoCU2wUTF73Mz8mlKGrD0E5IblQXHxiUfu/L
         YdWg==
X-Forwarded-Encrypted: i=1; AFNElJ9VTC+aH4shLjjrFWhl7oWuZmkna+WitVcHrClECTyT8mxVSP9U6VRM0WLBhjHK1ZOaL62hYJNC5Dnc/sAIhgE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5XvQpgTCjpQ8Kmr81gUD6tI1zCayvPBqZDHjd8rcZPxu3LC4b
	RiXWmwAjbhk7M1aM+T1M/ZJ74ugharissNqigqPkIm8m7Sbj7CBXHuC0
X-Gm-Gg: Acq92OHQnEkrMNcsYmMWj0K5gGHUgUkXWMS72LXIGedBCQEgjdZZgrvComVvTogmLIo
	LtT5iCpm5uUnkj1XSILHU6zyQ8YrIHCMBM8Jqvypeydj6R40PyTRDlr0ThOAFpCYHphUIW83hp7
	ZfDQE7dfrERCZrqNLBp6r5VLIDYtMNCTngKnXyit4RSHfegU1DZZquNaCmVxYhXau2HVj5b+cvV
	S3amm+rGM9ARRSIIXQlyVdT4eRP16H4tFrptpTOVJ/KL2r+dghnaSJQNhIgupyDlS9WhZgeuHAf
	uyaAe1GHvqCH+Y9Lbr9I3RrEm3RKK2FdzOzuFpPDZB4Hxpp/KKg8AWkJ77MbQs4n1yPIJyPc3qe
	vR8OMQSAKGGvitjA7mHjEwQ5+veH4bnMboZnXtTcFwIB/LqVtiKf5lXuiNP53orAOVM7/G8ZP31
	u7YqIIszjGXHonJKqBc1+oY/sJJRv/Lj4cThXfxJ6rrn8cBpYrmXfz
X-Received: by 2002:a05:6a00:a809:b0:837:735b:826f with SMTP id d2e1a72fcca58-84526b9c3cfmr2072767b3a.32.1781688983521;
        Wed, 17 Jun 2026 02:36:23 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100::206b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0226acsm15521653b3a.48.2026.06.17.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:36:23 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	toke@redhat.com,
	lorenzo@kernel.org,
	paul.chaignon@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v3 0/2] Fix partial copy of non-linear test_run output
Date: Wed, 17 Jun 2026 17:35:55 +0800
Message-ID: <20260617093557.63880-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When BPF_PROG_TEST_RUN returns non-linear output and userspace provides a
short data_out buffer, bpf_test_finish() can return -ENOSPC before copying
the packet prefix or updating data_size_out.

Fix this by deriving the linear copy length from the packet layout rather
than from the already-clamped copy_size. Add selftest coverage for both
non-linear skb and XDP frags paths.

Changes in v3:

* Keep the fix patch minimal by leaving the existing offset declaration
  unchanged.
* Drop unnecessary memset() calls from the new selftests.
* Keep the pass-through TC program and larger test packet for the skb
  case. pkt_v4 is too small once the short IPv4 input check is accounted
  for, and the existing packet-access program fails before reaching the
  partial copy-out path with such a short linear area.

Changes in v2:

* Fix the Fixes tag to point to the commit that introduced the shared
  non-linear copy-out logic.
* Drop skb-specific wording from the fix commit.
* Move the selftest from skb_load_bytes.c to prog_run_opts.c.
* Add XDP frags coverage in addition to non-linear skb coverage.

v2:
https://lore.kernel.org/bpf/20260616093103.471444-1-sun.jian.kdev@gmail.com/

v1:
https://lore.kernel.org/bpf/20260615073856.152479-1-sun.jian.kdev@gmail.com/

Tested with:
  ./test_progs -t prog_run_opts -v
  ./test_progs -t skb_load_bytes -v
  ./test_progs -t xdp_pull_data -v

Sun Jian (2):
  bpf: Fix partial copy of non-linear test_run output
  selftests/bpf: Cover partial copy of non-linear test_run output

 net/bpf/test_run.c                            |  8 +--
 .../selftests/bpf/prog_tests/prog_run_opts.c  | 70 +++++++++++++++++++
 .../selftests/bpf/progs/test_pkt_access.c     | 12 ++++
 3 files changed, 84 insertions(+), 6 deletions(-)

-- 
2.43.0

