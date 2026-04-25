Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0314A224AF7;
	Sat, 25 Apr 2026 03:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777088579; cv=none; b=apkwmt66SzoP/xEy9Rdp60oOXdIRzwT0tv6I0vWvFQ5IzEMNlkdhS/fRnlGoAm1ZO+cIyoA4MsYq2d6FLpQKkFegZOdTynSUsGKQGLpSTykvVZ9Ek7TAQ9txvLZJcyDwXNl26Bu0aOVNIg3YVVRfGGFNlNpVDdM/MjKxTdSg0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777088579; c=relaxed/simple;
	bh=IrQI7yW76VzE6zKYQoU3I+Gd2W2Ui+lUDWkL9wjoYKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MlX3BzOy9TnoW0tBsMDSJaDFBFkj6HKDtc030Dn4m7mkLNHhxqerQwU0mERN3+XLb/3DZOG+MyVXff807Eltr444Qd/EZ6/V3UcJkUQ8+NF5s1WGGl5LcDhd2G0vKEpe5Rq9WgDb3/etb9Nyu0sv+ZSjiIG5LWC8Qx+l+JvVa7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=AQ+8e0Fa; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=gmGNhwGh; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="AQ+8e0Fa";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="gmGNhwGh"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777088576;
	bh=IrQI7yW76VzE6zKYQoU3I+Gd2W2Ui+lUDWkL9wjoYKg=;
	h=From:To:Cc:Subject:Date:From;
	b=AQ+8e0FapH7a4thlHKhPH/exAOal43Y1BAAX3f3ZMHc94PCy875Q5FjuGt49Cf2ZS
	 5uId7rzKLSEMKqNCcFE8P8ldd6El29bDrkUTy0b3IUHIxYUG56iQKSEquZH/NJIsS0
	 5WlEWO4OxLgppbflwjgbATOxjmB3YQh1Wyg0ajmZE29E2jBW7DvxKQVemPG6bWoggD
	 atQ8AtKCD0L21k+daSvzv95fVi1ZGfEV1+7e6BI2MOU4oIPfQpBjgyB0+N6fNyCkN2
	 pI5VbvBmhn981W9aeMLZ0iDEd0b+eK42fVE/fh8e9n7x65+g8ZHDP6SWYz832EXxCY
	 jtpKE+26u7cwi981PpjdmmMG1+lfg/JFXw4pzuRLdwSsJf5yCeyZmltG1bnn+0Tn4J
	 eeVRlaR/DQArGKH6CjMMx830kzoHwbRj+49WpI+m41Q06wOo3JbLYCVkJwNMsKDrw+
	 8xidb9+PMhB2T19WWxCNgISnCQumKFEPX6OhWgvcccpmYSBv+dMEgjUFzEYpP3Iz5d
	 /APGHfsxQga97wdlaDkIgzIsIdAnZ1jq4cpLETnH2GiDiuz48xX7G61Yfm/1bKe8Of
	 5ZzwHB0NwWqRGWK/rKbFfPHIev+M6BfSSkEO9xzCGYy4KQphQC3jQ4CqRq3qlRCPLO
	 2yiJwpN7GwhVHO9YdbWHLMvA=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 23C681E8F12; Sat, 25 Apr 2026 11:42:56 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777088536;
	bh=IrQI7yW76VzE6zKYQoU3I+Gd2W2Ui+lUDWkL9wjoYKg=;
	h=From:To:Cc:Subject:Date:From;
	b=gmGNhwGhg9kvRBaAOg7zuJ7/iGldOom8YwqCKBoaDXE+CtWskc/fFkY4OtyLVK0pb
	 SdkVqqMtkSQSDonAhywElSV6Bbd+HUQoYyZWD45McZasYjjTkc5IggfzccKO2DC/8Z
	 G0nmZioWU7ro/rnfCGKzlg6y9ZpHZ+vnSyGxGxdlvRbQJ0tiN8XIKrJVNnpxvd2xJB
	 AA5YtDy6iZr7H5iu6MjP3ADmux+hGg6ShcPKddmLlqS/0YTQSLpEKjd62w7KJDF7AY
	 pvKasBE0IXXQ0cfIqhVnesIL0c4vISQ8QuE0/f8P1M71XjygwaBV8cxMNRQJu9gCYt
	 hn0XoSc193MZ6ItW6SF4yqjpje0mSXYf6/B7eb1oqRxTwDNUSmwHc1AhLZVe0my29Y
	 phjtkK75erpYass+uK2ypaam2bIPL2MKBpZl+pqeOq2InLNTfDFNriQO1R4M3JND0q
	 H7CMS0k26bSGGVV1Ua2i/770uNCniYf/TfuU4mSMeniGDZ/PoO8RwORgZ9Ye+JDjxI
	 PV2VT2lOW0Dk6fsR+8bvBwGbd9g8NCo5mbsgfxF7nxNx5rymfArEA80dtRDML1I6zn
	 Fh3R63VGSIdf23lFqOc/Lu3mM/Wts7aft2Cr15oKBEwPWAxOTX2QV6UPv6hhaFItgp
	 EPLXxG+xKY4yDv7DJGRhPvog=
Received: from localhost (pa49-196-90-201.pa.vic.optusnet.com.au [49.196.90.201])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id B05881E8F0D;
	Sat, 25 Apr 2026 11:42:15 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <david@davidgow.net>,
	Alan Maguire <alan.maguire@oracle.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kunit: config: Enable KUNIT_DEBUGFS by default
Date: Sat, 25 Apr 2026 11:41:53 +0800
Message-ID: <20260425034155.53913-1-david@davidgow.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KUNIT_DEBUGFS option is currently enabled based on the value of
KUNIT_ALL_TESTS, but it really doesn't have anything to do with the set of
enabled tests, so just enable it by default anyway. In particular, this
shouldn't be only visible if KUNIT_ALL_TESTS is set, which is quite
confusing.

Fixes: beaed42c427d ("kunit: default KUNIT_* fragments to KUNIT_ALL_TESTS")
Signed-off-by: David Gow <david@davidgow.net>
---
 lib/kunit/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 498cc51e493d..f80ca3aeedb0 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -16,8 +16,8 @@ menuconfig KUNIT
 if KUNIT
 
 config KUNIT_DEBUGFS
-	bool "KUnit - Enable /sys/kernel/debug/kunit debugfs representation" if !KUNIT_ALL_TESTS
-	default KUNIT_ALL_TESTS
+	bool "KUnit - Enable /sys/kernel/debug/kunit debugfs representation"
+	default y
 	help
 	  Enable debugfs representation for kunit.  Currently this consists
 	  of /sys/kernel/debug/kunit/<test_suite>/results files for each
-- 
2.53.0

