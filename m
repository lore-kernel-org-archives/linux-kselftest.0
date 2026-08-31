Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B641B362;
	Mon, 31 Aug 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185928; cv=none; b=A3nSGZw547rNDHcoLSyP71TswgVBkqbKF+GnvlH1lne8QeEmbDC9FVSKqgFE3Vhcz6VcUzJWDuswP0S7qDTDnZ4j+Ph9hZi2y5bsLQbQA4CJNDa6CRn20lTPiHLpNTZZnx5afjysUI86aOjRvJ4yd3coOgAOsRKPbNIAkutrjDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185928; c=relaxed/simple;
	bh=GiQY0/cGhCIhrwjz7J5xvOXUacu6SzKqp5fSychrLdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z455O5Zn523HcLGjgv0TzZ/TQ2FqZT082ANlOoYWbBU/NkUgjdIqtJEQ87pjMKOg+wdnUzykxzK54uhBGEq8uplA3PqoY42NJ71Vvt3nE+96sdo+ygZfNZsEiR9smQdtPSDjKvlI1OgztQQqeKipMNaLfBc2kscliAGE3Xk2LSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=es/OHSgr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="es/OHSgr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE251F000E9;
	Mon, 31 Aug 2026 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788185927;
	bh=YONLIVVAUFRdHkx2Rc44fd4Rx093REbHbos2HAeeAtU=;
	h=From:Date:Subject:To:Cc;
	b=es/OHSgrFhhuoB5mNLeORVCEwgIemnBbctWc1VqXmE/ivZ6SBs+Ja6EwcYS/4910S
	 alTuWAoZYzsEqFU34j3SWao+xeT68zjaUaaMpYb/Ya6E3RoT2x+McOyVDaLRmMH+Mm
	 ZS+ZRHI7YjX8cwf4PUMZGzZPWokcS7bFZgoeKVsjo6NZvkrudu7ET0YQ7mg84N886k
	 JMcai+D1cYkOwowdJGDgB5jn8/fjvroxm6puqYnHDvPhbonfDjLgA3cSJ9+olUH1/Q
	 Kv2KicCSqVsJCZSYeD8FvQS5vbc/n9aIQuPQLvwBrlNgXExPcbWTUPy8imsUTbK3Cs
	 ZGuT0pNVoFDag==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 31 Aug 2026 15:18:23 +0100
Subject: [PATCH] tools/testing/selftests/mm: add missing .gitignore entries
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAC6NlWoC/yXMQQqDMBBG4avIrDsQI6jtVUoXan7jlBpLJkpBv
 HvTuvzg8XZSRIHSrdgpYhOVJWSUl4KGqQseLC6brLG1aauSR/nwPLPiNSZoUvaSxIclgp2r2qv
 rGtvUhvLgHZHr//z+OK1r/8SQfkc6ji+cxVydfgAAAA==
X-Change-ID: 20260831-fix-mm-selftests-gitignore-dd389da72760
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: Pratyush Mallick <pratmal@google.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ljs@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=ljs@kernel.org;
 h=from:subject:message-id; bh=GiQY0/cGhCIhrwjz7J5xvOXUacu6SzKqp5fSychrLdM=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKm9hpxHJY+fk3bZ5vKhnl/GItVs+fO4w32CZgY4Tjnm
 /krpjXSHaUsDGJcDLJiiizPv4jvDxIJm9d5wd8NZg4rE8gQBi5OAZjIAh2Gf1rTy/fvmXPZ3Pb7
 1q5Nv9Q501wtoljnZOrvkNc3k+37ocrwv/SYefGUjgehKjudFCp8GsVey+iUiufaF5xfdJinyrO
 WGwA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Commit 2bee308f3adb ("selftests/mm: use pattern matching in .gitignore")
switched to a pattern-matching mechanism to reduce churn in .gitignore.

It however accidentally excluded the page_frag test's-generated module
intermediate C file with .mod.c extension, and also the local_config.h
header generated if liburing is available locally.

Explicitly fix both the issues, fixing the module-generated C file as a
general pattern as these are always intermediate files that should be
ignored.

Since this is a trivial .gitignore change it doesn't seem necessary to
treat it as a hotfix.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 tools/testing/selftests/mm/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index fcd892ed21e3..a306d7754786 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -2,7 +2,9 @@
 *
 !/**/
 !*.c
+*.mod.c
 !*.h
+local_config.h
 !*.sh
 !.gitignore
 !Makefile

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-fix-mm-selftests-gitignore-dd389da72760

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

