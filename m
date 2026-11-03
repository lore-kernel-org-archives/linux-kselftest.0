Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719099;
	b=wtlgah+pkNUid5ta93PIMi0+v13MEUCGZpWOZwHYp4Bxcm30Gq0RzY3ZYi45Q1zgwqAs
	 ziscJbz8UG11deAJpdNQUpasl6xqW+F0Q+pX/JkbKFHLf/d9F9gHGVtHs8YPicyFVNgFg
	 PYVypRanM+hvQh8Q9utpxiS4tgbDPJ7iaQuSAbj/mClQXCMwEDsgXWuWOiPwJV3A0phqD
	 TeR3hCQkQV6+m5ctmz4S/GIrp7Ggs7Vq5G+h5xg1HnvD/Qohk5XdI6FqrBn9Y9kZ0KE5U
	 ofiLTrV3XMgPzU8eVfSV0sNY7PJUp1fWZKA5Z5AIpuHBwoxkn5HhyplIW/moLhIAg9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
	b=zT6dXg9UcGWpitHb5YRgfMe4rYaNowLe8O3MC3Tckb7BrNPKu2GqSX79cNoNm0IkrUBf
	 HcKplrowjZKdhGveGqT+eSoR27flLmaF1Q54tH/2x1NSt9u2m0ZKkTBIk/TkP+lcppOr0
	 gIXbRx+AwjkdNXp85y0XnduOq71k5CoV0QReftzXCpzlVMLPn+37WKWHPwyXWs2lvYLcn
	 khIguecYFhbkFcYK+P5q1ib7OL/tVohXOX8CirISj6ehN8T/7rRTy1cmwp66ORN8f+ezj
	 lFzG3OoRpzG7E9MAYSOKpxzfMvPzOjZfFsNgYeQS2VjblW6MyujmxowURkAZO6e0iaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="tCY4G/fN";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63021606B244
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 15:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63021606B244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tCY4G/fN
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso832444c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 07:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719099; x=1794323899; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
        b=tCY4G/fNKBPrNKIJMDAH4z60NE/6pvSHmz4YmXDN0B+/w6hLIH+uOPL6uZQwDSAFSi
         ji5fqoupBeQyhW7F/5/GHEGCbg4c/RCf1hH9/0dzPW58fBu3Nk4SPtkya9OT2xuJFrpb
         37JHo51VgUcAiAINY6PXRFxnWqavoDo63iMKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719099; x=1794323899;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
        b=b3WuSPL9Iu77FmWTQd1D/b96nhw6yHebrVBQIrXKiZudUNKCexPGZU9fJcDpwbrSsh
         JBVBGuJMjACpU6PiU1UjxM0Cc+x6QQorDOx+ldtLGcVZt2o9cEXy3KXKRhHoP6c5hqKf
         6omvBDCYrK+u6I6F6tumVkNEVLiRltBYhCJIjDVO6bmZypofYRkwb8pZlUaElYI50MUT
         KPkhHPSTtfMgzkI4jsEq4inYUOlmwAEzBcqQIPddEnrNA7EqG+6Elwyi5Pp3kOIbyzOh
         BZT/JNtL86BEZiUglikhGlTl94mBpYZgMsTkStzDwVzziU3x8nvG6Luc9QB7xTGKfs+O
         LLOQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4A1y9QL908POYfi5UQrfmlXU4OVEN3+PZzA3ny8+5S8B93aF8MzpblJnO3xVoDFtS8uuOVFybdVVLO1d+mAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AME0Fy083eC7ZX5q3FyudHH0LaFQ7PwxsVoDcORFd9Pwk2lCe
	dUpW4x74gRyyizeatJy8Uohtzt6iWqOoDetQzyLs4H33aC0kAsG56qhy7z9xKDSaKcQ=
X-Gm-Gg: AYBFou0sKQZmOczHJ3br4N0gQJ9wMYBPUX4uk7Szu30bgrRisLVW2LLLLRz8yPCvTe8
	YfQmf5WGYcBK+2XXMX3m4/IUyeJmltXK7cvcswaUAkyG80uJcoO/iTp4px4D50i0DQHQJrSTHj2
	8YMr/UZnR7Wcn0XFJ4J2SFfSVuds/dCkPIfQbQsHMnoOrZVIyycyo9BtYiwg3FncsAkkKEs5HRn
	0JrU7cKZr/hpucD6A6wKFPFXvtf/r/kUevPolRxqAVpuBlZzU8Ye6eSk2vv3WECQ3bIO1U4e9VX
	vVrG0QildhKtjBMDBrvMBlYHl7HpF50359TEpW2zybnZYHGhwqEar31hA4GMa/P1azh8D/0LGMd
	4dktBsZkOSJ9lx0EA2BnJFA6yf6BKvL40eRNikK9SjakSaVD2mSzGHB4SdSSr0Nin/lJEg2R3j1
	16pVolC06gZ05tpiESsFNC2kIEN1cRxUxgZMK/iE0VarGlNyJYYkdUE9Nm/RAi/iZ0vsIFoSUa7
	tXQRZKYrkAdIc36osuwoLG/Hut4G8XpYLAJk8UncOeCFTdaWdCXBjz+GNXDTUUJH/axyISX07wY
	uFGYiVVgzdl60NwUu+0pr9NxLgtwZN9wbNFLncFxkOF0FFjneFir4ok4j4QyHsQRdbxUY2G1JES
	IrEHZkQL71Yj1ME4hEFmSDJMIEwyalCbpE6KY0qsn47Oi1LuSffepfOFzicDP3uk0ns5prl08gS
	22m430lPpwp52DDwt8Yg==
X-Received: by 2002:a05:7022:b903:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1ac5ac4f0aemr16822717c88.12.1793719098430;
        Tue, 03 Nov 2026 07:18:18 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm42657488c88.14.2026.11.03.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:17 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:15 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 3/8] selftests/mm: Test that the seal on system mappings
 is enforced
Message-ID: <cff8df45bfedfe7dbd3aca9416923c27be2a4a3e.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

sysmap_is_sealed checks that system mappings are marked as sealed in
smaps, but not that the seal is actually enforced. The rest of this
series changes how system mappings get sealed, so let's make sure that
is covered first.

Add tests that munmap(), mremap() and mprotect() of [vdso] fail with
EPERM when it's sealed, and succeed when it isn't.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/sysmap_is_sealed.c | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index d5ab2b0d8ca7..bfa140e01d8a 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -11,6 +11,7 @@
 #include <string.h>
 #include <stdbool.h>
 #include <sys/auxv.h>
+#include <sys/mman.h>
 
 #include "kselftest.h"
 #include "kselftest_harness.h"
@@ -138,4 +139,104 @@ TEST_F(basic, check_sealed)
 		mapping_is_sealed(variant->name, self->maps));
 };
 
+static void *find_vdso(struct procmap_fd *procmap, size_t *size)
+{
+	void *vdso = (void *)getauxval(AT_SYSINFO_EHDR);
+
+	if (!vdso || !find_vma_procmap(procmap, vdso))
+		return NULL;
+	*size = procmap->query.vma_end - procmap->query.vma_start;
+	return (void *)(uintptr_t)procmap->query.vma_start;
+}
+
+/*
+ * When [vdso] isn't sealed, these leave libc with a vDSO which it can't use,
+ * which is fine since each test runs in its own child. Skip if AT_SYSINFO
+ * is set, since libc may also use the vDSO for syscalls.
+ */
+TEST(vdso_munmap)
+{
+	struct procmap_fd procmap;
+	bool sealed;
+	size_t size;
+	void *vdso;
+	int ret;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	ret = munmap(vdso, size);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	EXPECT_EQ(sealed, find_vma_procmap(&procmap, vdso));
+	close_procmap(&procmap);
+}
+
+TEST(vdso_mremap)
+{
+	struct procmap_fd procmap;
+	void *vdso, *dst, *ret;
+	bool sealed;
+	size_t size;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	dst = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, dst);
+
+	ret = mremap(vdso, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, dst);
+	if (sealed) {
+		EXPECT_EQ(MAP_FAILED, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(dst, ret);
+	}
+	EXPECT_EQ(sealed, find_vma_procmap(&procmap, vdso));
+	close_procmap(&procmap);
+}
+
+TEST(vdso_mprotect)
+{
+	struct procmap_fd procmap;
+	bool sealed;
+	size_t size;
+	void *vdso;
+	int ret;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	ret = mprotect(vdso, size, PROT_READ | PROT_WRITE);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	ASSERT_TRUE(find_vma_procmap(&procmap, vdso));
+	EXPECT_EQ(sealed,
+		  !(procmap.query.vma_flags & PROCMAP_QUERY_VMA_WRITABLE));
+	close_procmap(&procmap);
+}
+
 TEST_HARNESS_MAIN
-- 
2.54.0

