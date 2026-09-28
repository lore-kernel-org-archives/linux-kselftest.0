Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328B2352034;
	Mon, 28 Sep 2026 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616455; cv=none; b=XwehDSi8uJjzMpdSQh/VO5CCxVONDZrULEwXDdOlvYl1T5MbmzE/EQmXwOcraY9UrQTjhOMJl76/OcRdxZ8yGUce7PGF4RvbFgWBrJ6B/VmWE8CsLX5I+SR4EbejUC30Obke7FNZayYDuqCyMaad6rdWhqpkY2DW+GjBnifibCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616455; c=relaxed/simple;
	bh=DREW0pnsHVnYIRYZJD9DChr73EUt3Hcbs4tKegeuVNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oERuX8OhrGNDJEbDOxABHlj4eKVV1txULdBkWfdrp8t3/MKEMb3U1bGKif1zPMt7BsXnzW0expWcxVy6H8//k8fpRZh4c6N6NsKT8dORw6KvNUzphj22OxxR91FXx3Rsjt5m4HDf7idQW2fLyiL0uGc5EbJmwzsZaeKT4nWPT94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMF4MzQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMF4MzQQ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 555441F000FF;
	Mon, 28 Sep 2026 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790616453;
	bh=bYY6SIuB38pNpvOXnuI019MieEUYiynUJJ9aqYbDrY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PMF4MzQQaBO1S123rLATz7lD7J/3S79MF4F1iuNOzs88eZr9hChaxqvOeeYV/q6PW
	 CUo5hRjsrTwhTnA9VFnZ/YLT1rAS/LLuWTfTi+r321ElD6RZFkwxvOrxqESVvkX2G/
	 rkXOaNGG/CUIhSvkIkBhNq/hbUZy8jgWYxVZc5ErX+du+7cruK/f9tYoyilePUgOuM
	 KTjDceMzVZVR/0cRH5EAtEZ4BIsNS5DJ6H7bv9NMP+b4dRzdsAFTzDG6a/jMebFu6R
	 K0J0VS5ArMRQARYfpVFXhnCwhQNfiF/fu+52s5O1LxcAOPLZuOzEVRHNJn2CzkyzZ0
	 ypIUc5Ir8JYuw==
From: Nicolas Schier <nsc@kernel.org>
Date: Mon, 28 Sep 2026 19:26:57 +0200
Subject: [PATCH v4 1/2] kbuild: Mark usr_gen_init_cpio as
 no-dot-config-target
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-move-gen_init_cpio-to-scripts-v4-1-f437a33c40ac@kernel.org>
References: <20260928-move-gen_init_cpio-to-scripts-v4-0-f437a33c40ac@kernel.org>
In-Reply-To: <20260928-move-gen_init_cpio-to-scripts-v4-0-f437a33c40ac@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Luis Augenstein <luis.augenstein@tngtech.com>, 
 Maximilian Huber <maximilian.huber@tngtech.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>, linux-doc@vger.kernel.org, 
 kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=DREW0pnsHVnYIRYZJD9DChr73EUt3Hcbs4tKegeuVNU=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBquqNnSXZkN50m/3I+6jr4xgQZQchL3CmlL4kEv
 i+EigEvgyaJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCarqjZwAKCRAHUgpwFiYS
 ae2zD/9RtzfbLSq2k0CTp9fSMzaHgvIq9PoA0g6ReAplrJoADU/2bqSjWLjJPd5c9RuqfuAHgp4
 fHW7Kc6on2hwnObtpbvt7w90j83hS1KOni88O9ez2ACmdmYyz7ZuQYbtDw0TqFgP3xz8lJVorTv
 vtsXQS/7bIVX4rhIY7CX41T6yc93jsVHgMOuXgyBjM/dPRWXJpWTysvgRBrDFRO9z+a9QEOJXiB
 V9cbYfZAGpdKHphXhOlXCpZG0tftpvv6FUv/ruB0VBSJS9WccGl8dZRdCrMnCHS5Yc3iqNxhuua
 GMIwwaxiHufFAFS3BDQOHfd27k0t18Kx3VT3hsam8a2bp+3Ic8uMWB15ZbCatgalDbIufOAt59R
 kR3fSmYKau1A52n8L7ChcSV8vFhkMBkNoclyibapUbreuliExvScTFXtUHPa9IBF/yYVsd/5NT0
 gjaYUihtoKQz0jzX7KZKLPzxAVLD8C7rCcHT6Wko6YgDFUJNSdPubrLbCreF5aRTFsZsUk1Ph+P
 yqJwaam6eZX2Q18p+BLbEvYPJg6A4PK1ryUh+4HRzeRAVwvhuE5uyRugm1ihl0VSC9JNfMrYudt
 jQoY9lo8YjCTd9IgJHWtd+H1IjcMhmG8we+W5Wui3EHheGGBmvXvWQoWIYhkrAKB+ly6TwAlCdV
 Jqz/BL+0xKqSI6g==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

Let usr/gen_init_cpio be built also if there is no kernel configuration.

Askar Safin reported that gen_init_cpio may be of use before any kernel
configuration is available.  Add usr_gen_init_cpio to list of targets
that do not require a .config file.

Reported-by: Askar Safin <safinaskar@gmail.com>
Closes: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com
Fixes: f8e05c10631e ("kbuild: Add top-level target for building gen_init_cpio")
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 751a08643bf85ccfd05060a3f574980f73b3a97f..51fada9059d68a92e6f5725e45ff9a594bfd9645 100644
--- a/Makefile
+++ b/Makefile
@@ -298,6 +298,7 @@ no-dot-config-targets := $(clean-targets) \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 dt_style_selftest \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
+			 usr_gen_init_cpio \
 			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name

-- 
2.47.3

