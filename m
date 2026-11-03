Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719090;
	b=C7zdBopV8ieor3+V0kp9EdlhftDMHmLhyRWymj20b+FV0K7lWeSaTGFdKtSAfzTYcZml
	 HDW7qsqky3qa6z6WsskMaJHDYRw3zwYF9KWrmFVPKFeR5ggcjo/UiyBVx6BboHxe7UD2W
	 CZRjJy2Le9gC2CgsQXne/JfSwul0+gLYajsq7pH3l2dMJxqApGo8mKTwOXZXWPj/H124y
	 R4llM5W613UeysKVRSSQ6P2PYcwSjtM5piwJGpkRGG/Y0LbODuXXk0QKetQjyLCalt2ls
	 p9CM9+KZhW/IfSORFV92stQLOoHkRpRGycMn40Zt7b9l61mqekZz7QbW7P8yGeX0Htw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=qMbUoE7myG/GAn/bAOasbXOTltQ3YhdGAnoaT+YPoYA=;
	b=InYQKIwOckaVNHNDhgkNlTU8bLw+WBBwCRw/RjG73LqNBN7yxzkTrx53CeWocpjAbTM4
	 huVymEAYUQhrS3gJmIfboW732fnb1pMp/oCHvGVSZvxjFalKj29rjC2IrqiTk7IBpzVdD
	 G7AJ+N8QK6hEApia7zFx4btQeYJhwDADKYP7pwtziY7s6WCdEffQ6+g0jHai6ybACZlj+
	 HLQw3eWAlGShhd9zQ0saLeYPVG4XqgxpQWvUwol9qCE5KQ1eTZsHBQ4axPgZZ80g15+ts
	 QbGsOvuQ79yaFDMrli+KLWOL30iruQSTQhaQLToykD7aED+nM4HjqcuD4k3MAddLL9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="p/kCuN20";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA74606D2C8
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 15:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA74606D2C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=p/kCuN20
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso447139a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719090; x=1794323890; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qMbUoE7myG/GAn/bAOasbXOTltQ3YhdGAnoaT+YPoYA=;
        b=p/kCuN20gyAkrSvljj3hdsphluitU8f5J8am+KboA8ZLs9tHk1gPwvR8KdkfAMjdm7
         10OwgpsxuZ5weZnwdFdepjEmZYfJ3mDeoPWjZWPSTjQ9u2KNp5OTXv+A8t6bfArOeZRp
         fp+8CF4kYPuQhEUcrVqcHLikxSKgicQY+GkUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719090; x=1794323890;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMbUoE7myG/GAn/bAOasbXOTltQ3YhdGAnoaT+YPoYA=;
        b=boOEA1I/MfmSZJnGaZrxXcVkvUIpWvAh8BgC16WX2elPNuooORY1dW6cHRgGFQXG6s
         pl5D4YzvE7elhcmPSmBwM9C9WBA1e/yOHa0KXgY/ng4yJTExX+c1ejKLAGN0jIvTKDLe
         A7nsTstU9/lNrFa/1VJEN7uOwMnQ6N4t+irjoV6YkfbPTw4g8CyngWIznIXrkxiXojQG
         FwG1hS9m17E1b4r8wNVxdEjY0oa6qx6mWArZ6bGGq0NzYTufyP94Rguq2htlpPm9QaVZ
         51DBk0hmWpPESSY5gvq82ahoDU+NeLze64oORaxW9zQTiDbtihMMyIVXfS2JT3y4JSBO
         d5Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzMkF5e4LBgYzUnCV3W9lgBEXveUmq9SBcnZkwrZuA+KKai697sMeBathlJItKF8Ap2bZony9LODvXqDRs1raw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zoGWWOD3lvUZTn0BnaqnxVxXsFqHghJcX2QbSSq77c+bk/Bhd
	qkbs/7HCXil6cv3PVJABVlSZjcA9RiYNbXh3BO02om2T8+pMS7pUALoc8pjwm93j5D8=
X-Gm-Gg: AYBFou3MUN8vyI/bdBXPUxKI0VzJ3uCP9kaY2oNVMa1b1vLwIup5D+Wgt+e6iCwfsuT
	8t9f0Arp5C5SxEARIXm2KA9vai8N8BM7o7XLbiDaHRucekK+Ew6e37TPX5sUKZLBr5WG/NCBUS6
	B/AmttF80tUprkldm1VVo9mSkMgVvLV9cSRHT3wf+agJNa+fNGL6H4CDwymKM62Kg8erHf9Qrrw
	x4hJnPCLS/EhWm1hhui723LJk1HQ3ZT5J9CjUPMkmynIbgOPh8L2kJ7A66YJjp6/IJAcIPmxPhR
	ZSph9742H2WEbcRITNWnBA7emO5uADsnJX1ykcIr3ZRvuyzU8F6r/3D7UquOsd5J7CHL/Pcv4cy
	9ShQiwzN/1TvPOunFrEpDp8KgyP95T9htfx9iGP4Z6GLT+bY53jvPn1lapPvGlmpxCGFk4Mwksu
	tnb2cDSmCQFTdiFQ08IEYkz6m4rjjQhUwt8O/cKGGeVPFq+A383QnF2x7i9+a56o+vSBYXsHIZn
	rPCXvZtCI+7el7P/UWOvXH1WcUdrPSsLt/vH+iEhVcMwXQqSW9ZjDb6vJ7ghxII0XvKyCNIzJOr
	gb88HDI87omG/uCAuTSgMXid+WgOFtM93Hv98SAtXpHDtme5rjKofPy+iziHvbkQepRES2rkQkf
	RAoLNiK73kZRnJZb9VU+mOe5ZXvElOvdMRCuNxUBXmYJWa1MPFq+ngYcAblUrZJiKWqbKqs8N
X-Received: by 2002:a17:90b:3ec7:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ae896d7a1cmr6969572a91.15.1793719089722;
        Tue, 03 Nov 2026 07:18:09 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm4842349a91.12.2026.11.03.07.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:07 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:04 +0800
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
Subject: [PATCH v2 2/8] selftests/mm: Skip sysmap_is_sealed when system
 mappings aren't sealed
Message-ID: <6b11e9f77d8ede7ef2f16fef173970a7fa1978e5.1793718940.git.chris@chrisdown.name>
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

Now that sysmap_is_sealed runs with the other mm tests, it also runs on
kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS, where it fails.
Userspace can't tell whether the option is enabled, but a sealed [vdso]
in a new process means that it is.

So let's use [vdso] as the reference: skip if it isn't sealed, and
otherwise expect the other system mappings to be sealed too, and [stack]
not to be.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/run_vmtests.sh     |  7 +++++-
 tools/testing/selftests/mm/sysmap_is_sealed.c | 22 +++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c          |  5 +++++
 tools/testing/selftests/mm/vm_util.h          |  1 +
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 573da5006268..1134a2e82610 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -307,7 +307,12 @@ fi
 
 CATEGORY="mmap" run_test ./map_populate
 CATEGORY="mmap" run_test ./droppable
-CATEGORY="mmap" run_test ./sysmap_is_sealed
+if gzip -dcfq /proc/config.gz "/boot/config-$(uname -r)" 2>/dev/null |
+		grep -q "^CONFIG_MSEAL_SYSTEM_MAPPINGS=y"; then
+	CATEGORY="mmap" run_test ./sysmap_is_sealed
+else
+	CATEGORY="mmap" run_test ./sysmap_is_sealed -T expect_sealed
+fi
 
 CATEGORY="mlock" run_test ./mlock-random-test
 
diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index cb0ca6ed7ebe..d5ab2b0d8ca7 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -10,9 +10,11 @@
 #include <unistd.h>
 #include <string.h>
 #include <stdbool.h>
+#include <sys/auxv.h>
 
 #include "kselftest.h"
 #include "kselftest_harness.h"
+#include "vm_util.h"
 
 #define VMFLAGS "VmFlags:"
 #define MSEAL_FLAGS "sl"
@@ -46,6 +48,23 @@ bool mapping_is_sealed(char *name, FILE *maps)
 	return false;
 }
 
+static bool sysmaps_sealed(void)
+{
+	void *vdso = (void *)getauxval(AT_SYSINFO_EHDR);
+
+	return vdso && check_vmflag_sealed(vdso);
+}
+
+/*
+ * Kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS don't seal system
+ * mappings either, so check_sealed skips if they aren't sealed. This fails
+ * instead, so run_vmtests.sh only runs it when that's set.
+ */
+TEST(expect_sealed)
+{
+	EXPECT_TRUE(sysmaps_sealed());
+}
+
 FIXTURE(basic) {
 	FILE *maps;
 };
@@ -107,6 +126,9 @@ FIXTURE_VARIANT_ADD(basic, stack) {
 
 TEST_F(basic, check_sealed)
 {
+	if (!sysmaps_sealed())
+		SKIP(return, "system mappings are not sealed");
+
 	if (!has_mapping(variant->name, self->maps)) {
 		SKIP(return, "could not find the mapping, %s",
 			variant->name);
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 8ef226107d78..6732f76b7e61 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -785,6 +785,11 @@ bool check_vmflag_guard(void *addr)
 	return check_vmflag(addr, "gu");
 }
 
+bool check_vmflag_sealed(void *addr)
+{
+	return check_vmflag(addr, "sl");
+}
+
 bool softdirty_supported(void)
 {
 	char *addr;
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index d32cb79d9905..0e94793b0d21 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -117,6 +117,7 @@ int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 bool check_vmflag_io(void *addr);
 bool check_vmflag_pfnmap(void *addr);
 bool check_vmflag_guard(void *addr);
+bool check_vmflag_sealed(void *addr);
 int open_procmap(pid_t pid, struct procmap_fd *procmap_out);
 int query_procmap(struct procmap_fd *procmap);
 bool find_vma_procmap(struct procmap_fd *procmap, void *address);
-- 
2.54.0

