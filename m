Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E62E3C769B
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 22:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440497; cv=none; b=IbNeQ3W0J4XqQbLNzUhAW5NF1Q9dpOjFGVCUtCk4HH5LnMfVPPIe74OSNjkG6IyVNt7pFAQeXEiBK4gl631cOBauvybg72MaXTPYNknfH3oKwN0f+4SRVOfNYN2lZVQSeDyQwbS/RV00+oS+cLaXFPslXbh4fpQBy47ucD2kE6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440497; c=relaxed/simple;
	bh=/BEze5uZvE97vkdxdEKscGQmmLTlvHt75B8/b2suPbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+rjC+2CqnQySQ6id57cnkN2e4fb7moxFX6g5AZVvqwl+VOxbZTUXnz7I3mf5frzjXQ/EO2SOUIIft+TpH1xlKDdFWI5fBnKk9lKllLx7yLM7UYa19kivv/qf1BKux2gcQzCY89K6qaFjU2uQ9Mobf5VaH8m/cyMLV7ml0WhMtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlEI31kN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlEI31kN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so3226198f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 15:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780440495; x=1781045295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwPLhLRZkxVDbJ+XZfxPTCPSMzzunTFiSNGj95FvoLA=;
        b=qlEI31kNxjbwB74F76h/iMA8Rt70PBfAVAwkfvOQ1OUWFaHg+UbcdRJZrCzi6K5HkO
         Hd8lnyadsYYTlSZz3jK1pWycosr71xS2M4gkHt5HIqBgWMW0INpWQbOTimKbIlKy2zso
         Oq1p7pXaJ8LAhZjSF1O2xlSlii4UyK5tnnIc3snbTN7GCBWwWva4f+qMsU2FmgeXgkrF
         OA/qHwFju4QSoJP6OgJ54C6ll2mhiQx4AGI3wHifogZfzGUa+spyNxhMVT1upnK12gfs
         Be/czoIFK+YVAZxE67rJbaOwKOKpqq++0nr59IloW0MBIUCheKY7/V+7LVsW3vAZepEJ
         Oz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440495; x=1781045295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CwPLhLRZkxVDbJ+XZfxPTCPSMzzunTFiSNGj95FvoLA=;
        b=s3UX2MYakBSYVSboeOQXN77b+LUr0Wu9QiYgyD/BKtfoNOVfVNCjpi/blcrD4xmhOU
         x6oZJNH3JOFgR3NuYtKRqVM7UmFTdmjLo/rXNeW5yS8RLUq6bkUZ86EmpDAl3Q6L2tP/
         TCS4xRe/uG6vNd0UH5kC6SgcEbNhbSb27tSMfqu0z2O9+RstMIy6AWveE4We/nek9CUg
         6OcoRG4mxMGy/yWHo3tNjattcXfwhlpbzgxFiz6cQ5TCvR0tmUjtoZTGyH7wBcOXQxI0
         djr9GebwWt9u2nQ0WwopmcUUBweo+CV8ELLrPsuqIVM7d8ot6dzZD8r8PGtu+miPI57o
         PeGw==
X-Forwarded-Encrypted: i=1; AFNElJ8Kpyy0lQQMA/l6YiqfOc8B/TS6Ev+aqzN1ZZtmOHO/LBCuRHJO2jvNMqnFkVANG6+Uxp2gts5jubc9higL8Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtIGnkqfI3I14ZHcrncAnj3xhFTtMtjETU9CjnLynXUnyQylf9
	tWLv/MP9IvG5iTOetv1IvZDZTJEowPAryGDF4Fy+F3k+7ATcu3pVlJVU
X-Gm-Gg: Acq92OF5cKKvgHm3r86A/w1ADLAc05m2/dQe3mW2wF3UOm1TgqXphVcbR4quo2QJZ7z
	H+ifkMNvTSttKuyVxWk2jIjtg8dvvxhUElUNL1TZmVUMI0WaelTjNuW31cN9ZRulP5KhtgkfTi3
	HhebBg1zK9rR92XssGsyv9FOHAnuJfz7WZvy4fIaqWGvihrm+Ex+NYx2al0Bi5ExXpEeTJZAihK
	MAGkQjeESV8xHzLh6Q1EdWw+fN+KPn7XtDuRLpdwOyWXjWZjJyV18n4bwYWKoLw3vNWkJhv+TQj
	rFTPEmSP426xElVzP2qPNVcmPelwI3lDDw8A0X4jFMy42pWWHQ3d1ZrP4XTt0Ax/XM6bBBMsqcb
	DpOoGdW+yJdNK7CfDBuEKGTcqq/j//WSqTv6IZ7onOsFCmt+QtMfutgi67oB7QKN9/gpFgaQMh1
	8FCR3I4JK+G8mSqtaC8AaQfswcavhnkYwfPBePONZbVw==
X-Received: by 2002:adf:e8ca:0:b0:45e:dabf:a00e with SMTP id ffacd0b85a97d-4602195abf8mr384315f8f.31.1780440494697;
        Tue, 02 Jun 2026 15:48:14 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm1999791f8f.14.2026.06.02.15.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:48:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 02 Jun 2026 22:47:58 +0000
Subject: [PATCH v4 01/25] docs/dyndbg: update examples \012 to \n
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dd-maint-2-v4-1-19a1445585a8@gmail.com>
References: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
In-Reply-To: <20260602-dd-maint-2-v4-0-19a1445585a8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780440488; l=2677;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=/BEze5uZvE97vkdxdEKscGQmmLTlvHt75B8/b2suPbI=;
 b=eGa6JOHZRbOrzq3N8stPRNIhRHhJDTd+EXMPhxsQVEHGQJoLEX5/8ExqTRqXIhbGFTDS7i/jW
 my6ir9qw9H/DG3fyTSa1Qx5Qli7GCViICT1Ms058vTbgPI0z3h/lvaZ
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

