Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D23E0C5E
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950068; cv=none; b=Xy5NpXfISJaFHbnsJlH060G7XDg7W525FCdAna6WpLspxxpFB+bTxjMYgvb3qQ6TECT5yagFgBOJbiDrFu4jJgWo26PQNfdosYA0PqUwHeaA9LPe+70aJSBZ5XVv1IwdGgwRZ1Bdi4UzyZWhj//haqNI0sFMdlXe8tUKnn+4WZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950068; c=relaxed/simple;
	bh=TCDZXjqVtoY2KHfHv6iZ3WPVq39f3rhpWlgoNJz3sxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0Zmiug5+CpieSTuUzedZPl/6HcYJ8eTGK2UfL92uD+7uygydK9be1pTA0Mty8RnqZxdgtyodoQ7B+FErmjMRLHFfSPZPASo/OhJ2ipwLn8luPGZgFy8hcYUt5wJqRiaCiCN6NLp+fwDyXqLjzPrKoEZSfIsv1oJXRFPRTqagJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cxFdiCT8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cxFdiCT8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso4895025e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774950064; x=1775554864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nElztS2A7qJnb4rGn//Egowv7jR4mCwF4gH95YG4Lg8=;
        b=cxFdiCT8n0DnkvtxMe//I1ZrG42wM1tOhdgFZppeeN3Isn7xx+h1Jt6uNTsNkalZYT
         mqqoGXd1S+f1xTBhD/P1hJEbeyGIvX7a3WwJysfs0oYIHxeDnyi4N5ASuUrwG5lh3t8k
         0/X9ulK/b/7akohOfO34UX04G8xT/BEf7X9x5jzXQw0bQAjca1qeNpup4Vb8NRr6tb95
         yMeSlX9kOGwT4vT75g9TTRQD4FyOJKgs1pVep9Hv56iqowdMTUcfPejd0U2C1QiwOlD/
         eIvfOkHFxsSG1x6aHxVhNhF9B7rVk8bo5DITdxbJEzJHW8KZYzEigzZfi2w50lOZoXnt
         dDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950064; x=1775554864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nElztS2A7qJnb4rGn//Egowv7jR4mCwF4gH95YG4Lg8=;
        b=DSTU39SAH/BZfAGizLwYW6JM4S/vDrlGtJ7Q4cEa9A/7Fo1JVhq8/NSad43GvgYDon
         df+Ji9T9X06yM8cwKdx4/bRcsAHz169P6aihMx2IXiYBoillSsKiR+lOU01XT1z9PPHc
         pL28s3jTcRtTDFtCEOLO5eL7OjKWOyUIQByptzLbstQaaKWf0BMvE8KX/dzsij+VgDSU
         jpC0mIcorZO24IxzontxgFTkF97Li4i0gZRVRbjwzhx3bDkSjfVSWKl0nKZByqGnpO42
         7QGHXgww3YW7PYQ6I7JtxueWnIch7n6BqdMKsqx+V0243a+CXvrfYEXRX1vX4HyUZq+J
         d9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0nvtPAXdObZjhs9DcyPTKFkxZq/+1cHqtHOFmsQd9VWouZwq3qXO0IoOc+1HJpzlfN3eBcvwFL++N200QxQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMfzgiTEzUHcarit24UPGYoxOmSD8RIzS934rLYLhUB2WjdNEp
	pjs+yPEIy2Fit/d7DosRaaSq/h/53Mn+50nk2iSP2TSdvGVPP5rKYc5SvoousQo7ZXo=
X-Gm-Gg: ATEYQzzklxZBPc/NXNyFeg5OPYuAck+z5TL8A9vu+p5MEkgNBPh4+KNUA10hANTC7MS
	9HFdyET3Pj93tpvfGSAEu+YsjZbo0elvnnK4l/SbsPX8/eNmg4VWnVX/NFlQe+z8JrV50HsHLjy
	oUsefp88De6kZy4mILMrll2k6zM58DRn7jYhtJWHVPXSkzEMhXfd13Y1KCwqMGcTym4/urUG0/W
	8cStC/QwasrSsan+bk0r+xOAPb5V6VpTJQ+yQOGdhY/pMG37oGrdpBAJ/PxsBF8ikOXiPJnP+j7
	6VTTTVEU1KrXJ70a9mVF5sSDeo689Asm2bVCedsE5iNIwvlGbE8iBL5JadN+mgypBtaLpDEGLlk
	h24B9WFQBtKSoDKF2OHAvWZ62Xwf5ZTDO2mSWiu/C3I83pwUBityrXJHuGpPHxswcRY1XEG1DUY
	FVsIkGu8+g8+U0aYxd60+ekZ/MWHjWDD1xtIAnrOkHJ3h4xYG+48OoRBa/lDFOHQ==
X-Received: by 2002:a05:600c:a06:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48727d59ce3mr282261525e9.4.1774950064024;
        Tue, 31 Mar 2026 02:41:04 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm130079565ad.72.2026.03.31.02.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:41:03 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 0/2] libbpf: clarify raw-address single kprobe attach behavior
Date: Tue, 31 Mar 2026 18:37:45 +0900
Message-ID: <20260331094058.49229-1-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today libbpf documents single-kprobe attach through func_name, with an
optional offset. For the PMU-based non-legacy path, func_name = NULL
with an absolute address in offset already works as well, but that is
not described in the API.

This patchset clarifies this behavior. The first commit clarifies that,
for the PMU-based path, callers can use func_name = NULL with an
absolute address in offset for raw-address attach, and makes legacy
tracefs/debugfs kprobes reject that form. The second commit adds PERF
and LINK selftests for the raw-address form, and checks that LEGACY
rejects it.

---
Changes in v3:
- Drop bpf_kprobe_opts.addr and reuse offset when func_name is NULL
- Make legacy tracefs/debugfs kprobes reject the raw-address form
- Update selftests to cover PERF/LINK raw-address attach and LEGACY reject

Changes in v2:
- Fix line wrapping and indentation

Hoyeon Lee (2):
  libbpf: clarify raw-address single kprobe attach behavior
  selftests/bpf: add test for raw-address single kprobe attach

 tools/lib/bpf/libbpf.c                        | 33 ++++++--
 tools/lib/bpf/libbpf.h                        |  3 +-
 .../selftests/bpf/prog_tests/attach_probe.c   | 82 +++++++++++++++++++
 3 files changed, 108 insertions(+), 10 deletions(-)

-- 
2.52.0
