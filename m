Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E3346AE5
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138125; cv=none; b=cYHzDXZhHanCxlF1ciAUKB6ZSm3O3SO1UATYLK4/EjxqI21NxHxz5+N41gZ5hyVjvxKPdpWFejW2E/KPu/jVds5XINO59SDpc0gTVCegcZLt1+VNiC77k1wK2Tx+/0eRj2T1DbvgMs6tX3KCStlJIUB6kSEOFk+6VisNWKmTVGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138125; c=relaxed/simple;
	bh=OblWpqp19kDTyqAGzbzu2Q8zH9UYGbJQfvTQaIiJLRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IG1/HCx6+C+SzvlNvMcDjQRgrJxUwKcnK/4wS8OMceyHh0pVXNwxHthDJeDPJ6WkrwyweTBM7ya+sHJqDOm133FgVHFAo/Cw3ZsKxBLEARFgth3LUu9N2ZCMXg0r2FQcop82GxmPyInUnpHXpFPIGsRS2ugR7VT5h0uXvB6SFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9g2NcIp; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9g2NcIp"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-41729dc7d7aso740593fac.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 03:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773138123; x=1773742923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=653FzskN4REwEFDcgD8vcg1axVo0C/yYw7++qUXSZzQ=;
        b=K9g2NcIpBXFzNnohzdJE2krUeW2/q7S196XA36pQq7vw01Ypx8AfPZNS+ajfWGUwTN
         DexqIJ+ACkMVg9R8s7RrbWJEreaLXDzBzWd5mITjBXelW3QrSckdJjEcKA05vm+DmZus
         6yoS5H9Xmw/jhz7ZlnhhWRbrDsdLniSbLMGg3KHmNEm40rbFae5pYym1UPNE7wdhi5at
         +c42yVift1mS+F9AIkVbj+7hA2+VHuiV5eiho1PjkQFoFNCXG9omq8ixsFrGCLrDmQPk
         o9n2VNV2AmvzPkXvMHeniKBpg5jG0jJ1gxH/LMegqdD3SlSAHNGd9T5ttIlknAvPvf+E
         z92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773138123; x=1773742923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=653FzskN4REwEFDcgD8vcg1axVo0C/yYw7++qUXSZzQ=;
        b=S3YIZbbHuqgtHkBlnTuCq5YAxXaOv9yqRMNYvdZoNwgrLBTFvCRumkGL+1OFOo2nhG
         StPzeO61ZigIBiowOgR7ByydTtQen/5UWVCo5an7MSOQ+HeCbTYlFFEahLLy9OCw1Ii3
         q9zLuGYE8RglbjlDlNM8OFkYvcMTlXba/d47YwOHY99IvGBw6oP1Qp2Y+aq5JruJ3H4X
         XCPs+GLixDcSBgfCqTTN+Flhn9yXtxPR/PGHXsr1jwqAwKCznqNh0vnJx/07XLjBirJS
         ZGQtHM6up2xeIB+HK4CX613geN8IX58pebOOJRsr2sA+kIZ+Rim4zpQ+BwZlSh8RPs6U
         fD2A==
X-Forwarded-Encrypted: i=1; AJvYcCWcMy/tnrvmO//U7LFdAWs0hGIly71tfYPrI/PtPfqPYUmJXvst4jJ0JRskz17h5cvJSUrjN2Z8lWJYB5+1fsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFy2sVKunzgpsHKNtQACUzse8q44BQtJnB2/XmB7dLzz7fgFGf
	NBOWbIkkOXeRLBw1dhtaUtnXDCZrx+shJgMZoRrc+PtdWjbzdD1oKuxe
X-Gm-Gg: ATEYQzyZEpXCwKTMqr3lz+EyHxn5v6ugIWvVTEY57GNA1Uj8ANDGiqp0muC3Sv9SO/r
	NIYx8KpyO6rZfsoeba1wPxk2ABKvvNkEvfw2IJbItX2WPBWfWHVI8m5XMliaIMimevPNyWWylqJ
	g6Q9RHDGLd9z8uUDvBX/VnwhGEs13p1yDfY/oEvdvIlOSSgcXOZCuV2Iofw1gFtOlFIpllsAKXX
	+j3iBbWrvvj/zcISAQ0QVtmIVf5dAboQOc7rDXBHm0l2uE/EsG9qRSAvjeHd8jUg1QlzDmXDXB/
	UOE3ghyrbA82WNiwN/d63cK87WUou7lFeFSgyJ1l14phnAvTBC8EgDM3RGA1Hdh81IkZAwaDW1z
	u90djH7CZCAbw7qHjKKIJuPM3uEQfTpyXXuW01n0eLdnDpM7aHzgqTO3leRp2sFE2S5n+9Aj7C6
	//RrvwcxaV9X7OzGMlvKkmLNAPpk8NtLlSeQq1JGwIFlsjN5m+BeZpHcpST0ap6uE2HWragH6NP
	dE+3fcN1i1UEjIBmYOrB54tHoI=
X-Received: by 2002:a05:6820:818a:b0:672:e67a:96cf with SMTP id 006d021491bc7-67b9bc81ea2mr9110007eaf.16.1773138123241;
        Tue, 10 Mar 2026 03:22:03 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bb331eee0sm3877789eaf.8.2026.03.10.03.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:22:02 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 1/2] selftests/bpf: Fix read_iter buffer termination in test_bpffs
Date: Tue, 10 Mar 2026 18:21:44 +0800
Message-ID: <20260310102145.857810-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

read_iter() always NUL-terminated at the end of the buffer, so strstr()
could scan uninitialized stack bytes on short reads. Terminate at len and
use O_RDONLY.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_bpffs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_bpffs.c b/tools/testing/selftests/bpf/prog_tests/test_bpffs.c
index ea933fd151c3..e8021ff0581c 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_bpffs.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_bpffs.c
@@ -17,11 +17,11 @@ static int read_iter(char *file)
 	char buf[1024];
 	int fd, len;
 
-	fd = open(file, 0);
+	fd = open(file, O_RDONLY);
 	if (fd < 0)
 		return -1;
-	while ((len = read(fd, buf, sizeof(buf))) > 0) {
-		buf[sizeof(buf) - 1] = '\0';
+	while ((len = read(fd, buf, sizeof(buf) - 1)) > 0) {
+		buf[len] = '\0';
 		if (strstr(buf, "iter")) {
 			close(fd);
 			return 0;

base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.43.0

