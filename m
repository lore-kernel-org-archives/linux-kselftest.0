Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734D7485CFB
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670317; cv=none; b=Nl1AopAEDZHC6eRz8NYx1wwsoBbGZQNPzpCx5nAqPjqMUeMZPmppEuiZpVeNmO+FO3xrrOvCSvceDna99u2VHeUDtRwBKdPt8dijxnvoJjxeein5OazIJr5ek3ncuKWsAMGP7GZobIGpOC81rVi1WoSiQbeEr71yXDOPWkMr48M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670317; c=relaxed/simple;
	bh=ArBbAiSJotIb8hE7Pfi2XmR5kO5/NegQVH+7ACq+8bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JmLB9amaMCRpWfzieyQEXb8Mp3VntttdAP5m05LVf1bNgMmwvO48ER4NcQyjgGRpkB3MFqvvLYbZON221Pae6ldG64rEVsuURiOWz7AaWI1u3hlTdOFCrqqNo4nqg7flkEoMnEvLcwcKRLE2u4NI/8IPE6Tgtv0BM0kAYc6U1f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Gqv3XvRI; arc=none smtp.client-ip=91.218.175.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Gqv3XvRI"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ArBbAiSJotIb8hE7Pfi2XmR5kO5/NegQVH+7ACq+8bs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787670313; v=1; x=1788275113;
 b=Gqv3XvRIUxCN0OSp01ZBZD3UPwHMj+FL3EdAhoochgO3/bC2+32MXlu15UsIqQtdAjLwmSq5
 GkgbE+8xuPQTA2Xp5LzvKON5/ihJHEusZK+hLzM7tEjip6YdMHtI3MGC/Az42HxcfQJkw8Uy9Yq
 /SPHVoPiXh4xyWkfpbDw8IQo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost.localdomain (147.136.157.2)
	by smtp.migadu.com with ESMTPS id 8af23868c579f1e7;
	Tue, 25 Aug 2026 15:05:00 +0000
X-Mizu-Trace-ID: 8af23868c579f1e7
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	jolsa@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jiawei Zhao <phoenix500526@163.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v2 1/2] libbpf: Fix usdt attach failure when nop10 crosses page boundary
Date: Tue, 25 Aug 2026 23:04:33 +0800
Message-ID: <20260825150444.31603-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel refuses to attach to a nop10 that crosses a page boundary,
since it can't be atomically rewritten:

	/* can_optimize(), arch/x86/kernel/uprobes.c */
	/* We can't do cross page atomic writes yet. */
	return PAGE_SIZE - (vaddr & ~PAGE_MASK) >= OPT_INSN_SIZE;

Whether the nop10 crosses a page is purely up to the binary layout, so
this does happen in practice. libbpf doesn't check for it and blindly
shifts the uprobe onto the nop10, and the attach then fails with
-ENOTSUPP. Just keep the uprobe on the preceding 1-byte nop in that
case, it works everywhere as a regular int3 uprobe.

Fixes: ee2862439e5c ("libbpf: Change has_nop_combo to work on top of nop10")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

---
v1 -> v2: move check into has_nop_combo.
v1: https://lore.kernel.org/bpf/20260824092847.361683-1-jiayuan.chen@linux.dev/
---
 tools/lib/bpf/usdt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
index 2e56e3ab5b6c..ee9d1b614883 100644
--- a/tools/lib/bpf/usdt.c
+++ b/tools/lib/bpf/usdt.c
@@ -608,8 +608,12 @@ static bool has_nop_combo(int fd, long off)
 	unsigned char nop_combo[11] = {
 		0x90, 0x66, 0x2e, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00,
 	};
+	long page_sz = getpagesize();
 	unsigned char buf[11];
 
+	/* the kernel can't attach to a nop10 that crosses a page boundary */
+	if ((off + 1) % page_sz + 10 > page_sz)
+		return false;
 	if (pread(fd, buf, 11, off) != 11)
 		return false;
 	return memcmp(buf, nop_combo, 11) == 0;
-- 
2.43.0

