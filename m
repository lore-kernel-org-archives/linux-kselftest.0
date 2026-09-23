Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AB5499F0F
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161694; cv=none; b=gqr74t+c7jjFjl9bsLtit8bHAVf1ktnn4+OQP/XHpb2mPi//4i1Ai1avq+fp4AXb4yJsFec0/S+locZAp26TjfIkvsyZS6b38ZJqAYcAb4+utadgCPGb6LTZ7prESXRpf+VYxwJ8YWyepSNkTvrxr6/S8Zz2cCUdy7T4vnui8Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161694; c=relaxed/simple;
	bh=IOAKMmCBlI6Y5ADecDu+BXYPFKPVLUehlx/wlSNc7CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBCBV/2DaZ3p6ZgUNtKPnehdZ0sK1lo37gtf5CBkk4Am19JT2tMMXtHphkklP5cKcvWbK/Ss2DQZpBZzUcQ74cghsKou9ZiHQzWmRiAqUH5jCdtkOi3qYko46WgBAQpubUdNlFm/zNWRbkfofJQRJjtE/qOxnK9+IigGLSYxNMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fgFy+biX; arc=none smtp.client-ip=95.215.58.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fgFy+biX"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IOAKMmCBlI6Y5ADecDu+BXYPFKPVLUehlx/wlSNc7CU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790161690; v=1; x=1790766490;
 b=fgFy+biXM4Q9x2QxFKyrmjeRdozXHtr3yurSpnsri5jxN/4c20JgEmAta9Y2rVjkErbU0VGc
 PSP4+4VOO/AsXaESzZs0SGoguBiPIDWkTloWhOfKi4+mNqja11ikb2CcTWmoqRUgCfq2C1nV1tz
 s5AFbLUf2Wj/ZTRivIXXU1uk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8dc03a7980d43812;
	Wed, 23 Sep 2026 11:08:10 +0000
X-Mizu-Trace-ID: 8dc03a7980d43812
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b8c42da963so5341e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 04:08:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw4rwHA2k//tjSONvMW9EK/5fLO2YO1NmensaQ2bxMlwJQcIZcg/x+xS3AannnJXt7gnK1T/2yztZoNruqUk+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nG+yp3l6l0DSeMrnAXFc8EKP8oLL+Of2B90sSY/dHIEiunu2bl
	HsQwdPb0+h6WotXzCek57KE2I/8hydJq7t6AnZYM/hMyb7ZW2LMp6A8fMHzvENX/hQwbwuarOuP
	JWpck3lorJU+HVfUfTrTuwHOq6coNb2qrkOkWT5t/
X-Received: by 2002:a05:6512:648a:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8d91673a2mr102638e87.15.1790161689001; Wed, 23 Sep 2026
 04:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org> <20260922-kvm-arm-prefault-v3-9-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-9-787bd3bc7e3f@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 12:07:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzY6KFekqaUX4RLRyFmSkFhOeWDZE4LjBF6owdLM8oHhw@mail.gmail.com>
X-Gm-Features: AcwNN1USJQu0cBxPqG4Fa3XJmPPBE73PzJ6UtD9si6PNBcHUySSR3TM9mD5mIUk
Message-ID: <CA+EHjTzY6KFekqaUX4RLRyFmSkFhOeWDZE4LjBF6owdLM8oHhw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 15:19, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> From: Jack Thomson <jackabt@amazon.com>
>
> Allow callers of kvm_pgtable_get_leaf() to specify the page-table walk
> flags, in preparation for performing walks under the MMU read lock.
>
> Reading a stage-2 leaf while only holding the read lock requires
> KVM_PGTABLE_WALK_SHARED: parallel faults (which also only hold the read
> lock) can unlink table pages and free them via RCU, so the walker must
> be inside an RCU read-side critical section, which the shared walk flag
> provides via kvm_pgtable_walk_begin().
>
> All existing callers either hold the write lock, walk with interrupts
> disabled, or run at hyp where shared walks are rejected; they keep the
> current behaviour by passing no flags.
>
> No functional change intended.
>
> Signed-off-by: Jack Thomson <jackabt@amazon.com>
> [ljs: fixup new kvm_pgtable_get_leaf() invocation]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
