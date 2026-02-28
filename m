Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C3F1C860B
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772264777; cv=none; b=GFFxUURKP8RAdnE/gf99OY9ie6bfmfdOzOKdLajBGI4QSGkZlUZYL/IimuudilrL/aJ9dVw1WAsKgbRQUWmH2ICtm3ih/RtwbwyHKsw58T8RG/X/dz6MG4DPRHWSIdPCmtCrZ4pISAOH7LBEylXzcDATB50GfFE3259H5n+TmIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772264777; c=relaxed/simple;
	bh=p2aSFGQoBgSywwgSIEnLpuWg2GFD0rXSLdwVlwaTJIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgLSi3fGbNJPXknxBMtF3I5+rplFFSwmE5UfrPSWyTC3d/8RvgF5DZ9otLLyYnVL4t4p7V1o4dWOldewkJIjiYO6gpGDzRLHvb72xvOka8AJat8u4CssIUK4LsNXOeJOqYtHHGH79XBUtRn4fytRkjYWn7Lb9g8/iK5UfKp8Nl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3kOWAPb; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3kOWAPb"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2589480eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 23:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772264774; x=1772869574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wu4x5CQAoY5SwDUEuWuzuIox/7baMZlh2zSWLJQRs/o=;
        b=G3kOWAPb1VrsOs2PQGUkLdD9GPOXA48GSJEFimhAxLgQ85+VslViqqh4yelJhyuKId
         pq7GPMPQIgHGiavSZr6C29AMjABbsxQ1MmoU9vBgm0W1HAdO/1krWnAg+aqrSb/acXuN
         KX2PFBbhCUoc2qOBuCze6qz56yW7yQwhyH/71+krRz83yFw9BvNREXk7Qi1/bRV4ImlC
         V2Tu3PkqxIVgGUrNnVqhkvXrVDnFzivr099w/l73J1/1ygk0RiGEEW+ZhOJ7/QiO133J
         eQPFzZ9MC6FKjzIx2SLAgZV7GDoIKsa/JRw5hZZBrCnTmZNcMCVC+s/9KNXHncvpGi6h
         0FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772264774; x=1772869574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu4x5CQAoY5SwDUEuWuzuIox/7baMZlh2zSWLJQRs/o=;
        b=B9l1+WzaG+dQ1Q0Bmy52pOt01PEpaBnwxR54MdVcH0E8KQ0430cRruyA6yPotM6HqB
         7oOzD5amx+hhuPh80/+C+mkTB30HDP5cYODbtHYLp38e61HiF25SAqObfapMX0JQuxfv
         PLeea7dmKGQxWPXjXctGM2n0WtMjnd1+Zkf5VHiPOKQaH/C2p2f/CbklYcrFcC0qJx0k
         c/TZy7hh614OgLqtNsnA8TYwO0YQ4Jq/MxLVbf4eoCYBv+fom3nOZVtJI0I/IMhli4Gg
         wTIi5JPeNbi7lKYrjKWjeiu90haNunsBLlYNfG6vmj3XnP3U6TgV2hUDHMjxzAce/onJ
         L7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2QBXKEEMXkIIgMTvXVQBOnxDIFC9wB3eGZIeVEYtc9r0NTAwg8vFRzKRc+Y1LnRdfKYsM6A5u9oUPTxoKiGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2lhe1kGsxYt0sedGolSA3IW/K24ZaVX6PUERPrBaZ0Dpe7B8
	IX9pSLKZdJMdH/eeKOh4YA2zEYrlT54fpD4ZccbF+JDYDQ/Pi250pe1X
X-Gm-Gg: ATEYQzyNadhG5yHFl7HHJcGPvwki0qUd8+YX7hUh6nXuq9RFZKEsVsdhNNf51yR2Vu9
	S1bhAC6WR16EfBbjak2bmTZCi+nyinLfpNYBp4tE9mnyW2Nv3LiGJdy7bknX7OBOdD0b50+MB8G
	1KbWew3s0a0WymAdG+FlQ3HEoXZ1bMv1hpHkzY/QFeE5GcUTeXCBJShhNeVtTd6pEZJxlJfhn37
	guEF5+BjnykNcbqdI9hh1F+bvmmmlBBbA2d3pFxzs8nPE5QQSbE1vhlZiDKqW/19mgdCuZvo1+I
	3Poe6o7D8DMiSK7qh4oeCavRHknk0Mw5xjFHxQehdmS1e3O8f64UX/mqPexLs++V7KqJjYCeI3e
	KpMvRvx6iqj866dNG5Vi5SA886PzCzQo6xRxIlAfgAOnUKacy+oz7C13nFqjD6ac24ruvXNBkT5
	ZUD1qgv+ZYb0GA0MwatxehH+/2yLZZ7rKW1FtvNWHxbv/6GELjiYuQGgQaxR6k7ZuQnguqAee0d
	PDSdjlf+PplSXJNyXe/eVPSeQY=
X-Received: by 2002:a05:693c:2b08:b0:2ba:66fd:3705 with SMTP id 5a478bee46e88-2bde1c3f0edmr2115477eec.1.1772264774400;
        Fri, 27 Feb 2026 23:46:14 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bded67bd05sm1874926eec.1.2026.02.27.23.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 23:46:13 -0800 (PST)
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
Subject: [PATCH v2 0/2] selftests/bpf: fix bpf_cookie failures
Date: Sat, 28 Feb 2026 15:45:53 +0800
Message-ID: <20260228074555.122950-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bpf_cookie failures due to missing bpf_testmod and flaky perf_event
triggering.

Tested:
  ./test_progs -t bpf_cookie/perf_event -vv (30 runs): 0 failures
  ./test_progs -t bpf_cookie -vv

Sun Jian (2):
  selftests/bpf: bpf_cookie: skip kprobe_multi tests without bpf_testmod
  selftests/bpf: bpf_cookie: make perf_event subtest trigger reliably

 .../selftests/bpf/prog_tests/bpf_cookie.c     | 29 ++++++++++++++-----
 1 file changed, 21 insertions(+), 8 deletions(-)


base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560
-- 
2.43.0

