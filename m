Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719108;
	b=QmZb0GsE2KF8du+faZCgTFETqm/9HaZV3Dx4VdVZZsVdyKLMdXMXee/sV+HGZFYg3bev
	 SpeDY2m0mwS9hwrwislEbN/oNUdH3iI8bNxvRJDjXWxSQU72Iat4VH+6LG8G0CMSfI7lg
	 +CwhfaPKrtrWYfhsXvhd7moERW+vkDZD57KDdfpJ16f6LpsRGORir/wDlMg8l6xXv+YBV
	 +oxRulB6OJQMIFzUU+UhdwvG1mPiT4Gr8og7dHgNjRnzovgNikI4K9SOIN9HZNB/nwpun
	 X5GLDVAVCe8HIfuioat/INFbjh0I4o9hD1HIdltreTRvXmPrcjLoi6wBOANvL8yiQIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
	b=I3E3X/37b9ppN4EdHZGrsdrzGc0XyjdC7T/vn/TpPxWb6sOyV+hYMThKdCi8lw+3TErB
	 QkscLA40p0ZrFEzcmwOLIQP+K0Gur+yL1uoWIA+Rgoge1VWThz3rKvYzo6XIJAZQYKeM1
	 hNrbkIu42GOXCbWK/pP84IIIz7f/liieoX5Zhg5Z9qN9BB/XG22fK3gJ6MoScPubxMgX1
	 h3URnyjguz6MbzG5Mku5+DS8xVjYcA7FrdZHuzejiBb7BJMTcFT4B/cBCNH6OYIhvloCG
	 KVWcpvTPsfpezyzt2ORIJxT3aNZ07PeJ2mksunq/7JpMQx/gOAs76aWYRvAU98NSZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iJQAdWul;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB71606EE89
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 15:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB71606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iJQAdWul
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8b20a899fso29461765ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 07:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719107; x=1794323907; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
        b=iJQAdWul3W/CUJhIrS5dvX0eM6WuXTz1S48rZb7FrM5HAGY2k2eULG3UN7fMf2HesU
         BgcewLwYarj5CoCIUK0cf985AauuA6PTll3ljWMb/GhZikHr2S8DKVa6H7UHtVmQA1VC
         Y1mKhneDjNU802KN7Ay4+ex61G7mP1iOn6T9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719107; x=1794323907;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
        b=TNiYxMMRkeTAgOX/b+ffw18DTGCPJsq0tukatn32BytGXvAP8iEC60pwwHJlu48bXp
         EJYHkXxP20GlMpK170aIcZbAx9JRxbyeZ5lEXDKD6zAsXChKOb8nURSuyC4MiO3tfZtT
         7fp8hej4zhkv8Q4m6734mQO27IVGH+27jxML7PWSE/1jbobZ0Ub49gsRnlIlwN0jw0M3
         a7EUmoO5qT2wbRaHzz6qpsQA5kSdu0yeZSIPzu9LqjrgZ1F1/CK/Va+s4z/ISxL5naVO
         bqGViF+NGZvFd4E7DTwWPLjzlKGOY1Rr+9UXWG41BNwbqfWg76CNvAOqrhw9bOavmtaN
         4K/g==
X-Forwarded-Encrypted: i=1; AKwUvBz1CART/HlEcFBeH1I+Bne0IpCmzsgd1uCa/14ITBTqLjGLfAy2XUiyZGIzfrD2t/WSGWMxx9F8d7DZSqEgeBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RnFNg5LQe6i5NVZHmhfaC8jtJ2tbApRKcVStiT+jZkLre5bnA
	dJ2CfvvFkfLvrnKyyuLG9JGxUDzT8ZyYXKevvY4SubSpH04duK130aDn+PFabnhmL2A=
X-Gm-Gg: AYBFou3Nhz1AbdnbK/NjpUQu9spP29UDqGnicuHp3s7sj41UrDM2mR19vatzMnvQpVD
	XEfzCWau8PpKVraj3aDa5qFMjdySdD92m69PBTGv5qKCRF0RnqAeq5x4KF0JhwVBcrqVAZG2Q0h
	I+yOPGsqudyKcpgSD+Ma5vLejxSgbvaPzUo+oKfOVN1SKdDNTGy27Mb3t0U/z/Y0AufnMuvyB7m
	Rtx6j6yWdhiELoS3ZciSyYrV8eKCtl9U3Zc+QuYPy9l3BWD940JH9YyqS4lsyVE9vSVazqxAZbD
	ab/a0Ch0V1ARDSWjtQx59knEgttdkJ+ZyvpqE3+BCwzJoKvCq5gb/OEz6Vzc/k+ymJe84hy0z0W
	0xT0f7L1fs1y0Af5ewScyp49gR8KvkgHBYWp82gYTaNTy7P4IklxDHgWDyfJdSdIH5BX8NFyPn3
	C69fjJuCxRGp+stxpoccjzV2L/7VygYIIEJMFrd/JxBZz+5Sf1faadUYRNE4+ixnklOl38vd4Yq
	OUZyILxnWwWZF/A6VzD+M2ZhBjOv3l5BOAN1UDr07JZDfzOMZkaKvEIgLMOzJ1O5nogtnwhBe5s
	5/sE6XQwzIS+gTlXVSmomrkTnjXUCOEJg0N8TBWoW7RPfsA6qajw9/d6ELVl5ncqeTp8Dxpv1w1
	P8o2CLVEfLJSz4cjZosiNa/uZeB3hkh/EEHsusjR/2YQsQabFjx/WUDJhDdKSstT0SWsd2dPTIj
	2N/zfVLKmvMMpuX8Kpl5k=
X-Received: by 2002:a17:903:1aef:b0:2e2:f2f9:b1ef with SMTP id d9443c01a7336-2eb364bc076mr131151785ad.39.1793719107092;
        Tue, 03 Nov 2026 07:18:27 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392613bbsm43426035ad.37.2026.11.03.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:25 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:23 +0800
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
Subject: [PATCH v2 4/8] mm/mseal: Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig
Message-ID: <6d72b96fdd36c8870393d8d6e67a811a9bce9e4f.1793718940.git.chris@chrisdown.name>
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

MSEAL_SYSTEM_MAPPINGS is in security/Kconfig, but it's an mm feature,
it's implemented in mm, and changes to it need to go past mm.

Let's move it to mm/Kconfig, next to the other VMA features. No
functional change.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig       | 21 +++++++++++++++++++++
 security/Kconfig | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..40172787dfa7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1355,6 +1355,27 @@ config ANON_VMA_NAME
 	  area from being merged with adjacent virtual memory areas due to the
 	  difference in their name.
 
+config MSEAL_SYSTEM_MAPPINGS
+	bool "mseal system mappings"
+	depends on 64BIT
+	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
+	depends on !CHECKPOINT_RESTORE
+	help
+	  Apply mseal on system mappings.
+	  The system mappings includes vdso, vvar, vvar_vclock,
+	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
+
+	  A 64-bit kernel is required for the memory sealing feature.
+	  No specific hardware features from the CPU are needed.
+
+	  WARNING: This feature breaks programs which rely on relocating
+	  or unmapping system mappings. Known broken software at the time
+	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
+	  this config can't be enabled universally.
+
+	  For complete descriptions of memory sealing, please see
+	  Documentation/userspace-api/mseal.rst
+
 config HAVE_ARCH_USERFAULTFD_WP
 	bool
 	help
diff --git a/security/Kconfig b/security/Kconfig
index f7bf6cdc6229..1679e8d009c3 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -49,27 +49,6 @@ config PROC_MEM_NO_FORCE
 
 endchoice
 
-config MSEAL_SYSTEM_MAPPINGS
-	bool "mseal system mappings"
-	depends on 64BIT
-	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
-	depends on !CHECKPOINT_RESTORE
-	help
-	  Apply mseal on system mappings.
-	  The system mappings includes vdso, vvar, vvar_vclock,
-	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
-
-	  A 64-bit kernel is required for the memory sealing feature.
-	  No specific hardware features from the CPU are needed.
-
-	  WARNING: This feature breaks programs which rely on relocating
-	  or unmapping system mappings. Known broken software at the time
-	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
-	  this config can't be enabled universally.
-
-	  For complete descriptions of memory sealing, please see
-	  Documentation/userspace-api/mseal.rst
-
 config SECURITY
 	bool "Enable different security models"
 	depends on SYSFS
-- 
2.54.0

