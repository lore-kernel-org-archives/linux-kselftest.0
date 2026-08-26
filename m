Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AC33AD526;
	Wed, 26 Aug 2026 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787726566; cv=none; b=pKSk7ghHG0UxfYVJO03oBZcfMkWdPPz40klM8wxj3MSV4Rv0EObA55CJ+pxdx/kNuPNf7mR1vO36m8D5plRAA4f2ebqzLW8y/gLeVexDBtGuaFvAjo/U8pYy6mhMk1BMYVMv70NgBthyg0bvBI5FQwVtumo4rK+JBzyw5vUPNaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787726566; c=relaxed/simple;
	bh=ucJaYL28wzn0yTSA4wbZcwdVARy600OU5xqruOvXIxs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=E6QkcrZrzAns3+ZqLYZ5y0Q2bEpNxYi7+jtawf1/V/ksxjdav4cecWECDE56q8YS2gyygVuwZvIO4KgBiJ2k3UujtUZe+tarBM/TAkxIhq7n21YgnQo+3tYiQKwD99h6RLe10HWQgEtbxxKdLiVRNYO5vxxkDtLhfbDUe0FgR3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=DHRKPQP4; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="DHRKPQP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787726559; bh=YUpYaXsq4mZSk10zKNzRlgByEYwJ8plN45XXrDI+0IM=;
	h=From:To:Cc:Subject:Date;
	b=DHRKPQP4h9iIy7Foz44tzZCZDBF3rNx2fzBgmo4xmHrxVgegHSEEHmPNRVMRtKa+/
	 01Djao1np9BwikzUYzn1I4N5v8hvEs9T/QpvBo8Z3ASKuYGmQg3NOWesTp3NW8DL7X
	 x9oQmOAA/owL0OP8uXufUNhQvzjhiXVU15E5JZFc=
Received: from omarchy.tailf00a51.ts.net ([2001:da8:d800:b00c:4e1d:96ff:fef0:ed21])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id A9D8585A; Wed, 26 Aug 2026 14:42:29 +0800
X-QQ-mid: xmsmtpt1787726549t1igdanys
Message-ID: <tencent_E313247AB9048C22740CE2A4C1A9FB04070A@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNzn45BTT3DW3UQls7PinerMEppsENTGy5OKbg8FQPM5cGJR7saNjy
	 HWIMBcrI7sb6yYYKzwf+sqzjSTitEPCBaMITHBDiU2xdhdHa9UiIgxCUkqH4dPqUC/GbKVWyjObr
	 oFVt0B8Fz664FWe8GhNkT44RKzvga2jTRixr+E+hWeeY5qCpoCyKbm4usJjCB45V8b6Wbtvq79Pl
	 GVDFW6VrMBv8cJ66Si+EUNiRnzVEvSFPlbalWGGrdoD3y5ERt5AcwAyd+iWyPzQt8OtywMkE8T+0
	 tRmkAgN1ZmJqm+X2Tv9832y9TYN5sMA/5WGLVKrIM1EcI/Kb3Kr23at1Xx+GDVw5982pmQc0mSim
	 Njrl8Q3L5Eo+S6yNcVm32mAU4wFY3Ow3M6cDEKoLWhPrhu/EhT17Ge2zMIaGaQtEsQMkSA8BEqrE
	 Y0gRxu5Hda/6Yx0Gq6Id+BwmfGJN2Tfa8Q0ZEXLWYrXpsMrsg0fu3Na4a1rQPBn20powol0WfvBt
	 JSf5dscQiDVcNI/TQCBTQTMkAapKhM/dYXhsul354d+GopEojv9p6Vi3wdJYqemXGfrsZ6AVLZ0r
	 e4CAHBu81klD8609VLR+D4SqmANQ3jtrW2mrkTdr4ZpAaR47ibAZi3xRg+APZCdjAicFe58ogq2r
	 DMltMS/24wxHlVh3v9K/EiAsT0BBc5qS1SrzLH3fJlMFIfvR8lnR132NJwvBLAJepDhoujzA/tBx
	 Qk+jIA9nM+iLnrXR0cIUs0YO3H8de3zEMtfWxeBt8vGh+V+NLYYjoMeDAyXzAQesxxaghOTgtBW8
	 Aa+UrzrdvX9NMd3UKsqRlT0D6YsDgYS3N6eCTfz/QV/Uw5ETuAP1r7nPyVAD6peTHkJorblSwqMf
	 qt7TVGPpfquFwtNrMPxLOn1GlcbuT5Kp1En3r+ygasyc40kZIloASN67tf7R73o98iTdzSTgh8Xn
	 WWfjKGWKDmv6X/aWpzBOmG66fcLK1akXN3aahLEI6MsC7dkV3GoF/ojKD0BEHH5evp6EC348bSCH
	 4tE+iTxO61lC7Z/SaAAKGwQO3jP1byWuoYwJvBaXrr5eKVeDuM
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: =?UTF-8?q?=E5=88=98=E6=80=9D=E5=AE=87?= <2028566723@qq.com>
To: kees@kernel.org,
	shuah@kernel.org
Cc: mic@digikod.net,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	2028566723@qq.com
Subject: [PATCH] selftests/exec: Fix check-exec-tests.sh with O=
Date: Wed, 26 Aug 2026 14:42:28 +0800
X-OQ-MSGID: <20260826064228.67490-1-2028566723@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running the exec selftests out-of-tree with O=,
check-exec-tests.sh is copied to the output directory without its
ktap_helpers.sh dependency. The script therefore fails to source the
helper and exits before emitting TAP output.

Add ktap_helpers.sh to TEST_INCLUDES so lib.mk copies it to the
out-of-tree layout.

Fixes: 2a69962be4a7 ("samples/check-exec: Add an enlighten "inc" interpreter and 28 tests")
Signed-off-by: 刘思宇 <2028566723@qq.com>
---
 tools/testing/selftests/exec/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
index b640af8f02b5..d16ad3d32770 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -16,6 +16,7 @@ TEST_GEN_PROGS_EXTENDED := false inc set-exec script-exec.inc script-noexec.inc
 TEST_GEN_FILES := execveat.symlink execveat.denatured script subdir
 # Makefile is a run-time dependency, since it's accessed by the execveat test
 TEST_FILES := Makefile
+TEST_INCLUDES := ../kselftest/ktap_helpers.sh
 
 TEST_GEN_PROGS += recursion-depth
 TEST_GEN_PROGS += null-argv

base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.55.0

