Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FAB29B781
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 03:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775618072; cv=none; b=mudRqapbLhR3zWN+Ta0tKWVvCifixQ1zy+R/jcXNUG3j7f2Dq28PduvbaGheiwC2uL4Q9ZOivGm59uBDEwpPP41brqz+i4kHsXIPRnvYDSMaQAhxCnAj1lHflgXqYdmpwn26IFJJdisqbU9RYMzzjn75TkMuaScWdr6wQY8Hr7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775618072; c=relaxed/simple;
	bh=k6bJloJYtw8y7wyBAFFrsNS+t6UXJtRmAyGG9edLQKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XT+15RsH4rtcKDe/qcQ28PG3EMii/POSapeZUA4rmqo9wdO2UhRzTfp3hAjUc8OET+FT9SaeBeYFqsdMeJIXwQvj7fPLM6tYXMMUb0450BprAMuCSaiSyiwaGySD/C9YYoGAuD2qC91Twtp2vVYUxGKN2rvC+hSqxmXi/1s2Zlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bc2PTMnP; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc2PTMnP"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-35d95017a68so3248630a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 20:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775618071; x=1776222871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KjCwjmm5FMl1mBDFLPEpQ/1ZQNj7Ms/Y3OHB07UOpRY=;
        b=Bc2PTMnPoJUF3x+bnBtclT2xlpcHoJ40TzP+iQjb1jVNf62SrEM6JD4n7ruTXI33W1
         UmBHCDRrWNhmyadkCvAX/XRfLYYO/0Nk+GWNzkjPxHzqNQUDnCZGuJMz21FDyBnWAlMW
         E4h+yfzQSB74o/YGqolsetZVKkqxBgHyNXWweXUPds9YDEBKq6uQwH0f7GsHF2+m8h0Y
         a17LspHz0oq/563IVH+MhKeDP6MuI5+tx9NzX0wGb+B+hTTkaNuJaG9N7AlUIgoiKtNt
         6iRvxjzxC4Qp7GUgE+pCmRXPZe2l8LTAdeuBlpI2GelngtdZL7owr5VcQwSkjVeghjp1
         /cUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775618071; x=1776222871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjCwjmm5FMl1mBDFLPEpQ/1ZQNj7Ms/Y3OHB07UOpRY=;
        b=c5KTW1A2vawbx+9mvwDlCLMBXkdGIBBVgpAwdmFKp3sxYp/dsy24m05WGRmOv29VYq
         p4jLDnBhHF3m0SD31Qby853E61VDxDP+igAdrQxdonWF5ntO2I0JoC09DE4s22gh1iME
         vuWQD2U5b488jTfoq0zmlnLM7T0yyZ2bASji/7BQcWpxYZu8pWY/rU1jidzpf7o2/y6r
         5okX1pPYIAOgr3dwwz9t2bEir624GmMskgo/LQru7+lgNA5LftK23JLjHbYiB0fjP1Nl
         8FbwZ1E6p7CYEEWdwD9NPMNRz8U978Pa+Az886PBRNmTNX2X4494fFdO6i41iMnwqCVS
         ZN4g==
X-Forwarded-Encrypted: i=1; AJvYcCXXCIdDszbyg+7X1t/vUfNNbLsWhJaEz5FLzWLUEpop5H8d5pLIrdIV+1UbUAHOhgysAmhuZ+sTb2NRa8zNVl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS2nJsFv5dwX1cC+z0jYw1/gfxQE/HtQDXz7LjRR1A5dPEqZY5
	0EsM7Qavi3p/yPLZr80f9NjcKrVv+kndRcd8gj1C/G6/aOItmjgxyqT1
X-Gm-Gg: AeBDiet75k9LeRcBitu5lYOz35GER7IQkLP9U2/wbWwt7QSNXRNBQa+EWAMcZ4KqdBs
	Ibj5mugzO5i6oj0MtScZH0pc1hZ1yVOw/4X/X1VH3M9y2Jn3jsnwfG8ZJCwrcYbDLX2KG/yWIO/
	f0jW6jZSHa2Iz/VvypYjzCQl8HwKFufT5LVh2e5GN3d9tt18Uxw6YTA3ae3Kbfk9dcxeRDo2jtQ
	67Ns8yjz77sQSkIEqRD3x6RultlRoY+6iLfYTgQkSnc5GZgQML6TVbU5vsmzT74mJthWZ+4eaEp
	buTZ7A1bMcUgH+28200rOO8KvWPLmrstp5a6ogxbTFDip6Dsu1DEpjhbnb26hgph1JT3JOxJzHR
	PLQCVK7lyXNZo1L3WlV6Iz/UlxAl5pEMpzpBWO7UgMk1M2B9GUbQDeUXPxGvXpH9nt/jq/0xlRd
	98fdwLc7KO9lfqUz8Jak28
X-Received: by 2002:a17:90b:4fc6:b0:35c:30a8:341 with SMTP id 98e67ed59e1d1-35de68b4c84mr20893495a91.13.1775618070776;
        Tue, 07 Apr 2026 20:14:30 -0700 (PDT)
Received: from 7940hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe41b11fsm23506913a91.0.2026.04.07.20.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 20:14:30 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	emil@etsalapatis.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next 0/3] bpf: add the missing fsession
Date: Wed,  8 Apr 2026 11:14:13 +0800
Message-ID: <20260408031416.266229-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing fsession attach type to the BPF docs, verifier log and
bpftool.

Menglong Dong (3):
  bpf: add missing fsession to the verifier log
  docs/bpf: add missing fsession attach type to docs
  bpftool: add missing fsession to the usage and docs of bpftool

 Documentation/bpf/drgn.rst                          | 4 ++--
 Documentation/bpf/libbpf/program_types.rst          | 4 ++++
 kernel/bpf/verifier.c                               | 8 ++++----
 tools/bpf/bpftool/Documentation/bpftool-prog.rst    | 2 +-
 tools/bpf/bpftool/bash-completion/bpftool           | 2 +-
 tools/bpf/bpftool/prog.c                            | 2 +-
 tools/testing/selftests/bpf/prog_tests/exceptions.c | 8 ++++----
 tools/testing/selftests/bpf/verifier/sleepable.c    | 2 +-
 8 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.53.0

