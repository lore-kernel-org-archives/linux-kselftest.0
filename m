Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31EB2F6918
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205585; cv=none; b=Jz3d+Wp36Bh8k4fPcS5gC4xfDQ/VRgod8JV3ZmMdr6vkW61nK+jFWmrr1LcZ/np0b/a+Uff1V0xPnyWwZZxifWtDQ6viKqS49did4qsQgCvlMX0ZRiftoGh4bIqbEyvqlqNiDyMCWrfnPNMZqg36EaetaKxB8ZDrNx/vI6T5bps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205585; c=relaxed/simple;
	bh=lWjHP6alA8c9bfJKDwOOPP5dbXqNnIjRZYB6Isxoog8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeX+lznfElYCxd2uMbI/DmbjzjFxwJhi609rRx92NR9hZaqqinWKHyV6lrm6+n+wtG3SCe13tgs0oh5AZcWPllmz100jaxSzLYXOZS4VlpsPCQu+tWIQ/uvTqmIEdJXOwc3NyT6nJ/U/v+VKtf2nW1SHwoatOyLqEqOpGRceFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv6XDB4J; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv6XDB4J"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso2434635a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205582; x=1791810382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BjL2pXlHfuAQFc/3GOIX7IQe1y00mLqM+xdgaQa2Gmw=;
        b=lv6XDB4JcMjNcKWP1RwcCUGeHU+CuXynbx2p4HBMTgPlh1iC4zsxy/QVjpaDhuVDfM
         jdo8cuRm7f2OiqPGdMS/pEmn4mSGo2bIMEf1IcNX/T5FLHXh8nCg/MaTZmpMmWFfu9Rj
         +Ldonim7hAl8m+eeOLxLB8gEsIfsPlk4suff7oOPlqt/nJngHJo5V59v6j6Cd0hEr30e
         tIMLCaFaxgY9bFXWmW0NUqEb36xKvNwG/GKIdc3v0m9yo9edrQz2MjoJxoc8SCeMazzw
         EhoDjGEl7gq1AyLIyTLcMxf6Icw9ufNowWr0bMSOIIuEH9rYaUOcDh/lD67ifnlFanV9
         HkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205582; x=1791810382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BjL2pXlHfuAQFc/3GOIX7IQe1y00mLqM+xdgaQa2Gmw=;
        b=QfCAa/AOqQauTPBXMUz2Y1N3O7/3v593a6TIxnsuHUivuRdlWEiiULJ7Z0ZYKqI/ET
         kPatuY6VfzmT8FHxrIeX6BiloL8RDCT0HXt3r/v5qOyhWaWVDPx/kKJQ0nMjRnlLoy1Z
         PSas4f6sOhS7e+6EMYOTwCRvss/laDErReEmi8s7G+OBgUqpRqde82K3u9PmxGZ8Ruj6
         M/Un4Bo+y3CMlOX95ggLi2nHH6ZNU5OSGvxscQ0eYr6YBAaGnzzATu0uNF5RZQuf/W04
         UK3F/MYZifa7EDv31wiVfRBu8aW9W9Bs2vTWiUJ2NGLC6Fkjf1xA13Onz1Lz7w+65qQl
         7baQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjd291a7fr2j2JUlFXXcCnWRc0YJMoje9wBfGObvRJQ3NWuH5hlpGmEhl7GHfIVCszJgvaYBAyKZqOax9i/oE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC0aEnx8GqohY9wN5AibD+3KQJF6UU+TcnVZAQn6JNVDvOFLyG
	MXykN0lnt04s6bZmAjZYRI16YPvc2z6fspY+yYOt6B1L6F00CCCYh10G
X-Gm-Gg: AYBFou1vAtcqgpp0/VITSiwPsE4SYiihdXvoJ2+SEvI9zfoS3ccJ439twrbZ+GT1/Os
	YCz++jqKbZ4efW/ECeIU04Jv24D6CEAbdeYvGIndB4eO+MPnhxuJ+LdH+YKTtcNtUiD7yUnt+N2
	ZfnORFNbGNeQkQWaWr23aXgxRrGBn2vDqT9P0b+uoWY+IF6azwY2bTedtO2EYWXGdAVCGV/K/o/
	y1KmrCfEvf+vQXD3WUeoRS7Pk77LrVONFMMq1+2KAwIk+P1q4J9cwDsqsAWIBCZjX+IxWQHBEQa
	MppEEzT8w3na1pnqzNSAZ76xwnilBTtcH0iYwnfsYc99F82uvxcyyYR+u0obLltoSOfcg/pAI9z
	x++GL4AN8hqZIf4PlplgIH4Ah93DOOKlCzsV5RuoSmXXyv2EBzKCpKJ7wQOlWE7mOKZqkjDK+Gv
	F5X6QXnlVPjX8kH1xgR+zTL3An3ydodqb6Yw5FluiMP9yy08rTLR1gPosl5qwOjhIt+eBHPHAEQ
	dsfuMvxlA==
X-Received: by 2002:a05:6402:378e:b0:6ac:934e:a9d6 with SMTP id 4fb4d7f45d1cf-6af9e022bcamr9401777a12.5.1791205581824;
        Mon, 05 Oct 2026 06:06:21 -0700 (PDT)
Received: from fedora ([51.37.100.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb005a424sm3390647a12.0.2026.10.05.06.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:06:20 -0700 (PDT)
From: Paul Dolan <paul.dolan.dev@gmail.com>
To: keescook@chromium.org,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Dolan <paul.dolan.dev@gmail.com>
Subject: [PATCH RESEND] selftests/exec: reject zero as power-of-two alignment
Date: Mon,  5 Oct 2026 14:06:12 +0100
Message-ID: <20261005130612.162824-1-paul.dolan.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The load_address test reports whether an alignment was found separately
from whether that alignment is a power of two. However, the usual
x & (x - 1) check also evaluates to zero when x is zero, causing a
missing alignment to be reported as a power of two.

Require the alignment to be non-zero when reporting the power-of-two
result.

Fixes: b57a2907c9d9 ("selftests/exec: Build both static and non-static load_address tests")
Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>
---
 tools/testing/selftests/exec/load_address.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/exec/load_address.c b/tools/testing/selftests/exec/load_address.c
index 55fd3732f029..e279d85e8f19 100644
--- a/tools/testing/selftests/exec/load_address.c
+++ b/tools/testing/selftests/exec/load_address.c
@@ -92,9 +92,10 @@ int main(int argc, char **argv)
 
 	/* Is the alignment sane? */
 	pow2 = extracted.alignment & (extracted.alignment - 1);
-	ksft_test_result(pow2 == 0,
-			 "Alignment is%s a power of 2: %#llx\n",
-			 pow2 == 0 ? "" : " NOT", extracted.alignment);
+	ksft_test_result(extracted.alignment != 0 && pow2 == 0,
+		"Alignment is%s a power of 2: %#llx\n",
+		extracted.alignment != 0 && pow2 == 0 ? "" : " NOT",
+		extracted.alignment);
 
 	/* Is the load address aligned? */
 	misalign = extracted.load_address & (extracted.alignment - 1);
-- 
2.55.0

