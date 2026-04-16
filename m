Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412902FB084;
	Thu, 16 Apr 2026 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776364881; cv=none; b=WB3WbCQDvUJoH5qW/SAygW0bwC3UwqWO903zlgcTMleZo0oY+Gt/Ayc4XwGy6PZDUJ3TfpoDIfb80pCW9Lxxqq8aFxLoNOkpt6ywUAXp9dMwUC7dK4LudF3audfXwwrqzmPaB9BrFS3H5vRKKgmqfSr7lsVqKlOaHNkl3qwNCBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776364881; c=relaxed/simple;
	bh=zYcqHhJWZbVqOZVOHUzK1fIX7tx53Tj7PLzpE68s6dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f0V/3ovLR2zwZwNBWJWlefg/dEXLwE7/QOTw9Zu0080mihe67TKzRjVAJFVFofREwhnMqyCP2EY10kxyiHoSNMqXjBI5php4+vjnx2Mi/rJUYs7dtPy456H/hfCLAsO8UH3VWOqgcQvk9P2KweAtwO9W1qOngcnli6E4uibOkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nF8FabWV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nF8FabWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E768C2BCAF;
	Thu, 16 Apr 2026 18:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776364880;
	bh=zYcqHhJWZbVqOZVOHUzK1fIX7tx53Tj7PLzpE68s6dY=;
	h=From:Date:Subject:To:Cc:From;
	b=nF8FabWVU5taY3Rmp22jRYNPLxtk9RBQEVKWLAlYvOvzhXsszdn5AURtxhjf4oXjh
	 v2jZW2D3Wc13XbUQuOhpDw8bGZCbZ4b1C14zUEcpmgwQIyR6ewWDwAonk6RpGBNQTb
	 gl8plMGNRgKNW2XrYV2gXw4fIgy6kzjKSw1qpnjWs39rdwDtRY84cV5bvrr/GhZwBp
	 SDV17IwxaV1DEVEq2K4cp4zouTdQVOdKwKC4Twc+YbkWoNiE8UFCXsRxxgt3VbGjVB
	 Zduq2Cfu0b56XD4WYTX1gq7tR11B1f/J73SdRu5Y4NkUUDboCb5Qff4Z7X2jCT/npm
	 MPa3RgzryDNxA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 16 Apr 2026 19:40:56 +0100
Subject: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
X-B4-Tracking: v=1; b=H4sIADct4WkC/yXNwQrCMBCE4Vcpe3ahCbUHX0U8pOtEI01TsqlaS
 t/dqMcPhn82UuQApVOzUcYzaEhThTk0JHc33cDhWk22tX3bmZ4Voy/QohwjzzkJR0R248utyj5
 lAR8FZqhza8VSDc0ZPrx/J+fL37oMD0j5lmnfPwu95s6GAAAA
X-Change-ID: 20260416-selftests-mm-proc-mem-always-force-5ce1b26022c2
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zYcqHhJWZbVqOZVOHUzK1fIX7tx53Tj7PLzpE68s6dY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp4S1NrKFPxkSkZOUOGYBSWF9G/cKzW7FGRGif9
 Id/7HTmuaWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeEtTQAKCRAk1otyXVSH
 0CvzB/sEoiIdTrIBx0hojKsFJPKr3NDVQ+pdSRoa7QczL0nxBjRD17152+PsXmgLgq515DjRt+g
 B2wQ0Yj2fz3msXDYnX2V2+lh5eP1iudpesIJekF6/jX6L6xcgYinBKGv3Y+Tj9qJF0kxKJiEY52
 5dublecK4tRkujar0tO5gD5bbqApWDpSoJBI1CLqO4LYtJfTu99SIXQa33oB28qDcgtf5oPTVQG
 rnUJpRviG9eSoB8vIZ2ZQceKPvxN5HK1eeIVSCCNpIXgZngxQgS9YbA8VMYrKlT7OfT/YXubGK0
 skcAP8Z4b/vIvII1KJDyvq4HFIlFNvsq/A7sR2ZsbnlriDxZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Several of the mm selftests made use of /proc/pid/mem as part of their
operation but we do not specify this in the config fragment for them, at
least mkdirty and ksm_functional_tests have this requirement.

This has been working fine in practice since PROC_MEM_ALWAYS_FORCE was the
default setting but commit 599bbba5a36f ("proc: make PROC_MEM_FORCE_PTRACE
the Kconfig default") that is no longer the case, meaning that tests run
on kernels built based on defconfigs have started having the new more
restrictive default and failing. Add PROC_MEM_ALWAYS_FORCE to the config
fragment for the mm selftests.

Thanks to Aishwarya TCV for spotting the issue and identifying the commit
that introduced it.

Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/mm/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/config b/tools/testing/selftests/mm/config
index 1dbe2b4558ab..06f78bd232e2 100644
--- a/tools/testing/selftests/mm/config
+++ b/tools/testing/selftests/mm/config
@@ -13,3 +13,4 @@ CONFIG_PROFILING=y
 CONFIG_UPROBES=y
 CONFIG_MEMORY_FAILURE=y
 CONFIG_HWPOISON_INJECT=m
+CONFIG_PROC_MEM_ALWAYS_FORCE=y

---
base-commit: 599bbba5a36f6de57ab14c373c25881e2b5273f5
change-id: 20260416-selftests-mm-proc-mem-always-force-5ce1b26022c2

Best regards,
--  
Mark Brown <broonie@kernel.org>

