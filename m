Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8F427F4CA
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098310; cv=none; b=Ua2Eo8h3ic7dXNKCuP5U10utl6eMSGC83yS9hpzLyyCPz7e7g+L6QazESddTWhZ0y0nqJ8jp7TrONWrak+xQIAlnmPacXLaFxqQc6Iw0XlnZkwPjakzXvjFSTXdRMLcaD4LpCVcCaaT0RR2fK0Gr6r1ZlUa+zEY3hy0IXY+gfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098310; c=relaxed/simple;
	bh=oFo6+sTPLkyTSFK4Ji1vRa5rCyrSWUa3s+0eVqdj7KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+Z4kqJgJzZ73Gvc4Jb4t4hFTFFuEC3vapSLiWmwyGKD42V4QpmlyCgM1saUTP/1W1xj8itEAnL8swSu3yaxAMUkCAGh97Sj/GwZLl2XuMgGwLZ7CBtgfMKr0Zn6KRMvgk8oxTZyCEqgQTl85mfWDPIsj+PpkpNhT4y7g1Vhrzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chc6P9J6; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chc6P9J6"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12776bebe9fso311442c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 01:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772098307; x=1772703107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0nm7W+k2pCT1m1taH8JfT56CcqjdfxYGmMvs5ermu7M=;
        b=chc6P9J6k5YDf5LOpQGnpJ5A6fIPmSogKJz813HXg7tz+DtrSYvsJ+h5seqUVe3zA/
         fTvGC2KlPL0mz0DPlFeTFjqwVUWGmviIzDnsclKHFBKJB4y7z7LRgGhG4GYGRH72egOE
         OFlpZaZQQqAwl8yNhJWMNKXRXG38r7vPZn+2fwT0RFEUIj9kV4LFkIl/6xU65/JTTNxb
         gIqUPyjuItyhFoLALhrLm+v9T1b62HWe46/f3ELw53qDTOO5Pxf4efz2RHv3JY6MjTy1
         DfZdWYhpdEcpzGzsh5XKau0CdY393LeEge/H9DbbNAertAH8cxpXvhw8Jcbouqih5owT
         ECUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772098307; x=1772703107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nm7W+k2pCT1m1taH8JfT56CcqjdfxYGmMvs5ermu7M=;
        b=wrHeyg0EdzvlATupjrqcLbryBPbhMuTGLCAdwwDfNPyDrLiPX8qtXwwiHb3pphEFvE
         QWNoc4dz8lmt+YIAaCD4fqSpBrGhHh9Dp9BLSmlw3VPdOzoXIkzMjVV8/cuKnvBF1Pmj
         5PC9XzLk3mnCJjUVgmWS+8tQWS7Pt59nuZDLp4u0Kqag5KlIthGFQcgLwmEkY+b5189J
         mjVp+WUhD2TXiqgaO3jxeh0Vcx29oiwprdACk5Ep+rrg/oISNAEo6KKoCueL5K+7F1Uf
         sH1HpsmO3WcrxiE8W5iFGQ4Jcx6v4TEjsVO9MmdsGMNVw7IYLAjmCfbn7f7k2RXWWl90
         QmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkv+iVZbZaKhfKZLIbJEP0rUyGsmuf0357yaCyaa90vPB4Ht8T4Un2Jt/718rBifp9B6BmQ+NAoXOYiXtqKGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZsV9kc7GEQdm6CNW5pz/P97pBnghBCgBz33+3NzQubzrk3Jk
	saTHQ/j//LXt5Fq9d12MKYPNXFNNfQxD80xF73TmCYWFnnJRRupOedCc
X-Gm-Gg: ATEYQzxn3czIfuGI77nlJE38Xmulhyw3vJ2SeGBGke98BvlYDWZeFZaZRbnJtct1Djs
	oHVdNn2j6IQRGtoqALde74Lz4bM93E67cqP64oT7qetA18dhwFUlnmlpX+VtOM+w71O32u7xWL0
	6IlnlDlMpVBlAUGRpVDRjnK77nfFU3+LjzMBupjc7J6SxkM4iBxbzOMy1WwWDYl7IaXjqp9VXqb
	58ekAtazH8JjR2Ot6CNtDYascFcFp8cODaZVUupNdD2Cp/PQZhC3P55TVpBp0tEvoWPg6W3gjiB
	fJ6NJG8/TQDBkFTxF9UqbfenOSXH9mHGvZ2Om8xpqoHebmX4xp9jNRUpL8gv/MJEZyZBUcT/X6J
	P4VnPcjra/LP22tYwC/kurN8pycU8Vk8iJmk+yrr4CIlWo3aAvINiizW/cHWub9i2OI0Hhmtdpo
	G9NMRy8aT4udJR/nSW3ts34ND3udsWXakUEGf10MnsN3Soy7EPoR3mMs2/gar4O3xXKz22xYNq7
	Pphk3OFjMZZKQH/GNZJ+4E=
X-Received: by 2002:a05:7022:612:b0:119:e569:f274 with SMTP id a92af1059eb24-12786990d3fmr1837855c88.29.1772098307410;
        Thu, 26 Feb 2026 01:31:47 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43c12sm1771904c88.14.2026.02.26.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:31:46 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 0/2] selftests/bpf: make probe_user safe for parallel runs
Date: Thu, 26 Feb 2026 17:31:30 +0800
Message-ID: <20260226093132.437206-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe_user selftest attaches ksyscall hooks for connect() (and
socketcall() on s390). Historically it could corrupt other tests
calling connect() in parallel, causing flaky failures.

This series confines the instrumentation to the current test process only,
and then drops the serial restriction and removes the stale TODO.

v1: <https://lore.kernel.org/all/cover.1772079741.git.sun.jian.kdev@gmail.com/>

Changes in v2: 
  - Replace pid_map with a global .bss struct initialized via 
    bpf_map__set_initial_value() before bpf_object__load().
  - Add bpf_map__value_size() check for the .bss map to catch
    layout mismatch.
  - Move PID filtering into handle_sys_connect_common() (covers both
    connect() and s390 socketcall() paths).
  - Keep existing validation flow intact (bridge via tmp buffer).

Tested:
  - cd .kselftest-out/selftests-bpf
    ./test_progs -t probe_user -v
  - cd .kselftest-out/selftests-bpf
    ./test_progs -j"$(nproc)" -t probe_user -v

Sun Jian (2):
  selftests/bpf: probe_user: filter by pid to avoid cross-test
    interference
  selftests/bpf: probe_user: drop serial restriction

 .../selftests/bpf/prog_tests/probe_user.c     | 30 +++++++++++++++++--
 .../selftests/bpf/progs/test_probe_user.c     | 13 ++++++--
 2 files changed, 38 insertions(+), 5 deletions(-)


base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.43.0

