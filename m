Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D76314A84
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927527; cv=none; b=mrd+mGvODUFKCYqywaUfwF0AEp1mZVSpPqEqD/buO+iEO8JsakYJ3Kntwo/riBbVREdjskzVOF0ZTSzMP3FUgivkmRmOS1v5v6CFeVH6+w519mSoxG20W3IUd26VikB6DndXVhmR76uoQNUGeF99LkPFyOJvNZ7Yh2Y28wdBEXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927527; c=relaxed/simple;
	bh=4QyJeRXUWgen8GS+6wbvk+BOK50BVAKI45Yo7nMzswY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5ZVfbdJDHAufM786sj+faVIYi5m0sieSaf2mhBvdkBpVoIe3JGZ1f9cKHKV0Y2bjuQWUOWtCPYmTEJsMKuqEBWf6IWKIiavthdWq0zvWsLplWHiX535TL6ymwBId07M/h+RjZ5lwUwhXdj7kEEHAtyL0vPtGZgMe9CLEQSGPAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jtj0xzc7; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jtj0xzc7"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7dbd801138eso2537491a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927520; x=1778532320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iz0Lg8jnkq5kxSThshTq+W9uPtGQpz3F9eqSEiSS+4=;
        b=Jtj0xzc7EBfvMqlI4hPQ14miLIpP+WB8Wcg8ILoAi3rB1bYd708mGw/4pw1CuTNVbW
         44O0KzuASqYkNkYadmKiB9DuBf7Vq24mT1mbUNG4++Utxq7K9bdfc+yQSlMimx/xN/ub
         Vnh5INWjRuNBwg36Clzy/iaUU3xlvAIYdX3qFIYl99+WOeNDBt3sZK854dBObIomtcB6
         PCilQG5mSs5yvjzpZ2qv11cSW95RT1TbhcLQlaSX6y2RkkUH6rr0hXSclxjOfFwHtaE9
         /qy+r30hCWXkbNBnLpcCMp/aFpFEZgcfkLaw4HHzpLK1QNrlWObreiY11EdQmph73re1
         jz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927520; x=1778532320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2iz0Lg8jnkq5kxSThshTq+W9uPtGQpz3F9eqSEiSS+4=;
        b=nDbds6QG5AuRVe2afsnu7iZXVQeYot8OPlwQQRaK8QirQ0ZdH/t17WrXkL14+KDasM
         EurQ91ERNpeNn6ScwdRrY2AjtJn7oqNY5FixemTaONxoMO+beRN4VDxqEjRRC5SIeOjT
         xPx/eiBcmzRhKczCIb4itQ7rKW9p05Fi8OtMRrdMUWOO8FdOlr1nPJhtGve0Q/unQ8ng
         6BVHiwg31KFyIhQs1n/yJ9Pm43BmqdK5SfeRPNGPjayociaMBfCylRSEIWhNgEwzZmPe
         7VaaEk1vPkI7xhtswoshfWEXtGvCBJuZY8dQOq+kRNa5tCF4sgzIKeoGzmvRnQrSlBBK
         PvZg==
X-Forwarded-Encrypted: i=1; AFNElJ9wNLZTzcqzaEKYuZIXlKBFgQGQCJx35tWTHzwzigTjTPWQO4ZC7SJEHccj0UVOl6+sDitX6lHt1G7yvN30t9U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JP+FW4HVLvAQ9IEVMGnymNlK2v+LMcZ29Epe+8aTTg/jU/IZ
	x8ogNz4QOGOahcGkIwU38uhVl1i4Jk/zYNTzdn3y3oCRyv85dRRJ9Ad8
X-Gm-Gg: AeBDietrUwzR28kNiVsNcemOrscf5uUciATF6ilqySQNajt0mFGsmJf3MCZWG81Mw0N
	HjYSK1p0ePHtfT1h4ZJQ2TluAnlLbQUzinnGeacYsdaW7uaimJQL0Uacs5sImYG7mQ8tw9lQt+L
	1gNyueKr3Y20MgtbFf1tWoiRxXB32Ul6pt4aM6csSMYIVxTQLzUVe+dE+8maPWikdOw8cMzD0oc
	5av8bbuEro8MAP4M36HyG1BuQV6sqwV+28nV6lyk8vBbs8SNtZDbVCeYw6arenu/qlxDSseTUVA
	7XvqzCwiJ4pVV5yYVhJeIFSjVeCw5I4I31n+qovvRtH6jerXEHyLd/O6m0RpMsAgSJvFv+HhFWI
	Jp+FS7ftNh08xFMUp5uv8DVejvEnuisMF7wrbX4PbarWHh3X+LUd4irk6Wgg/VZF1aIUt9RfIKD
	HvG+r38W4YSa13005Oi4C3xVEnb2JaulZTjS6tTeRLb2ia3s6lVsC0ZpjSYzgG09KKNQ2Wuyw3
X-Received: by 2002:a05:6820:4b8d:b0:696:17a6:c06b with SMTP id 006d021491bc7-69887863d2bmr545889eaf.17.1777927520168;
        Mon, 04 May 2026 13:45:20 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:09 -0600
Subject: [PATCH 03/17] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-3-6fdd24040642@gmail.com>
References: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
In-Reply-To: <20260504-dd-cleanups-2-v1-0-6fdd24040642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Shuah Khan <shuah@kernel.org>, Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=1024;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=4QyJeRXUWgen8GS+6wbvk+BOK50BVAKI45Yo7nMzswY=;
 b=inxfNkY6lsE+ppdhOmd9kLiU7+Iw4d1ZfSmOMXaWkJO35noemsBnN0vPy71ns7A9f9WWhfDzN
 0rp1fbaQyM9Aam6RkHf6Xtw1qf3p7JJTADX8kK+Q/R9OYDumtagjIoA
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it uniquely greppable.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
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

