Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405B345740
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520496; cv=none; b=AqQxE6AmtSI6BIp0sSkvxXhVyehVSNHgRYwdb0B8NQLhBF58T+05yoxYCP7s3VUfLPkJavsgA4tjg8vB+YssIi4EDKXwF0qYbqWYJ8vjIAb9P57xE1w7z6N385JB1LUQxlY4JxIsQVlTq+5Nm4dbc7e6AMkBPjRBohUXnElamUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520496; c=relaxed/simple;
	bh=Ybb0kJKNd2BJDDcZYbhZbCACFsLVAC7m/M+jXCdbe+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJvbVSue3SQkp9oqLs4whPXVDxrqOf+7KBLaRTaWpofko6yzkIocwtQbYGAty6n0P10sIBw9d5wn+1HoHAfxOlMID7JDxznQd3MolYqdApFUpfVUvMpIn1C0eF8xvUIXgSrxqHSFTgWxX77r4AhNo7aSefmky7S+gdj8Gl3sTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qY20ayf8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qY20ayf8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso20666545e9.2
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520493; x=1780125293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5zD1QygmB8fWogN5M5u4F28IFz6bLgLGYRTXYqao/U=;
        b=qY20ayf8XTd1/FaYC9R0/8Eup7n61+/B1DOOeWoXOo8DSN3avAnR2HUgnpY+TQq31e
         myfV0xZWbwbc08aNSIWszbQrqb0+/VDzx7x4DPZym43WDVTT/AYPxQwya68S+jl1Px0P
         BHq0t8KrfZLx/QtAHg/Zn64SNT/KF2puRIzSa5EIEziHZCErQA/m/HMUz/JHRx/MD+a4
         g1koDtszSupJGveiZbRYUUX/CPfWHRu6PMlaGa4v6RC12dNDMXdL4y4bYq1QGOCWEFUt
         17LQTBE6RZrD0xr/T4U3zNnZ6UO1dT84eswvsgaJ+TCEbS9Bux2YufupNgG4rQQWfzOl
         vYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520493; x=1780125293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5zD1QygmB8fWogN5M5u4F28IFz6bLgLGYRTXYqao/U=;
        b=lKc505s9KeOU2D79a59EsNgfSAqgon4Sf7Q8zp4QgtZwWOnPT3kHO5ypnxx3e9kAVi
         TlPiBluk2vVWY4Vf1ewywUD6f7/zEVoWAxAmXH2eIwDH95Uu+DpNCEAVD9sOzmGeo3wc
         7yx75tUlAbKpKHaQrVRO2/fOcr52vec9c7svofL5L0a3Oasdsmxl/xT5ySv/L9XjPyfR
         6nk08wJMSSo3uSKuQ3UerTU0wMwNpqiJgzQJIH873VOVlreI+pv5qGbvXCkrd14Dp1lZ
         /wiUNet0WJ2WJv6O+F1So7LZBx+PXXc+reFO4E036j2GgSDutgkP/72Wqg9osZ6i1VIb
         SKTA==
X-Forwarded-Encrypted: i=1; AFNElJ/uibMKqQTDeUt+3UIOL/PbHHSWfS7DTA1QCh9KMyjTB/29Jcf+r5CDss5i68+WTkSJehvt5uWT6N0Ri/7HaFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBe9nHQxhCJlNKexfHTxRiAn68vJ+V6ggUl+Xc2ltPTst5eXRm
	YZa6RH103bP6j5LbivmJ69IP7noJSSQb+CGwHpkcvZwj3T0uyz+DJGUx
X-Gm-Gg: Acq92OFB93fwaokHNCVpMzNfinUJeLxzDZOczlcOwQu41hwEeA9AvyuXKiSBmrH3ojY
	fJTaLvauaSqdLZUp2Fkq202aKfpT7/91fwRvJDsn6ynIiWjG/XEMmbUEgo2I6J1RypOaXwFswYf
	FkrfuCTVZMmhmTfsNI9eM0Qjg2VITMXb/1nCszWcAkr+iMic5uV1qtw0gWNEg0Kjx5cj9XNC9B9
	tNotHyCzVJZFxkFWa9/OrESoSfzmjgSO25up24i51d/VT0x/1kZV2CyhmHcqXiVp/m6mI91PDMu
	YTVunvrSIxyt12LFMLOCgquQGF/xASfzGvpfd9QAMp3zdiCrk2wV4LVD/Zd9miOO71HBQnNVch1
	rV7kAeySnEHvY1w+eiFmDjY8ZMPkXXoNm2sfRkR2CcnbbMu12RkIbw/lpESBr5g1ATvHyxO+EMw
	JZbvZiNQ4ApiV19JZr50LF5o/GfonTidlobY3ZAJA=
X-Received: by 2002:a05:600c:1393:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490428e0bf3mr95702355e9.31.1779520492801;
        Sat, 23 May 2026 00:14:52 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:14:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:35 -0600
Subject: [PATCH v2 02/24] docs/dyndbg: explain flags parse 1st
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-2-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=1814;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ybb0kJKNd2BJDDcZYbhZbCACFsLVAC7m/M+jXCdbe+s=;
 b=LDyIcN1thUtutyJAzsuSaLyDVoxR6fToU6bjihGjPO/ev9h0D9jBnvwywJk9EE3SFg1w7W3In
 LY27uL7o3wYAABSy+dtsNqblN6gjr6Y+4iVRe4Jf8b6l7r5euO2kJXS
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |

-- 
2.54.0

