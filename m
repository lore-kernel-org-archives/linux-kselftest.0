Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FAE3F1661
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721721; cv=none; b=p/ediirgKu+mOfB4diDk4dHLn+HrkE29I8iixb7NkQcoXz+uTSgzNd7ioC7GB7DaN0WA0EqqihmFpjKQhj/DjNgGScH06xBbikUOAEfNp1knOQeBxQqOif77AblM9XVdkbTc3dKYKdXmsS8FZtPdwxz3mkl6aUfJdLIZzmNfCFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721721; c=relaxed/simple;
	bh=tn6wJlpjZISGvOpBbSSmHynVckiSkF93YB8fHRf0Xag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aygzXK6bBSOT9haLAdM7GQB3tsKmZnexJjntxVtJ7tYE+BxvrjUCyXSAT5IvsyoUDQVit1BozMmOojosxTXYXoGF+rKx3pWJ3f9c3c6s4Q/dD0azcyg6yC2EPpkJIJGmxvWiPc5+hb8A/VblHSvXHbMFTweK4ATovNlKimw/goU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqvG/bQK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqvG/bQK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37de8008910so1300684a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721715; x=1783326515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFPmiZ4Mjv6BXhEHcS9Bb7V7+aPBk2CMtzf4Gc+B054=;
        b=DqvG/bQKgnbm9Koz0rWoUIE+z0XShSnvO1KKsqXwioJQQ9KvOkrCNDqOy/k3zLRbzD
         uwussXWr78df8JFUGEk4w3qYqBrAJnTYLkK9Bwqe6uHqVK0/GDntmbNOsZhFe4J31EK4
         P2X8zk94c2MhCPq5+vqf64VTD3BPoUCD9DldQTzXMVMSOHff8vhw/7uzlFEh6KY1Ake2
         9Xr6h7g4TdRx7WRAAQzoM5O1Wi0kzds+Ncf6V6/I7yLXsXkWXcMEZ2iYhbNkYtcgnf9Y
         FSHPsyR4d8jA8+afzlmHiCGxwKk4x+/ZdfKIqD/wjE0bXdSLJy146Y3T+BBiFijeLGmv
         AKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721715; x=1783326515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFPmiZ4Mjv6BXhEHcS9Bb7V7+aPBk2CMtzf4Gc+B054=;
        b=JEziwXmMtKXbqk+QJhPkh7GwflLfMY/AFb+2yA7VCF0S1YHTKSl94xiuh6DEgfMn/M
         5PbHsRTh0sekMcOFbpDdGdJOunacgGsQJ+bvEZsBeqncKpnSxYjqKemFh7NFo1f+99M7
         DBA/A5Ebx0zgn8fELqMgWZo/OX2GS/DlnfHsivdNHgEBWYaY9LdhHYIjzYbWncsrFDr4
         787Ub9XZBT2kqhH8CQXLIXG3TGi+JSDrA6CPrYybLQqgM7vdTguzTqflygOGnYhNy7K/
         yttF9d5bkz2fbKgbosdCYL2OHCOrd50zHCPT5whGbcO7vdzsc64nM9bwTmvZmMxNJY7q
         Tzwg==
X-Forwarded-Encrypted: i=1; AHgh+RqsHyaDZC2IRQwbfeyv8vtV4Ejuh+ZRK6mLoJ7kr2o/p9zAwndZylejxYCvoIDxgEbPvufqzZ0Z7uw49znsCOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUJqlLeHYxKXKySno7L+Sr7iJNk+Tj2cXxK0bZ2MByTG3+kwl
	6xQ8Wq0YCuWyA/hVa3a5821467o4UkejCpEcTvpuvUs5gjFr8pbQ6xGZuKEjrTmxO3rHAZw+
X-Gm-Gg: AfdE7ckCu1U5poH+jNIjNRCOSEpfX1wxAY5JQjATHA59xgtYFciDL5PW3gDh27UMnlS
	fUyhFx8n6t0C5HVXq+QJjX/PwVbrqjQsr5mpQ4Cs5G+/HE2ahu2sx82pROw2CcdIu/f6c2HxyMx
	i/3rTGpjxju48Hn9VvElwkqVYH903GmwxXGbpVKkn0/HEUA8jPg20xZLya6UGtAVRti8dZSbyXX
	sxUCBu7IsibBo0M3jlEj170pgqNHJnJ49yyMvmPGP+E2UPL/L9b7BB4IHnn95tnqFNyTDAZhPH/
	x22tqZJrIkVBC90Pym+z1EbtC+dbvzSGCNLVtLD3+uzoFJAjvqj8kEC5Y8T0EVtONaiLkzBoomQ
	rymtnzIKSEKChysNiEwNyr6tpt6sAi88qBE5WLCAwK2Jw7dvWM7+ydg0bR7vQz/U42fYdoIe6wO
	LxafSJ
X-Received: by 2002:a17:90b:2d0b:b0:37d:f85c:ee1e with SMTP id 98e67ed59e1d1-37f816cf837mr7806039a91.22.1782721714688;
        Mon, 29 Jun 2026 01:28:34 -0700 (PDT)
Received: from martin ([2405:9800:b862:14dc:12ff:e0ff:fecd:7ddc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fd2bd0e49sm3259343a91.0.2026.06.29.01.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:28:34 -0700 (PDT)
From: Martin Weiss <martin.githubacc@gmail.com>
X-Google-Original-From: Martin Weiss <Martin.weiss2410@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Martin Weiss <Martin.weiss2410@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andrei Vagin <avagin@gmail.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Bhavik Sachdev <b.sachdev1904@gmail.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/4] selftests: filesystems: fix spelling mistake in statmount test
Date: Mon, 29 Jun 2026 15:28:07 +0700
Message-ID: <20260629082812.551273-2-Martin.weiss2410@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
References: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Weiss <Martin.weiss2410@gmail.com>
---
 tools/testing/selftests/filesystems/statmount/statmount_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/statmount/statmount_test.c b/tools/testing/selftests/filesystems/statmount/statmount_test.c
index 8dc018d47a93..9d963e09e510 100644
--- a/tools/testing/selftests/filesystems/statmount/statmount_test.c
+++ b/tools/testing/selftests/filesystems/statmount/statmount_test.c
@@ -515,7 +515,7 @@ static void test_statmount_mnt_opts(void)
 		return;
 	}
 
-	ksft_test_result_fail("didnt't find mount entry\n");
+	ksft_test_result_fail("didn't find mount entry\n");
 	free(sm);
 	free(line);
 }
-- 
2.54.0

