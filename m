Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1B2D23BC
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436259; cv=none; b=qCX9DMCAcoAIU92EgI/EpmdG5imbXiEU1ceFY/gcuGB6RBOa3HeckeE5/RTszyKOgEoC2yWykZZ2ZTnKJAdduNR3G2EYZcpFfgJC+4AP8moeAgfQLRrDtPgaIedUCngp53RoQAK8/bK2bxoCvsQPpzF2dGLfbq5n3NEtYz3LDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436259; c=relaxed/simple;
	bh=kBaEADxi+tizzfCdPMIDfF9nbDsmc/EW3wbKD4zMYGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pmHjD4oEGLDGfCm3XL8ExuhOalgC9m9ZJ/Nn4To29xfHtPOgYQjFlRyrdFANeTV2+3afjn4hQcUo245kjJMb+WUJAPPvnnvJ2hkUN49mBRn599MBPRuLOhw8Js6Vy6Foe+EmRo/96TPBS79phNRnXLtZPFqeuzXDxFZAouk2LuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLe0GtSb; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLe0GtSb"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-4693691fde7so1138611fac.3
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790436256; x=1791041056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SpFkGZb0zSmE51hIVgs/JK2EDkgGWRwWNxYbnnSzQc=;
        b=nLe0GtSb8XpLanJLs9RGqqpWTA6LC0HUfdxTqiSQfLDLZzbOYXEQKXNeVHC8Er8uNR
         xqaRdIbZjnfHBC0gv8j5lRVoZoV04cU7HuV21hDsZ2aHyP/QQtgHI/CCdd5UeftxVCJG
         b9zACCidd8CDjzQwmAOHlJAboEFdZq3lcmlZGoJQQO245S99NnA26CUvrfJXSGzm/0Pg
         M6K8fL1GDOFxZ+W3rfBqzX3Y0AqvtuDT6BMOBg2YAmWwxBK1jfd0Jyu6vUDdC8DODm9H
         mN2xEmd2gMzceQhOsJVXDCIOpdWhWA9LAc5Ltw89FSjm8VutwKheMtTBp765dEVmf6GS
         II0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790436256; x=1791041056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SpFkGZb0zSmE51hIVgs/JK2EDkgGWRwWNxYbnnSzQc=;
        b=Rmnm3sTPTLwW+6pinvKuF2dLPeyBUAwXhj+PFy938BL/kURDVKQCuIKyYw9bKu04W1
         GIeJg7nHtj2jzFA55XFuQrFazhyi7k/ty1jMX2+pM9Lhi5azIfh+j10XN2D9hki4M9go
         e4YX2+fFt3RW1bacUXbLya6c8hRZs19P3u8QFjk4fNBlosEbHKxRQzG6qUM1xl91PXpB
         cWYUNfa3UeHGyVYkCWiKZZ2mOzPt/augIFe/AP7KnSBeXeuTynPsw6Upz94XLHxOIAmg
         mng1PH2Y1WN11Rb3BeXHS0Obv7dUC/snh6coDvl+t3D2HNBgtUV6xFCxmsouIyM3nc7X
         ppSw==
X-Forwarded-Encrypted: i=1; AKwUvByQ4NH0mv9t4O3siW0T5Vu8UXRGgxsY4Y2E0ZfuHrX0jkGcMzyw0jTugy4lhQdB2lf9Epo3y8ob5E7TfigNelY=@vger.kernel.org
X-Gm-Message-State: AFuF++kUmubNlNTVMztu5bZFF2nSHNmrPRSgWlUCELMArHuxNEWd/PlZ
	P5tkurRnGXaZfryyk/cr3m1tq8VBQTO3EW1cb/SM3Sw1bCw8hc0gDLrR
X-Gm-Gg: AYBFou3KfsdiEeuD8blxyL88aWtXU8NUP8HGqGn5Gz2qYwZY66guBmdLjTTr7PvLY2w
	u3jyjmNXFUvuU3t8n4Q7D8pGhcwZejGw8PZzte0Ql20TPinnQgzwLxL34hnUQFK6hk2cfFSpxMT
	hrKoCWwsngAGlnmKcGBx7Ndltjlyvhq4rp8iN40HIpOQr9YwA+8nk8TcVjXyzMsVowjux9xb5i5
	LmupOW+PNG4J21akmgjw/rqHDkOFBFxfb1qg7PayHVciKLuYX+pM0dmCrtgYPQzAX38nrkY1hw9
	1kL92ygIV38P67itCm66woZ99mYOSvTMYhWizoyfPH0LGHUJUwrJpdbEtskbS5os2oIPzbbStB7
	jQ4gsTKf7rmbPo6dTBsSCC4zjsiRGkvmSUR9pjEpl/j45AaO9F0/InMj9SOq7NzymkCOyHC/ccC
	YLV1FUjEVVmF8rRBIZmNEeCcfr7zKUOI3pwOBahyr6gwuyI7VIbdfnM2rVbtktHLoBv13vzEf2f
	58lWQy5t+alisKejrI9Ua4F4QjTFAl0tpmtOHq2
X-Received: by 2002:a05:6808:c412:b0:4b9:e5fa:8908 with SMTP id 5614622812f47-4d72cf3fbb4mr8927841b6e.27.1790436256542;
        Sat, 26 Sep 2026 08:24:16 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf6206942sm4653798b6e.9.2026.09.26.08.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:24:16 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 0/2] tools/nolibc: check for overflow in malloc()
Date: Sat, 26 Sep 2026 10:24:12 -0500
Message-ID: <20260926152414.251214-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

malloc() does not check the addition of its header size for overflow,
so malloc(SIZE_MAX), calloc(SIZE_MAX, 1) and realloc(ptr, SIZE_MAX)
return a single page instead of NULL.

As suggested by Thomas, patch 1 drops the rounding to 4096 bytes, and
patch 2 adds the overflow check on top.

Tested on x86_64 (GCC and clang), i386, and on arm, arm64 and sparc64
under qemu-user:

- nolibc-test: no failures, with patch 1 alone and with the series.

- A separate program: malloc(), calloc() and realloc() with sizes close
  to SIZE_MAX fail with ENOMEM, and free() still unmaps every page.

Changes in v2:
- Drop the rounding in a separate patch, instead of checking it for
  overflow (Thomas)
- Drop the test patch (Thomas)
- Link to v1: https://lore.kernel.org/r/20260926134332.58184-1-danishkhateeb03@gmail.com

Danish Khateeb (2):
  tools/nolibc: stop rounding malloc() sizes up to 4096 bytes
  tools/nolibc: check for overflow in malloc()

 tools/include/nolibc/stdlib.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)


base-commit: 0e1c44b472e1ec21efdad1df21b10e5c568b65b5
-- 
2.55.0

