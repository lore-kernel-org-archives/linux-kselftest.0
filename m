Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290841EB5FD
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572553; cv=none; b=Ln+/yfgNgcQQqwWhGio1gr02EYK8x6K3MwdX/2b/kH9rV5HininH+UmF/9EgjZftfOs1ZXSDA+3kJjgl+VAfe4HwbI1DyNSh+1iYfsts0TPUAQPWYqHD0JlR004y46TmwCjWO1by5deT7LL/xeFF8mfOAVBBPdtctl7yucBbeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572553; c=relaxed/simple;
	bh=IRHUYQTVSy7eKLfs9awYkPFAR9CSsmd4GW1ICvSISTA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n6Wcdah71OWGwmG7mYq+v0d8VVhOxbfL4OKPxwdkyUSTtvkbdxZ3KlrR6ebg0I3+Sx951+AVR2usILRVF3JQ4Pz0CNCbyYxbs3w88rueYChXHAzeTev9+ck1L+9d5FC0i43wKqwDaOacZ3zDJZrM+2/OQO7xZZ0T8vQES4rU+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FZnr6iVq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FZnr6iVq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48374014a77so68770935e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775572550; x=1776177350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSLEuzftp/vn581F8/eCq5iwVi1oOcYy/GnZ6Clx8Vc=;
        b=FZnr6iVqremJUDm9DldwVV6BJZpUWYMXnEfAaMKqYnjnrUjA2yw9kfjN/Hf3IPO1NW
         FemOBBXpY4gjvTsZUDV/BaeT6cy34BoV24mJK21Z72c2VvMLfPqzpXYg2Pf/ckpELCxh
         RwtDqkjrmcUNLrWxMyiqO+tEoSJcm67xKXkuAXfaAgn5BLnvzl1slJea8DKa7HVvBnvz
         4CxQ7p6YRDNq6xJvVA3/xvkIYTChnCy6eey0HnuCTUUiPyH21/skT386IwTiTFcmxaaD
         FX3uNsDgBzGo16gQEdSJGVtWrooycQXoIhTmj8/6sVfvSCC8cqRSlGrtUuYbMNREubz8
         W1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572550; x=1776177350;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSLEuzftp/vn581F8/eCq5iwVi1oOcYy/GnZ6Clx8Vc=;
        b=XX03dlSVvsvilxIGbj+IVOGB08qrO3gliR73ZlcWYgikCL+c3K7mjloZX9rAopmTjN
         5KODir3k9ZM2wdI/aypcmHzkldE01TZyDRQ3h5B2KvyjM4ow+1UtR5RjHEyL7lVnsiVO
         JdZQ6otOuSfFCvd1+si6V4iY1TamvAidn7i1QDI63QeZn1FnjjZAG/3ijXImJUs1oJ1d
         RUlNNzFozaRozREhgtGnQgqy9dwA2ov2PUm9NrGQEK9xOx3esM5UmtPAUBbsuvDYt4l7
         JAm3yijW7JqJLMzk3tWz1fEWhYtW/X1+6RfZ4hAPLQjbHpbYENhV+cmBKzXpCk9v40vB
         X/XQ==
X-Gm-Message-State: AOJu0YxZrRYL1O5q00eXFyO+xykIloMwnvbhE6v9Iy2cmjROBZND0LrX
	WBKsZwg0g8CWT0j6X0I6ai/m9uqHeIMsp6klD9AOUgGliQt6T7CFZmLikHv/BZ/YrRI=
X-Gm-Gg: AeBDieuY3RdexOpmF2mAaH7yFBIW7ESmBun8dYi0WEjhTrUq76iwcmlnfBOkrmj54Rs
	JbSsoVe9P2Gd1U0qXgIMWWkiQCmaTqKuFkX89igbnouszcHGk8a9y/SG2xzgxCQ/Mm0HnLkvL9P
	zsMf5FTt84aQp4jxWPlpB242ds32GdjoN1DA0qKUPcDhELjgJWZhdGhoiWw+uQKMGq+PJmtWxc5
	ljPCM2lrtqHpp6JyCLv8/ZWqJfbYoz4SMLpA5X1OQy7kaSmfsu0IPmQZgqW+T4+JLkULSwbXFUw
	o+Tnq7BwG1pwoT3OVzSx+hRBICU7xVQM/8AXPdgv9hdJcuTLawF3cf3bbxYkOcFsjSM8SdfK2RX
	QWAq7FXDoOeKCa3ghXCZg2R7qFiNFygH8V4zKoMqaUVzdI0GXzgjnXX+qmlhv4wShrIAokAUy39
	Ct00EX3EefqJLu
X-Received: by 2002:a05:600c:c049:b0:487:2439:6266 with SMTP id 5b1f17b1804b1-488998e3a68mr171943005e9.30.1775572550519;
        Tue, 07 Apr 2026 07:35:50 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cae7e3ec57sm18751150eec.1.2026.04.07.07.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:35:49 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Subject: [PATCH 0/3] selftests/namespaces: Fix test hangs and false
 failures
Date: Tue, 07 Apr 2026 11:35:44 -0300
Message-Id: <20260407-selftests-namespaces_fixes-v1-0-59109909d88b@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEAW1WkC/yWMWw6CMBBFt0Lm28aCVaJbIca09RbGSCGdakwIe
 7fo57mPs5AgMYQu1UIJbxaeYoF6V5EfbOyh+F6YGt2ctNGtEjxDhmRR0Y6Q2XrILfAHoswhBNP
 W7RlHT0UwJ/yK8u+uf5aXe8DnzbgtnBUol2z0wxZNiXuO+9FKRqJ1/QKYX1QhngAAAA==
X-Change-ID: 20260407-selftests-namespaces_fixes-43ff47179e5c
To: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775572546; l=1521;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=IRHUYQTVSy7eKLfs9awYkPFAR9CSsmd4GW1ICvSISTA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMwfKFjSFI9+yoX2A1QL0+sICdA6JUuHgk7zaWVttpu+8YYyeWxdv4j0CP6pt0U8yq+5bDD2J7p
 1aDlvR2+c/gg=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

This series addresses three reliability problems in the namespaces selftest
suite that cause tests to hang or report incorrect results.

The first patch fixes a hang in nsid_test where the grandchild process is
not reaped during fixture teardown, leaving it alive and holding the TAP
pipe write-end open so the test runner blocks indefinitely waiting for EOF.

The second and third patches fix two problems in listns_efault_test: a
waitpid(-1) race that can cause the iterator child to be consumed during
namespace cleanup (leading to an indefinite block on the subsequent targeted
waitpid), and a false FAIL verdict on kernels that do not implement listns()
(the EFAULT tests should SKIP in that case, consistent with every other
listns test that already handles ENOSYS correctly).

Assisted-by: Claude Sonnet 4.6
Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
Ricardo B. Marlière (3):
      selftests/namespaces: Kill grandchild in nsid fixture teardown
      selftests/namespaces: Fix waitpid race in listns_efault_test cleanup
      selftests/namespaces: Skip efault tests when listns() is not available

 .../selftests/namespaces/listns_efault_test.c      | 33 ++++++++++++++++++----
 tools/testing/selftests/namespaces/nsid_test.c     | 14 ++++++++-
 2 files changed, 40 insertions(+), 7 deletions(-)
---
base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4
change-id: 20260407-selftests-namespaces_fixes-43ff47179e5c

Best regards,
--  
Ricardo B. Marlière <rbm@suse.com>

