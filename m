Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D79A3EBF33
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314682; cv=none; b=V1wvsNDCjRd275dJ57qEyN2gHEI9tJraHrJy0rTg7OUgM7tiR31FR2uTxztRI63v40tM0SrxI6c2lN1qd4rIXxxnT5ootaDiGPLlAZv85Lrd8hRQwunOMVZTRYskNBX5gWDpga4yyBfcqn3WIrEyFIkj9DRHwajAxK+Gl1fvswI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314682; c=relaxed/simple;
	bh=cabsWImOrTfadEvXIKkGEu46ZFIbjUR+jCHHWZS1nFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hpo+0K3ZlOrlaDnJ3zA6QFPLvLpcifWgiqyS89eDreSfHgifnD22+ZsBR9AWYCq7xrrqrj8Aab/Rn7Pz9ZrDRL5cjQMpg+0CoBdW4OArmhhPlnZKNpwat9FF3udQ9Nn1MROVer3l+NOdIPh444IqTklk4ouSbC5ZHBSv7zEj+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DS2xoav6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DS2xoav6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so56292985e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777314680; x=1777919480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSv7mvHEKazo1ADkBY1eKHJ65hhcoj1auW86Wb7XPbw=;
        b=DS2xoav6lvwb9x9e3FcavzXeNTDLCQQYvlQZs5NK1rdd1r59M1/+LcE3yQZrCse77l
         Br5/a59/Bw7fIyMMn5iI9wSj6/aKFhEiNmfKFlKAO2cmNlZePC5NZK3JShBC+QTvGmdM
         SZ/yif5Wm6V5hzYOssVD356sm71Amac+/x4VKkoix/O9sTUVAI+NrxL1VbV5Gxy5A/zM
         TeAFmYKpcc/Af9kSec7V7HFqBmhgpO8EzLvwj37TUdLiMw4enn8KTfwu8pjhYgPNo8yr
         Afq5kreRiLepPyaRj4cbWpMnwODSNPhUd1JLuNXQunmfFgLM0/rP6RAyVwj/sbCN3meg
         MiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314680; x=1777919480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZSv7mvHEKazo1ADkBY1eKHJ65hhcoj1auW86Wb7XPbw=;
        b=X7pagKb4PcT20o1BO+NvMhog4bytGbe/tsqIKPQT67g7/77mtrCckZVi6cW6bbaJpQ
         gcbEJPxIdRijPO4VZ2zsYY9cCy5ydKOiptVn30bcZjEFTnuCzdOM5Gscg13mKx9Dsyu5
         wGLPlP4CR6oSlQixnpbyMdSzvjgWi1JSgcKzyT3wZLFuje4S5PV2A15lOuqwYhwNrWjJ
         lXHrXvf62O8r7C4E5/pEzdZc6ipq0MbFwgNHy0sw8DzovicbY5/EaJjGHXirejIm4rm8
         n6GSy2ON+3wZ2KJwXwdALikVbR4Z73I1YfU0fFrexnu1a9ERrgCKCxu8HnnlCNp2HPoK
         0p5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/1eLSqdUKsYYS8iFoRDeoZkxlvUWTQafioAZduKT4dLKPEmJo30PD7uaVaFNqFiLkVZCeszVsXeK41K449Pbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGk2yeA4/ddSlD+F0C1M6WprVwKln+hyr12Pd8BQyvhS/CfN3V
	cSqB7cGzQkh7yswpsvcR3lTCNUvn5elusWw81CatL2mCFPYE8U2rFNkFDsjRsrZ0RlB7Png1yhc
	R3pnG9d4=
X-Gm-Gg: AeBDiesKbmx9o/GN0pQsnKSIX+k5Vz2VhBeLi7jAyoy17Xym1ixuxWs7Eravpt9ELcE
	dm+SCxfw6DC/JuSx75jCIJlj251KirqAAY2WKVeoEblu8+I0upSAjSX2VyQhZYmsSDlfwW3sSFN
	JrQ5HWNwyYoNuGqOf8XadsU92JUxZWD2IGYnoOBaK36wAPzKvmD9s8BmXyYCz/pa/8vl4qIWkt3
	hBX+LgL7t+8QCsfuxEVRWI4jFTrOaanxY9FVZua7UtlkSPVb1ILkdjYfnbATrXgJI8WgshuWtyd
	FZnIGZZiaG/H9KIk2EwcChoko7CNcD7i3Cc/yEHolGtu9v2w2sOjgkPwxeZnOxO0O9aAx8kDvJ7
	n5sZDdJ1Nl7usj6dsuruS1GnG4Ug7knON287mmdN2ygT6kQwzazkjZUrk7aFGuEGMQHq0jKma0E
	H4y4lvjpWqKsxGhUIQS6cBv/HY3EegOivF0w==
X-Received: by 2002:a05:600c:2e4c:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-48a77635c61mr1553295e9.6.1777314679620;
        Mon, 27 Apr 2026 11:31:19 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7749cabdsm1182065e9.9.2026.04.27.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:31:19 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 27 Apr 2026 15:31:00 -0300
Subject: [PATCH v3 4/6] selftests: livepatch: Check if patched sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-lp-tests-old-fixes-v3-4-ccf3c90f744c@suse.com>
References: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
In-Reply-To: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777314662; l=3506;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=cabsWImOrTfadEvXIKkGEu46ZFIbjUR+jCHHWZS1nFI=;
 b=RtWCyDoZ0CDWVtPSx0XGCigfMLI0Lb5+rOa/9wKam/t4YGJk/K8YQBnkY4lt+BILQ/S6deQd5
 3YeSCj30LdiCXyvcQMn6XyU+TV/k7AU928KD1L1SAMjFi78o5EmD2J7
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The commit bb26cfd9e77e
("livepatch: add sysfs entry "patched" for each klp_object") was merged
in v6.1, introducing a new sysfs attribute.

In order to run the selftests on older kernels, check if given kernel
has support for the attribute. If the attribute is not supported, skip
the checks.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-sysfs.sh | 38 +++++++++++++++----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 58fe1d96997c..394cf3ff99cd 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -8,6 +8,8 @@ MOD_LIVEPATCH=test_klp_livepatch
 MOD_LIVEPATCH2=test_klp_callbacks_demo
 MOD_LIVEPATCH3=test_klp_syscall
 
+HAS_PATCH_ATTR=0
+
 setup_config
 
 # - load a livepatch and verifies the sysfs entries work as expected
@@ -25,8 +27,12 @@ check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "transition" "0"
-check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "vmlinux/patched" "1"
+
+if does_sysfs_exist "$MOD_LIVEPATCH/vmlinux" "patched"; then
+	check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
+	check_sysfs_value  "$MOD_LIVEPATCH" "vmlinux/patched" "1"
+	HAS_PATCH_ATTR=1
+fi
 
 disable_lp $MOD_LIVEPATCH
 
@@ -45,23 +51,24 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 
-start_test "sysfs test object/patched"
+if [[ "$HAS_PATCH_ATTR" == "1" ]]; then
+	start_test "sysfs test object/patched"
 
-MOD_LIVEPATCH=test_klp_callbacks_demo
-MOD_TARGET=test_klp_callbacks_mod
-load_lp $MOD_LIVEPATCH
+	MOD_LIVEPATCH=test_klp_callbacks_demo
+	MOD_TARGET=test_klp_callbacks_mod
+	load_lp $MOD_LIVEPATCH
 
-# check the "patch" file changes as target module loads/unloads
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
-load_mod $MOD_TARGET
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "1"
-unload_mod $MOD_TARGET
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
+	# check the "patch" file changes as target module loads/unloads
+	check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
+	load_mod $MOD_TARGET
+	check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "1"
+	unload_mod $MOD_TARGET
+	check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
 
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
+	disable_lp $MOD_LIVEPATCH
+	unload_lp $MOD_LIVEPATCH
 
-check_result "% insmod test_modules/test_klp_callbacks_demo.ko
+	check_result "% insmod test_modules/test_klp_callbacks_demo.ko
 livepatch: enabling patch 'test_klp_callbacks_demo'
 livepatch: 'test_klp_callbacks_demo': initializing patching transition
 test_klp_callbacks_demo: pre_patch_callback: vmlinux
@@ -87,6 +94,7 @@ livepatch: 'test_klp_callbacks_demo': completing unpatching transition
 test_klp_callbacks_demo: post_unpatch_callback: vmlinux
 livepatch: 'test_klp_callbacks_demo': unpatching complete
 % rmmod test_klp_callbacks_demo"
+fi
 
 start_test "sysfs test replace enabled"
 

-- 
2.54.0

