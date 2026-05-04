Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E5131AAA3
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927524; cv=none; b=PHXyKtHxh8F4TmqmQ1XID4uQSWSEmxysD1lQXWiZlaKegxPWfxFeE574eQHttUhvnGR69T8UZ3Z6Ahg9Ds4NQXxwni/83krU/703N4g0U14Na7HkQpqPAJZPM41KeR2oflCiKaP0STjcsDSgtazzP2HsaoFeShVpSi/SdIO3tSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927524; c=relaxed/simple;
	bh=fQtxjBBlsfrbVNeHFs+VzNlAPJfQpt7R7uonizgiLgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OxRhwbKdagmm/R7I43t3JzQn7dV7znMMJaRK5ae7PCB8E1mu8egrvJrjV9SuKhe4sTvvgYsUlctMiLQV/vXezBKiygJhZDI6knDG8gICj7fMALJtQyhBR279YTdmAv903u/q9k5I3uoNaQkgGn0LR0M/SWLE6GznlBr8LwZawBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv9eJXyq; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv9eJXyq"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d4c383f2fcso4293341a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927521; x=1778532321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0og+a8kac0IiyPYwMTiYKdKkV179BGjDAZzwYpwxKg=;
        b=lv9eJXyqRYzjGnA0fTU+PUUzBqf91Fm+wBP8kea835C5BTCD1IPa2NYiGq0vxENsly
         UEXSv3Klujg4Wwnx90jTLd5+8stby1/ODBRsKiSAhalTJ2aDcqD5kYtJvsyNDGYPAAAB
         OWP0jjJXEDUafr3CODz8BJc5pePccpcz+Me4fdFsexPUnKpK+b6NZw28BVX/+1+tNLLR
         ojH/VNt158fCCMrfyME65G4i6fAT7vPoAR/lOOO5jU+ut0vFRATLWQbiGUTkx1gn4ydd
         zBhS5t1715HcAzzSWieHh1TN9/3f7fAvW3Q/7OF3KAfK5C3TXdtHPb8eRYoxMg73eEUA
         /rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927521; x=1778532321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0og+a8kac0IiyPYwMTiYKdKkV179BGjDAZzwYpwxKg=;
        b=LFBPuY6rZIO/MPaobPnY9R/z02AHYz3HHU02yHxHW5demyK9FqfeLEeVzgQ8YcqVmC
         sYxINhEjG1W65As8u4uCanj+X2rS7ipv22+B2viirWodsMs5jUx/BnMM/+94l7ltfVj3
         LkljDTnXigvNlXfq/pae2UXI6JF1gsJ6A26ko/g23GucwpKQJrALNcEWk3bkN5BxNfht
         MswKhuLZdkoTUMhjj3DNqAkKzDzrpaV4+Hi499OSqivFq5GmrCeVaQDfOJFzpU0ranA2
         68JUvfSMLvCQrYdn/rwAuuxUkiYKx9hDQYnq/cbx79l/L87q9o4ZUygPgVgxWJlfO9vR
         2VZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q2yUQy/Ot0Lk//l/ozDDKlEcV1YvdK5kaYN8mz13ApVPdYORfRkSo1N0yoNw0XkI5fp86ZYO1V14o8/F0Ag4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/mcHrxJKISU7yEte2kpTJ4Imrz2PcmEeZIVqegHWAJRzRMmDv
	B98GhFzVSe8ibVEoa9JoB2UtFu0kCWt3AaA0DOtn+7gygMrgDCyAkOAf
X-Gm-Gg: AeBDiev6ytSAPS7dKJO5v67c/tV7AyaqbEJ917vC2viwZnlu60a1shaAvrVhJvZYYQB
	ts7rB/+7RF6U/ztFkRyvPBRjggfW0g7TV+w+ig40JGhYtnJJwSNeatOTvXwt0vZUHMQnxmbWnxj
	YMT8ifSxpo1GVEqEI88Rl6Zove/fHdM+K+ns1B28JrU8Xun51n5NlQ9iX26bHy9TFsPEx8y+e+g
	EMWfta0595Cy4onAxJnQmJaM1S02sWNSIYG6J2h4eA9ifXUD22T6gHaBaTpgi5ALfqgq3RNOokU
	bt/VQK0sehOBL05aLp9NF9LrY93LKD6i4B2N89y+2AG6IkNRNvDdJzuHU43lw3akZOYlD7hwUiA
	v7jQ+4Ssj//7VlDJbYpt0Q6+ymudnPi+oPfxmfDcVt2WFH/diVdjNYvMFjVT+c1LqOA9szWXhC1
	Ke1B/22n7dPjDshnZwEhXUMTVto1/Q+G3ZZ6dskzUB4xOqGBALzAoRNtFkIXYEi9MpyfT79bRh
X-Received: by 2002:a05:6820:1687:b0:696:6bf1:b8da with SMTP id 006d021491bc7-69697d69e55mr5450314eaf.42.1777927521511;
        Mon, 04 May 2026 13:45:21 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:10 -0600
Subject: [PATCH 04/17] dyndbg: make ddebug_class_param union members same
 size
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-4-6fdd24040642@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=1479;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=fQtxjBBlsfrbVNeHFs+VzNlAPJfQpt7R7uonizgiLgM=;
 b=ttLRyXE6cZ85k5IAGBKzfNeOHmjsQMSdBe0oJuY+GuqeR5kO7dRO2UTAOXb6Z/uCC5xzVY3Uu
 k7pB5IiC37BAmfaXmLuWDjqegWQkmZL7ULDACaH/AQppR+9Hq0uDuxo
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index a10adac8e8f0..441305277914 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -104,7 +104,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a9caf84ddb22..ffa1cf7c2c72 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -811,7 +811,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}

-- 
2.54.0

