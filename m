Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86434472F97
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155287; cv=none; b=PtCrTyOuC6lWXQq2mfcmSpvFcSL3S8UnnWNZMjxPrQcToiGDV8iUHuz0NwECr9Jg7ZZzrHtxi3Uop9BmSkjUOjYorznVBEa3XYuzj9BmOmjPtqocpCtZ7ajqlremV4dnKoYgfiBMqbzHN+V5chjdWvxAReqH14zQywN1oJgTYqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155287; c=relaxed/simple;
	bh=LtOibToDbEaBaevqO4ikHPxXA2mp/7h2SUznsOKHAtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AO+eAPHbvzUIK4vD28fbbUrc22Qe1FxI5/yC6/dmFRHaNr3/x5E6lAEy+/7+uLuoVNdCbYZ+2yzo4R4DxN7CtObTcPVGEEOsbo3EyhT+1D5Op7lFug4M89QENqRTBwv47jOBhxVQicxYaA1kMjno2VQBKg5pOnssPajJ1eppO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8wHP1Jl; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8wHP1Jl"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5070086eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155285; x=1792760085; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=47xwNbLDV/wYZSE2wpX2Ena+RjFR2X+u3FxDomSqYmQ=;
        b=h8wHP1JlCuJhMsidMonmya9u6255PqnG6bFZo8I5rC52+WUPINutq9nWvV2gaqV8TF
         sMGZoseL/C87XfjOVEQagFBb29MND4NbIzC5ucXjzYf7XRdaGF4nD6V7GFi4p3Wpm0qd
         v01Loh06OMV2fJXfeIV2CtIkg4+bE5/5v9zGiKx/BHwwx5eIKzaiiETaIY27t6FWN0Kn
         KIuz4V6GT6VynpvYMmsjyvcCLom6Dqk/XStbV8cVYuYwyUAq+TaYHQLV8emiUKwN7eFz
         91xsQaj7JUAE15V4SIeTORJMhkf9zfr7R6CVfS+pn0WjXPB3zTrQ4eq+KBek/DvvVgD1
         2Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155285; x=1792760085;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=47xwNbLDV/wYZSE2wpX2Ena+RjFR2X+u3FxDomSqYmQ=;
        b=z4oC39I4muxpmSxkI0KYa899NjWFwgMkwjb3y4/VNuYK9gnNEivvdzVmctO03NwxfC
         rVZrUj1LEVjF16Hygo3riefPt/O1ThAwvBjQLFo0qDAc2bORxCYT8FsU81WAJeudNJAD
         WJbJPEc+Ab4hzZQNV88FDKqGtXosm9OAqPUbtH+hWLsliUyVA/IKob/roA9vjxokJmif
         xxK0AQkX/iPFcFTpStgna20bCR05AN51wSMfpr+3Vc3AwiTpXxHbBLczEvwU0Bo/ZFyx
         8kaeCCDzmu498XFdfPLwN//uU5YwOJwzUEW6sCHq1MNhK+H0LCO82PhxDbrxCrM/P31N
         tlcw==
X-Forwarded-Encrypted: i=1; AKwUvBwG87A+wMaas10GjfAUmE7iKXARqYcbb7pV/VWFvJF/9ImlafZnTTlLsAix2NId9xCpW9+gJ+cm1Y1uiChgbg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl6B88K1qOi45yEb5mTXfKPPp25CHIb0NF3hYr5xtmm41AuF0w
	x+1AkIlGbXWsFxiMijPFN2urS/y8R1qJTEhDdVIiPD8pXVleBAvtd7TK
X-Gm-Gg: AYBFou0R+vgDNB+jx+cVYr0e72o5oq5b/s3/uR+lttfamm/1tT36kYTI0HEPbDe2zyV
	Vz9GvnMQGqbnNNByZI8oetZGXkk3PTLdXdNxfhS6JQyvULFJrfcvUi8j9i7PWWDYn6+wcYLz46z
	vrMOqjGv9tRNlx0RS23WszUaz/TUgaQLbjZ6F3wfz8A4UZ9VBmHg72jLHUM/pf80ECwEgBbNaGv
	T17BFpep/FUWZ+rqV6a0qphYe7Vg/AwiTg9xp0G/wOWeZ3BFHwjgk4KGIBeG8OxX36fgTKhviRG
	uYUVRpGFFQ3NNQqKNZOffcTWCzCZpEXhwBVTClp4CGh2TfibGCwCJDCe4cPVOS0Feyc5uMQ3rRf
	dcNhR1ZiZh+NBFdf78rsk3tYZ9Ghz0rEiNGrn+Rog1ecaYw6ALBRD+UoX+h+EUffnWlOoO4NyuJ
	bs5SuUw1S8TOyXX0E8/14uYHae0xgWbmH7SFiOrRUkuSSUsCvuQil9vDPVEIG7taaQasaS6ms8t
	l+T
X-Received: by 2002:a05:7300:6d23:b0:35c:6ffd:e91b with SMTP id 5a478bee46e88-35c6ffdf3b6mr20435005eec.40.1792155285484;
        Fri, 16 Oct 2026 05:54:45 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm6829118eec.1.2026.10.16.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:54:45 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 20:54:37 +0800
Subject: [PATCH] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-v1-1-b97dfc79e97a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIwe0moC/yXNwQqDMBCE4VeRPXchEUmxr1J6qGZiA00iuyqC+
 O6G9vj9h5mDFBKh9GgOEmxRY8kV9tbQ+HnnCRx9NbWmddZYx8M6seIbFuiinBLLmnlLf+6hpuJ
 nKQPYw7j+7ruxQ091bxaEuP++nq/zvACD1dWgewAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

run_vmtests.sh creates a loop-mounted XFS for "khugepaged all:file" and
for the pagecache folio split cases of split_huge_page_test, since
tmpfs does not give them large pagecache folios.

It only does so when xfs already shows up in /proc/filesystems. When
xfs is built as a module that is not loaded yet, the check fails, no
XFS is created, "khugepaged all:file" is reported as skipped and every
pagecache folio split case of split_huge_page_test is skipped with "No
large pagecache folio generated".

Try to load the module when xfs is not registered yet.

"run_vmtests.sh -a -t thp" with xfs built as a module and not loaded:

                                   before    after
  skipped tests                         1        0
  skipped split_huge_page_test cases   43        0

Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index a1b45a3dedaee..6b754555d5734 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -399,7 +399,7 @@ CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-	if grep xfs /proc/filesystems &>/dev/null; then
+	if grep -q xfs /proc/filesystems || modprobe -q xfs 2>/dev/null; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
 	    XFS_DIR=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}

---
base-commit: 437a7e839def0f505277022622fc59a8b071d6cf
change-id: 20261016-bug-selftests-mm-run-vmtests-xfs-modprobe-de0697d4c4e9

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

