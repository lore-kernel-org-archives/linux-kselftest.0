Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788524A482F
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155302; cv=none; b=kHcDKFh1PLNfSsywLrgR37BtdbKuC8kMjnEYRyb2oF8nUxcTr0+Ygh7PG1GQf5yBZB8M4EMV2IM+A2y72AIr8wsYlKAWnMtmO/Gu76deqZSWAp2B57b3wZnoNcgfw8GH/9pEnDDEBv9IQwF4O2JyB1+xP0gRigBxwOfF6cOJ1eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155302; c=relaxed/simple;
	bh=LX8hK0qolg/iOl1j+KdSYrMDtNDyex1iT3NZil1UQBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fvB4S+2701hut1wWxfkbx4X5231FEp45MItZtXaRQOnmCV3tfjjsZpaeXlWCu83hWBvdg6ZCSmTxheFyp9Dn+qDuUX/+PzZMrjKkaNJjQNc7n61s2qUCoYB6mxN9WFw1gASz7ccX3NFY2RufV/zBuiGmAPHZ/Fu+8+XvWIHbAwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Feltn+1x; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Feltn+1x"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso4863034eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155299; x=1792760099; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E95YYQwjstxiJyP2LILlZnMWy7pjKVcdUHQn5hEnhWY=;
        b=Feltn+1xjtEkmFDjxG+o6kSufSk6HEs6nZqU7YCY2FmuOUmKl7GVtult1UoQh8ridz
         /8LGvhhP5eetPUCd3BOeyfh9Q9xgr8fu9cnUHWJo8+FT+ISNh671W2KlhOFWXodEJnDL
         hfi74GHgawQpqc8Tkyz1/BfOzLxAnB8J6OOHfYoYayCEw0uBwOzdiUsU88Vp32b1zj68
         1HFSmFycYhtcRThTupJxzMCw0H4j9BFbK5Z09XOiMH87GRLRdZi3GB2xAJpbyg977gvW
         +AnOBKIgLcQ+bJDyQxNlcqsiv2zm5+vkbY1s+gR0LRciN/5SybYc0Fnvt5qXkcOoYk+k
         V7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155299; x=1792760099;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E95YYQwjstxiJyP2LILlZnMWy7pjKVcdUHQn5hEnhWY=;
        b=KexvL5iJ4s6fYXTzeUUtGWmdDoJtYn1KO/n+XjXsOllclCTiAPPwf6twPjgtarcRA9
         VfmZFjOQC0YmPQf9fpegX+8wAlRHxZlNjxAgad/4nKH4DNsQOEDvbQCpI0SOZ439/t3s
         +vMOWNfY7eVZVBAv6H7IwlUtSWaEPJCbeKnjZpxWv8ZfAW5wP3yZBdZHVaxk/vCL9BOb
         wRqkBA1PmxQETGA7t0kvMvwitdSmeie8dtGb17zfvVmM55rk/leOn5Sq/ZuUkU1UMjNf
         /vRJp6ZrN0ogEdgURbOpx1Ry4jXLwTlXEpuZoeFKwqdCnQh6OY26aA54XaZ8qOTT27SY
         wxXg==
X-Forwarded-Encrypted: i=1; AKwUvBzvKERxNaDTicwS/Twm8wzmiZpyJhoCdpwqwkMFRueG58TVY2U50vaPmm3dUSUVEa/dcMfYgv1Mr0BKaKYftTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYjlnIgLmtx5mYIjdCDm+h/nQKN+yDZLJ612jM9ZlW33tHRHHO
	qQaiBCddDQsgktHbDrtpAonIvkWPjRJkt8S7sd+uJuSQcxdMWwRqskLD
X-Gm-Gg: AYBFou2o+NEaiCyd7MHyeyxORoLrkR7fuRP8KONY1Ek5afvkweC5JEIeN8YNWy4YbRi
	ixIgoUAAnrynwrfn285gTc4P9z7TL8xna2KJO7sQynpyidB47gJk3VIH7hI4SaqTG6vcflNPHhh
	BGpLeYiK0M8LvmNAQ/H1RavMfEQrozrbC76aPlLCRMUdkiAI9xAVUuQNoGQAX3BQ8fyO86oVsiu
	sa+OOGmuPuMsh7TFDe3ldAd942wWnxoT0MGB1Lzg467gJz2gDKZSrZPqWIHgAd8wjUU4hngRmk/
	OKED9U34zaj7cHq4D5vp/2oOj1f/JKf0LoMglozsLMuoCehEKItUA8hU4iICDmUxb36vrMhdWzX
	ZVBIyq5NF0c1qvzpiBgaXiYZLa0O40iV3FO/HHlO4gk9+XQ/ZJt/sVIza5+7cLLwmGVzC0A5N4S
	JCspvf0iY/klH0l43KceHXQVQLM7CzYI5LKiwOatJl9VPt20NnlQ7U45hKuGULERlJMzIf4icQA
	hPh
X-Received: by 2002:a05:7300:d58d:b0:360:73dc:1e13 with SMTP id 5a478bee46e88-36073dc22cdmr3045198eec.17.1792155299332;
        Fri, 16 Oct 2026 05:54:59 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm6974508eec.16.2026.10.16.05.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:54:58 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 20:54:48 +0800
Subject: [PATCH] selftests/mm: skip hugetlb cgroup v2 tests without the
 needed controllers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-selftests-mm-hugetlb-cgroup2-skip-v1-1-7c78883a67b4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJce0moC/x3NTQrDIBBA4auEWXdATbGhVyldJHY0Q/7E0RAIu
 Xuky2/z3glCiUng3ZyQaGfhba3Qjwbc2K+BkH/VYJSxWmmLQwkoNPtMkgWXBccSKM8DupC2Eg3
 KxBFf3qlW22dnvYHaiok8H//P53tdN27F2oZ3AAAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Mina Almasry <almasrymina@google.com>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

With -cgroup-v2, charge_reserved_hugetlb.sh and
hugetlb_reparenting_test.sh mount a cgroup2 hierarchy on a temporary
directory when none is mounted and enable the hugetlb controller
(hugetlb_reparenting_test.sh also enables memory) in its
cgroup.subtree_control.

On a system that still binds these controllers to cgroup v1, they are
not available in the new hierarchy. Writing to cgroup.subtree_control
fails with ENOENT, "set -e" aborts the script, the test is reported as
failed, and the temporary cgroup2 mount is left behind.

Check cgroup.controllers first, and skip the test when a controller is
missing, after unmounting the hierarchy and removing the directory the
script created.

With hugetlb and memory bound to cgroup v1, per script:

                                before      after
  result                        fail        skip
  cgroup2 mounts left behind       1           0

Fixes: 29750f71a9b4 ("hugetlb_cgroup: add hugetlb_cgroup reservation tests")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/charge_reserved_hugetlb.sh  |  8 ++++++++
 tools/testing/selftests/mm/hugetlb_reparenting_test.sh | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
index a1cfd3a349db6..65065b1377b24 100755
--- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
+++ b/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
@@ -39,6 +39,14 @@ if [[ $cgroup2 ]]; then
     mount -t cgroup2 none $cgroup_path
     do_umount=1
   fi
+  if ! grep -qw hugetlb $cgroup_path/cgroup.controllers; then
+    echo "hugetlb controller not available in cgroup v2. Skipping..."
+    if [[ $do_umount ]]; then
+      umount $cgroup_path
+      rmdir $cgroup_path
+    fi
+    exit $ksft_skip
+  fi
   echo "+hugetlb" >$cgroup_path/cgroup.subtree_control
 else
   cgroup_path=$(mount -t cgroup | grep ",hugetlb" | awk '{print $3}')
diff --git a/tools/testing/selftests/mm/hugetlb_reparenting_test.sh b/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
index 95f517c3bd167..811912ae7d975 100755
--- a/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
+++ b/tools/testing/selftests/mm/hugetlb_reparenting_test.sh
@@ -29,6 +29,16 @@ if [[ $cgroup2 ]]; then
     mount -t cgroup2 none $CGROUP_ROOT
     do_umount=1
   fi
+  for ctrl in hugetlb memory; do
+    if ! grep -qw $ctrl $CGROUP_ROOT/cgroup.controllers; then
+      echo "$ctrl controller not available in cgroup v2. Skipping..."
+      if [[ $do_umount ]]; then
+        umount $CGROUP_ROOT
+        rmdir $CGROUP_ROOT
+      fi
+      exit $ksft_skip
+    fi
+  done
   echo "+hugetlb +memory" >$CGROUP_ROOT/cgroup.subtree_control
 else
   CGROUP_ROOT=$(mount -t cgroup | grep ",hugetlb" | awk '{print $3}')

---
base-commit: 437a7e839def0f505277022622fc59a8b071d6cf
change-id: 20261016-bug-selftests-mm-hugetlb-cgroup2-skip-7fc0316486f2

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

