Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC3C342509
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174237; cv=none; b=aYoEaFQb1RmPT32m+epnFNcKJWF0ECirGaNXKCDBrE8ws/GpzXXUTRwyNyN8qx6Ks+aumfFSy9U4WfSUqTQfuGUEgI4pkGcjvZf6imCB/UOjjHjN73O7tpZaOZJJSGmPbPE8lkl2HLQXipSVQDO8wBGll4bU+CstH/M96Rb1XNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174237; c=relaxed/simple;
	bh=ChU7rLrz5Ly5f6u8c+cGt26nIjegz2kM1bSEHnszRUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oycDnOjVFbpD3MEh/6tEHPAnW7I5C5zqQT5x9KC6uZleIk9gwhpL1IxmgkUY/FL0PbYh6YbEHFpUhw1GSgxVdj8ex6q/e0Bxn55wXx9pcQOE5OZi6rBgOK4hSdDFshJ8hxjWsXG/BZOttDhXKM0qmUk6isce1bYRNf7SG7fmklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jmwFNBib; arc=none smtp.client-ip=95.215.58.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jmwFNBib"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ChU7rLrz5Ly5f6u8c+cGt26nIjegz2kM1bSEHnszRUA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788174234; v=1; x=1788779034;
 b=jmwFNBibWAk20ARxYY5i/Yk8K8RAIQPX/aRb+6F9DgC4ddC+HGw6D85H9hQIgS5KZcTaQ/BH
 PCPU62Nghsr/aTvAKVTTZqMSrd++WNzlnxDVUo+0BfvITOSDc1q3YsK2MqAsXBXuq/I4CcN2Iwu
 t2EvpIrr7GJyTg2uKyHqFRCw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27ca0f8a3d15d337;
	Mon, 31 Aug 2026 11:03:53 +0000
X-Mizu-Trace-ID: 27ca0f8a3d15d337
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	syzbot+37b56485bbbf90ad8489@syzkaller.appspotmail.com,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v3 1/5] bpf: Reject key-less BTF for hash maps
Date: Mon, 31 Aug 2026 19:01:06 +0800
Message-ID: <20260831110314.150870-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831110314.150870-1-jiayuan.chen@linux.dev>
References: <20260831110314.150870-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_check_btf() allows a key-less BTF (btf_key_type_id == 0) only for
maps that have a ->map_check_btf callback, and leaves the actual
decision to that callback. Hash maps used to have no ->map_check_btf,
so a key-less BTF was rejected outright.

That changed when htab and rhtab gained a ->map_check_btf to register a
dtor - htab in commit 1df97a7453ee ("bpf: Register dtor for freeing
special fields") and rhtab in commit 6905f8601298 ("bpf: Allow special
fields in resizable hashtab"). Neither looks at the key, so a key-less
hash map now passes map_check_btf() and gets created. Reading it back
through bpffs feeds the key type_id 0 into btf_type_seq_show();
btf_type_by_id() returns the void type, kind_ops[BTF_KIND_UNKN] is NULL,
and btf_type_show() dereferences it:

KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
RIP: 0010:btf_type_show+0x223/0x2e0 kernel/bpf/btf.c:8232
Call Trace:
 <TASK>
 btf_type_seq_show_flags+0xca/0x120 kernel/bpf/btf.c:8250
 htab_map_seq_show_elem+0x12e/0x350 kernel/bpf/hashtab.c:1669
 map_seq_show+0x13d/0x1e0 kernel/bpf/inode.c:293
 seq_read_iter+0x93f/0x1270 fs/seq_file.c:196
 seq_read+0x344/0x4d0 fs/seq_file.c:163
 vfs_read+0x1e4/0xb40 fs/read_write.c:572
 __x64_sys_pread64+0x1eb/0x250 fs/read_write.c:769
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
 </TASK>

Reject a key-less BTF in htab_map_check_btf() and rhtab_map_check_btf(),
restoring the previous behavior.

Fixes: 1df97a7453ee ("bpf: Register dtor for freeing special fields")
Fixes: 6905f8601298 ("bpf: Allow special fields in resizable hashtab")
Reported-by: syzbot+37b56485bbbf90ad8489@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6a8f4e88.27659fcc.2ceef7.0008.GAE@google.com/T/
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 kernel/bpf/hashtab.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index d40cb5dd446c..43123424183c 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -530,6 +530,10 @@ static int htab_map_check_btf(struct bpf_map *map, const struct btf *btf,
 {
 	struct bpf_htab *htab = container_of(map, struct bpf_htab, map);
 
+	/* Hash maps have no use for a key-less BTF. */
+	if (btf_type_is_void(key_type))
+		return -EINVAL;
+
 	if (htab_is_prealloc(htab))
 		return 0;
 	/*
@@ -3110,6 +3114,10 @@ static int rhtab_map_check_btf(struct bpf_map *map, const struct btf *btf,
 {
 	struct bpf_rhtab *rhtab = container_of(map, struct bpf_rhtab, map);
 
+	/* Hash maps have no use for a key-less BTF. */
+	if (btf_type_is_void(key_type))
+		return -EINVAL;
+
 	return bpf_ma_set_dtor(map, &rhtab->ma, rhtab_mem_dtor);
 }
 
-- 
2.43.0

