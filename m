Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826584;
	b=CbroWyyqAQKOycM/3J7oFQdlPVwFXD1TCSQKEOhDYuFkrOSgty2DkW0+n5W+QGagPOKj
	 oyuNd+G5vdrnbQuK6zi1Pk9LJH44VUpdaRE9YpC7TOUYvRmdx8Sy8teQnJs+YrdKdvZ0j
	 qGoBSJFdkJ/fuPVM9O57KfLFrwgM00CxNYS1Z13HHuY2aLjCxtn/4nXYwyw2ShUhWEra7
	 u591iGInslFqV0DYbWbtjlX5P0RP0NFEPVbhGZZdkwPJtSyU3cyfEtTxlvMq3gGNDTtDt
	 15dZle06zs2aXOH20OdcWrfB8fHxnPiiCvLfIzigKS3mdEdDPZnAyht6HEYTyRCBmTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LKarLfxYEUZqeqqLWzc2n+DvjQXfdpA91g/AOtlmbp0=;
	b=FmOCgYikyeUJy8UuhoSiasLTbGPzWnUXlLdbRVXqka/fz1Iljx5kbN1edeqycFOX4y4J
	 HPklhVWMTv55C3TKtRbJnCuFHhJ3dd2UlUJFkqZxZGGWP8eeutFwdjzY4KM1lRspQ3Soo
	 6ijr4WvVls1SDnofxYQHgpdbHTwj9FIhLbzhi44wcDz7tqCFAM6zLgX9FTquMmwmQeDom
	 JYlnSiNAG4iesF26xCmmZVs+Elf99sgJVno+3O4CS1pPwVweEBWrek6pZYP+ILWPdtK8b
	 j0PBuCWdzGroRHl3k96haAkZREp8ThcLqOaYLRNi7IPqTndNOQsCHiaUA6HjascReYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QU3uCnBj;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F95D60EA9B3
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F95D60EA9B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QU3uCnBj
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1048640f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826582; x=1794431382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKarLfxYEUZqeqqLWzc2n+DvjQXfdpA91g/AOtlmbp0=;
        b=QU3uCnBji3jCmsbc6W/xxM7tCpsWe3NmctUtH8kaE62jbt09PpVLnItdbrgNkmSUCZ
         LdZ5UR8gHdHCE6qvXFxzo11SVQwDEFRIQSkRP/8oxLBKdbcN8sR1jpDOZrzjBlLdQ/7h
         2vGOGHMRVZXCODU0ykEtVGCaSmbtRh9BW6NlJLGY5OsoFU/iNPqBcyO+a8MR4WpWEDq5
         lQzSlamHimaotFJ19UUR+p5LztcA+nDaU+Z0+2pfBWz4OP4/xCGSlx3dGDEV1vOwX4nN
         jg9Zmqp6fa7L4ejxjLMMSayv37cSRyAuY32toltTTnCPvruByENzalD4H2JiSAM7hqKh
         y/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826582; x=1794431382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKarLfxYEUZqeqqLWzc2n+DvjQXfdpA91g/AOtlmbp0=;
        b=Mt86N1wSoTDEvjyBGA2u1ScY5ApYrjTNe4QZhzXQHqzMxHj+TZnsrsjrmSkSIxsWTL
         DYG8ek9uqn3LekNfOFk3HRJiPf1Jjtql4gWniUBqLDmw5zsWEExkJ4+a6H/ANXqbI6cj
         MVRinRI62H8EygeeyPPH8FfLE7tgB//xJvgl5snKtcpj6aj519+ijieGzBOrUuuBIIkQ
         ItS7EwQGOkG599+nhI7a2L5VjHAIO13WafsKqpBmsnjvYGrikmQfBqR2EPSslkCSnd20
         KsZJnC78EU3bI7aYhIewkN1KODQWOfnd2eFiHGCPX6al8DkzGLyVGP62emDbY4luacY4
         ZjDA==
X-Forwarded-Encrypted: i=1; AKwUvBzp61Bc/itAcxrdC7P6d7KMit4TmNO0DbGcRYkC3N3YvgJvcis24ZkKB/IMzBt9wnODYYPVMdu+xsTYRzIzVwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IWdD3MyWWd74Fijbw/or8aOINa0QMc8zSwqmZlOxccmjn7PkQ
	3KbYnDP1V183Aj58MufIOWcOOsQiSVzcFJtpFTqiLby2/yXj0cQEXgUo
X-Gm-Gg: AYBFou1unsmmivWrP4J3/izkcYIz6FX2/7T1VeLYVqHMdfM5IifUl/K6FdVEuM5CNHO
	qybhlg/zM2uQuiavUYu2TYKHP4KabRPkBZt6WTbtywx2JvndQJv9SKxoHf63ziMuEddB0yipCmZ
	ln5DbNN1d/VjjDr0mSg4AcBXwpf9U0f/p4/WH8Jt7+V/UIasqKMIp/pqswn+F2laxehJ9le74Nx
	/6M57GUlQI6briSpoTbKtnEtFULUZcDdX/wRKFh6WdX4HxBLB/wEHj77XkViEhjeP0C2D/EN4C+
	JUZo48AAqwMVZgaxazfOp+bJzKHdXyIuONqwjIIIMXBwId+t8rn7gVJew0kYyJPi8OHSc3NXeIm
	f3kfDhylWalvs8bfqaXnOqveioGZm69EnFjEI0Undnn4D2wh1sn3wHltQ2qqWP0fkjJR2e7xLtT
	hbx0pD84EW/+jiBmWogPG5mO0duzma1cGFhD4JYlluSY58nbWP8cDM4VxXFVSr/02TBPSggXi2s
	oWnv3hZbCJjUPXHDlS4cmZPsVJdjrZA3hPu0AmkOCs2ppENRTC39JrJEbxF6tKFiuBnHa4SvD8t
	2h7Q/Tk2OZQKtLHzTcfvEKKZMs2DYxjBdNVxQcvojZMZbCngSvLsgrqKLqrz73E/H0QI1IadiM0
	=
X-Received: by 2002:a05:6000:2204:b0:490:b23b:8017 with SMTP id ffacd0b85a97d-490b23b812bmr3010592f8f.34.1793826581845;
        Wed, 04 Nov 2026 13:09:41 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fe7189883sm6177411f8f.0.2026.11.04.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:41 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:07 +0100
Subject: [PATCH v2 21/27] selftests/landlock: Use _exit() in the
 named_pipe_ioctl child
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-21-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

In the named_pipe_ioctl test, use _exit(2) like in other places.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index 1e94a3171e02..78b2bf06b6ee 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -4272,7 +4272,7 @@ TEST_F_FORK(layout1, named_pipe_ioctl)
 	if (child_pid == 0) {
 		fd = open(path, O_WRONLY);
 		close(fd);
-		exit(0);
+		_exit(0);
 	}
 
 	fd = open(path, O_RDONLY);

-- 
2.56.0

