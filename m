Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B891B448B9A
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364320; cv=none; b=Qi6He0ELSrYOfpYOVIInUA8pmbDU+c7edelmCkxGCqBBNG/nB6KavuolICYWEyuMfrUlHS1veRxvDcKcaW9ZR1vDcGZq2ZN8m/B2kZhMqMf2DRwIuvIWfvA06cbdGugajBTUc1YQuP6qXzc3f0/+xRmw1KELyjVW8FKahd14vIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364320; c=relaxed/simple;
	bh=j5Njce1R2CzMDzpSrCt4D4C2yKngQ2KuqhBpl1pHhmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t3+4oyktkE4XVoWy4zU0tBDdVo5/rh8ksFQ9z9C2UAMj5miopatkMTdZ6XcscmO40PKTAXuiy17I2UD9IAYtgJzEPbcmmiGqUx9koADpv5W/1Pp0GwL/Z50z6PLZeISYUY5FSOml6E/nzd7Wa9Bv5okSSXWlXUT0zqoYMIKWkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZEVauiQ; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZEVauiQ"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so753184f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364317; x=1790969117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G9E+sqsbctWeMKlnS+UkV61JpHdXQmDR0/Cg9hJ8tHo=;
        b=CZEVauiQEUUSshI568NztLVATBws7TXi2Zw2Ovcz0GRj7cZIcOjkTw/jvIL0WGzWWj
         xXqQ562xEWyLL9IB/V/wskVU3ZTAt40Ct/mbKk8IDciQB5KgRsspOo7hDmuyifpfzlMM
         82SDqR+l/ZiUn0JtjFPjUBD9STlJQ9/04jpghtw5DVJ4r+meCYtstNRrelvNPluixHx2
         O7WFyvaYq058kl33hPQ6czuFj7cnF3KmnEP/JpAqB9ialZPL0BMCXtYNPGv0JVYudldn
         iGZxbUC/9kVbn+FcWS8Hun+DgiNDV7e7J9tuPjptgKynbzmfTBIeBskqMQ3YKWID4sjA
         kzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364317; x=1790969117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9E+sqsbctWeMKlnS+UkV61JpHdXQmDR0/Cg9hJ8tHo=;
        b=x/AMpfNV0qeg/L6BHWRRvWdIKidVvSQzc7v44Wx0GwSZmUPNSCHW6Ybf0I1qD2bl3V
         2aampr/cUqQGoq463zSrbmpn4+6XoXZPeX9CDWK0tyzwsEW9yia1DrHdPNs4FQAmrbAe
         8vjMqJGSWAU16nrqOV3H1wh4V3SBbIVXiFaf17W6CAIPF/0lDIVNxr3iZA02RQi+AOMQ
         TbjdlWPwfwhSa9knENwWAGsv3Q9knBD9VjAGhLYt0+WJvaqzMWKnaGva1+9xM+ZNHEkR
         kenozYgigQBF3HKT6fOWYsTZp3g3fVkwjSV3xjJaGiaqxjlFy7Zeta/S7IpThpbfdDGp
         7K/Q==
X-Forwarded-Encrypted: i=1; AKwUvByqXFsm60LLSkSYeRecxbXo+XeSZE1vkGEzYTFUrV4ZxI+nSHH0Ghu5oU0gGuuVzTVjv0FfbfGfky57dFl9hq0=@vger.kernel.org
X-Gm-Message-State: AFuF++nblDPzVXzEk+aPb/1LxKzfR66Cx4mNyv42QoNkjT5XCV3SSsQB
	yAW/mFVApyH8QiPVo5YyWULS1/h6K9NGGxHpHjKxjMbNiIHkti0RizGg
X-Gm-Gg: AYBFou0e63GA7nnG8WfQ4x0phDmHP27cpyIN6MPNV1zmqNMdFmFmG84f7so7m8L8naB
	V0ITGTSlVleGEyLUjMpytFrtlnu/6c2yLM+Y7rxl6s5d41hOVDGmlawlEAZwwSQCpHg25k4pBTT
	/9UM8o15rykYZIDC2bZQK2WdMHLQHIahgMdKycp4e0W1vR7DKEBGzaM67MN8Ft3qw4DwkgBBzms
	Q5Ts0IKG4RgbInsiiW2V6I6eQdqB2MXZjFeoeHsvWi92OHq2Wp5nBDKzvjSu+1NWr8pjbOcDnQo
	QW2RfncL6NXbsLK5O01reVjAJ6deO0a/gCbmLQ6jbx7Zlhrcgz8dcWE4EsPvUXsoWLp0I4zvKds
	+QrNr9/v97WlpsSg3OUP6Lua3LZ9Xm/k4SB2bSiRncSb9oJMqVH4++3BOsS0tsmgROLwjYQRlBc
	VB5/KiLJulAsThONL1kHaprGPXyAOcZhsO2i9fI9AIZGExn1c7StZc5mOlJ9sErPraWV6Kwn+A1
	KpkH+BTGp/BXxBh9Lm7rjvTARSPmBFmiC4yB95pVYXZzjDZW8srNumMaGeBOMyE/J10tUVxxCdc
	hLBlW+BoKudyNipV5iNpCRLr8rIOd9Q+xq7+WWbWWqXRO09TySnA1XIxhpvdRxCBBSbVTx2DHGQ
	yayWmP6k=
X-Received: by 2002:a05:6000:26d1:b0:487:8ec:1fc with SMTP id ffacd0b85a97d-4887d9fa635mr5543814f8f.12.1790364316713;
        Fri, 25 Sep 2026 12:25:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-adc6-9c01-89ae-b145-8960-cf19.310.pool.telefonica.de. [2a02:3100:adc6:9c01:89ae:b145:8960:cf19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm10205982f8f.20.2026.09.25.12.25.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 12:25:16 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: mctp: Stop selecting flow support for KUnit tests
Date: Fri, 25 Sep 2026 21:25:10 +0200
Message-Id: <20260925192510.93840-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MCTP_TEST selects MCTP_FLOWS, which also enables SKB_EXTENSIONS when no
transport requires them. Remove the selection to follow the dependency
rule in Documentation/dev-tools/kunit/style.rst.

The two flow-specific tests already skip when MCTP_FLOWS is disabled.
The remaining tests can run in either configuration.

Fixes: 109a5331143d ("net: mctp: tests: Test that outgoing skbs have flow data populated")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Validation on net-next 42a9fb3382fc: x86_64 LLVM builds and QEMU runs
with MCTP_FLOWS disabled and enabled. Both suites pass. With flow support
disabled, only the two flow-specific cases skip. The enabled configuration
uses the I2C transport to select MCTP_FLOWS.

 net/mctp/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/mctp/Kconfig b/net/mctp/Kconfig
index d8d3413a37f7..3a5c0e70da77 100644
--- a/net/mctp/Kconfig
+++ b/net/mctp/Kconfig
@@ -14,7 +14,6 @@ menuconfig MCTP
 
 config MCTP_TEST
         bool "MCTP core tests" if !KUNIT_ALL_TESTS
-        select MCTP_FLOWS
         depends on MCTP=y && KUNIT=y
         default KUNIT_ALL_TESTS
 

base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
