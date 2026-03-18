Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4717A329E56;
	Wed, 18 Mar 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849031; cv=none; b=eM804IY8CWvbFakbr2AySa80VOWbFme++m5olbp0Gtx6UIwqKEusApVu7Wyo7dQ1oX6cS+sMKhdatm8lWFDcB2frKCorZ8veW45DzjL5C7WKmgXvHSwya8pzbpEzIdhHFf1Z5E8Hep68h5TjVI8YwoVSJhg95I319VyIag3bhdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849031; c=relaxed/simple;
	bh=kXShGqnZPr0sQQmOIFjbIk5fqoDXcN5fIOESvlZQzK4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gA6yOsEny2Zbi/kqQlOb+5yH2EzJ56u9SKtiOU0XyhgAw0ZWckUU2g+8En8m9H6x+7URqySbBJzqPytuPl/um26ffjgcMxBj6ksekWiMog1jQOJYJWll9PdOLei8sbi+fIyGuGWJvruEavAJpQD3IXHWy1GiWOe6S6W0SNKl73g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=BXntIC+H; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="BXntIC+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773849020;
	bh=kXShGqnZPr0sQQmOIFjbIk5fqoDXcN5fIOESvlZQzK4=;
	h=From:Subject:Date:To:Cc:From;
	b=BXntIC+H+gxUz1M/F78emDwo1zfiiw/MKcPZ2XzeDlVxI4IQKxERDzRSNPmviRKGE
	 ja2u//q9rQzTk/VhxO4tP90QMgMx4KY8OHEhjk9woN9p+JrQjGhAm6wqkveeNIrpDl
	 hVH2s8vrY2qGd3kjW+ChrlzR+j1KESsxjUg4oRPk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v4 0/2] tools/nolibc: add err.h
Date: Wed, 18 Mar 2026 16:50:15 +0100
Message-Id: <20260318-nolibc-err-h-v4-0-08247a694bd9@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMTQ7CIBhF0a00jMXwU6A6ch/GAYUPITGtgYqap
 nuXdtRUHd6XvDOiBDFAQsdqRBFySKHvStS7ChmvuyvgYEsjRpgknFLc9bfQGgwxYo+t41IrYa1
 1DSqXewQXXgt3vpT2IQ19fC96pvP6B8oUE6y40AcLylFhT08IKSXjH37fwYBmLbO1wDcCK4Kr6
 4YSwVui9E+BrwW5EXgRJLiGGCKobtWXME3TB1na8ywxAQAA
X-Change-ID: 20260311-nolibc-err-h-df36a75dddf8
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773849019; l=1512;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=kXShGqnZPr0sQQmOIFjbIk5fqoDXcN5fIOESvlZQzK4=;
 b=rXtPuheXq2YDeprr2Ny0VGtHH8Lk1gY4EUWa2UwHS9pIhVXxFTtzIqC1GpQNbt1l9ZBpq+JaX
 kskDBZc+AGiDBRqF/1fWBfhLAUeI76YvQiTWfLK/xn68iL0+tC6HE0Q
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a few convenient helpers to print error and warning messages.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v4:
- #include <stdbool.h> from nolibc-test.c
- Link to v3: https://patch.msgid.link/20260316-nolibc-err-h-v3-0-6ef80c051ab7@weissschuh.net

Changes in v3:
- Make sure program_invocation_{short_,}name are never NULL.
- Provide dummy definitions of program_invocation_{short_,}name
  when NOLIBC_IGNORE_ERRNO is set.
- Drop Ack from Willy.
- Link to v2: https://patch.msgid.link/20260313-nolibc-err-h-v2-0-f4481053b07a@weissschuh.net

Changes in v2:
- Fix program_invocation_name test to handle test execution as /init
- Drop already applied patches
- Link to v1: https://patch.msgid.link/20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net

---
Thomas Weißschuh (2):
      tools/nolibc: add support for program_invocation_{,short_}name
      tools/nolibc: add err.h

 tools/include/nolibc/Makefile                |  1 +
 tools/include/nolibc/crt.h                   | 26 +++++++++
 tools/include/nolibc/err.h                   | 87 ++++++++++++++++++++++++++++
 tools/include/nolibc/errno.h                 |  4 ++
 tools/include/nolibc/nolibc.h                |  1 +
 tools/testing/selftests/nolibc/nolibc-test.c | 34 +++++++++++
 6 files changed, 153 insertions(+)
---
base-commit: d59131de97ee69ab4e4b8926089a6e953d699b11
change-id: 20260311-nolibc-err-h-df36a75dddf8

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

