Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C568F3769F4
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 12:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315506; cv=none; b=Bd/C8oBl4czOUWzRXEduqMUvFk1hzVDH9Hu8cA2vMKktJV5Mr7RugC10IWHXC1jtDkjtCHRIS8SraHC4QgBfgK4bskLgS8UVDkG8q0efvNuuuP0nT1GF2nRm0NvekxyONvU1OmQ7paSQce5XpPCLUHgxX90THFWmgFJXjNp2DDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315506; c=relaxed/simple;
	bh=/BEze5uZvE97vkdxdEKscGQmmLTlvHt75B8/b2suPbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKVMsiLH8A0OPWPW7eUgGoyMVpqVNiu/AOYm0oob3gW3QuIX+dVXTtiQEiUGAwiFHgWuK2M+Pmv5pyv1XAF5svE/WoVHwVoOJ7jf7gqLy9u1SSJOmdeeTKapjbL8nFCL6ZQaxKYejx//p0ynGv9OcZH8qHjKQJWdOvQPjeFfMvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8ZaUJTl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8ZaUJTl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso91143655e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 05:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315501; x=1780920301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwPLhLRZkxVDbJ+XZfxPTCPSMzzunTFiSNGj95FvoLA=;
        b=X8ZaUJTlJSmPN5Lp2+drVg+Y8VYUe7hHrC2s+iTm+6b4FkIO3e6P2MkXYFG1ec5KlY
         ax4/vFi6P0aGj3O8nnMSeex2hpAdOHlcrqHv3ZNuIoyK2/zhaeRHWAkasCfVhInfCFGJ
         Xj9BZ6YzVEawtEvRcUXbD9zF34F+Ck+RkNQRStqsHaVOCYdTjXS+6695GvJDdADA7YD/
         lDUVbLfNMcwbgBoLEw6LIXuqutA1Gjp5RmrMybocMbhC9NrhCNcNfvCjSEvykrrs7iAK
         WVSWuxl/WBD86kovAd6lMwp0DBI9Vc2itChVue2CNMo2htHRhaViBUSGYQdthbdgdCnm
         z2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315501; x=1780920301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CwPLhLRZkxVDbJ+XZfxPTCPSMzzunTFiSNGj95FvoLA=;
        b=r4TUQF7VwmdoSCSLF+KrkQkJ9RdHPuWGSAOmPf7OqDHwlIGpqPy/vCn9FEF+wuYuNr
         gjXywt/JfNyffZty7IGEjqojblRgcZaLOtBOzzYoqkavm9mauYCr5mXEThRWuWcXRaBG
         /CG3gpWkzbD8JjR2JxnxQRI+IkrOnfO9sLrFMnQymVCescDLsNuC+QhvtCOqtu5sv8NR
         q8c5haGoC9JcSsMWGepxkCKV67Mbp9ny858JePEbABiB6cgLj6W0v0s/bkLguTfWkftu
         7lsk99f39L2wAA1OayhH3j2t3QJUNOsalOJzKrVKKFphQY/+UIJyh8SIyYJcnyZRKgh0
         Kn1A==
X-Forwarded-Encrypted: i=1; AFNElJ8TnilpMW8pDzGjYWv3usAS+/5AN1usvOIizpPKls0Av2w9Kz6tSG75jNlUbEApIk/TZrHvTZ8q4Jy5DPt0Ztk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3+KBJhDs3kJE4Ethf6NosOjvV5B3Dth1w0sd3w4beAFFSpDe7
	s0gBXWZ+xaxsckNr0+FFoTnO+S0joaiEn0EQf7bIOxgEsYTT3pwarQFg
X-Gm-Gg: Acq92OF7+gDCyMSAoxUOwOHcpw1350zwNBysvaZasA2y2k4bEEJ0f+PXxcVyjq+45J4
	PbVSeF80JzW4Uh36GmiMBgGs9/DVf7PfYmrZmJ8UF+zvEpwrqYmotTA/G2ckRK2T+r/pyffgr/S
	SK7ALpqEzLgoQDMsanjiKinhJlX/fwBSpn4B6qPLVqBrkTnNZbds8anoaQr4iKxeVWCVLA9MKTw
	qAjcDZh38IG1I/pAPXtCnX+BF6TkWe/5UD1G+ZpaY4UUbioZBsaCmAWZ10+Vzxk78cxLuoL9ENN
	HZeJovHSaNqZKu+BFNRg8BFZMrBsFMziA+yot+U0d/ycrHzDCkltHyxoV2w7pqZ7V3OK2mmgP6m
	ugKmGtuyYmCYeN2zFS1nl2y0qyuS7uglcUqOb22Ym/o/tO+X7LHYBe8lkYHJ2Nmz/9NGrVvWfC/
	0NGRxETF5AAuBCyLW5ATmFLnCdY9lym6GoTBXZw5LKfA==
X-Received: by 2002:a05:600c:4715:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-490a2932381mr196252395e9.11.1780315501072;
        Mon, 01 Jun 2026 05:05:01 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:04:47 +0000
Subject: [PATCH v3 01/24] docs/dyndbg: update examples \012 to \n
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-1-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
In-Reply-To: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=2677;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=/BEze5uZvE97vkdxdEKscGQmmLTlvHt75B8/b2suPbI=;
 b=c8S96t+ZCXu5kmm15ytCexf2F+SACA7KqyLI8HX9Eb3WTFBQJJe/DEwNE9wWzQI9kMMtWSMe2
 BCeYdCPPvMcCqA4vhxh710sNmgly3GwhDZJllsv9yBgjcughOSsHbPp
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 095a63892257..4b14d9fd0300 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 

-- 
2.54.0

