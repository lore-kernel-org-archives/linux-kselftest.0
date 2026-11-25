Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630497;
	b=Frmdh4bNrsZ1tSqmpWEleKbj5vTsbd1WUmhO7h3+YpWaUc90vmwBMD89LPyxAwex80z2
	 tfImDjgAhdiwpvQnQXZQRj0BGxtFa8TFCrrUwseg8QImoCzRihJ3JQltsr6LhdM4F+r6x
	 Yv25Ttfu3yPVndBt0hLHaDGJK/5MG+JFMWfC/XuB2NgwbEI1/q23ucUeqAwm88HBeuKdE
	 9X8+2YsHci04cIvrQtT6MqhMKA7VmrrQTcJkYcL8XBcMeRkuIQL6DGUNwUUoi7S+x3RVy
	 6gaNCpN/hNamHgo5WsjrNK2a/4vvA5ZQE/QnlfRyws1oZ5cn7CD4hKds9euP3QdtRRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VtvIgmARk0ylTz1Vb55Uz9jsAfEsRaDu6ZRMFkPArig=;
	b=kG5six1sq+5je3ZgLUdGtLE1ZQK/jyAMkGbjTEL7nCRanTyJJCXdmOP33XcNk/cNzUSt
	 85P8tmF0Po7C9R9GKR32W+Qy6QgcC3/CP9XxBj7qEpQvGTurFVHTeb9NEdJhR8QQnavOm
	 UMNgnHOoNiFntq74ClOUJW2BsQAKAFMvRVgTuCgBQhCp7XSsxsUgY9fia2LAZ1CYSxTD3
	 hqmcTHy8P/WAZMV1hgkmhcefSiODht6z5/xAca0u0Cfdo71F9/Nniozp56d0672uAAVo0
	 wV6lA4Z36Wb5qBvgC28iKTmg0Au1vn9mJIjXD+M+v6fsDqgpGvl9f8LzmbfBwD/aBDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkRxM0I3;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF773606A684
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF773606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkRxM0I3
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b32daac9d7so33484017b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 10:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630495; x=1796235295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtvIgmARk0ylTz1Vb55Uz9jsAfEsRaDu6ZRMFkPArig=;
        b=GkRxM0I3I9rw9mLuQwX/dgq1if9czrDya769L7oT8W7BXPcs6ii0XDH+75MEXs9q75
         9laMkh98+PVzu7I8zowc0qlg1rh+e+5kRkZsR8kOxQRgYjWDbn3DQuikB/DpDkqxZX3m
         hcKTMgHq2SxoCgrCl1r8B5p5I/aOM7hjR2xkU9YVSuoU2lu08e5FgFmsLYpNkp0XBvz1
         SrVDiKbu/CFB+dXKsYh9nJbMKZy7ngbjxR1M6HiHQ7gz8OHG1NIlTjVWujmI+lE5mNgv
         A4RRvaLxog6eQ+YwYTSyjW1T6Ul5YW7CCSBhAZRhjQpLNFgXXflxTCfgTQh/eQqBMTRX
         lpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630495; x=1796235295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtvIgmARk0ylTz1Vb55Uz9jsAfEsRaDu6ZRMFkPArig=;
        b=milyzsjzoDXDQKQxVU4fuR62O96Ei4pnIoTQPm8FDPwGQShI023uZVZE37UZKT14LD
         TKbKynZgniKrg4kiAj4BGS5IDzR4zzHfEgIVMPOWCc4l5K5HKszw6MyqbmHEGU20IA7Z
         tf/8eloZXfOiSIqPXNWo9ALgZRm6AVW4h5xxPp5ysKpgmkOnRxHIySdhA4fRMT6g16KM
         TNP35fInUsmPCq0spMMqFdG+PU/RzocOKEwYgBKB1dJ8zRBCBDMl1wcTTLT9GYt3RFJV
         Wq0yKFybmdL5N8Ji0fSmrv2Q13/66gX9LS6a2kj6sYJdPgOX+IwaKvBfMdujDqRrEI4L
         +OlA==
X-Forwarded-Encrypted: i=1; AL+hErE4LgyYfXChf21MOA4bprzIzmqFY+KRkPaxj+5+hdP43URvvJXNaF80K1yw9VJLWLrbxRSKSjSfxoGrwe0dk40=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vMslmoq/7W/3z1gfRfyyC63TZiVYQTSxcGCn+ucduCuWoeKNR
	OxxDjokmJTR6CxQxEzD9laPZU6GZi3fCcs6dC88VaIgjB8k5qLPKJAntys+aji0=
X-Gm-Gg: AZFdTZckiHONRFG1vL1SZ54KxPR/TeSkOvTHVnDf4lEVNrXc4OquCF7EM2Tg3KLfV85
	9Nyu3VlNU9GpkQZRtuFLE3BgoXwLYVkZGzcHxmgR2zCMjFmLqd46I2+7PpAHlUnF0AxrqjGa5v/
	91ml0EFISdA94bwZPkbRZxCJU3VblqAnYE6sfyMkSyj3tJtrc4FMlDzybjCN9Yz9wFVCQgXxFl5
	5rynY+58QiTXmFg8Hd7SVmSmqpLD0d4fOCmDP8nnPyZOSTXZzZE20uktPFW+PoggrvOM+MWqN/C
	W5yNKoBIvOtVH8CLmwpYRiz1rS3SFotxosrzsUQwgGnoje/1g6OE8VpgPDFYw+hh0EDYlxrLdvL
	B2exlhGMgGAB1GJPzHzPgQqrSqYRUslLhKWLuq3cbGQ0BJo4qwPaVMU3zxVAtgmPfQ9E1IvT+V1
	3puf0tuzcjiPwh+QcPh5dRzGPmzuwLst5qxD/SoTc0AgrLHhRbygukMG+68s+clMFeYVqrJ5mx9
	MWmwV1WCbLxYuyNYkyKGOtbtG634zOSW//E+iIeCy+5VENKKTVi6YjCxBICzy4ZxtQ545A57uzk
	/CJ8lrwm4fy+xWpVsdPDUasqC928IYPBEmQ=
X-Received: by 2002:a05:690c:38b:b0:8b4:f6be:d2b7 with SMTP id 00721157ae682-8b518e8aa37mr74974367b3.6.1795630494808;
        Wed, 25 Nov 2026 10:14:54 -0800 (PST)
Received: from 3511.attlocal.net ([2600:1702:7a3e:17b0::c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cdbsm74546187b3.1.2026.11.25.10.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:14:54 -0800 (PST)
From: Arav Verma <svav2021@gmail.com>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/3] tools/nolibc: fix standard conformance of a few string functions
Date: Wed, 25 Nov 2026 12:14:50 -0600
Message-ID: <20261125181453.814976-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few nolibc functions deviate from the C standard in corner cases:
strchr()/strrchr() do not find the terminating NUL, strstr() returns
NULL for an empty needle, and atoi()/atol() do not skip leading
whitespace or accept a '+' sign.

Fix them and add test cases. The new tests fail without the fixes. The
results were also compared against glibc.

Arav Verma (3):
  tools/nolibc: fix strchr() and strrchr() for the NUL terminator
  tools/nolibc: fix strstr() with an empty needle
  tools/nolibc: make atoi() and atol() skip whitespace and accept '+'

 tools/include/nolibc/stdlib.h                |  5 +++++
 tools/include/nolibc/string.h                | 12 +++++-------
 tools/testing/selftests/nolibc/nolibc-test.c |  9 +++++++++
 3 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.47.3

