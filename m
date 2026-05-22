Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3453624B7;
	Fri, 22 May 2026 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450878; cv=none; b=YZ36QL1gMdFaGj67HQ3+T1LWNNN8D07/I/g5qpbheIm6H1eAsGL9itlI8NwfiizXaL9+h5PY2egeDu3g4Evwk7oPAD0PW2vLAo5jtX9LjZLnckwG3Wj6OWnOda5kQNlXFubWrzsQo53jRGCnZfaVzvirO3nj1A5NBAtgClmwJJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450878; c=relaxed/simple;
	bh=hi8Q8er21Ee+qLG4PUeV6SgtDUBnPQbGtWq7BnU+jzA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L02LqKw0CLdC+oGNkGF5MHgdSLta6aEe9ZBDCntx6+WuERQk5Hl/TFI/Rj0nNuSIQP40UhoZOdDUv6FJqhtX3/X9DNKq5CqEXuU5rUVkf7ih2vs0nSA5E/4q7Fafke/a2vcl0sE6SPiLq1qLGEomxuQkIwaBp7C/DMm8d6/vrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXXNCx3q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXXNCx3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D961F000E9;
	Fri, 22 May 2026 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779450877;
	bh=N4ucK9+pRSI9Tdz8qI3dbkHivUX+/XRMcFLOq0jsj2I=;
	h=From:Subject:Date:To:Cc;
	b=lXXNCx3qQ/c0sPxL4jJ4es1AnZdqayCVAQFIYk9Ni3fTlB2e2TnUOcwINe9XAsyco
	 MNpKW0nsfoFP2pI7nnx5yNDDQOJfW9OROZDyHSqBUv2qilLpMJdwX4kKcn7CGk3yoZ
	 LFwsZfyoWWw2tXTHYbkY/KdfK7ylLALWbXaQNkSSbcknLz1zPIMZ0vWnhnvfBdSZcV
	 Bqhmxut1Ws/0qNOOcSWHuQTUvdMiGXj0PASFn9r1fp/WWicUe4STUEqtTCRgbzSD6I
	 txYg3ebLSCx8CadAegkY/fpT/Uybf42hthBFzhEDRnerKpf3ZeBHvnF++jp3CoBwyi
	 odNP0eZ3WA6mA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 0/3] selftests/filelock: Make output more kselftestish
Date: Fri, 22 May 2026 12:54:22 +0100
Message-Id: <20260522-selftest-filelock-ktap-v5-0-8d0e3c012a36@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5DEGoC/33PwWrDMAwG4FcpPs/DVmwn7qnvUXpQY6k1CUmxQ
 9goefc6HdsYJTv+An2/dBeZUqQs9ru7SDTHHMehBPu2E+0VhwvJGEoWoMAqp4zM1PNEeZIce+r
 HtpPdhDfJgOR9gyqQEmX5lojjxxM+nkq+xjyN6fPZM+t1+kU2utkiZy2VDEYj1zXryrtDR2mg/
 n1MF7GaM/w4Wmm76UBx2HIAfa5tW+GLU/068M89VXEcYMuE3qgQXhzz7TgF4DYds/51bpC0B2Y
 Df5xlWR5E50oMlQEAAA==
X-Change-ID: 20250604-selftest-filelock-ktap-f2ae998a0de0
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hi8Q8er21Ee+qLG4PUeV6SgtDUBnPQbGtWq7BnU+jzA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEEP4lfxmDQk82Yoxmnv2SnEJiMjjBIOOOjVqW
 XRsqoGJP32JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahBD+AAKCRAk1otyXVSH
 0Fs8B/9H8Li9VsF4Hubmcv006ym6PJjw1s6EhJOEhyTTPXTXwcFAw0fw/jBTrbhWYZP2DLaRGmC
 kWBMegHwf1DN2byJ7eVm5v0n+WLbS1EPkFs8MpR5vPyvceeSeaBS4/K91aONUh91uC7r7+GL55c
 Z1M27pH3f/1VsnXNxnCrWuB8WfvqoLTJkoU2lJ4/hCaqItd/WFzp26eNGcn7yLxBze6gB85Iby6
 s22ga9UzeA5dKzRTA/lfiFL2qbtTMmwJfYFXwa36Jynu+2g4y2opWoaVrerYNGyDoJh2vJhhjmQ
 0rEhaJPRVlX3PhTl3N4n14fheLJqkn60NAnq+BAYnY2NJEbF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

This series makes the output from the ofdlocks test a bit easier for
tooling to work with, and also ignores the generated file while we're
here.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v5:
- Rebase onto v7.1-rc4
- Link to v4: https://patch.msgid.link/20260226-selftest-filelock-ktap-v4-0-db8ae192ff42@kernel.org

Changes in v4:
- Rebase onto v7.0-rc1.
- Link to v3: https://patch.msgid.link/20251218-selftest-filelock-ktap-v3-0-62acfea940dd@kernel.org

Changes in v3:
- Rebase onto v6.19-rc1.
- Link to v2: https://lore.kernel.org/r/20251015-selftest-filelock-ktap-v2-0-f5fd21b75c3a@kernel.org

Changes in v2:
- Rebase onto v6.18-rc1.
- Link to v1: https://lore.kernel.org/r/20250818-selftest-filelock-ktap-v1-0-d41af77f1396@kernel.org

---
Mark Brown (3):
      kselftest/filelock: Use ksft_perror()
      kselftest/filelock: Report each test in oftlocks separately
      kselftest/filelock: Add a .gitignore file

 tools/testing/selftests/filelock/.gitignore |  1 +
 tools/testing/selftests/filelock/ofdlocks.c | 94 +++++++++++++----------------
 2 files changed, 42 insertions(+), 53 deletions(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20250604-selftest-filelock-ktap-f2ae998a0de0

Best regards,
--  
Mark Brown <broonie@kernel.org>

