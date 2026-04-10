Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F93AA516
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814962; cv=none; b=mCnBIwiLjGFJKKmH3wu3u046t8lr3jeV8sO65ajfzQcyDRMdCMullpbdpWRjxXEdFmlt2P5OPzU1P9vPGwdu+5rrptJa9tB2RQnkVLCWl+krHg8F5X4nazfFkNLsit1W5wCIVBkcV/sfcvhv3n1mHmH98sQ8Ft6w46H2inlgrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814962; c=relaxed/simple;
	bh=EhZxedE48iyEtofQO3IsZdajA3ZW+sdCe0Tmu4JXA8A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQzOoeHaGBl7zXLKLfypsL+KpWUVsbtQpOYNoR+z9ZgiInUNVTqVxbXDnRaxkAJWOzrebp9ltFqa/kUOD0EuwyAiRn5NhxY35Jw6mNltB2KEB/tPKc0CRP6FpEnTsP9ORVE9AEE+GViv4ngUTdNXPuR9lgC6X0EtX27/O5udt+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=S4V5MyFG; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="S4V5MyFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775814952; x=1776074152;
	bh=4lwqm41kb3Xq61Z1+ag7RwAcMowrPSu9Ny1DsvAYvcs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S4V5MyFGu3qubujb6NYq44G7KfXOkW5i4aNAHvabxKaVGNGfaj+4jcpzkHeahcXb3
	 /akM9qNJFerJymohInmpbBwsS2qr4zN0cr0jt59YEFLMO0lYXm8baUUQHKl5PbuykJ
	 GGvKVinvVyNyMOt1NHobRTO/ekKdsZqErBXBD/9Ylt+f7ecHscsqJZAdE5VyPGZU57
	 lXKOAuRdkAAA3DfBowTEte4lEolYXKUo0pVpwNeq7GTd6FvR3Egt+55ZHdY7wDgX+W
	 4hZ8XmHsTdg0hyv9Yk/QeqfUpb2bkc/y8d80CFl8So6gXdbwn00G4udJRUvqLjZekZ
	 24YxbfBs77q8g==
Date: Fri, 10 Apr 2026 09:55:48 +0000
To: peterz@infradead.org, ryan.roberts@arm.com, ilpo.jarvinen@linux.intel.com, maciej.wieczor-retman@intel.com, jgross@suse.com, morbo@google.com, mingo@redhat.com, ljs@kernel.org, nathan@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, james.morse@arm.com, oleg@redhat.com, houwenlong.hwl@antgroup.com, xin@zytor.com, justinstitt@google.com, seanjc@google.com, hpa@zytor.com, perry.yuan@amd.com, bp@alien8.de, dave.hansen@linux.intel.com, sohil.mehta@intel.com, tglx@kernel.org, nick.desaulniers+lkml@gmail.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 3/3] selftests/lam: Update LAM tag width and cleanup names
Message-ID: <20687a8abed771847a4056e64aedbc073076d477.1775813245.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1775813245.git.m.wieczorretman@pm.me>
References: <cover.1775813245.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: ec2a6d2f0cd9e70992ae524544427f5ae548dd11
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

After the tag width in LAM (Linear Address Masking) is set to 4 bits,
the value isn't strictly related to the CPU features like LAM_U57 or
LAM_U48. To emphasise this, remove mentions of _U57 from the selftest
and update the tag width.

Define GENMASK() so the selftest defines can match the kernel ones. That
way it's easier to find or synchronize the two sets of values.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v6:
- Update the patch subject that was not accurate after debugfs part got
  removed.
- Fix one comment I missed.
- Define GENMASK() and change defined constants so they match the ones
  in the kernel (from patch 1/3).

Changelog v4:
- Remove the 'default' wording.

Changelog v3:
- Redo the patch after the removal of the debugfs part.

 tools/testing/selftests/x86/lam.c | 94 ++++++++++++++++---------------
 1 file changed, 49 insertions(+), 45 deletions(-)

diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x8=
6/lam.c
index 1919fa6daec0..f14600e74d8c 100644
--- a/tools/testing/selftests/x86/lam.c
+++ b/tools/testing/selftests/x86/lam.c
@@ -24,11 +24,15 @@
 # error This test is 64-bit only
 #endif
=20
+#define GENMASK(h, l) (((~0UL) << (l)) & (~0UL >> (__BITS_PER_LONG - 1 - (=
h))))
+
 /* LAM modes, these definitions were copied from kernel code */
 #define LAM_NONE                0
-#define LAM_U57_BITS            6
+#define LAM_TAG_BITS=09=094
+#define LAM_LS_BIT=09=0957
+#define LAM_MS_BIT=09=09(LAM_LS_BIT + LAM_TAG_BITS - 1) /* 60 */
+#define LAM_UNTAG_MASK=09=09~GENMASK(LAM_MS_BIT, LAM_LS_BIT)
=20
-#define LAM_U57_MASK            (0x3fULL << 57)
 /* arch prctl for LAM */
 #define ARCH_GET_UNTAG_MASK     0x4001
 #define ARCH_ENABLE_TAGGED_ADDR 0x4002
@@ -51,8 +55,8 @@
 #define GET_USER_KERNEL         3
=20
 #define TEST_MASK               0x7f
-#define L5_SIGN_EXT_MASK        (0xFFUL << 56)
-#define L4_SIGN_EXT_MASK        (0x1FFFFUL << 47)
+#define L5_SIGN_EXT_MASK        GENMASK(63, 56)
+#define L4_SIGN_EXT_MASK        GENMASK(63, 47)
=20
 #define LOW_ADDR                (0x1UL << 30)
 #define HIGH_ADDR               (0x3UL << 48)
@@ -175,7 +179,7 @@ static int set_lam(unsigned long lam)
 =09int ret =3D 0;
 =09uint64_t ptr =3D 0;
=20
-=09if (lam !=3D LAM_U57_BITS && lam !=3D LAM_NONE)
+=09if (lam !=3D LAM_TAG_BITS && lam !=3D LAM_NONE)
 =09=09return -1;
=20
 =09/* Skip check return */
@@ -185,8 +189,8 @@ static int set_lam(unsigned long lam)
 =09syscall(SYS_arch_prctl, ARCH_GET_UNTAG_MASK, &ptr);
=20
 =09/* Check mask returned is expected */
-=09if (lam =3D=3D LAM_U57_BITS)
-=09=09ret =3D (ptr !=3D ~(LAM_U57_MASK));
+=09if (lam =3D=3D LAM_TAG_BITS)
+=09=09ret =3D (ptr !=3D LAM_UNTAG_MASK);
 =09else if (lam =3D=3D LAM_NONE)
 =09=09ret =3D (ptr !=3D -1ULL);
=20
@@ -204,8 +208,8 @@ static unsigned long get_default_tag_bits(void)
 =09=09perror("Fork failed.");
 =09} else if (pid =3D=3D 0) {
 =09=09/* Set LAM mode in child process */
-=09=09if (set_lam(LAM_U57_BITS) =3D=3D 0)
-=09=09=09lam =3D LAM_U57_BITS;
+=09=09if (set_lam(LAM_TAG_BITS) =3D=3D 0)
+=09=09=09lam =3D LAM_TAG_BITS;
 =09=09else
 =09=09=09lam =3D LAM_NONE;
 =09=09exit(lam);
@@ -230,8 +234,8 @@ static int get_lam(void)
 =09=09return -1;
=20
 =09/* Check mask returned is expected */
-=09if (ptr =3D=3D ~(LAM_U57_MASK))
-=09=09ret =3D LAM_U57_BITS;
+=09if (ptr =3D=3D LAM_UNTAG_MASK)
+=09=09ret =3D LAM_TAG_BITS;
 =09else if (ptr =3D=3D -1ULL)
 =09=09ret =3D LAM_NONE;
=20
@@ -247,10 +251,10 @@ static uint64_t set_metadata(uint64_t src, unsigned l=
ong lam)
 =09srand(time(NULL));
=20
 =09switch (lam) {
-=09case LAM_U57_BITS: /* Set metadata in bits 62:57 */
+=09case LAM_TAG_BITS: /* Set metadata in bits 60:57 */
 =09=09/* Get a random non-zero value as metadata */
-=09=09metadata =3D (rand() % ((1UL << LAM_U57_BITS) - 1) + 1) << 57;
-=09=09metadata |=3D (src & ~(LAM_U57_MASK));
+=09=09metadata =3D (rand() % ((1UL << LAM_TAG_BITS) - 1) + 1) << 57;
+=09=09metadata |=3D (src & LAM_UNTAG_MASK);
 =09=09break;
 =09default:
 =09=09metadata =3D src;
@@ -291,7 +295,7 @@ int handle_max_bits(struct testcases *test)
 =09unsigned long bits =3D 0;
=20
 =09if (exp_bits !=3D LAM_NONE)
-=09=09exp_bits =3D LAM_U57_BITS;
+=09=09exp_bits =3D LAM_TAG_BITS;
=20
 =09/* Get LAM max tag bits */
 =09if (syscall(SYS_arch_prctl, ARCH_GET_MAX_TAG_BITS, &bits) =3D=3D -1)
@@ -719,8 +723,8 @@ int do_uring(unsigned long lam)
 =09=09=09uint64_t addr =3D ((uint64_t)fi->iovecs[i].iov_base);
=20
 =09=09=09switch (lam) {
-=09=09=09case LAM_U57_BITS: /* Clear bits 62:57 */
-=09=09=09=09addr =3D (addr & ~(LAM_U57_MASK));
+=09=09=09case LAM_TAG_BITS: /* Clear bits 60:57 */
+=09=09=09=09addr =3D (addr & LAM_UNTAG_MASK);
 =09=09=09=09break;
 =09=09=09}
 =09=09=09free((void *)addr);
@@ -937,14 +941,14 @@ static void run_test(struct testcases *test, int coun=
t)
 static struct testcases uring_cases[] =3D {
 =09{
 =09=09.later =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_uring,
-=09=09.msg =3D "URING: LAM_U57. Dereferencing pointer with metadata\n",
+=09=09.msg =3D "URING: LAM. Dereferencing pointer with metadata\n",
 =09},
 =09{
 =09=09.later =3D 1,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_uring,
 =09=09.msg =3D "URING:[Negative] Disable LAM. Dereferencing pointer with m=
etadata.\n",
 =09},
@@ -953,14 +957,14 @@ static struct testcases uring_cases[] =3D {
 static struct testcases malloc_cases[] =3D {
 =09{
 =09=09.later =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_malloc,
-=09=09.msg =3D "MALLOC: LAM_U57. Dereferencing pointer with metadata\n",
+=09=09.msg =3D "MALLOC: LAM. Dereferencing pointer with metadata\n",
 =09},
 =09{
 =09=09.later =3D 1,
 =09=09.expected =3D 2,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_malloc,
 =09=09.msg =3D "MALLOC:[Negative] Disable LAM. Dereferencing pointer with =
metadata.\n",
 =09},
@@ -976,41 +980,41 @@ static struct testcases bits_cases[] =3D {
 static struct testcases syscall_cases[] =3D {
 =09{
 =09=09.later =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_syscall,
-=09=09.msg =3D "SYSCALL: LAM_U57. syscall with metadata\n",
+=09=09.msg =3D "SYSCALL: LAM. syscall with metadata\n",
 =09},
 =09{
 =09=09.later =3D 1,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_syscall,
 =09=09.msg =3D "SYSCALL:[Negative] Disable LAM. Dereferencing pointer with=
 metadata.\n",
 =09},
 =09{
 =09=09.later =3D GET_USER_USER,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D get_user_syscall,
 =09=09.msg =3D "GET_USER: get_user() and pass a properly tagged user point=
er.\n",
 =09},
 =09{
 =09=09.later =3D GET_USER_KERNEL_TOP,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D get_user_syscall,
 =09=09.msg =3D "GET_USER:[Negative] get_user() with a kernel pointer and t=
he top bit cleared.\n",
 =09},
 =09{
 =09=09.later =3D GET_USER_KERNEL_BOT,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D get_user_syscall,
 =09=09.msg =3D "GET_USER:[Negative] get_user() with a kernel pointer and t=
he bottom sign-extension bit cleared.\n",
 =09},
 =09{
 =09=09.later =3D GET_USER_KERNEL,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D get_user_syscall,
 =09=09.msg =3D "GET_USER:[Negative] get_user() and pass a kernel pointer.\=
n",
 =09},
@@ -1020,60 +1024,60 @@ static struct testcases mmap_cases[] =3D {
 =09{
 =09=09.later =3D 1,
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.addr =3D HIGH_ADDR,
 =09=09.test_func =3D handle_mmap,
-=09=09.msg =3D "MMAP: First mmap high address, then set LAM_U57.\n",
+=09=09.msg =3D "MMAP: First mmap high address, then set LAM.\n",
 =09},
 =09{
 =09=09.later =3D 0,
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.addr =3D HIGH_ADDR,
 =09=09.test_func =3D handle_mmap,
-=09=09.msg =3D "MMAP: First LAM_U57, then High address.\n",
+=09=09.msg =3D "MMAP: First LAM, then High address.\n",
 =09},
 =09{
 =09=09.later =3D 0,
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.addr =3D LOW_ADDR,
 =09=09.test_func =3D handle_mmap,
-=09=09.msg =3D "MMAP: First LAM_U57, then Low address.\n",
+=09=09.msg =3D "MMAP: First LAM, then Low address.\n",
 =09},
 };
=20
 static struct testcases inheritance_cases[] =3D {
 =09{
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_inheritance,
-=09=09.msg =3D "FORK: LAM_U57, child process should get LAM mode same as p=
arent\n",
+=09=09.msg =3D "FORK: LAM, child process should get LAM mode same as paren=
t\n",
 =09},
 =09{
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_thread,
-=09=09.msg =3D "THREAD: LAM_U57, child thread should get LAM mode same as =
parent\n",
+=09=09.msg =3D "THREAD: LAM, child thread should get LAM mode same as pare=
nt\n",
 =09},
 =09{
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_thread_enable,
 =09=09.msg =3D "THREAD: [NEGATIVE] Enable LAM in child.\n",
 =09},
 =09{
 =09=09.expected =3D 1,
 =09=09.later =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_thread,
 =09=09.msg =3D "THREAD: [NEGATIVE] Enable LAM in parent after thread creat=
ed.\n",
 =09},
 =09{
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_TAG_BITS,
 =09=09.test_func =3D handle_execve,
-=09=09.msg =3D "EXECVE: LAM_U57, child process should get disabled LAM mod=
e\n",
+=09=09.msg =3D "EXECVE: LAM, child process should get disabled LAM mode\n"=
,
 =09},
 };
=20
@@ -1224,7 +1228,7 @@ int handle_pasid(struct testcases *test)
 =09=09if (tmp & 0x1) {
 =09=09=09/* run set lam mode*/
 =09=09=09if ((runed & 0x1) =3D=3D 0)=09{
-=09=09=09=09err =3D set_lam(LAM_U57_BITS);
+=09=09=09=09err =3D set_lam(LAM_TAG_BITS);
 =09=09=09=09runed =3D runed | 0x1;
 =09=09=09} else
 =09=09=09=09err =3D 1;
--=20
2.53.0


