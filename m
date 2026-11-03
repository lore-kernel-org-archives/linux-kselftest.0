Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719070;
	b=qJM0Ci4jOdYBqpHGRBUUMJQVQAlJCN/ksCMwQD+5tC1WCuz+D1wnvr3kF+LpMcpoe18p
	 JqsLIKhyXC0qAruY3IlzvZnh3VSY6ee/XfS/HU/GRU/Qy2fkjEhSKjiX25CpoPo7PbZLw
	 Wy3kekoAVo8UcnSIkyhFwaB6W7IYOkm5EbUsD+EAVhx9igDRZc0OcnaIxnX8jfDB5duTj
	 Vf69A4s/4vpBmcOkdnj6KdrRwhudhmapkmY1KIHwGOWjGjV121Lugz1xW6DQ/7I6m1Fg+
	 kZpXF1bkWjHXJuBGV+IyubsoCLulYHUqxEcrboNEb+jITqkwv/7UBsRuMYvbaqTfwvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=Kv57rrW9AR5Uyx8+S36d+hVUEIxbqmnbUnmaj9pRDPc=;
	b=p0yF3/5bvfjjasNf8brj8/mu41psnWJnpC5PAEKgKaaXwRdue9xvfYRDqkH/yEbFrVzR
	 7N0iJc7I2VUL4tNBaedji+4ObQpLgoC7iSjeu3zVD46S1sJgd4lYikJTrleNVlILSPRtE
	 ot9YtXl77J1tI27YRtN0IaqVAxIwvkKYH7smFbm3J09cmnxWmtyKzBFgglG9vlzjlfWue
	 HMSgGzeHSUBKI/Epd/W8GB9T5bU4Ma0mxHSRQdBT9WJiU58UMViSJsUudoIkZb7aPVaG2
	 rGjiTdLfDCu4yHDWknK+8Sy8qqJbT3o5I+Nq32TEySezt+o32y5mRt/AN8hrn21Fkbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UTWV8h2n;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67564606A796
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 15:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67564606A796
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UTWV8h2n
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2773456a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719069; x=1794323869; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kv57rrW9AR5Uyx8+S36d+hVUEIxbqmnbUnmaj9pRDPc=;
        b=UTWV8h2nFTZ0eInmgrs3DEF7YRTvpPFa3wXSTzrgbTJdxS8o6LX18nP95bFPdtGbel
         mhOBG2L0OGKLRHHR5Df5WGSB4ANOi/n6F8HnF4gGjy7OOMbjUQlof9V2g4MRUDoAwbYS
         /cttKPQyPKLAjztUy3DJqrlEkWxeSKvdMeTW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719069; x=1794323869;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kv57rrW9AR5Uyx8+S36d+hVUEIxbqmnbUnmaj9pRDPc=;
        b=OUP/V0dda9mpTh/0Y3G9eAfqzSEFdaCBzqzcEwbmzEIAHepDMOB3SYc5cucmHoSKUZ
         snQ29kOnoNTk96Ifri69I+ulupNqudo/1C1f2OrsySCRauhbwqzGWv2Ps5s1LN6okQmy
         T3DwgNa1VweBanfAX1FwZWl89p/jHjOYDNzSucdtgTdsi1yyNP/MYQjWA3TNoiGphJTJ
         +vUigENPqPm+qjCkgU8WvJ7d3H0fd2VHssXjm1mrkWD5NICtpe9dNIb9Y+pDuK48FpOu
         02xKK00nmMNwmJh9QW9vPUePEbmjgMOQUUiJG7XZJKR7QnKQFjrmQCDYQjGRVbt4CVg1
         jJcA==
X-Forwarded-Encrypted: i=1; AKwUvBw/bfwsKJk1he2qX3U9uzPlXPyQyMCOaTIQpbaGIiwYBy6KubCKvH9qI/+VmzqERpbkFSQGw6D0QCEHK1AyFCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4FW+thnmfwHoCqysG2ANMCu6Cf57eDfs2PViSKOqzEDxoJ20e
	RBPSLV+pDfla+CMIfJoLveP/hHlLmKfW5DbDHX7lYq73yfKKCBZxM/SCYXI5yb3MYT0=
X-Gm-Gg: AYBFou0ceDrSm0dWqry0oSPWm3VTDfk+neROAkTqmBEH/qmu/5i+Hvm7S+qjzfJFBam
	ya2tGnfb5LSbj3PtgKUBgUON1mNPDC9eeBPjW1rjQ37tkR/LXy5VHTbxRROLFlFB8j4vCxctPlw
	+1JazgZ4sKg5ZdnWnP1vY/T+GXM//5nNbIzBj63YHaD/2XhM2xYB+mf7aRqABChJwZR1lsGvuLq
	L18uzyrwLbDkFdlR3yQx8wL8Zg4B46kljc1JOs9SC7yczFvPZnxQ9bmfkvuIgVptAOSWNRqTl/u
	VLaDkwlxltVdlsgINfXXTqZ9MBl79uAuIFmI2KbdyMK2kU1RpjuffyT/QdO2FgsiJnKxqOxUWfm
	K7x7fjZcs+6idc3y8CAq0ecsnsjoWgidkWAlfkkh2qp6dlY1iCEEXGb9L7oIcRu+9GLl0apAjRD
	FNJ6NDDt21CmZrTW/GlT9B+Hy2abd5sDM9p9zWsh6LNrNAlTXNJMSwry0LHMGPUNSG7ib8YME9i
	VY1eONhYBxckmCNzjt4PiumIfP0UoQHZiH3xMBRMVR76sD7IST4sKzdeFCgGIFO61flEsAqzOMC
	HwNjSfhtd5dDNHdKOS3PkYRAnp9Z1jjonZGJdJuuQOqwUvDqnKbCc6VzpGhQtAKFrFuBxEgPlKa
	vDH8GftRgYBG2P+f8a84soI4UYY5HI7Q5nZqHgyvguzoCiw8W8CrFagHAPcMR0QpKySnvWLJuab
	oEKgHpCic0KFrV7PECkw==
X-Received: by 2002:a17:90b:3f84:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ae89776af6mr10813768a91.11.1793719068633;
        Tue, 03 Nov 2026 07:17:48 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c62984bsm4849760a91.9.2026.11.03.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:17:47 -0800 (PST)
Date: Tue, 3 Nov 2026 23:17:43 +0800
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
Subject: [PATCH v2 0/8] mseal sysmap: Choose system mapping sealing at boot
Message-ID: <cover.1793718940.git.chris@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

System mapping sealing is currently a build time choice. Hosts which
want it and hosts which need to move or unmap these mappings therefore
need separate kernels, which is not ideal. Let's allow the administrator
to choose at boot time.

v2:

- Skip destructive vDSO tests on unsealed 32-bit x86 mappings
- Move the sysmap tests into selftests/mm (Lorenzo)
- Use shared vm_util helpers in the sysmap tests (Lorenzo)
- Use PROCMAP_QUERY for the vDSO lookup (Lorenzo)
- Keep test changes in separate patches (Lorenzo)
- Put the enforcement tests before the kernel changes (Lorenzo)
- Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig (Lorenzo)
- Remove VM_SEALED_SYSMAP (Lorenzo)
- Seal mappings in __install_special_mapping() (Lorenzo)
- Leave a sealed uprobe trampoline mapped if optimisation fails
- Replace the boolean parameter with no_mseal_sys_mappings (Lorenzo)
- Drop MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON (Lorenzo)
- Drop the CHECKPOINT_RESTORE dependency (Lorenzo)
- Document the software which sealing breaks (Lorenzo)
- Keep Kconfig default-n regardless of CHECKPOINT_RESTORE (Andrei)
- Retain sealing by default when built in, with no_mseal_sys_mappings as
  the boot-time opt-out (Lorenzo)
- Explain the security rationale (Lorenzo)
- Describe the Meta/Reverie use case (Lorenzo)
- Skip general checks on unsealed kernels (Lorenzo)
- Add expect_sealed for strict CI checks (Jeff)
- Use the existing -T filter to exclude strict checks when needed (Jeff)
- Test that no_mseal_sys_mappings leaves mappings unsealed (Jeff)
- Add the vDSO mprotect() enforcement test (Jeff)

v1: https://lore.kernel.org/r/cover.1793094611.git.chris@chrisdown.name

Chris Down (8):
  selftests/mm: Move sysmap_is_sealed into mm
  selftests/mm: Skip sysmap_is_sealed when system mappings aren't sealed
  selftests/mm: Test that the seal on system mappings is enforced
  mm/mseal: Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig
  uprobes/x86: Leave sealed trampolines in place on optimisation failure
  mm/mseal: Seal system mappings in __install_special_mapping()
  mm/mseal: Add no_mseal_sys_mappings boot parameter
  selftests/mm: Check that no_mseal_sys_mappings unseals system mappings

 .../admin-guide/kernel-parameters.txt         |   7 +
 Documentation/userspace-api/mseal.rst         |  12 +-
 arch/arm64/kernel/vdso.c                      |   9 +-
 arch/loongarch/kernel/vdso.c                  |   3 +-
 arch/riscv/kernel/vdso.c                      |   2 +-
 arch/s390/kernel/vdso.c                       |   2 +-
 arch/x86/entry/vdso/vma.c                     |   5 +-
 arch/x86/kernel/uprobes.c                     |   2 +-
 include/linux/mm.h                            |   6 -
 init/Kconfig                                  |   5 +-
 kernel/events/uprobes.c                       |   2 +-
 lib/vdso/datastore.c                          |   2 +-
 mm/Kconfig                                    |  23 ++
 mm/mseal.c                                    |  12 +
 mm/vma.c                                      |   2 +
 mm/vma.h                                      |   8 +
 security/Kconfig                              |  21 --
 tools/testing/selftests/Makefile              |   1 -
 tools/testing/selftests/mm/Makefile           |   1 +
 tools/testing/selftests/mm/config             |   1 +
 tools/testing/selftests/mm/run_vmtests.sh     |   6 +
 tools/testing/selftests/mm/sysmap_is_sealed.c | 259 ++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c          |   5 +
 tools/testing/selftests/mm/vm_util.h          |   1 +
 .../mseal_system_mappings/.gitignore          |   2 -
 .../selftests/mseal_system_mappings/Makefile  |   6 -
 .../selftests/mseal_system_mappings/config    |   1 -
 .../mseal_system_mappings/sysmap_is_sealed.c  | 119 --------
 28 files changed, 345 insertions(+), 180 deletions(-)
 create mode 100644 tools/testing/selftests/mm/sysmap_is_sealed.c
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/.gitignore
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/Makefile
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/config
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c


base-commit: 734a9da61a5bc5d82b496a86bacc097d11dc6871
-- 
2.54.0

