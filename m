Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719155;
	b=OSqGek1AmMgCpeUpWnQRUNS69jtgzubZAjyZ+fL4LVF5lDhWvB9cbHjXvU/R2FaymNhP
	 WAWMQJbTu8anSuc8soxBIYC8+Iq5Cup8rF9q7HT5ODf9wrQlDdUn/Mk6jXP1hOKJBIHrB
	 rQ0vEXXLx0mbJyi5o8RfR2OAUCptgu0AmhjNa+ZRvm7UYAaabiQfbsIUWECkIu3dnl8ha
	 5FwJBhCW+7xtdGQvFfPeKVGxpDrG+b+zyFxIubfDAfIZ0SX4VriGtIgzOMzaUp1rP0/Fg
	 GlJ1vopIIQ7tbPvcfz9bTntDVXlkC3GFhK5wQOgIWTuMJmcgwQaKt+h2Z/Xu/BpwhYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
	b=lWF3X0P5yKPe5TUaUcXl1UWGaI1ZVmeFz7ncj/XDrXY7QIejx6TaBjYVIV+I3unUcNmZ
	 2+NT3dNW0y+88PmVfAdVVHKpjNifEUAqrLy2xRarGio6bcqic9Nv0fAh7w3Nvf5RNErSx
	 2ITuMA0olJOPnA28AfgPjYkgRfkh1/bRxPHZ71rsIVx8JX2twbSsdM9Y7XPh8LeMPBc+K
	 eavC6Mi2GIgqpuUNsEF3yNKS6BHoGSsTewrxxqImKm9kb3fAHVS0855eCQfWsYE5gjxrX
	 IhIqOcwykCrOYdbhogGjCwNcUbDF9dTF90eMXpYMVWQn0WyeZ7u51CT9H6uOCm9T6vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=HiZKqjod;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D460A5BE8
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 15:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1D460A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=HiZKqjod
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5378b281aso25420255ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719155; x=1794323955; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
        b=HiZKqjodmC+QQmLAeaRDa6IAzpCvNu0e/O+ZxnDhxZcqbtzhfsFirRaImXsTbNtcHc
         kZnISC5LjTgyAMGkaIBpkPEgBVilEidh2y0Jo0Uw2J2JKg+dkQ20GsYD/n1Qq+ZJyvAP
         S9mhCv9d2fjHoV5vo3CMXEefki+aKbj9UEvwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719155; x=1794323955;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
        b=oMGvPUYfBAFSednrWGurtNBqBA50F89MdHLtHIFXtJmUQeCpRuyptUKks3iKyJlRH8
         ZBtyQnEGKVMWQs6Aj8kkyM7D0q++f/RBmTLQ2H7Ly6XlnMWXzHDzx8wiW6JjJ/kceS/N
         dci+9jQNnWW/idZt7+3kI7zHK5KzUHkqp5diPVxFB61c2z4nqLTLp8PSRVd3NDzdrnA7
         m3aHd1jEKNLE6Ben5sV6duX3WuCfgIa/45sr0tEHhMfXKrtRsyZyVBfA6iZ9GF15B/Oi
         17CUTWyzVVlTL654bL9UHsl9vuNx9ub08wuw1htAIwGKktr5hXDyLihQqeBxKUmrT/Vc
         aJaA==
X-Forwarded-Encrypted: i=1; AKwUvBzSD02nqDY0d4LIYwgjgxQ61FTbGEglNcRgOz8KejenZ0a3Kg8WYpy8NW34bwp8sgIcctJyxBzW6XMWsujjW2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z86xYTTikrthXIkgtfc6DPuouLhia8ST/8xpBNtpAZleAxosZGV
	JF9+3KJGwqxuWqjpkJvJ3/FhyTPc996SzaN2S4nmFM5tWTM89W8HVOG4tDDXnQfXvOY=
X-Gm-Gg: AYBFou1yl0J7mVJY9q79R+NpL58m+U9HP8OU9t3AATTKMpR5KOfpp8RyzU7MDpsqf8g
	2de7B1sTmINUP5wxJodw4e5aaYOCNe8VikoNDjlj5pVajVPhaSDc0/vpSiJUttA9Gt+wI5n3JJB
	vbJ8xxHI4bnKDNbKVNgcRLBnaXYiDAWz/tOE/PDIOG8FWH1tDOwfX7V2uzyhfDc0jlc/wAzDrT8
	c+KgomcbuKdihpbZtWCF5SELxZNEIHjJpiNPXEc6AJq78QbGDnpzvtk6S82cnWjVtTUSNAd8pzl
	DsxD9Uc/MfLdA7UwpN6KISqWZYR5TL78lLgZ7hmChQaIuymXAhqdA3umkG+ifOiR/u4R62XRaHe
	e+AqstB68ZqGQu3NnHTHDhF8HIA3n08VnVGXSt+EoJG6Wqo+QC603SPK+yFQxYGeinIiZ3gKvSZ
	TjASnvSSIiCnip1FKu6vSGFP2hUhSIEos03Vz3LyWOsC+2FNJ5aeyQliU+xALr59SXbUJcWmGfJ
	spL6Bg5aEoPoLpms0LMpk3xQ8oMU9Zmh9CedOz6zPgLPowmkVUyX3ACGajeh9YVHCF3AJDZaZE2
	T4ZBn6JYn1/59z51VTf8ichYt9Oa4kUQBTsi0Dk9l7WFPGBe/NjjywzawjVQ0PMJupIzz6B2+jj
	1FlzVRrrPYCosQucU3AgwB4Zu8JEKuft5PyyOwOY4x/Rv4nEYOKSACiILb/TJupWe6kdjGfZe
X-Received: by 2002:a17:903:1b2d:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2eb36414d03mr125058495ad.7.1793719154563;
        Tue, 03 Nov 2026 07:19:14 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm42885535ad.32.2026.11.03.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:19:13 -0800 (PST)
Date: Tue, 3 Nov 2026 23:19:10 +0800
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
Subject: [PATCH v2 8/8] selftests/mm: Check that no_mseal_sys_mappings
 unseals system mappings
Message-ID: <053ef1ff0a6a7e5b37109d59a064a7665e087cb0.1793718940.git.chris@chrisdown.name>
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

Booting with no_mseal_sys_mappings currently makes check_sealed skip and
expect_sealed fail, so nothing checks that the parameter actually turns
sealing off.

So let's check /proc/cmdline for it, and when it's there, expect [vdso]
and the other system mappings to be unsealed rather than skipping or
failing. The vdso tests already expect munmap(), mremap() and mprotect()
to succeed when [vdso] isn't sealed, so that covers what the parameter
allows as well.

Suggested-by: Jeff Xu <jeffxu@google.com>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/sysmap_is_sealed.c | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index bfa140e01d8a..158e116ca3b4 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -56,6 +56,21 @@ static bool sysmaps_sealed(void)
 	return vdso && check_vmflag_sealed(vdso);
 }
 
+static bool sysmaps_disabled(void)
+{
+	char cmdline[4096];
+	bool disabled = false;
+	FILE *f;
+
+	f = fopen("/proc/cmdline", "r");
+	if (!f)
+		return false;
+	if (fgets(cmdline, sizeof(cmdline), f))
+		disabled = strstr(cmdline, "no_mseal_sys_mappings");
+	fclose(f);
+	return disabled;
+}
+
 /*
  * Kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS don't seal system
  * mappings either, so check_sealed skips if they aren't sealed. This fails
@@ -63,7 +78,7 @@ static bool sysmaps_sealed(void)
  */
 TEST(expect_sealed)
 {
-	EXPECT_TRUE(sysmaps_sealed());
+	EXPECT_EQ(!sysmaps_disabled(), sysmaps_sealed());
 }
 
 FIXTURE(basic) {
@@ -127,7 +142,9 @@ FIXTURE_VARIANT_ADD(basic, stack) {
 
 TEST_F(basic, check_sealed)
 {
-	if (!sysmaps_sealed())
+	bool disabled = sysmaps_disabled();
+
+	if (!disabled && !sysmaps_sealed())
 		SKIP(return, "system mappings are not sealed");
 
 	if (!has_mapping(variant->name, self->maps)) {
@@ -135,8 +152,8 @@ TEST_F(basic, check_sealed)
 			variant->name);
 	}
 
-	EXPECT_EQ(variant->sealed,
-		mapping_is_sealed(variant->name, self->maps));
+	EXPECT_EQ(variant->sealed && !disabled,
+		  mapping_is_sealed(variant->name, self->maps));
 };
 
 static void *find_vdso(struct procmap_fd *procmap, size_t *size)
-- 
2.54.0

