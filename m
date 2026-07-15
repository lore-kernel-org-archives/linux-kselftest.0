Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE373845DA
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126160; cv=none; b=qc31O89GYwH2CYh2PQJlX/QUWlYJZkVzfJv8cBHXnMUD6QSBuN6Awk4JhIATwYWXNwIKimqdS3pzVecDU6Tv5TwG5+DrCBEInJ/Ij4ZqNyrC5ALP0PZUeeOhjV9EjRjx6EaV/KsT8RSm5KAkYyKTzyPA2WADFz2AsktGT0tE0ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126160; c=relaxed/simple;
	bh=hxmKRPMmqGMKGywEfTu9KROw+Ys4d3cc+jYzBoXbH1A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LkLTdsvZXVUQc2eU/UY3BHPiuJmUet8foFQBmM6heP6ggjKIumc7R0gkOMgEWNoVMpT/cg7YVHFswV2j6ED4QMusCjZ/sHJC26iJifMWvnL3XBwk6C8EuSE8t3VTtDtZFCpzHY2nFjE+ZojOD1who1iLGOFIYSR63tpc/W8WV6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvT+oBVU; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvT+oBVU"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso3533004a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784126158; x=1784730958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3P+ay8dWFUyLvh92+wpcw02jxXPVk53CiD8LmKlD/k=;
        b=jvT+oBVUxc+9uR00Ulxnxc9l1TVjSUAaJWNrjsnWQJd/DjIjZx5gnV1J3dIVUep/dX
         jAPjoUOW5xX8hRqkxm++CIEigTCXnQ/1eIaB1WrJA8cR7DiNa5H4FuQO1eNTUbxyZhm7
         iTwSl7Jj3bs9jX47Lowr956C2t5HEmSBVLYSKmqQ0lPPw8XeDwuRtyWivnwExxNyNHe7
         890kQOUgNB72SJUSjLTB8wC1+kzpHyIYp01vLBVSw0PFJQ1TViJqgclP5nhvu4Cf+Jx/
         PluddWa/+0GiOCuvAa3/bhyxtrXjmJF6tUHIFbGH5Pg4JcYtvFURBZWPSyzGWzzpRt02
         2cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784126158; x=1784730958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3P+ay8dWFUyLvh92+wpcw02jxXPVk53CiD8LmKlD/k=;
        b=qGyMUF1cJutgZ1EH7/I8Kyd5wGcAEVKn727kvSzlsmhwJHIYWBjjrjce4xOTZ+HK7D
         q+hFgB3R/szgBDU9spYu4qFQuiZ5jpkHiUHImwge+4oDsfE7NLhiNFzq6nNdacFiiMYp
         sHytgfqAdBuJBnjRTinH/Y/G8Cumb7TwWKKRV+a3VCxN1Q487I+KKgKguboMr0JZ+x9u
         Uv2nQUl8SMfdQ9jTKdYBVk/iTILVMaoxRIbcrpto7QGkYKf5R8x1WbWD6KByNIu3HjAj
         i6+vIZPXsDxi3UZPYihYGXZzkGUhuobdwCJcLTQfWv0g3D5ANIjAKQzxnOJLtV1J8o7E
         fYow==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Q+2H95J8f+guUaMPMXJNYd5Ke6QlhsZ0CNFd5B+NZyu084sPP//HuYlxKlTVvoL3c5SHPOVA2SFqygf1v9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmW/bitpKY8tew/yqA5zEsVDbskys7BmmWWD1qED2qhPNmDzTn
	mgHpaah/XprONk6sirA0/MG1xSVRATX5zQUd2BLSd0M1t3UsfNgg1enR
X-Gm-Gg: AfdE7cljfUuOzH3N5hkW+xZpBE2X0wWjjHIXoZsQp0+477fV13oIQHrFNN+UuVkcqiU
	6GXd4+b7SPCPbovQ9Pv1ycZLTK8ssa0bm4v6O5SdezkFJCgXkUZm0f00KzwYIOnQ/fdgOl71Jt1
	sgj0/UYhFzAQy+RWPcVg+KMs3zWH43sj8esedl91c4eXlNwXZ79YZFoqWngeW8IPs8nInqujWyp
	andRpregY0Xpnq1Rx7QN/rYPUzxTVr8+Dzx9ADveEpa37Mqwd/+rSuDQF5gI5blCZu69zVpW+nT
	fael0BoLMh2VXq/9q7ddG6rFsPYqfB735ACJ1m7e0onp84yOVKiu79hrIai89/xeU+rdNpsWuQx
	MNCMNrXAHC02V8neTCTdrXVpszO6VdYQDEzaONJrVYGcrKnmd9j/upqGRdCRpRU3+/Pt699IE95
	M41kfmUnLmNP875CY+ldRXV8yXcCgdD9IbKSY9/A0aa1tW4t4gVBc=
X-Received: by 2002:a05:6300:6d85:10b0:3c3:7a0a:18a6 with SMTP id adf61e73a8af0-3c37a199b18mr757383637.18.1784126157664;
        Wed, 15 Jul 2026 07:35:57 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:90:2db1:3066:c473:74d2:497d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e4fcd31sm2370744eec.4.2026.07.15.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:35:57 -0700 (PDT)
Sender: Deepak Rao Gaikwad <deepaksraog@gmail.com>
From: deepakraog <gaikwad.dcg@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: selftests: fix typo in ip_defrag comment
Date: Wed, 15 Jul 2026 20:05:48 +0530
Message-ID: <20260715143549.14094-1-gaikwad.dcg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "thourough" to "thorough" in a comment describing the
non-overlap reassembly test loop.

Signed-off-by: deepakraog <gaikwad.dcg@gmail.com>
---
 tools/testing/selftests/net/ip_defrag.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/ip_defrag.c b/tools/testing/selftests/net/ip_defrag.c
index f9ed749fd..146f2a2a5 100644
--- a/tools/testing/selftests/net/ip_defrag.c
+++ b/tools/testing/selftests/net/ip_defrag.c
@@ -378,7 +378,7 @@ static void run_test(struct sockaddr *addr, socklen_t alen, bool ipv6)
 		} else {
 			/* Without overlaps, each packet reassembly (== one
 			 * send/receive pair below) takes very little time to
-			 * run, so we can easily afford more thourough testing
+			 * run, so we can easily afford more thorough testing
 			 * with a nested loop: the full non-overlap test takes
 			 * less than one second).
 			 */
-- 
Deepak Rao Gaikwad

