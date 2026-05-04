Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25CB31AAA3
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 20:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927527; cv=none; b=Og5P0ER4AMe8w/yNCbENVVOrIs6pjjY5vyb+VC532rINiR/gTrLL28YXSwHEDT3wvyT5csvS0YIinYBJ1STuibr+4vixby5EWI018b3msnFMvAgkFsRx2GHtEYRzWXwntZ2u4O/EAeWAA4FaK7sOYUTHFjpD4zT7bUlFNhl/iUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927527; c=relaxed/simple;
	bh=zu8zqDW4h4dx4V+1PKHBcn6qe7oPdJ+ifodfL/4d/lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mk5YuTuvfsK4yVkhZ88rYEUoT4jvUPfU9iX3keL0+04tMcO1HHQ95TrCZu+Wsx7nnamJF+BsNfCpwpE3QHCLDRy+zvK1Eyjf5hJuC2g4vOJoORlP1IGaNhbd1EHD0wbrlHh05Ob8jIViYA1ic/9A8QGNO2Z7onjrBvuGJ5lwphQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrYnlN1F; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrYnlN1F"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dbd801138eso2537509a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 13:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777927522; x=1778532322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbxgwKiIfVN6BirlEGV9NUXaN1gnD+W0Y+ioXIR1Pq0=;
        b=hrYnlN1FRwQzm7wYJO5owfJyAAv8R69T58fDmyq7S/6EAlY+qT3rTJOYWIXHKPAlbs
         fQGasE9LS4VZ6VI9Cu7+lSOITcMMrYNZq7SB5EEb80VIVnQlQpbqYM2adOlJfy7tp+jA
         bLzaQ+E5kOffgRcmk2/E871GgxIaFrDht1+lYky/cnLO1xjMout5PfFdvoLpOfjuDcZy
         fntsrZkHKvJRR8ivxLoL0O7BAohSa9+4BIPaGkwpOqYxiTYTihVDxPh/dbybVNSeNPfq
         SfhsvY3oxV45sxBQzFg7rLh7ahn9q0oF4mt2ev9CIg3MiEQ02qgF/VwnR8E4G9dlDHT2
         eIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777927522; x=1778532322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KbxgwKiIfVN6BirlEGV9NUXaN1gnD+W0Y+ioXIR1Pq0=;
        b=rjY3v7/2tBLCTNgIQRcHpQrdGmTQEZePtbQf+/h2Ox0+e/7TdaibxBjPMr0SsgJqwx
         5OnjfOHe3uQ9SSOHANVVC64Q+L6MLAfvaiXzr3Ye8BUvcDcGBOwLEFn6LUbIhBslRBwo
         9ct685aQSgfQg8R61gDzkqcc96UNLe3crmol1zfiieFCAssT7ULNAdnfypW5XNRshn6X
         NDc2jO45qYvrRznsZaxm3rkdaxo37NpUO3V0wJT98UyDPAbunnZOBP0ENK57VeqJ2Mj9
         9cII9vNGLXdcJlX2Hs/9mo6ufVO/7qg8DpoiXjp9/If26rU8wc2WRF24NjMt+jwPals3
         6t5w==
X-Forwarded-Encrypted: i=1; AFNElJ+NWkZkrbm15KiDHT36uxfekkGD5KVEnDlcI607Fpz86OQ7XOrdc+Ri36Bpxc04Vqz8oMUNXIkwKZvzKLp5Ad4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzamjc4viHwjCOcjFdFrjCO66Hm6eYDpzwBNFzMy+UP5JK8MC1R
	pUtC4g+BQLXYlHQ2usEr+6Mr5Qiuhk+3Bb7yZu4RTn/+nFlUZe9qg6XF
X-Gm-Gg: AeBDieufhlveXX8JvbaZBt/1tXzJZVTtiSDM+/VW3KtwH8vD4j1V8Ins5GAvYcu1ntu
	FRoebPZ8wE4kNDmc6QhD4i+vRk/qxsroqDKAbdSBqQbT1OYAtNMdDThXtQQ93fVVLhHV6/L6sTX
	G/L892VAJQ66BC+TJ/WEptnWGkNnAbn14JlP2tYzM4G/RjW8kXBYp9Z81Yt0VUuxArnQ3QkSLWH
	pyItOA7tvY8JXyadLKSLj6sYRs9PAetQ80XutouoOsyQdoMpURrAyz8KcJ6m3sAHE2bW8np9cye
	a4DaAholU5wC9V/DEL8dg2T1EJcTD9tb+kruBJIS2kCTnNHcQ2+hFPXiZKguFomcW2idWYU3WIj
	Cvo9nNqRF4qMZoJR2h6dYFAzjMnlDxhZD3qWS+zTVRReW4R02tZFv1IuHDKzcHVK9V6r/+lYuTZ
	HCqOEa5pEgHtDvGGeB6K68AvnZuxOk2lue3SHDuDWEaAegDDr8/VSb/jhjxCzVBkxXcl5/WbUQS
	8QsLXb/7Ro=
X-Received: by 2002:a05:6820:150f:b0:696:177b:42b6 with SMTP id 006d021491bc7-698916338e8mr553402eaf.30.1777927522592;
        Mon, 04 May 2026 13:45:22 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm7144713eaf.0.2026.05.04.13.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 13:45:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 04 May 2026 14:45:11 -0600
Subject: [PATCH 05/17] dyndbg: drop NUM_TYPE_ARRAY
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-dd-cleanups-2-v1-5-6fdd24040642@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777927513; l=982;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=zu8zqDW4h4dx4V+1PKHBcn6qe7oPdJ+ifodfL/4d/lM=;
 b=iiHii+Vss9H0pYsNChYziSgSQvbvIe7Sv351rn8+qWxnxEMFtue2rJVzfeP7mPYDadwZihbKg
 ySvhvQyQkqSBHChvslEBvYKxQhqrJr96uidafAT+aQ78xwrNi4SK2iX
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 441305277914..92627a03b4d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -132,11 +132,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);

-- 
2.54.0

