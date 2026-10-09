Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD1C25B090
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 01:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510597; cv=none; b=sdQwOUr8y/HE27P1jBCSnBqGEr1QjzFKeEthxfQ7CGv/6W7QiJA3IQhSxC3U/tvud5dordfz0fUPgrGL/wyr/aFLqZMee1zlSy75RDqF4AWF8bqoh8s6TlkWyIbhRLmdxA2x652JintBGj+rBd/Z1zhz4cSdJl2D0uz0L7VoPvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510597; c=relaxed/simple;
	bh=HtIl/nwx6bOv1iqWUYSobRqCIqsM0aPvGMZVuqqehNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HvlKqFr7HfXoiuEx2Axg07sos0dFJK4hkYb7A94m735RfIALSBP1IykYqW/F9xd5fHLrpKmcwG/UMzYFqIOsS1g+HX9m0GMPARN4yfH9xWZ26Hra8IN7Ls4mXhN0Eqg4+xKOvwDo1ITIQec0LDlC6ZVDn5htp6JCfLW4QtGmU10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXsv4S4N; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXsv4S4N"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3115c4451c8so5038435eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 18:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510596; x=1792115396; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GMDytykDqwmOSKHEI4lP8Wfae7lF8nVLH1/sChzwqGw=;
        b=aXsv4S4Ni1U6ydBnnaNzMaBhZE0cHz7aRSYhF099qUT6Gazmo1A87ASfwOuSWQP6oY
         ArBwTkku09IlyzEInP5RwHLg5i9OvdQKsRAypjCKjzywMVFEPN00fkP0gKj2g6v0d0j/
         bi3LzX0eXPDYM1Mnr7HrsUyz+ydTmix/V7+CG1ueE8U9LvYDVJnyofmaY1HgEzjPBgxD
         Xj3R1fd7nB4bsoqlXp1g2/46unZrxr9lKODi8cghrjooT0j8lt3PZpK01SjJn+EpGz8e
         Ql/gE0QVZz64lvwsrl2HJGxS3dFalbNMfF81YJ+lIV4U+slymtuHr2vA8E8o9j3KkArX
         /RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510596; x=1792115396;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GMDytykDqwmOSKHEI4lP8Wfae7lF8nVLH1/sChzwqGw=;
        b=ciC7rQAOcByPZThaaaZQVrcps9cvmsV7K2/PavibbHKUbNgMh4gaUIkGEjtNWWnb1p
         bnDkyRjZbpgiXRw/wypjt9ETLQvmde4DXILX58MGeuxYuUQAJb++VYFNV9fmXaHWci3D
         CiI5Y5nnFtSJ8shPJ7CNs2m0atnZnP/0OGDn6Ounn/utjDzzaA+CPw1L+cBoQePfQffY
         91lvIzQhcBI1rh6+Z6Fc5GtldPXuXjSe1dy0p77qI6dPXzrXMBa6MaBNPxLIjVWs4QMn
         yYZW+YbTxCmsPybbXpH24LzBx4pJaIedMP+B3LHvYM7hFVNXgpXW9uPnjjewPOvLSpqt
         0mPw==
X-Forwarded-Encrypted: i=1; AKwUvBwazKI5O0zgBa8MS97KPueWp9B66605b59PQf7sm67Ft2yiKzdvGW6ys8E7ddz2L3jD4i19yL99/gUcxoC64yo=@vger.kernel.org
X-Gm-Message-State: AFuF++nfT3slHQMqQeSCfJFb+x4NjRSfqUpzNjewe0ianeFaYciefFPX
	t/yUio3x6bMGraVUfLmowBRrG75g/ZTZyQLvKO0UwrsDpfqfBhhhr3U1
X-Gm-Gg: AYBFou1h51aXWPYFQ2J/MtGjXsCNy0lklyIgdOt9jHPCvhtPtxxYxFzZ764zf8u1VD/
	iMMg3TqD2iWtMx8zVcZAn3draSwSoFm+D0gRv1uelAnMxZc1pYr+cFMMzmrrft1taow/02o0Xl5
	QPWYc7f2fGc/PWFBFSWflbBC+MDIgH/zjWEkgfkegQAixNUcdxRzMqt4hY6FTB01IfLy3gBfI8G
	Os0VTDOcZ8MEmy6+0OynMIa45U3wp1o0URp1IhRqnjP7ZuLKr9hUmdGGQJ43zbkCLsAoyHTL27e
	I9Q/N5tolE15oCsf3wScfb64GKnzF70me6nem4qmT/52Hyw/jPa3az/k2/p5FqdZzov8uE/9cng
	mT6ZmmHgLXc8hUO6ddRrTpomdes3/H7p5acpJWXIEibZ24k84eELuFzE8jFgGYU4N9xWY8VYKFY
	J0LIkpPGCqP8vyRx0XTjW8tApeyhAE+IRT0aGcvDJ0T/BJ7jeM1z8RXxknD/1gR5c/9Q==
X-Received: by 2002:a05:7300:c87:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-3537b291a93mr1987985eec.23.1791510595779;
        Thu, 08 Oct 2026 18:49:55 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1d6e6sm1984845eec.24.2026.10.08.18.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:49:55 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next 0/2] selftests/bpf: Skip libarena when arena spin
 locks are unsupported
Date: Fri, 09 Oct 2026 09:49:50 +0800
Message-Id: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5IyGoC/x2N0QrCMAwAf2Xk2UBWmKC/Ij50bbIFRi1JlcHYv
 1t9vIe7O8DZlB3uwwHGH3V9lQ7jZYC0xrIwau4MgcJ1JLqh8yaNvTnOVXDTORqXiMUw1bfjRJK
 mnImEA/RINRbd/4MH/IzCe4PneX4Bx3hJinoAAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

serial_test_libarena runs the test programs of libarena, whose buddy
allocator serializes its operations with an arena spin lock.

arena_spin_lock() fails with -EOPNOTSUPP on kernels built with more
than 1024 possible CPUs, as distributions commonly configure them.
buddy_init() reports that as -EINVAL, and every test then fails at
arena_buddy_reset.

Patch 1 makes buddy_init() return the error of the lock, patch 2 skips
the tests when resetting the allocator fails with -EOPNOTSUPP.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      selftests/bpf: Return the lock error from buddy_init() of libarena
      selftests/bpf: Skip libarena on kernels with too many possible CPUs

 tools/testing/selftests/bpf/libarena/src/buddy.bpf.c | 5 +++--
 tools/testing/selftests/bpf/prog_tests/libarena.c    | 9 +++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)
---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-libarena-nr-cpus-50fc5dd00fe2

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

