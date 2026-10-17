Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0183921D6
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 15:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249654; cv=none; b=to+Q2jsggHjRg1RT3Yvluo/CJYXplFUoRxKv8afiXU5MZK4sfV8xUCxM15tBDD0BrfIu1/vzr1v2v7Lk/xPOx1w/1V4ILgqFb/F38iCnGcMwfsQTBWrvvn44LgXf7HM7ZdKNHg6h5vgtjD36H6K6UeF6MxEFOquB81N0Hmu6co4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249654; c=relaxed/simple;
	bh=ajhqMMevRMUkFNjLwiWa8hkPP68v/fykXCHCDIhZgzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cx4mZrukcDAmTB+RyUga1IT0zywV/YCqXkjBFfrsOe/AkeA1odlbF8j6P2jXPAn8tj81ZQeehje++YbV5b0uxh1ovKIRVSVRXtQuNu8xMADNzQAonmPWBUuTMbvZmvAaLgMDsKQjdxuxXgrh5IC2Qfc6UcchSbCM9NdzaKr4U+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwjlxIMQ; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwjlxIMQ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso869024eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 08:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792249652; x=1792854452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBQ7X2jkYefaXYnnpfuBlQ4cNKv2piH6HTiOHbSZfNQ=;
        b=cwjlxIMQN8UKfOv6aOBvWDAnU1cllWpKwqL8H1QBBJSevrSIi4p0IU3WIAURTFSQwx
         4/eF/287ufkooF2AmmNT7ELVUD9aCX/qEPe3fJgbVYF+qpDnoSqZBdmYt4UaTVpg1S0z
         QuYrQR2IZtFW17H3I504KSyx4oVOZ/+ynrMLFSP2dzJU/hfMhW8gr752R0/pyk+2a85w
         jsmA+zpySla7k7suDR2JNp1cpBk9GCGPE3NFtBfRHXwA3lO99JFn/EQeNXKloryEob0R
         OD1esty5uP9BJIs3xG/VtEq2Zyc640EYHfEOMn+13wwlj81Vh3pnLQXOfaPyV7OwRwxq
         aGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792249652; x=1792854452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBQ7X2jkYefaXYnnpfuBlQ4cNKv2piH6HTiOHbSZfNQ=;
        b=Bn7t6XTZlvQ5KVxoeJHsGoyXcNYOQTNy38C0WhbVA+PIKG1gsr/kWvNNeovQDznnN9
         43L4RqzNBXpv4MlckmQ7JKtKDaBJLnQJ5YEtTQQz+Bnw8E74u158nHS8bpXvtohQilGy
         8FnVIOc+P7wQExF/X6+wRV2kc5A2GgdXhJbqcii/Q8gplBppni+LXTzn6y1Sc86S7wd6
         ohJLNXyZJqjINAkpgFhha43b891Rz2Jk04VrJrgQ/egKmJSRCy0jJzq9pdaQbTFxCXJR
         3eJIu0Muu3IDAFySy2ULHX6ClXxdCJHKqKni/CM8/5LwP9smkbdlByKyFiixBfq8huSd
         dfaQ==
X-Forwarded-Encrypted: i=1; AKwUvBymuQKDpI1orHKVmod/1zpY3avYFyBffgpTwWGpvo6OQeSrXoayofWumLw4Mgjpb76g614YF1RvF+F/FG9+bis=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRJgUDItfGD91lKXUjkNB9aKhd8xXzhTsuboP4AEb1Yf5nphTD
	3ocTlGwJgzHvCJ8Xd6yoJWxKMbZpg827j3wJkN+9biS9fsvic6Z+5h0P
X-Gm-Gg: AYBFou1YpY6j5yLLHG2zOo2ykgjsLP3p+5XR+FxorOkg2/dNf/1/mK2pF7sKuYGjoy4
	wkfbrw59SKS2/GpSGwM3Y0rG3Iprq3g4KvZgt0+hlb1+uDnivyh8jFPinOM3fhca9Nspi+Y6CTT
	9qkfGCgr0dvl3o1yIYN6HOhRBVYvpfG9C9V+lpRUlFaHtvq1aB6DimDACYjk2iB1xkGc0U6qzef
	w4aNRZbyHeFuqNAh3bbiNi82h65HU/CZiW+HwhNcOPEgFDUCH70Pbrwnu4BxAvIc+rKkKrbGv1v
	E9h6A2gLoP0+6z8uN9ejJObRJl7NP/Ipzn6YOurt+Z4+WRiNwpttdwexuK8NlyOE3LR5Cib8Jm+
	MAGvC3Cs/GsoYFAyqajEOAlGa7ZTxEfyoUM6woBht2Wb77X+VwNrWMsEi7TywfXXTLm9e6WB8RJ
	aK0QKmC0OOePaj1/gI3x7S4EVartB2biJWW9tdDYuRqqQUL25zqI6g/9HmfqFaNlPkAg==
X-Received: by 2002:a05:701b:455a:20b0:168:3243:c910 with SMTP id a92af1059eb24-185120a88cemr4732337c88.13.1792249651516;
        Sat, 17 Oct 2026 08:07:31 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm13170977c88.8.2026.10.17.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:07:31 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 17 Oct 2026 23:07:13 +0800
Subject: [PATCH v2 2/2] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-2-cbb36b014322@gmail.com>
References: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
In-Reply-To: <20261017-bug-selftests-mm-run-vmtests-xfs-modprobe-v2-0-cbb36b014322@gmail.com>
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

Load xfs with load_module() when it is not registered yet, so that it
is unloaded again once the script is done. "run_vmtests.sh -t thp" with
xfs built as a module and not loaded:

                                   before    after
  skipped tests                         1        0
  skipped split_huge_page_test cases   43        0
  xfs loaded after the run             no       no

Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 56f5416681da7..ba77fae5df4f2 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -428,7 +428,7 @@ CATEGORY="thp" run_test ./khugepaged -c 4 mthp_khugepaged:anon
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-	if grep xfs /proc/filesystems &>/dev/null; then
+	if grep -q xfs /proc/filesystems || load_module xfs; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
 	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}

-- 
2.43.0

