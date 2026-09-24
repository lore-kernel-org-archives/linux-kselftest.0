Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636ED404BDD
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 06:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230156; cv=none; b=j/5H6tspfcfjzGYCVIRJzH380Rhp2p0L3VASLwPsSihndReP2eWAp4rglXcKjWuQv4Oo5r+XhzZUMEDIye406lS72OoLalUdh39wrPIqJNcFyEQ6Ucszflm3j9P+JzbxFQ9TYm9XkKIq2ll+EuC3oFPIu3qlnxLI6VsPMWFEt/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230156; c=relaxed/simple;
	bh=RyyiC0ofM8CGzkXnRUfQTw+HLZ/pLb7WijiCtVOlmu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQNCIohbEofD91/HGc/krFZ6rpOXBzc4e01RMV4IyEcc2g3n5nyOTVmhNGTRSt2UAHLKbhQkJwl4cxXbnbRFa48AG6hP4KSFRWf+5RQh62RkX6l+nV8rHmVtxxBXpMETgG+nqY2h9aw5jbCfEWOk+C+S3rPsbZHlW36/mBzcoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Iiy6+pgT; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Iiy6+pgT"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RyyiC0ofM8CGzkXnRUfQTw+HLZ/pLb7WijiCtVOlmu0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790230152; v=1; x=1790834952;
 b=Iiy6+pgTy6KjqlZRNR20IPLn01yRwCg8mK00VLWE0/Zn1qtJEGwo8pWTUQyBrFHSwTylrYfO
 rQkk2AwDyi1kSK4ZSkfzGOwFlKhZcx3PfbPSPJGKwx4+KgWn0pCgD7cu6+hgtolW0kxzYUx99Df
 FaKbpkopX5FhndiKvO3uMCXY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3fb8ded2654dee0;
	Thu, 24 Sep 2026 06:09:02 +0000
X-Mizu-Trace-ID: b3fb8ded2654dee0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso3598e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 23:09:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOsc32a8KQsIfgCaqSqnf0DTKw/s45DMVfq/3wvTOlB+TZ91p+aWmJxZ9+BpNiFRtyd//8s0vDvo178tEq0js=@vger.kernel.org
X-Gm-Message-State: AFuF++lhR0v5vrsH/5MAUnOz0OD1H/09joEDigVNTnJdzueNS3Jxlsia
	xXY9UxUy+92gmj1JhjCHc7uf7kC89/DfpIRNb1SCSlgqYwoVSEYSYjOwdN6pPnSFIJI6mx5E/QF
	Lc5DiAkI6hg3B02TsuB8rvf5IpWV12CdeUBFdtOZM
X-Received: by 2002:a05:6512:1358:b0:5b2:a967:c0e1 with SMTP id
 2adb3069b0e04-5b8dd6d2b18mr130595e87.0.1790230141441; Wed, 23 Sep 2026
 23:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-12-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-12-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 07:08:25 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxAah=pvuTqSYE0-jkXmgWJBrVD33nCThS4SNJN-kfNmw@mail.gmail.com>
X-Gm-Features: AclHuK_kb7tirLzxpH1tqzJpHCuAErXckpMiZSE-Wc4zTJclc5slHcBac4UN3_w
Message-ID: <CA+EHjTxAah=pvuTqSYE0-jkXmgWJBrVD33nCThS4SNJN-kfNmw@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] KVM: selftests: Enable pre_fault_memory_test for arm64
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

On Wed, 23 Sept 2026 at 16:18, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> From: Jack Thomson <jackabt@amazon.com>
>
> Enable the pre_fault_memory_test to run on arm64 by making it work with
> different guest page sizes and testing multiple guest configurations.
>
> Add an assert on the exit reason, comparing against UCALL_EXIT_REASON so
> the check is portable, as arm64 exits with KVM_EXIT_MMIO while x86 uses
> KVM_EXIT_IO.
>
> Signed-off-by: Jack Thomson <jackabt@amazon.com>
> [ljs: merge conflict resolution with commit c847704619da ("KVM: selftests:
>  Fix pre_fault_memory_test to run on s390"), commit message accuracy fixup]
> Reviewed-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
