Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7CB370ADF
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468205; cv=none; b=beVP3yRAOD8mHgzehouBYPFnsXbBtphtmk/mnu9B3KTh32mpDu/1SYTeA7YH66jjd/NPpuA6hwvoCDDljdzbfpWLumGGOXlb0KrBwNeSWcbEU+3ok5+8CtHkOYb/Lv/avmCI4D3eekiIHed0r6JilYNu2m9mfLoMJuyJa0MJyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468205; c=relaxed/simple;
	bh=tP+VBOEE6uUWavsjTiW7KUgYK+WeJr0lcZRqCu2VSZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGCuWWw4EeqN9VvGWNh7jk77cuLR6DH2wGuK8bvh3sq5qddSs0cDElMp2s40ChF7F5XCCN1StihUJeL3EUkb/VqWRCctt0YOk17yDLxyw4cK+P6KOrBOSgDqEguP1P+VwECSnAz3JmnZUWR/K79nxIw8Yy1/q4DUeWonr5sCp5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puFx893T; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puFx893T"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1419d3416ceso9998565c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468202; x=1792073002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM01Ijv3NbsPqz7EOr9J6JvAz932tf+OYegbwuaM0ck=;
        b=puFx893TOC3kiLyMo3SZxW0DltsL+6LnT19DIKGRpGMu0gU41Xgs13UX5cLL0Qn6Cc
         3pAmK5CuRsJ8Bise+Mu54Rpv2GYxg0dHQrZ2Uwiw3haZz0+B9I/wQwCIByLDtwwUv/7J
         YCedYTGeTLY/QKFEDYXxSAIi+yYz5rQ8v1UariUTzvbFCauC6qaZtv90ZwDsKh5uP5at
         9SOCkDTxOIwGZDd5lEMkf9KMD9+HYryzcx+YvK9QpluqzZJGvjlsI95Ywsw0yJizinuj
         BfUUeP1R4Nsz+rZeJUhvZNUFdFjlUHTOOYl08M8pZnoR+T7ujBi1OKeeguuOg5/ZA1ri
         8vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468202; x=1792073002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM01Ijv3NbsPqz7EOr9J6JvAz932tf+OYegbwuaM0ck=;
        b=DRwvJI9uQp23M1FC43aD7wiS5kv86lKS1EpvJGLYG7zky+JXPOodhW8uG4DwdnRjT6
         p/QfWh03RtYwgyNSkkJ1R+3yoKqKa94+8YObq+i/zCCnre45hENKzRFLbi+m9nZCRpOd
         7RCscGqzZn7OKK6lxmDVCnQYXm0I+28T5FRvEHmP8DcMlILyQeFHnfUKJSxrtwHwtLg5
         V6tRJgbm0qBiL4XKuU3mI7YQJf6qxgw0obwDswpDKhmqdmnRdGQTrWl+m1JJ1BePbZ7I
         F6tJ82Xi6U81GM7dWky/6BQjaAPEpDGaYP7b9apfPwb0c+zmgYwp2hBE2r9XR/ZCzG3T
         CYrg==
X-Forwarded-Encrypted: i=1; AKwUvBxnAmt2MUXOrgzfTW7GNqj2D/7Ro0aFPfCPW8Lkx/eVafsb8vAyLmioriTcoSz3hCJ4AYoZQt0WvAZ7mYt8HA0=@vger.kernel.org
X-Gm-Message-State: AFuF++ky9GJy4fE/hAQ36Nph++YzcLAsx+/1dR/dKoyUrEJaM4ETYOTB
	d0QuUrKj0DKYAvBv7iRJxh1q4/IOM1+uM44tX5qhEIDcXDJbTeKhTllC
X-Gm-Gg: AYBFou2Do0BSeG3VmTEJOoVDCkhwB1odvI/G/uOvkX/2Rp9mtXU4cwsT5Rr3NSIeNKZ
	ihQqoSwvG40X2atWgJwjaW+WYwdNOMfzudjt/4Xd3AzBISZX5rDITIZVPKPxW4mnpUmHS2HLq2T
	xvC9SQaFnTatr7FAglSXcfHkh5U98rRUKulnEgy6qYcJBXINMSRykPYBzCh9+BLcjD2rpWw/smm
	HpmWp6x29YubPxG4At0gHIOGiC75dtncO15Xnlht7+yfpbLOzCjbymtq6mW2G6g8QcGjv4wPQsk
	cRReSwA6jtztdn11e1lyNcSrVEwBU4ZWkeNh9e32i88aaclXUFGNN/YVuj2VIsesoh4tLRSHqpf
	vXMbo9JZvCroUdl+F8cMdG5G674JWId7UCyMvekzLSOe7pLazV5ivMhnniuALFrpJhNzgD2VK77
	MJULDhTKLFxJdM29DPERp1sIE7MPFFHgWlkOFmTW2V+OjFLUVdGivHzTNmEKg6xlMUMw==
X-Received: by 2002:a05:7023:885:b0:144:eab0:9cbc with SMTP id a92af1059eb24-16207001d4cmr7174653c88.37.1791468201113;
        Thu, 08 Oct 2026 07:03:21 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616aa55195sm15973494c88.19.2026.10.08.07.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:03:20 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:02:50 +0800
Subject: [PATCH bpf-next 2/2] selftests/bpf: Don't stack a bpffs in
 cgroup_hierarchical_stats
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-2-76b9a6d1be34@gmail.com>
References: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-0-76b9a6d1be34@gmail.com>
In-Reply-To: <20261008-selftests-bpf-cgroup-stats-bpffs-v1-0-76b9a6d1be34@gmail.com>
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

setup_bpffs() mounts a bpffs on /sys/fs/bpf even when one is already
there, while test_progs runs other tests that pin objects in /sys/fs/bpf
in parallel.

The new, empty bpffs hides the old one until the test ends, so those
tests lose what they pinned or the directories they pin into.
bpftool_maps_access then fails to pin an iterator because
/sys/fs/bpf/test_bpftool_map doesn't exist anymore, and bpftool_metadata
can't find the program it pinned in /sys/fs/bpf/test_metadata.

Mount a bpffs only if /sys/fs/bpf isn't one already.

Fixes: 88886309d2e8 ("selftests/bpf: add a selftest for cgroup hierarchical stats collection")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../bpf/prog_tests/cgroup_hierarchical_stats.c        | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
index a93b16ed629e9..8e0b67df700bf 100644
--- a/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
+++ b/tools/testing/selftests/bpf/prog_tests/cgroup_hierarchical_stats.c
@@ -23,8 +23,10 @@
 #include <asm-generic/errno.h>
 #include <errno.h>
 #include <sys/types.h>
+#include <linux/magic.h>
 #include <sys/mount.h>
 #include <sys/stat.h>
+#include <sys/vfs.h>
 #include <unistd.h>
 
 #include <test_progs.h>
@@ -88,13 +90,22 @@ static int read_from_file(const char *path, char *buf, size_t size)
 /* mounts bpffs and mkdir for reading stats, returns 0 on success. */
 static int setup_bpffs(void)
 {
+	struct statfs st;
 	int err;
 
-	/* Mount bpffs */
-	err = mount("bpf", BPFFS_ROOT, "bpf", 0, NULL);
-	mounted_bpffs = !err;
-	if (ASSERT_FALSE(err && errno != EBUSY, "mount"))
+	/*
+	 * Mount bpffs unless it is already there. Mounting another one on top
+	 * would hide what other tests running in parallel pin in it.
+	 */
+	err = statfs(BPFFS_ROOT, &st);
+	if (!ASSERT_OK(err, "statfs " BPFFS_ROOT))
 		return err;
+	if (st.f_type != BPF_FS_MAGIC) {
+		err = mount("bpf", BPFFS_ROOT, "bpf", 0, NULL);
+		if (!ASSERT_OK(err, "mount"))
+			return err;
+		mounted_bpffs = true;
+	}
 
 	/* Create a directory to contain stat files in bpffs */
 	err = mkdir(BPFFS_ATTACH_COUNTERS, 0755);

-- 
2.43.0

