Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D323BBA0F;
	Wed,  1 Apr 2026 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051022; cv=none; b=YC/l76LJq1jsl1m46I2LRKjBQJVitA7ZVQhFnEJAU981FHuRpyODY4/0iP0eta4NOkqEGbjO+PBfYw/a8wkJXg/klUjokvU4egqLBHdMcmuZGcsmJEwFHRRSuEY6ma91Ia0AZV0uKrWMbcfhQNO+Enp75ePM2vTs6lTpIZthv0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051022; c=relaxed/simple;
	bh=M5f6qgsTJ20AEmhOuE5Pj1TpDhKrIqEKyXg1PYUX8yo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I5qDX6q4mbP4DKKcIFZ2B9LEiYDEay9/zf4jZ99LHS7ddpNPFOqaFPQ5qmkoIejR9FfmgvYvw3Rvqd/nVCc1QrhQt8w0DUNndUPJhZHULBruwhOfONF/VAbB5/3SbuoPJrpOrGO9FwmWyEFcltBHztkORXxmVsqt59oDyCSrFNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0PknoYK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0PknoYK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC80C116C6;
	Wed,  1 Apr 2026 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775051021;
	bh=M5f6qgsTJ20AEmhOuE5Pj1TpDhKrIqEKyXg1PYUX8yo=;
	h=From:Subject:Date:To:Cc:From;
	b=i0PknoYKoleXinqYAN6LNjMgsttJS4usoB11QIhW4Dl0G9pvilnpS4WISn2YfK7Ld
	 c+BAFvGRmSLr5qdMJpwFVT8D7Y5cQQ13r8DcUL22qg+7cHSPSXqawQPqnz0yGbl7h+
	 bHunfp+GoXQEDiVsJl6Tmr5gcMgdLySDduTndrXioaEAABMPaEmAozewjDyJr0+Ul1
	 YCLTpcF12JFiS2mx0ApGKkHb+ceqxjVooZladdca6ADFJExCnbZU4Khc8zb5YFomIv
	 waRKFBCrUtsUVebBOUweQKkUKPhRg6W4s0XyNbWlrcjxeYBobnq8Zz57315P+9tU/X
	 7J6TYhDk++6pg==
From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v6 0/2] firmware_loader: allow firmware_class.path to take
 multiple paths
Date: Wed, 01 Apr 2026 09:43:26 -0400
Message-Id: <20260401-fw-path-v6-0-4ebe70441839@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOywrCMBAF0F+RrI3M5NXUlf8hLpJ2YoPSSipVk
 f67qeCL4vIOc+7MnfWUIvVsvbizREPsY9fmYJYLVjWu3ROPdc5MgDAgseDhwk/u3HAHpaokCF0
 6zfL2KVGI12fTdpdzE/tzl27P4gGn6avDvjsG5MgLa1Vd+mDQhs2BUkvHVZf2bCoZxB8oMrQOw
 ZAvkbyaQfkHygxdAejA+ip/P4PqCwr4QDW9qlVBIkBdmflF/Q3lB2oOnKz1IhAqHeQPHMfxAfv
 UL1mDAQAA
X-Change-ID: 20260317-fw-path-a094c30259a5
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=M5f6qgsTJ20AEmhOuE5Pj1TpDhKrIqEKyXg1PYUX8yo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpzSEI5mKh+RdxrINpRxxKYVHC2NxBUFZNgZL18
 Tee1lzQQayJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCac0hCAAKCRAADmhBGVaC
 FcvSEACM5FrOLcfUvHU29JG+SFBB5pVE27jAOhwGG6CTS82edqn146lQIfT1SlGrRZomBtrLxFP
 Xt6UEiO2zg7W33rKbGanwh1yHRb43wTRVTeS3ni1BJDfea6a2r3rZ0R8VwOfUepMZuPbCzIrNys
 9jOosYXsTkuSzm7LpYWy5MESV/qTNJLd8hZlhyc13U+CvADPdBfteMezs0OXeaZ/lSYqD95ea8y
 IIzzFEFYCjJKCwpPf53NB1z0BH7CkytQetsL0GvjOUcWU446YdbkEsv1jvOl6DfiWkIyF6ExTge
 Reki3U2Ia7XSvOubr/9j2ijZKCBzsPkrJMGC3mWIJaFSujQhcDCOoGTo/axRp+dgYBJ16CoW2vf
 YEh40YwVWXsa32YvzMl+CciVcYm0u16abG0G2Nc4UXKD0lsTT8P86nXjjUSXceki/MrOMc0W5sd
 ziIis8xNvXcfPzlUltJiNAg/+SpRQNBS7FgG1odLMTLdIhHvy+HNh+AGmYvbGLZEHj6sraKP+/O
 cveJ1VmmCAfuM8Hnv7SRB7FPNlw7l0L8THNUL40Bhvus/uKawMKcR6zIMc9OJriGV+7WGEpeHcP
 qLIlzqw7ToLOS8HrFXLvdw6susif2pvDMQi4P10XeIi1vT2eeO4QgdeUP5t6B+t3C6KAlcmcWgT
 INr1OvMREQ+Vffw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

This is something Michal had asked for last year, and I just got around
to implementing. This version is just a minor cleanup for
reviewability's sake. I also renamed the search= option to search_path=.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v6:
- Add fw_search_unescape() to make the search path parsing more readable
- Rename search= to search_path=
- Link to v5: https://lore.kernel.org/r/20260323-fw-path-v5-0-e88b2fe145f3@kernel.org

Changes in v5:
- Increase search= string length from 256 to 4096
- Preprocess search= path when it's set rather than on every firmware load
- Add selftests for search= functionality
- Link to v4: https://lore.kernel.org/r/20260320-fw-path-v4-1-7547e2f0dc64@kernel.org

Changes in v4:
- Move search path to new search= option that is tried after path=
- Link to v3: https://lore.kernel.org/r/20260318-fw-path-v3-1-a701a08bc025@kernel.org

Changes in v3:
- Allow '\' to escape a literal ':' or '\' in the string
- Link to v2: https://lore.kernel.org/r/20260318-fw-path-v2-1-8a106eb91eb4@kernel.org

Changes in v2:
- switch to using ':' as path delimiter
- Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf618f@kernel.org

---
Jeff Layton (2):
      firmware_loader: add search_path= module option for multi-path firmware lookup
      selftests/firmware: add search path test for firmware_class.search_path=

 drivers/base/firmware_loader/main.c           | 298 +++++++++++++++++++-------
 tools/testing/selftests/firmware/Makefile     |   2 +-
 tools/testing/selftests/firmware/fw_search.sh | 222 +++++++++++++++++++
 3 files changed, 445 insertions(+), 77 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260317-fw-path-a094c30259a5

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

