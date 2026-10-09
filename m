Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE086345EC0
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 02:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791511493; cv=none; b=ko0/IWzED9Te248gO6aG3Udj3JpCbxFc5pgHz0Tl+ejGB6/bA6g7H2xVr9o8K++lvi4KortI/zqxwTCmg5BZGjAb2GWtPp1O97QtrIWs1hfNqcikYqszjiMkHxjGPyLACi+1N/yiy9zjtnghPJ30GZ/6xDJfJgtG4e7akhI/3yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791511493; c=relaxed/simple;
	bh=eJZETsRJ0Hh20z27qQJ53/aUqbdLLvxPKcw15Y8Xiu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JNqEXpqHLIc//bEDncRbzFVS+c907MZDwXipmiTK8tfstqXkJrl9IMYdoPJyRSKtGrkiqHLmQf4fXTiwX58o3VeEaWnsC2tFScZJCbhMYWYkJqBRJzGiVFFJkEEFRxKpxeHx47U+C56ZtmUesYirkUueQXCTfvxYStNnsW3yZsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOoD7Bmj; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOoD7Bmj"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15354aa70e8so8593c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 19:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791511491; x=1792116291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J54/gYCI95envFrHsdO+xt+CtFLWckC3t7mEJfXoeZU=;
        b=tOoD7BmjF/mNuz87C+YFpm0oMR63G1pH+KuaNu+QM8FIrPhYJ+TCB0ThVZzFAI9WnD
         KzDJQh2TWWSrqrg9nqUl1MWQ39Olp1udqg/UpfEkFSb/Uzuo3SiDG3llfsIsgvcCK89N
         c4/yfIOe2T3+A+yuSzhfXumtwMPQroBvtdJFcGGqiL2cKJDYyZ+BrTG/XgzW8G0IyUPV
         /lRa8jiUPBFY5gCruZ+ImMUVSl97WVCRUQOSjhxkJ1aqnNERCq53vKPnv+gjgXB2qLLP
         L9rB+lwa+/Og9MhXV0KgjbqdKSbfoZ4iUuk5RegNLnqXHSJz1O42xNo/3KvlPo1Tss9t
         QLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791511491; x=1792116291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J54/gYCI95envFrHsdO+xt+CtFLWckC3t7mEJfXoeZU=;
        b=Ml6a5Bb0w5R/P2QKBCmK3w8CnO7TwPvxuG+WQqnnvAEET76xdBlPxZIoP+s35lg1v6
         z5q4XvYR2fGASKTuRWN8AQj5NekIwsyBB6IHQxd/VlK1mYWmRRFFfo165cF5QHFtn5Gi
         ChdyO+GFjAxVqGvfX8CMNBe67FaKAf8I3ic41aa2MOYOW0bG2znc3QYB6fJpLY9BZcJ9
         ESJtL3mHLBgebsSXQpnS2KVOrs+QmoXuIEjW0HEMuKU2lRvpX1YiHVZ1zF9PlNOuRy6o
         oSkI+8wMmtWwPlgwetDTZA6rryMp80nKdZbdwHESIvkl3eVXHGowa4WTF8yJY1Q58wJD
         3B5g==
X-Forwarded-Encrypted: i=1; AKwUvBwU3/3ierX2V7pCxS6xuIWoJX0U90AJqLNdhvlOVH3M43HpWpAej3Nd/flOExIb9rJCvOS9ODBsBFcT4TKG/wU=@vger.kernel.org
X-Gm-Message-State: AFuF++l2gopWEeCXi0UQgQ6CLVz+40d6vcyY4B38YJ6xy/T+ll77MiRd
	zzjzajlGln+5p1CY8+HDrvUhf+Oq5HncTj+3GQcE8pfB5vHIRBS9ppb8
X-Gm-Gg: AYBFou3wKVnhlKjVuX0w1Px3BbdavV7TIqySQCatieOR1nGNWDfqY4ZE6xXMFfq1XfH
	/VgxH/cBUM/ez9wgwsSnZsngiga/+CKXE7ky7bsqKI09DVoN6byBmVVYMv9N8EmTcjL9WtUB1Qk
	a4ow/HlzIGtG/0grPA4EeP4UXN+lVstrghqTmi7ImPcjcS4c83wiMw4p3HgwSS9StiRx2Up4gmk
	aujZsvEWNr5o3KUDBS7TLX+oqGpjP3XlYXjaav3CDLrVjTrkywOmDyx+C+pjW1P+9i6pXhowhXN
	4jdWvhvugXzLOcTqSmsW0jJOPTK2ddsPJVgD3J/3JmW/376uOtovfJ9Q56jpT+GHwLOhbDShPom
	2LllsOz2pQyxPIv45aXHlgNuYOGbTnpfNIXmCwPNiixNTxAyveJlF6CHwFdvj6eeFcZmU3H9QrF
	+RWga2+M4h2+XBVQhe8o98pbZtl8n6/zOOd4CBjtSAPhamsKufwo62uOdo5pxjJnACGA==
X-Received: by 2002:a05:7022:7f05:b0:149:49c:22b with SMTP id a92af1059eb24-16a57733270mr571517c88.1.1791511490964;
        Thu, 08 Oct 2026 19:04:50 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16996eac537sm1970743c88.1.2026.10.08.19.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:04:50 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 10:04:38 +0800
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Unmount the bpffs that
 cgroup_hierarchical_stats mounted
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-2-f93a111da992@gmail.com>
References: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-0-f93a111da992@gmail.com>
In-Reply-To: <20261009-selftests-bpf-cgroup-stats-bpffs-v2-0-f93a111da992@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Yosry Ahmed <yosry@kernel.org>, Hao Luo <haoluo@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

setup_bpffs() mounts a bpffs on /sys/fs/bpf and records in mounted_bpffs
whether it did, so that cleanup_bpffs() unmounts only a bpffs that the
test mounted itself.

cleanup_bpffs() checks the flag the other way around. As mounting on
/sys/fs/bpf succeeds even when a bpffs is already there, the test never
unmounts the bpffs it mounted, and every run leaves another one stacked
on /sys/fs/bpf of the mount namespace that the test_progs worker keeps
running later tests in.

Unmount the bpffs only when setup_bpffs() mounted it.

Fixes: 88886309d2e8 ("selftests/bpf: add a selftest for cgroup hierarchical stats collection")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
---
 tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
index ad19d6d41918a..cc6ab2c263da1 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
@@ -110,7 +110,7 @@ static void cleanup_bpffs(void)
 	ASSERT_OK(rmdir(BPFFS_ATTACH_COUNTERS), "rmdir "BPFFS_ATTACH_COUNTERS);
 
 	/* Unmount bpffs, if it wasn't already mounted when we started */
-	if (mounted_bpffs)
+	if (!mounted_bpffs)
 		return;
 
 	ASSERT_OK(umount(BPFFS_ROOT), "unmount bpffs");

-- 
2.43.0

