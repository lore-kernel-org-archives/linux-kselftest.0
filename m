Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD02344DA0
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771591755; cv=none; b=STKUn/0rUtni1NpTIriCqVzlwGDzIBonN4MaAp1IqaI8EoP/g0DrMenGbCt2Pvo7uxsSi7++cL3Xucs/prcJk6xPBQ5bLz2ubjJxw0vzTxFRAkURlSsBWfxDJXCOJzq0ALB2jMjhCxSWTR5iKUERRKjWnKHUka0ryr5VNghlLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771591755; c=relaxed/simple;
	bh=Key36d9CQNDC2jdXVq+xiTTel29uUeOXeIWgO+AuEUM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MF6J/GFLJtcaxcao0WzhJkF+4MuDbq/qXevXinxWpYAZhLvuygX6kLx34FhtwGcz2u1xCE6Ft5wmsFu4AC0KMH0vFLouE+ov5nHrrewBWOyJBKHe3ERMzJYMesoOFHlpMqF1NGuA36L+ZL3Q/kfQGEeXCskRfzMGad4jXVLNza4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=LLvUpuPR; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="LLvUpuPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771591751; x=1771850951;
	bh=TOcZfslwyOLnqfStp7w1Zf0CKilK3beX2XrqjjIDxw4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LLvUpuPRtmw8ZnCiefPGWoDUT1Q/+TAKNXLz3ErxU0c1r1vBYz+nRxyzxqDSZ/W3u
	 Jpr0Ox6KLC1k5WWq4pR/g+lFUbsmkEy5e182ZBSN4kIb1KJjRkJw97aQYko3KEXmI8
	 Yiwo7YziEU4755+lLMtNJRe2itocjkRGQrvybJECNTxPKobz9PP27oZlyyMosw3Gz5
	 4T9q6FZLm7FifHDuKav8au3KkvvrpuQAppIYVZ+InxEQngf4DlT9V8iWDkkokKn41D
	 zUJPeAbcoJqhGC9j+p/aI9oZd7dsBWdFOWVX29fpiq3WjJg44AEDq8E0NmKO12q5Ln
	 Rnkhu9RKU1SdA==
Date: Fri, 20 Feb 2026 12:49:01 +0000
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v1 4/4] selftests/lam: Add test cases for different LAM tag widths
Message-ID: <8b604b5ec11051437940fb0537ab4c2ed6bb5bb4.1771589807.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1771589807.git.m.wieczorretman@pm.me>
References: <cover.1771589807.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 26fbcd654c44720f93558be50b48fe99bae1ef41
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
bits, it's still possible to enable 6 bit wide tags for debug purposes
through debugfs.

When a program enables LAM, it should be able to, through a syscall,
request a number of tag bits equal or smaller to the one used system
wide. If it requests a smaller one it should receive the system wide
setting anyway.

Change the default tag width. Add four tests to check all combinations
of tag width requests. Modify the existing test infrastructure to check
with a syscall what the needed tag width actually is.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 tools/testing/selftests/x86/lam.c | 87 ++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x8=
6/lam.c
index 1919fa6daec0..9ed2964082eb 100644
--- a/tools/testing/selftests/x86/lam.c
+++ b/tools/testing/selftests/x86/lam.c
@@ -26,9 +26,11 @@
=20
 /* LAM modes, these definitions were copied from kernel code */
 #define LAM_NONE                0
-#define LAM_U57_BITS            6
+#define LAM_U57_BITS            4
+#define LAM_MAX_BITS            6
=20
-#define LAM_U57_MASK            (0x3fULL << 57)
+#define LAM_U57_MASK            (0xfULL << 57)
+#define LAM_MAX_MASK            (0x3fULL << 57)
 /* arch prctl for LAM */
 #define ARCH_GET_UNTAG_MASK     0x4001
 #define ARCH_ENABLE_TAGGED_ADDR 0x4002
@@ -175,7 +177,7 @@ static int set_lam(unsigned long lam)
 =09int ret =3D 0;
 =09uint64_t ptr =3D 0;
=20
-=09if (lam !=3D LAM_U57_BITS && lam !=3D LAM_NONE)
+=09if (lam !=3D LAM_U57_BITS && lam !=3D LAM_MAX_BITS && lam !=3D LAM_NONE=
)
 =09=09return -1;
=20
 =09/* Skip check return */
@@ -184,16 +186,21 @@ static int set_lam(unsigned long lam)
 =09/* Get untagged mask */
 =09syscall(SYS_arch_prctl, ARCH_GET_UNTAG_MASK, &ptr);
=20
+=09/* Update lam in case lam6 is enabled */
+=09syscall(SYS_arch_prctl, ARCH_GET_MAX_TAG_BITS, &lam);
+
 =09/* Check mask returned is expected */
 =09if (lam =3D=3D LAM_U57_BITS)
 =09=09ret =3D (ptr !=3D ~(LAM_U57_MASK));
+=09else if (lam =3D=3D LAM_MAX_BITS)
+=09=09ret =3D (ptr !=3D ~(LAM_MAX_MASK));
 =09else if (lam =3D=3D LAM_NONE)
 =09=09ret =3D (ptr !=3D -1ULL);
=20
 =09return ret;
 }
=20
-static unsigned long get_default_tag_bits(void)
+static unsigned long get_default_tag_bits(int bits)
 {
 =09pid_t pid;
 =09int lam =3D LAM_NONE;
@@ -204,8 +211,8 @@ static unsigned long get_default_tag_bits(void)
 =09=09perror("Fork failed.");
 =09} else if (pid =3D=3D 0) {
 =09=09/* Set LAM mode in child process */
-=09=09if (set_lam(LAM_U57_BITS) =3D=3D 0)
-=09=09=09lam =3D LAM_U57_BITS;
+=09=09if (set_lam(bits) =3D=3D 0)
+=09=09=09syscall(SYS_arch_prctl, ARCH_GET_MAX_TAG_BITS, &lam);
 =09=09else
 =09=09=09lam =3D LAM_NONE;
 =09=09exit(lam);
@@ -217,6 +224,27 @@ static unsigned long get_default_tag_bits(void)
 =09return lam;
 }
=20
+static int change_lam_width(unsigned char width)
+{
+=09char buf[2];
+=09int ret, fd;
+
+=09snprintf(buf, sizeof(buf), "%u", width);
+=09fd =3D open("/sys/kernel/debug/x86/lam_available_bits", O_WRONLY);
+=09if (fd < 0) {
+=09=09ksft_print_msg("lam_available_bits debug file not found!\n");
+=09=09return fd;
+=09}
+
+=09ret =3D write(fd, buf, sizeof(buf));
+=09if (ret < 0)
+=09=09return ret;
+
+=09close(fd);
+
+=09return 0;
+}
+
 /*
  * Set tagged address and read back untag mask.
  * check if the untag mask is expected.
@@ -284,20 +312,32 @@ static int handle_lam_test(void *src, unsigned int la=
m)
 =09return (!!strcmp((char *)src, (char *)ptr));
 }
=20
-
 int handle_max_bits(struct testcases *test)
 {
-=09unsigned long exp_bits =3D get_default_tag_bits();
-=09unsigned long bits =3D 0;
+=09unsigned long exp_bits, bits =3D 0;
+=09int ret =3D 1;
=20
-=09if (exp_bits !=3D LAM_NONE)
-=09=09exp_bits =3D LAM_U57_BITS;
+=09if (test->later) {
+=09=09ret =3D change_lam_width(LAM_MAX_BITS);
+=09=09if (ret)
+=09=09=09return ret;
+=09}
+
+=09exp_bits =3D get_default_tag_bits(test->lam);
=20
 =09/* Get LAM max tag bits */
 =09if (syscall(SYS_arch_prctl, ARCH_GET_MAX_TAG_BITS, &bits) =3D=3D -1)
-=09=09return 1;
+=09=09goto out;
=20
-=09return (exp_bits !=3D bits);
+=09ret =3D exp_bits !=3D bits;
+out:
+=09if (test->later) {
+=09=09ret =3D change_lam_width(LAM_U57_BITS);
+=09=09if (ret)
+=09=09=09return ret;
+=09}
+
+=09return ret;
 }
=20
 /*
@@ -968,9 +1008,30 @@ static struct testcases malloc_cases[] =3D {
=20
 static struct testcases bits_cases[] =3D {
 =09{
+=09=09.later =3D 0,
+=09=09.lam =3D LAM_U57_BITS,
 =09=09.test_func =3D handle_max_bits,
 =09=09.msg =3D "BITS: Check default tag bits\n",
 =09},
+=09{
+=09=09.later =3D 1,
+=09=09.lam =3D LAM_U57_BITS,
+=09=09.test_func =3D handle_max_bits,
+=09=09.msg =3D "BITS: Check if 4 bits can be requested in 6 bit mode.\n",
+=09},
+=09{
+=09=09.later =3D 0,
+=09=09.expected =3D 1,
+=09=09.lam =3D LAM_MAX_BITS,
+=09=09.test_func =3D handle_max_bits,
+=09=09.msg =3D "BITS:[Negative] Check if 6 bits can be requested in 4 bit =
mode.\n",
+=09},
+=09{
+=09=09.later =3D 1,
+=09=09.lam =3D LAM_MAX_BITS,
+=09=09.test_func =3D handle_max_bits,
+=09=09.msg =3D "BITS: Check if 6 bits can be requested in 6 bit mode.\n",
+=09},
 };
=20
 static struct testcases syscall_cases[] =3D {
--=20
2.53.0


