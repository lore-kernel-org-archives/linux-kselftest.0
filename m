Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5233A0B05;
	Tue,  7 Apr 2026 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583939; cv=none; b=VRn3S25ygjz/5ievo7Tu404N90v6qKqaBwatOHYYEaxexkj8r1cff4z7j+yJBEbQDmxPjiCKUx6aAA7mqiLNKvUuSUmAcLpLL0CLswrBo+H69uHJy1zylHk+PAdGrzn9XAy4xNqem5M5YCWwygeeJSrn2GMB2SkSPQ5oDqFfDXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583939; c=relaxed/simple;
	bh=QCvNrVBR+UQpZWHcJILEpoR99lJLLIBXUMiv9hufMAc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kPxUYJwfaT+qacexLwAGzmxhymoQ8NA357YRBBeo/4ohLA0/XBYU31pCmm3c1zZf17HfJXhZ60xPismw+9/zdoLyZHHawa2P0Z9RQwZ85rUe49sb0Pm6XTRcY8U0hKNSvjPIoVKisD9oY3f4YnplWG3mo/Ux8gDTfe+7Rqs9NXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qRc/istY; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qRc/istY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775583924; x=1775843124;
	bh=Jue6vVhHghVxlyod3DDyXibcUYZsmo8usQOXh8QIwdM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qRc/istYVPGaNJqfY76Rl82eXyWWqTy5JWG5C8lxC58jn4j3kfBKiu605rODy2mD2
	 hCDCwFYgiaTseeuEom/YtmPzaGqubKRFMXqsjYg2JDyjz+/iIg6PNgK1zcqSk3ck4Q
	 bOpGTCuZumHXX54mhNQB+VdrqUmryPrxJ8c2G/peKUuITs/Irr4Ct/W39zhpHOCU8z
	 OjhwjkzDUCEGPx9YqSx+SkeaKwP7DPBwxwbzpM7FuIoGJwRsgP1po0gO/k8qmOyEDW
	 gVBlorFQisBYDgC7bsgVa2Czs0CEyqft0AlxqYBICRk/HxHuYOL+SprxjCTpWzFt2e
	 En4PautBUXYag==
Date: Tue, 07 Apr 2026 17:45:20 +0000
To: houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com, ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de, will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org, nathan@kernel.org, justinstitt@google.com, seanjc@google.com, perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com, james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org, jgross@suse.com, peterz@infradead.org, morbo@google.com, ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: x86@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, m.wieczorretman@pm.me
Subject: [PATCH v5 1/3] x86/process: Shorten the default LAM tag width
Message-ID: <bf872c3f7591dc7580679e35b343b08534be2d5a.1775581451.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1775581451.git.m.wieczorretman@pm.me>
References: <cover.1775581451.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 708afe33024b2f3955356fd5ac5e9c619a50ed3f
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

With the announcement of ChkTag, it's worth preparing a stable x86
linear address masking (lam) user interface. One important aspect of lam
is the tag width, and aligning it with other industry solutions can
provide a more popular, generalized interface that other technologies
could utilize.

ChkTag will use 4-bit tags and since that's the direction other memory
tagging implementations seem to be taking too (for example Arm's MTE)
it's reasonable to converge lam in linux to the same specification. Even
though x86's LAM supports 6-bit tags it is beneficial to shorten lam to
4 bits as ChkTag will likely be the main user of the interface and such
connection should simplify things in the future.

Shrink the maximum acceptable tag width from 6 to 4.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Ditch the default wording in the patch message.
- Add the imperative last line as Dave suggested.

Changelog v3:
- Remove the variability of the lam width after the debugfs part was
  removed from the patchset.

 arch/x86/kernel/process_64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 08e72f429870..1a0e96835bbc 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -797,7 +797,7 @@ static long prctl_map_vdso(const struct vdso_image *ima=
ge, unsigned long addr)
=20
 #ifdef CONFIG_ADDRESS_MASKING
=20
-#define LAM_U57_BITS 6
+#define LAM_DEFAULT_BITS=094
=20
 static void enable_lam_func(void *__mm)
 {
@@ -814,7 +814,7 @@ static void enable_lam_func(void *__mm)
 static void mm_enable_lam(struct mm_struct *mm)
 {
 =09mm->context.lam_cr3_mask =3D X86_CR3_LAM_U57;
-=09mm->context.untag_mask =3D  ~GENMASK(62, 57);
+=09mm->context.untag_mask =3D  ~GENMASK(57 + LAM_DEFAULT_BITS - 1, 57);
=20
 =09/*
 =09 * Even though the process must still be single-threaded at this
@@ -850,7 +850,7 @@ static int prctl_enable_tagged_addr(struct mm_struct *m=
m, unsigned long nr_bits)
 =09=09return -EBUSY;
 =09}
=20
-=09if (!nr_bits || nr_bits > LAM_U57_BITS) {
+=09if (!nr_bits || nr_bits > LAM_DEFAULT_BITS) {
 =09=09mmap_write_unlock(mm);
 =09=09return -EINVAL;
 =09}
@@ -965,7 +965,7 @@ long do_arch_prctl_64(struct task_struct *task, int opt=
ion, unsigned long arg2)
 =09=09if (!cpu_feature_enabled(X86_FEATURE_LAM))
 =09=09=09return put_user(0, (unsigned long __user *)arg2);
 =09=09else
-=09=09=09return put_user(LAM_U57_BITS, (unsigned long __user *)arg2);
+=09=09=09return put_user(LAM_DEFAULT_BITS, (unsigned long __user *)arg2);
 #endif
 =09case ARCH_SHSTK_ENABLE:
 =09case ARCH_SHSTK_DISABLE:
--=20
2.53.0


