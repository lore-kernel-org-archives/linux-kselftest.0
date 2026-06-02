Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320E3C8724
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 22:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440524; cv=none; b=bdPVYiWKZ1ds0HatWdF1L6haoW1iCeRSTqD8CO9Fo/urVCR+jg93TI2q9WcgI5JVU5cp3Az5Ev0t7vp1JiC5PVW3MGG3xt3dRlY7vc9C8XuevPRYI3UapSei2sCpoYHpU+dAxIVuw27qKrRLbfSpXGyKfdCgaCG7pGddJ2tCEjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440524; c=relaxed/simple;
	bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eOICEwJhYCO8U/MHgplo27CNih7MftcBt59y1GsOP60MsFDSwMLVbOfNM23IZ+7mNKavMUMuzxQVDAl7Om/WReBmsf5KaMggIc3QQnwq+O4dhXEAcdWQvgtTrh/6yeF56/wfeJnSlgvTiPhWZbBFN/jsORWgYyYFDbMFwq3Em58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFuxi0H2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFuxi0H2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so6004405e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780440519; x=1781045319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=hFuxi0H2UuJnZ64MYnC7sk1J7y3+R9yeqezMzy6OPMv3yOV9tOrx0vSkjnvoCP1MNg
         Z/sctMu6JTcTxu1ng+32FHKBbFWFUOHLT1k8cRTf6CB3MQoVyHJYMzhTJl9MNhas3JcB
         V4MK4N7d+0njhO7U9zJZmIF1t7HUEF2+8ZB9L/6ZPM+iC/mr8SeCg9TgPsWtxDADNJfP
         P3loPLaXlwuy6HgaGkizpXNQs9k3iIbojMWpWA9MLasUmVUomupYoYqFUCm6Jj2QsqW1
         RaN/FnjxN1G0Sx6sk/G+9685NCbRdv1EhOzDMiFqcv2nPPcvFKIlET7p+nspkMfjFBEv
         oZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780440519; x=1781045319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=ld4Dg0xVSLECUg+2ER6lPZ5yM3zquwE2SqVdzXv/xuIhXH+SQduL37dmC1LG8+ZCjO
         GEiyQZMh4YC+yXZJSpvnCCyN3ATZ6ocbk99IKCh87acBc+6kM5XsFy6UGK9TUR/bsO+k
         s+GrzyuoCBWUoQdPkj4625nhM/EcSN4tucF6/f+ywGnEvlCbie/WX29k7TQkSgUJPY1V
         M5fT1zYAu9VJEgO0KX6kY+7SEoiaeUqJQRa8oEWeuF5gjFcJ4ZWYaLGxynrJaWPHbqgQ
         V+E8f9ybTfQ5BCZ2ClupsAUMzQjR20PeRy1UzA8wwwy2cMoDMSvFqNyhLlG56/tlV9f6
         dlGA==
X-Forwarded-Encrypted: i=1; AFNElJ96SIowShbBrlDEn+0//yZBpornZp/uTAFr5n69ZZ4a6aRZohosAKX+7hIBI8s83xGayn5wOjWKdlFnNru/fNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXfLBiDa/2C6wJRUPaX49+Bzl02S7IoSEitWELASLb+rOCoRtT
	e3su3XGtiXrHr96i4amb67qkZuoHIjNmknqUJkL0gjrXL5zyDlwwvdy7
X-Gm-Gg: Acq92OEMtZ6PkV+U3uSGuZjd27mToGO8kn5dew/zkifNHYbZKx4XQ0oh/XEnTMHe0gk
	kzaINUNTmdc8BvRuXlDAF99gg1an8/f9545DU7Hy5HSv+nLuANQ25DQgGImearJoCEEB5lXbdB3
	+Uavd2EULJYjuIwQqxCI1cPj24HjNGawHQ0L/bbNfUeh5mdmb7X421lII2/NqHV/9vmqVBVfOWE
	KWCzDpbpjZhFwgMBSK5ODQ8OWKGmS9p/8PsNQFrzfQq6iEX7qUohokbOAbtwQ/F8cyN3/RH0C2z
	g5nmiwfGSpJOmH3bEBAC+soAGn5hzQ6igrBTPGgIZ8Yr/9dF2eWESKCB+AfE4mVm90sOkSAt/dg
	qyOlHXBgLkG0d/kVCc0n6arvjpQT41jWqPIdQCIlslgoPZKy5PSAoobMOPuCpI/w8JOy+SWTlZP
	pSN54k/Bx7AADkY5+cm6mLfELSsvhvEMFhABdlcfyuyw==
X-Received: by 2002:a05:600c:458b:b0:490:b409:94f4 with SMTP id 5b1f17b1804b1-490b5fdcda1mr13028365e9.28.1780440519473;
        Tue, 02 Jun 2026 15:48:39 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm1999791f8f.14.2026.06.02.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:48:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 02 Jun 2026 22:48:07 +0000
Subject: [PATCH v4 10/25] dyndbg: reword "class unknown," to
 "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dd-maint-2-v4-10-19a1445585a8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780440488; l=1309;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
 b=mY6va1q+pplf3oiRh9kAqV2/4rkm8Jt+FXjkD2G7wa/YV3UYCu8KlP74E8zHuHM0fBwUW7QfI
 85+dFL9KEusADx7bjdzgWA9Z4a2ALDbaZGX4b6jMBC5KuU25CaW5OCx
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

