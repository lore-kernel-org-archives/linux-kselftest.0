Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506273D34A0;
	Tue,  7 Apr 2026 17:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583948; cv=none; b=p6hDgAr46W+JHGLeAK3gtQubsfx7DJh8z2gYoe1CjKxFWEY28/KJh/vLhA/uVcWsDjga7IUh4qEnoxunslEzBRYbq1F7Fcp2fjYRQp8YWj9RBHqFyXcDiQ865lD98NPZfdl8DbGNEnY84TPjJNRK2FFzCkbmh3tfKVeqckfDxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583948; c=relaxed/simple;
	bh=m9hKwZPyuEzZ8uN5Kiu7EUVvRypg4VjLdMDA4EOO38M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O53hGKNEsF4yWlhyF82xQyZscFkPJJkmFIgi7UZCj272+VnWKAEVXqPhkT3QuddhN0ItWefTBpelHri7Dh7XSUe4QJhCy2vRmXg9rJaN9m4jBj4jMo4QpotLt7JJvpxaqG/DBwvek5LMfd6h3KUSzpBvM9sewISmyvSZXCaoRIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=crdf66im; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="crdf66im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775583934; x=1775843134;
	bh=I52Q+KEeiiDsU8FQqfmtTt6VSyBmS0haSG3uGXRUd04=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=crdf66imab0GdbcKb4uxrFb0oa5EgynI0+TSmxXUuYrzKLVhHeNW+o6ANIPa82FfP
	 6i0qg1LQAN//UxRmuxXKAWSAPAOsqC0n0x3ggrOvHiXN4rvNlFOhiZ+o7vXAaYfOD7
	 IxzB4/SCr9sfZeyTAk3rhKiD/P3QiVm11m/euwvgctiEYKbrsdsj2NZqpKiZpo4bf3
	 +1iF3juG4gYa6KovzC31r9ZaMruIuHejoeWSVJNfS34SgMmhfW0OXr6bT+mrxI7rMH
	 AbLxKQWjDicCh+Ya+kXtW5leqCXFAcRcgSwPO6RPh2aCEJ1DGbh+HwuxnADTV7pCxq
	 MwEf3JRiuei0A==
Date: Tue, 07 Apr 2026 17:45:27 +0000
To: houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com, ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de, will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org, nathan@kernel.org, justinstitt@google.com, seanjc@google.com, perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com, james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org, jgross@suse.com, peterz@infradead.org, morbo@google.com, ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: x86@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, m.wieczorretman@pm.me
Subject: [PATCH v5 2/3] x86/mm: Cleanup comments where LAM_U48 is mentioned
Message-ID: <bc0901ae4561a00d95f99daa3d5d7406cf58aedd.1775581451.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1775581451.git.m.wieczorretman@pm.me>
References: <cover.1775581451.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: c45887faa67dcdf2e4b80a96467fbca08936458c
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

For simplicity only the LAM_U57 mode is implemented in the kernel. No
matter whether the enabled paging mode is 5-level or 4-level the masked
tag bits are the same as on a 5-level system.

Remove two mentions of LAM_U48 which implied that it could be enabled.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/include/asm/mmu.h      | 2 +-
 arch/x86/include/asm/tlbflush.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/mmu.h b/arch/x86/include/asm/mmu.h
index 0fe9c569d171..9dcfce439c19 100644
--- a/arch/x86/include/asm/mmu.h
+++ b/arch/x86/include/asm/mmu.h
@@ -49,7 +49,7 @@ typedef struct {
 =09unsigned long flags;
=20
 #ifdef CONFIG_ADDRESS_MASKING
-=09/* Active LAM mode:  X86_CR3_LAM_U48 or X86_CR3_LAM_U57 or 0 (disabled)=
 */
+=09/* Active LAM mode: X86_CR3_LAM_U57 or 0 (disabled) */
 =09unsigned long lam_cr3_mask;
=20
 =09/* Significant bits of the virtual address. Excludes tag bits. */
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflus=
h.h
index 5a3cdc439e38..94c5ca1febaf 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -110,7 +110,7 @@ struct tlb_state {
 =09/*
 =09 * Active LAM mode.
 =09 *
-=09 * X86_CR3_LAM_U57/U48 shifted right by X86_CR3_LAM_U57_BIT or 0 if LAM
+=09 * X86_CR3_LAM_U57 shifted right by X86_CR3_LAM_U57_BIT or 0 if LAM
 =09 * disabled.
 =09 */
 =09u8 lam;
--=20
2.53.0


