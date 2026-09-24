Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CC047ECEE
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251804; cv=none; b=Ln2oSyUxABXHEti5Yq3ZrjUUBOwO/nXowhUGhHD3BEwjj1BMLWUbBfOj6btCdvdORphwSGCNfcKnuOJNbZkLKfzggQbbXFtS95WrR8tO2zli3tcBuzA5p1OsCd3y7cchiH22gxCH5a+IRyb44Lbt36piKS72umrR91TLty1nV7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251804; c=relaxed/simple;
	bh=g7EOyRqtAFbQK+H80q1NreQ5GhH1UcgvaIBoQ+artjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIXY23VzdEnr61nOc+JbtK1uXcfQb1AMgRwrrZ1yPJJXl5+Qxd8PiO0t5o3Aclds6Rycj8O92wxvypg57w1H/8oweKmyZNkIUoun0rbl9/3txQTNpYe8b6zP7wrtSSOQlzgi8b/vOSKn2bOC77V3CUwlAEnlrxIOSolu5/nZw9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHXqBe5P; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHXqBe5P"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae7166edso1144424eaf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 05:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790251802; x=1790856602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BKBUzSZB3vVnSpPIGxLPH07emHByxzqthFJBCTfAGa4=;
        b=sHXqBe5PoHuTiUqd8B1i8ScyzQVSVaeGZpBFH6Ym7lUFrkTqX+rAi72JWlSZ6KPRSD
         rPa6kqLfE/0HADsJ3WtrsW5PdfO1WKcNMyWw/ZEkYv3vstFe3PcN5q86Q9/4uxze6pxe
         hiB6GruypA/311Gj3GdgONvwneV/1C1qa3nk5zftsrNViOPgHOD8OhrdGf1+dDdl1WXG
         haMcm4odzJW9aHBnwK78vsC78GYdJS9SxFDzGbU59FAYsowgWqpMVY4HUyE+cPP3QsKH
         L33KOUZgvzqUvALDL2TAk2DOWTGezl5AXusMAMRvhz6jzp3vEzBNR2lRrA/xHpTVu7uO
         N0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251802; x=1790856602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BKBUzSZB3vVnSpPIGxLPH07emHByxzqthFJBCTfAGa4=;
        b=PMVyYH5ku0Zs2KDvdkn621yxNXwAA27R2HbSeCzaooA/k/kBczdCcumPD4z6KE3A7S
         aPsMdM5xUQmW/kC5OrxWxeAp5OM1kNg2JSAgzA62KdKpLLyML+AlIJ9r/O6/Lwbp5BMs
         VOfxTq4fZAuTLKAXYDWkhc5+PSIkWhXIqXcewpNjzaZP9/jxLmp/X5/kDKNsWNLOZMr3
         7OQ38Q5qPuGobFTwaPbiOaFUKLp+RS1x7GZa+ZfMeGMrzNfKNMugfYqKr2078FEZgbcM
         e/OCxAUaoYzvsZaRqJeCnBMj2EnMwQjz0JFjEHAx2S7ryu8D0G3zn7fT2xTHpYii89KN
         9YJA==
X-Forwarded-Encrypted: i=1; AKwUvBxuaou4sj9bV4q6brsSjZNlzjqOJ24/Zz8RlG2W/qDl7MFptpu+20bS3g65CBPoknePSame3+8fWdjqWskZk04=@vger.kernel.org
X-Gm-Message-State: AFuF++kIPUF68hq2rqdKwBREk5vmd6xrXQ4bDluIriLvuAi3ldID3+0x
	YzxCRUPZEMPrHTqfTpQJoqOGRXgVuR/bV8/Ao/oXXWkF+XL9riJwOqom
X-Gm-Gg: AYBFou0C3SlL1y4KSf6VdCp/Okf0fUp/vKmKclDIG+CHL/kt/QrCcA9+jycotcH651l
	DONEMnTZ3silaEpx1V7IZjhq8vVq4PogyxbvRo0vVo7tcvPOgSdS7egM0cD2oIlS6kz82Nao2gS
	JhvYUUcHoi6qmTD0naXnKo+kp/d6pmMnysQPLJvsHkIa7yvPcOHJfrjU/zIqVtdjS/D9PXnxt4o
	G1toF1rI0H1fF75Ak59dG0vH0RcsTlcDp12x4f4XnHQx82+g7UfH0SNFTpTwPkQ0VGlUyQOUvin
	05C1zeZN/mTtxRFP5SC+yWKjMSPSJOl8g7ftbPzwBRxByZZjU//ba2x74QxhV+iWgiyLuWMOcid
	UOpyiRImDLwmpVQ1aGI2WkC/0ODkKVstxxonZjUHPsDeLoU7SqRLoBuI1FZoa8agJVId9pzKGOH
	CtV+zn3ABFlemT6lbUJZ+U3MFCr/D6kBXQHH5S0h9j7HzpDAF1RDFsJcNpNN16GyAYuIEW8CfEz
	Qrjy+B+CFbtwocxf9hLPopwUuw6PRacmhRb31+R
X-Received: by 2002:a05:6820:806:b0:6ae:a950:9fb4 with SMTP id 006d021491bc7-6d43f9956d7mr2263108eaf.33.1790251801819;
        Thu, 24 Sep 2026 05:10:01 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2ce763f94sm5018070eaf.8.2026.09.24.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:10:00 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/2] tools/nolibc: fix verrx() and errx()
Date: Thu, 24 Sep 2026 07:09:56 -0500
Message-ID: <20260924120958.23698-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

verrx() passes its va_list to the variadic warnx() instead of vwarnx(),
so errx() and verrx() print their messages with the wrong arguments,
and can crash when the format has a "%s".

Patch 1 fixes it. Patch 2 adds a nolibc-test case for errx(), which
would have caught it.

The series is independent of the readdir_r()/FD_* series [1] and merges
cleanly with it.

Tested on top of nolibc/for-next 61fb00d6efee, on x86_64 and i386, and
on arm, arm64 and sparc64 under qemu-user:

- nolibc-test, all tests: no failures with the series. The only
  difference from before is the new errx test, which passes. It also
  passes against glibc (make libc-test).

- Without patch 1, the errx test fails on all five. On x86_64 the child
  is killed by SIGSEGV.

[1] https://lore.kernel.org/all/20260924015222.31693-1-danishkhateeb03@gmail.com/

Danish Khateeb (2):
  tools/nolibc: fix verrx() and errx() message formatting
  selftests/nolibc: add a test for errx()

 tools/include/nolibc/err.h                   |  2 +-
 tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)


base-commit: 61fb00d6efeeeb9fd65c81db3bd8b2ac140f573c
-- 
2.55.0

