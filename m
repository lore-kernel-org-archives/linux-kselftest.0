Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C27345CB0
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520514; cv=none; b=AVuP34r/n7HOTGq+nARt8qT1Ypw2iAcVFZLNJVUATLja2x23tWhLA5W2PcslnNSRgBb1bsTYOepDx9mVl2DDt3nzsX/302FOIQAcHU6IgY4w87vivP0/L7OzMogsEv0dJl6iZT3olybuRVjJvbUFaA0KDZwfpSY/xEpE7azFjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520514; c=relaxed/simple;
	bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAJ0BK34UgnOKPF3Xcx96TQ2CMUsl5oNz18KNbX9krBsQp71z+5dBo66ELa5dB5nRc+anoZDEVekpCBR8lObd+Bggt/qJ4I6WyncWvmqzn0UrIQ2+DuDqqV1QoTtdD+/7VUBi9cym4uKtV+DGl1gsB/4Jof0U+RlY6VTYNy397c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnYOsHTS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnYOsHTS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44c350a5b87so4920532f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520509; x=1780125309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=mnYOsHTS6C1ZmiYricCFU1qon5J5Bj8Xdremgr8bCNl4r64JKw21B9n4+GI+9UMVUE
         rxqxT/Y8MlMmd3wIz8fBkglKB7s36J7uLl5Tn07TQ6gXCXd8HvBAT3FM6GBiLUkgF4dj
         PP0peeYIse3Lm0luFtDc59NmwrrcUxipa0AZ+cT8NoJPImBmNuzpLKJ8WmkVlzb0Lzxq
         VwPjDo+mFRQBXnry84pL6Ejy/r4/xC8qD9u5VcRlWM+IGwBn6WRq2AZjXD3rmWedp7xW
         HqPqDYXhATvvlD5z1I3ByHiZf03FLEuMy4UJraccOONYwW090dYE4mQu65iwT7yUIx4Y
         3ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520509; x=1780125309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=OdkPAr0sBcwmc9I5CCppgVMkmclT+YYjZ+p1+7KeOg/yx6h54r+h8dBe9do7/9XXqF
         qlXC9RmfZhpU2QrLDppWAUro/VcBfT1fmJTw+vfWpZfKbLPUvZP/cRmc0G+gj7pQrnYq
         xJ8WEksqxqeV+hisVeKbgYyU5f/RvMVsAWL6gvxKcDgnzw3Ib1plnbemob7aUzn8IQXi
         p1DG4ob6akeEPOKOFi0QBcv4/HHIn8G9YXYM/YlbTcvF2nEM1tMxrjAtkaCLQXM4my3q
         BU7vNYQ2vSz8VYu8NxaVlxcnp0xkYDlhRYRic7aP6mkVm+VEcBhxF4Be/l3EVc0Y0qKn
         h/Pw==
X-Forwarded-Encrypted: i=1; AFNElJ+/TnZ/ESjwzLob/maXgvZDCdqnBaGNIA4OAE8a7rSafmMoRJkwmnAWGFa4bOI0pfY/qUZ5OC8Cgi3kX0xZqsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjdhqaAvboZrvBHCNEuht2BWn2Xu9HsHnkwaY/dLu7EDl+FTE
	ZRZL7qG0bxEvbVBJUsJIf2ahollPZ6h2rPwAJFHb6FHrQD85xjkSz+77
X-Gm-Gg: Acq92OFWlXiPvubXsBQFM5YzId53ON9jQK9Cid2iR1f+3S6EKstNPWhN6bkjSsBcXEA
	vAiKa+HiJowoDX67KfPHkhpp4hkVOpmU1FlXx3MLfCLHzCWX7ylXJmY1L5DvGplFAN4+7UrJWMo
	axCV1YhUdHC4X/ND/fZzWAyoyzKIlgmQjnzGZO3AA6leyOrXWybeW/wcv2Q7xFCDyokHUVZBK2i
	U32gKPxVAd/ll9ihCNKsVVShRrZIixgR8QiCfG1cl4HlaAYrfmsFnUlkMgkDjkC1VLlVebAwXuP
	LllWwD/Xa71YiorJQPaoRdzK0Ks3aG7zI6C3AmHK4j3wkrW8MzPJyOThun91QMWP/KEhvrww3Nv
	l7hgtxZvAlIwhQqxc9RAx33mSlcz/nTGAZHErITrxKblZ/OeC0lJT41OsRn4L6+B7Lp0upzQdpH
	nuxFQsBhD0xdw0Ome632ndi8Gi1/b5FEGu0zIndtY=
X-Received: by 2002:a05:6000:41c7:b0:451:66e6:501b with SMTP id ffacd0b85a97d-45eb3324e34mr9651283f8f.0.1779520508486;
        Sat, 23 May 2026 00:15:08 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:07 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:43 -0600
Subject: [PATCH v2 10/24] dyndbg: reword "class unknown," to
 "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-10-b937312aa083@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=1309;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
 b=pwcA+Pegzk3CXbQXnl4Bmr24EnZTQsoVG0QcFjlTa+oIhKNkKDOhgNtlhtZ0DeoUT+EatexUY
 g3lqjPBN5QDCaSTmisG4ORkEm7FKIG+zXYtZSOwHcVuXgKVw0paJe2V
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When a dyndbg classname is unknown to a kernel module, the callsite is
un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

NB: while this might be seen as a user-visible change, this shouldn't
disqualify the change:

a- it reports classmap coding error condition, which should be
   detected before review.
b- SHOUTING the error makes it uniquely greppable.
c- the classmap feature is marked BROKEN for its only current user.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6b1e983cfedc..a9caf84ddb22 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1166,7 +1166,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_putc(m, '\n');
 

-- 
2.54.0

