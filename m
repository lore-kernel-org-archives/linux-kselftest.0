Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341AA4E1C92;
	Fri, 25 Sep 2026 19:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364616; cv=none; b=NV0e5orEEIEjxYavd2U1oW20FWf8jpmJIl8nUEK0uwKg8FOtmGAQX2MfIQqVLSZzACZuOk+njvqSTHNNUk76EF2MSkpkAM5AsvXFTxzrf9MRNxx+kR4Nx76LiuwlEgstCOmvVBs9058vNzC0OfFi9JFbEPZ1VmTwU29AfRJZzrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364616; c=relaxed/simple;
	bh=zT252H2Ho87u3KEN3XgUGqqVJMLoiJ1cFQMrKMVc2VE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+lwRV7hgUKL7gqGGKUb60vrE/ONgqAsQmsGufVfn6nIwVBhNMC9IJlCw1TU/p/cPcGcY+bTPoXxgHIlyEGL8w78N4CVigLGODvUQuK1FX2BwpxzoYB2JYexwJgfHQUQ6Nkn8m5Doz9Tdwow1/5qUc1kiBuwH41Yt94pBwmHA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTC9Gu0M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTC9Gu0M"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8A2181F000FF;
	Fri, 25 Sep 2026 19:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790364615;
	bh=N33tIU6kIygB4VaarKLSX0TT1aLAq6k2sUWPy0f726s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RTC9Gu0MrN5Xg87sZMqOE0Z3mbbvQY0/9wA0REwAIJQdcozHOCmPqrGXEfGInvMkC
	 vX32v5/xhxgdPSfTFOrk2J3qPyMaNQeVq+OAkPbpleMRJoDbvyYP6ydAm/PpdaGU7Z
	 +XBumrWmscx+B+WlAKKHaP59v/u27QXVv8qofSvwtYfNxNm+nMSshYlJ7lK2WlPZH4
	 tJAaB0av7CXmY7daGxq4Js7rugJuxbwErPTYBAEOweudczvXFKeVJ3cwfXcHQc7utQ
	 PevrKWCKXJ2MRmTV/pcalcQH/20TbgV1S0xbmp//M83zqQsULTTUMAkbOKDMlQln2h
	 iaVcnYRKAVq1Q==
From: Nicolas Schier <nsc@kernel.org>
Date: Fri, 25 Sep 2026 21:29:30 +0200
Subject: [PATCH v3 1/2] kbuild: Mark usr_gen_init_cpio as
 no-dot-config-target
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-move-gen_init_cpio-to-scripts-v3-1-99c493f76722@kernel.org>
References: <20260925-move-gen_init_cpio-to-scripts-v3-0-99c493f76722@kernel.org>
In-Reply-To: <20260925-move-gen_init_cpio-to-scripts-v3-0-99c493f76722@kernel.org>
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
X-Mailer: b4 0.17-dev-1f2f7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=zT252H2Ho87u3KEN3XgUGqqVJMLoiJ1cFQMrKMVc2VE=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqtsufsfYeYT1sBDoLauwLKFoPXwsN6+APpXnyU
 o+A0B4KUOqJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCarbLnwAKCRAHUgpwFiYS
 aYOvD/4ygVvWdPjef/U4fr0RFblazzSSsOqSdO+uo2M7hgRgpunel7QTDmY72T8zjdamYOj0Thc
 6h6zpfP5PJXV3NQY2CW+2iYMtEieWxmXjAYuC6TrZfUiIbtbDiia4da5fD9j5tH1UVpAzX3+CRe
 BktrH22N6MU37cUWzryZ3AK1h2RM8WZWsaV8dotOtuak7tv0aR25fkOXyK+05O3ZLWA0croK5I+
 syqnd5BB7nyb4J9Ru1KWd+DWIEXg7ZUZ6HOuWvDF/Y0JOpl33FZdo8iDHhmvcljfqVNqr4Mbm2B
 Z5uU+gGmcluYOGdxsNZZI0y86+WPKfC7CVaxa3jtpFH/JQncKx7VGMlZpGEUh9PJszty+qe+d+S
 zmPmUO8OQjkxNHKbf/S99ihrfMouqV5PgjvAkfuHQ6cUPUEYApm339iJzGqkI/nUAGPrn+rQzeY
 zcXnYa+PBq94VZpo53cAFdl+P9U5cCLuCap7GfGDVdCVORjSPZNYAO/0OS8z+qz+L+Fu+BNjkHK
 lBoAHwFGmpBMXvY9oSSpWKaU5rKzwNfckSVkJ+GkNq8ZobeFjQiG7xMHRy1efPx+7eFGb2APolg
 tsKvJUd3i1eHI7PyZxr6P6ugoRT0r8ppOLfXU2rmh7dY3ZVdaqfMJPUGPTXs2sBqs+6Y1aSjxY6
 bh31QprBv3oFASg==
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
index 751a08643bf8..51fada9059d6 100644
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

