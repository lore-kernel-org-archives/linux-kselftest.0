Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A437DE8B
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315527; cv=none; b=AUrqofqva7tb5QZMct+0k9R8wx9vQs63dkJabbMuN4UW+DGSlO19GyubshXUny1d71S6RZ6OE28E39keqCimaKx/77MV7FjUYKFiRsJg1IAog0205d2e2YNn3oYdo7pZ+VdH38wVy0Zmxjl9hhJbHpHw2QYA79bBkz91GuilqPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315527; c=relaxed/simple;
	bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VpQVX6VhbzKSeG6hvr8JUKnq8Vpmroab5vJqLJ1iPr7f023wABXUQG+CoMVHXras9FSf7iI8tzeRCmXpjyozFTrBFxIGKQvFNgD9yo2praL656E96TjIlHQ4HyTtUb8XybAUHX47H5HKdPc/IWVu2chydDFywhDv5qL5rhNr+8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZH/IaOw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZH/IaOw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49050bfe053so68931815e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315524; x=1780920324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=AZH/IaOw5BCYj5MyVGeetdPpxXjKM/sT6fhraaJr8sEqZzPu4o17YARMQ09KrXQICO
         KVYU8q/1tw2/Qo49KplhXKLieOigDS911PeCO9aSOg5WOCF3R8xtFlmS/+4lU/e2hOd0
         3m+/N5riL79mvLklrUR00WloZyEZneA0Y3J4WyP2Ff2aiitqsKYeLdzJYXvVAH1BgbSc
         RgutmJBkYyYBzYSwlLBm0b+LpG/rym9JMMWHnOX4+B5+W/MHEDICfkBwJxfJZUtAmGiP
         /Q0a6B3B8VEOcmx0BE7a7jdfv/fslqZ/OFXEJJeMZbvIAMQu4AmLA310qW79w/4ihdAh
         JGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315524; x=1780920324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1/UoMyrbDRBJtnX/0jQKUAOsd+dEJyLvzD20lPdR4ww=;
        b=c/jK7oWL4jUHlAGV1KX1SOEd2xs8eYjIK/R9AEYPLuTisUkCAkOM+/SR5c1N/GIoi5
         WwBiboxHFeKVQ5vCRuryE+8pzMEynCxmUkV2IRehS0A+OXYjIitKglHMr55nPzh91ySb
         Ao1V5N1FsqumPRi3gNCUnDuZ3aEV3oDdqkhZasWcxuQQZgS2pfSPuLLJGa/kbh5ISnJG
         dUkyuxM5NNPMpPVTZiQDbgLsVK5apbko0/Gu6MKmuV6JcOrjYvX+KOz33URIWQYFipyA
         ISbHHpULH/66mMqKdoS+eFxgOyR+i/sFIl8nuvAnJ4VuJ3JZPD1JLDQKpfdgX4n0KDkP
         fJow==
X-Forwarded-Encrypted: i=1; AFNElJ/VFNHr0Y6OISB/zPWDj8vdSMkLgdDro9COkkkrpzQg6xLljTwIZrCqlduODbvYhidqmGhpOfAPOI7d4evSV2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5YE9K1hNidX11mrJG/VF/pRw9HIqhM0QKmqx6W+YzI6d6C+W8
	vw97X+oAfA6DbMxM43jVDPoxEnSANv/s46pWMXUUzC/yKXqnKaBWGLBe
X-Gm-Gg: Acq92OEyItZLIimbsUawtS2VIDS93XYQL24iwk1PK9OidKaTIpMvPrxynw0rOVT68X/
	aaN4YVAJttLPadik5QAmm0p8dtzvjfaZ+H+KZfzQFHHH9eCQzpYIcu9gexnIIqenxjd1GH00rOp
	7/IUT2lkioqHdpbD5ceFnFfXpXzmoTtu8tVBC7pGjaPadorH/zeH4jxD0RESBH98DWKWOABJ0TL
	zpkmgisXdQ3/Bm3D2tPD80CFhikK//EBPk2XWqVvF3oT8EJ98yc0z47rHDWF3y98Ivx2VD2zjdM
	PpIF3hgEj8FWXBkLM42lGpOl+/WeWHACWQKpnN5+J5/TwOVq3FoM3z+tOylfQ4nEZB5qyqIr2bU
	/zRMTEin1OGS/AfXrbDLBZnKmghdco14CgkNnw+KZly94DMZ/m0J5IAt7rv9allNaRICR2jVcMR
	QZfud/f6TcA3/X0yLcdFSG5lw3xBOOrcfLCipKHZSZwA==
X-Received: by 2002:a05:600c:64c8:b0:490:a298:acf7 with SMTP id 5b1f17b1804b1-490a298ad48mr185339785e9.17.1780315524059;
        Mon, 01 Jun 2026 05:05:24 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:04:56 +0000
Subject: [PATCH v3 10/24] dyndbg: reword "class unknown," to
 "class:_UNKNOWN_"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-10-4a15b241bd3c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=1309;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ah9OubhC/0J+O5fnf6mytQN8u50S2Bl4xoeKfk7IEd0=;
 b=4n65AvgYtX7DtTVqkK1I41Xodkq0iZVSmLxfv1Y6t8k120KPHW6PpndNmLzsyHWrgFjRlxjH3
 1OE/Ktc1/TcBtwgSTMRYSIw1FJSESkUk8jXihxInLBxLSKTv4/NPkPP
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

