Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255096;
	b=bxEhr8ENV/p8NpLhsymMMvzDHmZtezn384V8IM/aU0GZ+4atEyW6dGe0moiYsu0moI+f
	 nigvEVR0v0zmn3D+z3iebyL0sGbznzd/vZ/q88X/BVcE0y5ADUlz+n25h3EYzFj6OgJTF
	 oTTSF86nllM6K6CbjhHYQADM052fK93RdzojzN3KDP+bQ0lksC5vBf42pXzF3VwDdpCdh
	 hwpYEl5vTJZFtPdzdIrLbk+l2S3DhjZcRRlNfnVJtsWPfaTHjZA3Dq7WBHUIMF56XKESf
	 jbGowP/t4UxqVf2okDdHbULIbNKSmOL05WmaEuM80p8iuFp99GDNpsjVSK2oj+/hycA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8NzBJI6EsRS50iI3ozE0K4oKaJ1QSXdP21FHU7kTXig=;
	b=tjr1HBxUnfl2wxPBE5iYX1kdFDQdZwQq0cQmaDMC4+2VvplwL6bx3Yr9tVu3spxGhcxx
	 9DATfUPkOjEEmN3nCyqoR7bkQozvX5d+XHVKioiw3eBeBxSDBEKkQvZ2qCwUKKYZJRekf
	 WXstA6BUWNwOjizYBI8iZ4vqFcGasmq8h+a4g2bcev6/cnod3VInzBLWgDA7i9x+DNfOR
	 IrXBY1H8VFgb0eQcfshXXjgL0I+tJmeedz9QMZpTWHpgPtN8GWrqf0MMqaWvZvqwKSX/O
	 ZwGntqFXiAq/oqk+jbFIMVZOP/2Z0EY7YHfBdYWbIwYtabV4wyOET6h+WzJK+PndVjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vdc8yS+Y;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F0C606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 06:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F0C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vdc8yS+Y
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1846bc43c28so2083986c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 23:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793255095; x=1793859895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NzBJI6EsRS50iI3ozE0K4oKaJ1QSXdP21FHU7kTXig=;
        b=Vdc8yS+YgtVk4jxXa0wwPUCutgmiUAPvXecH8xBqOThGDnSGwk05sY2XMFOCd7SjQ1
         N7EV8vWV4XDEC8MtIQwafaKU3w43iD6atFUHaFqARrmJ+Li8UkntcYZMZ3db0yWaOKD1
         g3haqHhdZmebeq5yHe12H7R3WquGSk1ygbGLWSjhw2D6sWnTPskJB2PQRQpl1ARELtv/
         dcgni5crIJNE5n0nbXdnT/dRUayPHqsfJh4udP8oqawb/sj/VTS6OquDgAjw3jFjLfQB
         iNAttfErmtuGfp2lRz/UiLOwW67ZpuprMmxQe2IaRFYtLKb79hrfdTwTVz68qxW4qSd9
         fO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793255095; x=1793859895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NzBJI6EsRS50iI3ozE0K4oKaJ1QSXdP21FHU7kTXig=;
        b=r7WU0CxlHSkOuqHlEn5KaPdjQ57d2WzG/DRUCK+4z6XpX+CQY7VtXFzhYekIIZK2BE
         KFYldWeDuT+tlwUiYJH/LnMQhVFtSgfC/E6faY0TieMim0I3+MG/gitrMTgUVvv8Byf5
         vCpwQPcrW2x+8rCGP7p5bVt/NqGC5iGSVfyv6W0mbNM4OaUbmv2BBteFXDYOrlvD5OZZ
         A6jjH6onA9dsAo+e+CfDsR1dsgn8KiaZD7//8nL5leaHhhlutCkZkV5nvISx5abNGKWL
         X/zxFsHQbJiT8/nRlvi+A1SCRExAStpMiYcDNvSeuGvB89ROmotnEn85y+43DzAfVHSf
         MAHg==
X-Forwarded-Encrypted: i=1; AKwUvBwj79Zh2Yk5RQCgGvfteVp5obs5QNyZRVzBHnpcqUaQfQBkGVeapYV2VIcKDyB4VRladtzf0gNvsv1Cr/Si+Q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl/8D7NyOyuvbbpehCLGDw0oYwXzf8/tLOo7PWRMAciyaxaPJH
	J/FYhZiudwUQ5VEWxmMSU9p4EJ1CSv/yvb5VGZf2fEqJRkBlftzSl0oD
X-Gm-Gg: AYBFou1QkTBHxN1Wala6z3sk0OsvbuyJ0MwTHF5zZYKzFGNCtZZJMCsOE6ZZnOBpO3x
	UsedFYY02huzb9YNR6ibgyLzfEvltku7Qf138s15SwHKCqn14XS6oFTxbdqwOxQPnB6B+wjMPtj
	hTSVaeQcXilHUYdXIcyjB5t5BpkCHN4mHwGUVxLfXiMrf3J45Qt1dhQ0PoMRDUE62leDbBC1jlY
	7Qmh9Iv1Oezc8Eer+Ku5EwWMf4uzHANyam+EMxQ7Kksc/KMOJUO8uFotVsIlArH9S6OgbIyYYgl
	olVie2jLwfpG8/uvolgbZeRTyIaB3zaNl3tGl6Hfhpmq/GkGuH5ksqrsTu8Ny3u4dslfJ1IQNeL
	T8QGiGOaRuafLpajqs2QVszYDU+belnm2HMjGzNjRPJHihy0tvZ8F1QZoDECORM5/AHnUkDLQ9S
	/mRAVH9g+VUVXFNe1U6mnjDk04aQ1onGYVSYx9WzcS287pJWARA91U/ZqIuNgqvyEjzOY3n3ndC
	oFhpbH7oHBPLbPL7dmg6wccFdkNkDuujGPhqqoNOdWvWCMYprBFHY2+VA4rjRA+b0DJgF4s87c+
	KG7tlLzjgFWhA3RXWDKVLMUL
X-Received: by 2002:a05:7022:1003:b0:151:8280:2c1a with SMTP id a92af1059eb24-1a6cfcedf27mr7079202c88.42.1793255094945;
        Wed, 28 Oct 2026 23:24:54 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aa2f100684sm2152004c88.3.2026.10.28.23.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:24:54 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 29 Oct 2026 02:24:36 -0400
Subject: [PATCH v3 2/2] selftests/mm: load xfs before checking for it in
 run_vmtests.sh
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-2-16ad772850ee@gmail.com>
References: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
In-Reply-To: <20261029-bug-selftests-mm-run-vmtests-xfs-modprobe-v3-0-16ad772850ee@gmail.com>
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
is unloaded again once the script is done. Match xfs as a whole word,
as "selinuxfs" contains it too, as does "vxfs" on kernels before 7.3,
and would otherwise skip the load and leave xfs to be loaded by
mount(). "run_vmtests.sh -t thp" with xfs built as a module and not
loaded:

                                        before    after
  khugepaged all:file                  skipped      run
  skipped split_huge_page_test cases        43        0
  xfs loaded after the run                  no       no
  xfs loaded after the run, with
  selinuxfs or vxfs registered             yes       no

Fixes: fc4d182316bd ("mm: huge_memory: enable debugfs to split huge pages to any order")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index e104a9c6fdefb..b422edc2e2664 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -412,7 +412,7 @@ CATEGORY="thp" run_test ./khugepaged -s 4 all:shmem
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
     if test_selected "thp"; then
-	if grep xfs /proc/filesystems &>/dev/null; then
+	if grep -qw xfs /proc/filesystems || load_module xfs; then
 	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
 	    XFS_DIR=$(mktemp -d /tmp/xfs_dir_XXXXXX)
 	    truncate -s 314572800 ${XFS_IMG}

-- 
2.43.0

