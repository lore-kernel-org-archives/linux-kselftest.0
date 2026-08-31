Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4656647606D;
	Mon, 31 Aug 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192310; cv=none; b=sFYRFGTWnZAkzVtvl1LZLRi3lzXKMzMXoVDKlmgehr9teawgP767+WaBd/n36B1UFIiOWnI5zFCWfBR5xiUzikgWKQBqsn9QnOw0RZSVupT9rHjq1x+E7mIA0iy5KbLs6deHcQnuDqAXHEi7OIUaxTjb8M/H8Tyv0nWvDVAU64Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192310; c=relaxed/simple;
	bh=S8A/TSaKjf6NDhTtmK7HQiM3lT+uYlGn15xY9F/POdU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g/vXW7RnmAknN8YHAvW65Av5o/cHP+/pp61wjnaA30BKibM1eZ1bHbYwlRjtp92ezxCWCi/JZZCzteCpLNoRM1a/Yek8Q5RfQ2oUXm4KFX1d9/V5aMDl0QB5w7s8wajq/VsRgucT6t3OSxsI4vjjG8J8NpZxj/hsKD2CaKRBvpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fJiphSzA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fJiphSzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1788192307;
	bh=S8A/TSaKjf6NDhTtmK7HQiM3lT+uYlGn15xY9F/POdU=;
	h=From:Subject:Date:To:Cc:From;
	b=fJiphSzAXjWCkRZ7qqchbWi3HtEb0IrkYD0xE0MWHwo7yX85NxEZcuTgdMXI1Jq6h
	 iIxGcAqLE3HUEd74pB9UAjSb8Slhm8MdOuefaykATq6z8F5wcVslKcvVho6aUqE+OD
	 poWYE1lORVOsx/+qaPTKmwIkAaMrzuUIM28yCcWg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] tools/nolibc: verify that a directory is opened
Date: Mon, 31 Aug 2026 18:04:58 +0200
Message-Id: <20260831-nolibc-fdopendir-enotdir-v1-0-8cf0e79c4e6f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2N2wrCMBBEf6Xss4GmweuviA8mmeqKbOomFaH03
 021T8OBmTMTZSgj06mZSPHmzEkq2E1D4X6VGwzHytS13a49OGskPdkH08c0QCKrgaSypIt7745
 A9FtLdT4oev781OfLn/PoHwhl8a0NxWusn2WtzfMX8eQIi5EAAAA=
X-Change-ID: 20260831-nolibc-fdopendir-enotdir-3d7b39eedb51
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788192306; l=838;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=S8A/TSaKjf6NDhTtmK7HQiM3lT+uYlGn15xY9F/POdU=;
 b=MxwdzJeuFTUkm0aO7Uh9iKaFg+BzRfbl+rrfecdecTrIeC8EJJ5DCiAf2tG+CHY/CskGgV3gd
 7zYK56xLIEOCMlPm7Z5VT2LDDDNKrfTVyFPY5ssKI6R+ZfBO6co0tw7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If a non-directory is opened, ENODIR should be returned from
opendir()/fdopendir() right away and not only during readdir_r().

Validate the type of opened file during open.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (3):
      tools/nolibc: verify that a directory is opened
      selftests/nolibc: validate ENOTDIR return values from opendir()/fdopendir()
      tools/nolibc: validate directory with O_DIRECTORY in opendir()

 tools/include/nolibc/dirent.h                | 18 ++++++++++++++++--
 tools/testing/selftests/nolibc/nolibc-test.c |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)
---
base-commit: 9c47af906bc655c8f45aaf1f156656239c2c5073
change-id: 20260831-nolibc-fdopendir-enotdir-3d7b39eedb51

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

