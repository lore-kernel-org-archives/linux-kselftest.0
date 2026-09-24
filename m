Received: from mta1.migadu.com (out-79.mta1.migadu.com [95.215.58.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35EE3FE347
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 06:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230189; cv=none; b=oLJySZ/3jchdmweukmVxgwllMNdMNYFFPWMVxIMRBP4dP1pqyxvUulClaOZtxPsbJyySMXMs7bnInX8Sfz9pb2i4ErzbIZXDP7IkBj5/0RV3gChpl03hvMvohdq8G6QNR3KpccXGwBo8l7zZPdTDiWdYyYaN0vOzZ00Hmq+JebE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230189; c=relaxed/simple;
	bh=0CUsutr5c/pwyjZUne1mfLzu7Ng+TMFz2fiafLg6SYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lbLuNlGblm3TPjmoK28yioVo3XEei1M+bd3GFBE6L06RlIOwVciGu6F47JzU0enI9tgsdcLlD0vDkFN8lop17Pn6o01D7FJW0hd4r21KyMboGSyg3n7IpPOv/5DYafa2qI3LnzfcBeWmyKuQDRxxx2ahyTzpwp+0DiaZzS8B8So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QHgUfYc4; arc=none smtp.client-ip=95.215.58.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QHgUfYc4"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0CUsutr5c/pwyjZUne1mfLzu7Ng+TMFz2fiafLg6SYM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790230185; v=1; x=1790834985;
 b=QHgUfYc4o4cFjA+XbhZuPzvuy3i2pzuAZVVIUxkXJkjhlzuET8Hlzl9WSzircp1X2Whpkb4f
 /GFzzRmTsQenTmJouyDDdKlnM9r9iZnBv662/UC6w3VBK4ejiU6InfY7noGSXKNMIhdN/vGhzl8
 ybzQSedoyavnKxRcaEz1817o=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4cf7c382985e0278;
	Thu, 24 Sep 2026 06:09:45 +0000
X-Mizu-Trace-ID: 4cf7c382985e0278
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso5735e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 23:09:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByixAaOhf1IK/SH8TZaGvGHcg5+athmEwoVkFVVZfnQ1NlM7KV9WVveGPZVsspHG7WpAHBKaJ1t5s9ItSkBiFE=@vger.kernel.org
X-Gm-Message-State: AFuF++kEe92qdHgah9umKHKnI9hiW2zVenRKccErPVBqziY0x5STIJaS
	qmLc4raeTso0c8vdvj4UgQAOLegHMeU/pYAlXUyVMu3yRmhzdOMOqrKjxQW7eLAmeJmEBObfy5G
	9cvSt86AOsLobPb9Vc2ljkNhb66pgjki/ANfZuUyP
X-Received: by 2002:a05:6512:3b28:b0:5b8:caec:cc77 with SMTP id
 2adb3069b0e04-5b8de5c4ceamr119554e87.7.1790230180648; Wed, 23 Sep 2026
 23:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 07:09:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw-OXzqXbs8phvXKpbR5UCx6munmFQni80eH6G4gD_k_w@mail.gmail.com>
X-Gm-Features: AclHuK_Ine4NnKUQcaZ0yB1SSKmzV1yVXJdk5G12ur315eMZsDY4KFVeV3Z9hpE
Message-ID: <CA+EHjTw-OXzqXbs8phvXKpbR5UCx6munmFQni80eH6G4gD_k_w@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Wed, 23 Sep 2026 16:15:43 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
> This series implements the KVM stage 2 page table pre-faulting feature for
> arm64.

Retested as follows (let's see if this one sticks ;) ):

QEMU/arm64 -cpu max:
- guests boot on VHE, nVHE and protected-mode hosts, protected guests included
- pre_fault_memory_test (all guest modes, anonymous, THP, hugetlb and
shmem backing) and nv_pre_fault_memory_test pass
- pre-faulting an uninitialised vCPU returns -ENOEXEC
- a failed guest_memfd pre-fault leaves kvm_run's exit_reason alone
- dirty_log_test, demand_paging_test, mmu_stress_test and
stage2_block_transitions also pass

Apple M4 (nVHE, 4K and 16K pages):
- pre_fault_memory_test passes on the five guest modes available
there, with the same backings
- in protected mode (4K pages), the cap isn't advertised, the ioctl
returns -EOPNOTSUPP before and after vCPU init, and guests boot

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
