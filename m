Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F8B3FBB46
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 06:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230177; cv=none; b=f8BJsaVitOPs0OE/FoREYI0RLHzCWw4dpnvjlmVvcywPjsQGxBxjiPMLJUkGpqDct3e+6y7LtoXhFMR4dqeuouCHccR7rb6Oiorg1sa0SjRJ2OjbSFaRAF2BfOcglUHFX8ylSsi05Zo4VWZhAXLoJL7lYGUzwrq4ppPPzNB6XWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230177; c=relaxed/simple;
	bh=EAQiwSLU8WvEPiMz51OeeUlVyfvtoZuDVj/Ws6zFfEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6hJexit8wqGxc/V7Zq4kVkpXrIuwlo0Onz0u4mrkSx/Fddvv61fTdoa4HwSJjnQV9A+wanUfxG/Eg5Jk/PwZbOm8JiogkdSzx9DqlVpLig3OoXHgafYFLuVVjsl70LU/8ZnB3S4Z2ZH8dx5CnQ0U947ToxNslJywwzBh2QI6cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p4tNoJ9E; arc=none smtp.client-ip=91.218.175.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p4tNoJ9E"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EAQiwSLU8WvEPiMz51OeeUlVyfvtoZuDVj/Ws6zFfEs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790230173; v=1; x=1790834973;
 b=p4tNoJ9ExEGaruESs/70oXmOmxrox4wjqiK/4myP6ANlEpKnZDfUB8wjK3b8+pY1l3kdN+jv
 xMAQpbZxmhM+31Vvc+0lGpY2vBdwFO8uoWZD97+vugiH374ee7bcBjVEXYFrwaAykA+y+LI+3H1
 Js6fX5kwRqELRKLvfSyOpz3E=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06835c8379645a87;
	Thu, 24 Sep 2026 06:09:33 +0000
X-Mizu-Trace-ID: 06835c8379645a87
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so3517e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 23:09:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEiicaltQtbYL/p3foGNg/PIB0JcCfH1WZ+QdXylpiDZERY5SRhdXPtWtHqDviMCpF3Q5ZcqXqxsJKqYaLaBM=@vger.kernel.org
X-Gm-Message-State: AFuF++lHvlNzdy6IBVhkHMeSV5hVsmCQgQ0nsCanzisocwc1wSeS0opR
	EyrfK5aVVVGzzCShHjCfVGPhxcz8lei5q0VYi4DEqYlm1IvAt2px+sgZynM+hMQDbaXcDRsA5gW
	MQLTL5exR6jvIjoTBfwJoJRUXkh7b56HPJu1qSFKc
X-Received: by 2002:a05:6512:ba4:b0:5a8:6646:d7b4 with SMTP id
 2adb3069b0e04-5b8de3bb43emr120128e87.1.1790230168511; Wed, 23 Sep 2026
 23:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org> <20260923-kvm-arm-prefault-v4-13-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-13-d4b0b4dfa8c3@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 07:08:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyPyy-Z=HAMOz6pUHrz_X4O+Lx3cQ6Ay_Wt+tnc1WDU_w@mail.gmail.com>
X-Gm-Features: AclHuK8PM-gKMDq-u5QWjDRmdsBji-o2uwHNqiDgg3TNGtYz82rPBW9_kKwo1Hg
Message-ID: <CA+EHjTyPyy-Z=HAMOz6pUHrz_X4O+Lx3cQ6Ay_Wt+tnc1WDU_w@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] KVM: selftests: Add option for different backing
 in pre-fault tests
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

On Wed, 23 Sep 2026 16:15:56 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
[...]
> @@ -189,24 +195,28 @@ static void __test_pre_fault_memory(enum vm_guest_mode guest_mode, void *arg)
[...]
>          test_config.test_size = align_up(TEST_BASE_SIZE + test_config.page_size,
> -                                         host_page_size);
> +                                         mem_page_size);
>          test_config.test_num_pages = vm_calc_num_guest_pages(vm->mode, test_config.test_size);

With -s anonymous_hugetlb_1gb, test_size becomes 1G and setup aborts
on 4K guest modes, as memslot 0 has no room for the page tables that
map it:

     No guest physical page available, min_gpa: 0x180000 page_size:
0x1000 memslot: 0

As a followup, could you compute test_num_pages before creating the VM
and pass it as extra_mem_pages, as arm64/sea_to_user.c does?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
