Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD43FB06B;
	Mon,  2 Mar 2026 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465715; cv=none; b=uRROnmOMQ32HKgHaBCiS4grTm7VkXVUlVYnDZxNGP5ljatW+EIy8XY3492mh21zeh27lhnqAdH6c6xxC9B5zjH+vZK9tBRrSSvztfSyNtD+OYAkkXiHoZVrFLk6kMq4gvoQFrXSmZ+fF6e1OfLLPFPDA5dZQfPvxcZEqAh1bCmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465715; c=relaxed/simple;
	bh=V+LNXsXOHKt3EuWsssm3765WRGWiyJ+ep2LC3/3pV64=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4RixDIUkGQDWcCUFsyfwWzFjBhBAJaNbdL7xh1O+RnvdGsh8LE23p/blX6+j37zXgNDqE8ZtHW+/oAqjmWbQsxsTjH/98SBYDZWFiWR96XyOz5YpBMU4ZUEjxUZoWuy6eyeABX0jgp//sB7mm591C4bIYW2MBYCJOAbwecge50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JvJxCsc7; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="JvJxCsc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772465711; x=1772724911;
	bh=Ls78EiQXIyqbG4RhJ8iCingmqRLVnCcv62L4JbYTdKM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JvJxCsc7XOhhqtKbRgaAX6ezOKuuBaDGEji41qAuCY6DPgwo9QlFpmj6Lz4otAiVW
	 Ifuavq3yJaOj4ARrDVP65sHhSlyeF2NMNgkdm7odE6YqWfsoTDCkL56RF8duzWCvJk
	 GiD3dFVcCr0gGmLnCbfo4WFiKF4WR0rMvZ6kysNZ+Gk71uiFic4ai7yh3xEk/lsFGK
	 tIQh90HGCeW9lVBnDBtXl705sGtiPP7YSZp1hFo8ppvQcW7PYaVzyBH+O3NKz2RkKA
	 hkVqLXQcA8wPTzHCjRAGb61iTE42xaGubeHR8f+YOmYVxqersfDWHG2Tz32jGe+Csj
	 Sxv17N/WVfydw==
Date: Mon, 02 Mar 2026 15:35:05 +0000
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v3 3/3] selftests/lam: Add test cases for different LAM tag widths
Message-ID: <954217ee970deb94d5e11d1260fc885732f6b1dd.1772465456.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1772465456.git.m.wieczorretman@pm.me>
References: <cover.1772465456.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 09891961c6297dc0df6c16095e88f03339a858bb
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

After the default tag width in LAM (Linear Address Masking) is set to 4
bits, the value isn't strictly related to the CPU features like LAM_U57
or LAM_U48. To emphasise this, remove mentions of _U57 from the selftest
and update the bit width.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v3:
- Redo the patch after the removal of the debugfs part.

 tools/testing/selftests/x86/lam.c | 86 +++++++++++++++----------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x8=
6/lam.c
index 1919fa6daec0..d8f75387b931 100644
--- a/tools/testing/selftests/x86/lam.c
+++ b/tools/testing/selftests/x86/lam.c
@@ -26,9 +26,9 @@
=20
 /* LAM modes, these definitions were copied from kernel code */
 #define LAM_NONE                0
-#define LAM_U57_BITS            6
+#define LAM_BITS                4
=20
-#define LAM_U57_MASK            (0x3fULL << 57)
+#define LAM_MASK                (0xfULL << 57)
 /* arch prctl for LAM */
 #define ARCH_GET_UNTAG_MASK     0x4001
 #define ARCH_ENABLE_TAGGED_ADDR 0x4002
@@ -175,7 +175,7 @@ static int set_lam(unsigned long lam)
 =09int ret =3D 0;
 =09uint64_t ptr =3D 0;
=20
-=09if (lam !=3D LAM_U57_BITS && lam !=3D LAM_NONE)
+=09if (lam !=3D LAM_BITS && lam !=3D LAM_NONE)
 =09=09return -1;
=20
 =09/* Skip check return */
@@ -185,8 +185,8 @@ static int set_lam(unsigned long lam)
 =09syscall(SYS_arch_prctl, ARCH_GET_UNTAG_MASK, &ptr);
=20
 =09/* Check mask returned is expected */
-=09if (lam =3D=3D LAM_U57_BITS)
-=09=09ret =3D (ptr !=3D ~(LAM_U57_MASK));
+=09if (lam =3D=3D LAM_BITS)
+=09=09ret =3D (ptr !=3D ~(LAM_MASK));
 =09else if (lam =3D=3D LAM_NONE)
 =09=09ret =3D (ptr !=3D -1ULL);
=20
@@ -204,8 +204,8 @@ static unsigned long get_default_tag_bits(void)
 =09=09perror("Fork failed.");
 =09} else if (pid =3D=3D 0) {
 =09=09/* Set LAM mode in child process */
-=09=09if (set_lam(LAM_U57_BITS) =3D=3D 0)
-=09=09=09lam =3D LAM_U57_BITS;
+=09=09if (set_lam(LAM_BITS) =3D=3D 0)
+=09=09=09lam =3D LAM_BITS;
 =09=09else
 =09=09=09lam =3D LAM_NONE;
 =09=09exit(lam);
@@ -230,8 +230,8 @@ static int get_lam(void)
 =09=09return -1;
=20
 =09/* Check mask returned is expected */
-=09if (ptr =3D=3D ~(LAM_U57_MASK))
-=09=09ret =3D LAM_U57_BITS;
+=09if (ptr =3D=3D ~(LAM_MASK))
+=09=09ret =3D LAM_BITS;
 =09else if (ptr =3D=3D -1ULL)
 =09=09ret =3D LAM_NONE;
=20
@@ -247,10 +247,10 @@ static uint64_t set_metadata(uint64_t src, unsigned l=
ong lam)
 =09srand(time(NULL));
=20
 =09switch (lam) {
-=09case LAM_U57_BITS: /* Set metadata in bits 62:57 */
+=09case LAM_BITS: /* Set metadata in bits 62:57 */
 =09=09/* Get a random non-zero value as metadata */
-=09=09metadata =3D (rand() % ((1UL << LAM_U57_BITS) - 1) + 1) << 57;
-=09=09metadata |=3D (src & ~(LAM_U57_MASK));
+=09=09metadata =3D (rand() % ((1UL << LAM_BITS) - 1) + 1) << 57;
+=09=09metadata |=3D (src & ~(LAM_MASK));
 =09=09break;
 =09default:
 =09=09metadata =3D src;
@@ -291,7 +291,7 @@ int handle_max_bits(struct testcases *test)
 =09unsigned long bits =3D 0;
=20
 =09if (exp_bits !=3D LAM_NONE)
-=09=09exp_bits =3D LAM_U57_BITS;
+=09=09exp_bits =3D LAM_BITS;
=20
 =09/* Get LAM max tag bits */
 =09if (syscall(SYS_arch_prctl, ARCH_GET_MAX_TAG_BITS, &bits) =3D=3D -1)
@@ -719,8 +719,8 @@ int do_uring(unsigned long lam)
 =09=09=09uint64_t addr =3D ((uint64_t)fi->iovecs[i].iov_base);
=20
 =09=09=09switch (lam) {
-=09=09=09case LAM_U57_BITS: /* Clear bits 62:57 */
-=09=09=09=09addr =3D (addr & ~(LAM_U57_MASK));
+=09=09=09case LAM_BITS: /* Clear bits 62:57 */
+=09=09=09=09addr =3D (addr & ~(LAM_MASK));
 =09=09=09=09break;
 =09=09=09}
 =09=09=09free((void *)addr);
@@ -937,14 +937,14 @@ static void run_test(struct testcases *test, int coun=
t)
 static struct testcases uring_cases[] =3D {
 =09{
 =09=09.later =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_uring,
-=09=09.msg =3D "URING: LAM_U57. Dereferencing pointer with metadata\n",
+=09=09.msg =3D "URING: LAM. Dereferencing pointer with metadata\n",
 =09},
 =09{
 =09=09.later =3D 1,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_uring,
 =09=09.msg =3D "URING:[Negative] Disable LAM. Dereferencing pointer with m=
etadata.\n",
 =09},
@@ -953,14 +953,14 @@ static struct testcases uring_cases[] =3D {
 static struct testcases malloc_cases[] =3D {
 =09{
 =09=09.later =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_malloc,
-=09=09.msg =3D "MALLOC: LAM_U57. Dereferencing pointer with metadata\n",
+=09=09.msg =3D "MALLOC: LAM. Dereferencing pointer with metadata\n",
 =09},
 =09{
 =09=09.later =3D 1,
 =09=09.expected =3D 2,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_malloc,
 =09=09.msg =3D "MALLOC:[Negative] Disable LAM. Dereferencing pointer with =
metadata.\n",
 =09},
@@ -976,41 +976,41 @@ static struct testcases bits_cases[] =3D {
 static struct testcases syscall_cases[] =3D {
 =09{
 =09=09.later =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_syscall,
-=09=09.msg =3D "SYSCALL: LAM_U57. syscall with metadata\n",
+=09=09.msg =3D "SYSCALL: LAM. syscall with metadata\n",
 =09},
 =09{
 =09=09.later =3D 1,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_syscall,
 =09=09.msg =3D "SYSCALL:[Negative] Disable LAM. Dereferencing pointer with=
 metadata.\n",
 =09},
 =09{
 =09=09.later =3D GET_USER_USER,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D get_user_syscall,
 =09=09.msg =3D "GET_USER: get_user() and pass a properly tagged user point=
er.\n",
 =09},
 =09{
 =09=09.later =3D GET_USER_KERNEL_TOP,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D get_user_syscall,
 =09=09.msg =3D "GET_USER:[Negative] get_user() with a kernel pointer and t=
he top bit cleared.\n",
 =09},
 =09{
 =09=09.later =3D GET_USER_KERNEL_BOT,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D get_user_syscall,
 =09=09.msg =3D "GET_USER:[Negative] get_user() with a kernel pointer and t=
he bottom sign-extension bit cleared.\n",
 =09},
 =09{
 =09=09.later =3D GET_USER_KERNEL,
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D get_user_syscall,
 =09=09.msg =3D "GET_USER:[Negative] get_user() and pass a kernel pointer.\=
n",
 =09},
@@ -1020,60 +1020,60 @@ static struct testcases mmap_cases[] =3D {
 =09{
 =09=09.later =3D 1,
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.addr =3D HIGH_ADDR,
 =09=09.test_func =3D handle_mmap,
-=09=09.msg =3D "MMAP: First mmap high address, then set LAM_U57.\n",
+=09=09.msg =3D "MMAP: First mmap high address, then set LAM.\n",
 =09},
 =09{
 =09=09.later =3D 0,
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.addr =3D HIGH_ADDR,
 =09=09.test_func =3D handle_mmap,
-=09=09.msg =3D "MMAP: First LAM_U57, then High address.\n",
+=09=09.msg =3D "MMAP: First LAM, then High address.\n",
 =09},
 =09{
 =09=09.later =3D 0,
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
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
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_inheritance,
-=09=09.msg =3D "FORK: LAM_U57, child process should get LAM mode same as p=
arent\n",
+=09=09.msg =3D "FORK: LAM, child process should get LAM mode same as paren=
t\n",
 =09},
 =09{
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_thread,
-=09=09.msg =3D "THREAD: LAM_U57, child thread should get LAM mode same as =
parent\n",
+=09=09.msg =3D "THREAD: LAM, child thread should get LAM mode same as pare=
nt\n",
 =09},
 =09{
 =09=09.expected =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_thread_enable,
 =09=09.msg =3D "THREAD: [NEGATIVE] Enable LAM in child.\n",
 =09},
 =09{
 =09=09.expected =3D 1,
 =09=09.later =3D 1,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_thread,
 =09=09.msg =3D "THREAD: [NEGATIVE] Enable LAM in parent after thread creat=
ed.\n",
 =09},
 =09{
 =09=09.expected =3D 0,
-=09=09.lam =3D LAM_U57_BITS,
+=09=09.lam =3D LAM_BITS,
 =09=09.test_func =3D handle_execve,
-=09=09.msg =3D "EXECVE: LAM_U57, child process should get disabled LAM mod=
e\n",
+=09=09.msg =3D "EXECVE: LAM, child process should get disabled LAM mode\n"=
,
 =09},
 };
=20
@@ -1224,7 +1224,7 @@ int handle_pasid(struct testcases *test)
 =09=09if (tmp & 0x1) {
 =09=09=09/* run set lam mode*/
 =09=09=09if ((runed & 0x1) =3D=3D 0)=09{
-=09=09=09=09err =3D set_lam(LAM_U57_BITS);
+=09=09=09=09err =3D set_lam(LAM_BITS);
 =09=09=09=09runed =3D runed | 0x1;
 =09=09=09} else
 =09=09=09=09err =3D 1;
--=20
2.53.0


