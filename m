Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B72351C0B
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814934; cv=none; b=o860hAbIQEzS9xvs8JJIZnxLmjHAl3unUlk7LoSIHLPozvltNUaqbsH302rf4IlXfBICLKNdo+owch6ChpU3mDgrUZkKkFP34cx47Qx8b5NSrwDajib64ZDAZRKeSkOAVbTlMwvvzGs+KqXBnT4T/vJ9/lS1cc/BHewHQFbnk78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814934; c=relaxed/simple;
	bh=FzXBIw1vdsKfYogXbUn3HuPwaqm1ZjhIXwxLmyPxSHE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uskt8t6CAVwUoAjvnf/3sF9WCuP8ZesfQDCPYfwZXdcuocJejox0dauqAAc258E+Nb7CzTVR406DW9/SeEXZhFzOpnzlTxuTsecDSzxwAJO1IxoyYZCakDNZdOuxNK8anAAKb+nnFCv4ilcQEaZ+SIb70N2S+bJq1+75nEf35sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=k5tYU5XI; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="k5tYU5XI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775814929; x=1776074129;
	bh=P3Nnw9i6S+QzWm5UK1Oh5jO4xjBLfUIrVCJ6W6qb0cg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k5tYU5XIUxSUYKuXpVOZHgaixMRlPRGZspZxHYmkRFF6/TY5dMiENCh+OfpBj9GZR
	 xsn7TcYt5DVObEYpxdr4x1nEnbFk4mXJuuf9XGapVHCQSxaFiPctfIhSAkzPyXapQI
	 0g90XeLsHO3Kcw6SokTfHqK1u1ECw6xH0G5HjhGMZQ5dL9f5C7QY0ZMA4eYebScsdl
	 M3kCz8N419nQ/N9m77ezHOb6lb+W7lpnX9WRKcLAT3v/Qcj/UjsE0XZRBGUJYXvbPT
	 +pJyVS84V2jUMuD3+Dzbx7E1MxLnsqcCSN7GXy5qXfvjtAbQjODnPi8SV7GmmqTYqz
	 8lilxwEVU/NUg==
Date: Fri, 10 Apr 2026 09:55:25 +0000
To: peterz@infradead.org, ryan.roberts@arm.com, ilpo.jarvinen@linux.intel.com, maciej.wieczor-retman@intel.com, jgross@suse.com, morbo@google.com, mingo@redhat.com, ljs@kernel.org, nathan@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, james.morse@arm.com, oleg@redhat.com, houwenlong.hwl@antgroup.com, xin@zytor.com, justinstitt@google.com, seanjc@google.com, hpa@zytor.com, perry.yuan@amd.com, bp@alien8.de, dave.hansen@linux.intel.com, sohil.mehta@intel.com, tglx@kernel.org, nick.desaulniers+lkml@gmail.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 1/3] x86/process: Shorten the LAM tag width
Message-ID: <79720f2640839b15f22e3618136b084cb376456b.1775813245.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1775813245.git.m.wieczorretman@pm.me>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 9df94bdd32eb8008f8992a65852d1e219dfccc88
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

Define tag width and the untagging mask as constants with names matching th=
e
arch_prctl() LAM cases. This way it's easier to see where each value can be
returned to userspace.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v6:
- Rename the define constants so they match the arch_prctl() switch case na=
mes
  and update the patch message.
- Define LAM most/least significant bits so they fit better into GENMASK().
- Remove 'default' from the patch subject.

Changelog v4:
- Ditch the default wording in the patch message.
- Add the imperative last line as Dave suggested.

Changelog v3:
- Remove the variability of the lam width after the debugfs part was
  removed from the patchset.

 arch/x86/kernel/process_64.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 08e72f429870..d6f8e71156cd 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -797,7 +797,10 @@ static long prctl_map_vdso(const struct vdso_image *im=
age, unsigned long addr)
=20
 #ifdef CONFIG_ADDRESS_MASKING
=20
-#define LAM_U57_BITS 6
+#define LAM_TAG_BITS=094
+#define LAM_LS_BIT=0957
+#define LAM_MS_BIT=09(LAM_LS_BIT + LAM_TAG_BITS - 1) /* 60 */
+#define LAM_UNTAG_MASK=09~GENMASK(LAM_MS_BIT, LAM_LS_BIT)
=20
 static void enable_lam_func(void *__mm)
 {
@@ -814,7 +817,7 @@ static void enable_lam_func(void *__mm)
 static void mm_enable_lam(struct mm_struct *mm)
 {
 =09mm->context.lam_cr3_mask =3D X86_CR3_LAM_U57;
-=09mm->context.untag_mask =3D  ~GENMASK(62, 57);
+=09mm->context.untag_mask =3D LAM_UNTAG_MASK;
=20
 =09/*
 =09 * Even though the process must still be single-threaded at this
@@ -850,7 +853,7 @@ static int prctl_enable_tagged_addr(struct mm_struct *m=
m, unsigned long nr_bits)
 =09=09return -EBUSY;
 =09}
=20
-=09if (!nr_bits || nr_bits > LAM_U57_BITS) {
+=09if (!nr_bits || nr_bits > LAM_TAG_BITS) {
 =09=09mmap_write_unlock(mm);
 =09=09return -EINVAL;
 =09}
@@ -965,7 +968,7 @@ long do_arch_prctl_64(struct task_struct *task, int opt=
ion, unsigned long arg2)
 =09=09if (!cpu_feature_enabled(X86_FEATURE_LAM))
 =09=09=09return put_user(0, (unsigned long __user *)arg2);
 =09=09else
-=09=09=09return put_user(LAM_U57_BITS, (unsigned long __user *)arg2);
+=09=09=09return put_user(LAM_TAG_BITS, (unsigned long __user *)arg2);
 #endif
 =09case ARCH_SHSTK_ENABLE:
 =09case ARCH_SHSTK_DISABLE:
--=20
2.53.0


