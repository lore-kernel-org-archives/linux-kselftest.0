Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A203921D6
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469639; cv=none; b=oNZ7F/JaC2vVlnZi4SXuupeQFgw8jSiV8Cmnenylj8E4CPADNLXMeUGm75yqzy3esUySg0E5AXkwGWDQ67q0OVsojZkHRIGsY5NKk4IeEO78dx+rsYwa6j/tfCT+2beiX94fwUvwbmmqrLW5hHLMGV14/NC75QAVyEvngbiZ/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469639; c=relaxed/simple;
	bh=UhDm4WNQwXw7aR1QB+LiX+TYoJuttlt2x/dLLT9hWvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M49AN8ki9KyRNlxOiOAtSMXh2gW1J4Y7K9J3wiAlFsNYw8vHGikqPLhaV/2B20W5wMiAVVFcxGMq26mFZAHGQocpZQFehO+/ZP1TfwnkJHqOetuHdzGFBq5TdlN4U0fcyb1o+A9Pk91Zf7XIJ5/3cit4YJymgVxBKnze1m7ZgfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3DB4DGK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3DB4DGK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e73611928so5898535e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469636; x=1792074436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHrEYq9MgxAFLtaKHzrscJ3u+B/7wbhOLRSIihIY+ZY=;
        b=s3DB4DGKs7pX1+Mj1c+pexU6gX500tbugCO1Ah4S0IH9YFW4NSNK40++9jL1SVVzE+
         /AOkb/EJlCn8ks2dgjV83cPQ968cCp3B9CeTqNZv4+U1mhPg3WFJ6cp2UpzSmzbxHG23
         bxW2ryAYE7Phvmu8BsRC4UWBo1exeZNIRYgb8htnAj7g9bA6HkNc6We0fSQxTG4K7II7
         SkvPcFT9SHzI3hb6t+00lDPIjaaFv9oQMtsaJjndH54foLElPv9m9frzv52ca+YEj/04
         c/RYLUfQ8j5zoWisgMCdGObM+/vYMfvk3X0wc1PRkdVKuqyU1G4iEwyzgcvrTgnhIro9
         7f8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469636; x=1792074436;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHrEYq9MgxAFLtaKHzrscJ3u+B/7wbhOLRSIihIY+ZY=;
        b=AmMkefC2aUHBSE3IJ0WFhnXAR53iTF5POAhZhSfkpoV8KQMKx52W1HXVYl6PJ4kRyh
         TLmp1s/gbUyFKAoqjk7OqFTmihwTX8UH2TjrYBs4TvnNuhzrj2zJnvHY9FW65eK5xmp7
         uufeAyk7DhtAEq7eRPGRKhdFCFgJLkuB+PSyuuN/IsYJ7zJHF7FPfBrycXth3loNLe4n
         j9Oas+tkefXfxg0eG5EM9rhMwKN/3zq79zfGKAgqATwD0wxE/j1IKSr0ByrM0IiAhQ/j
         c85iw34ybHd01hMR/NiZ6/N+o5OWLqOniGous6l0fvJqeil3IMke+BjpxUSqtSR4rVNR
         HqEw==
X-Forwarded-Encrypted: i=1; AKwUvBxO/gxNeTduiiKW8bnrBnrX2JASYjjcmlZflVgn4eJzuMc6LJAjhAfRpA9nGDn98Nu5yXzMoIT9dEZe7oHuyEM=@vger.kernel.org
X-Gm-Message-State: AFuF++m8f0dAJOm9wX+qTKdxjIM2DWUH+xD9bkH2QT7cEtO6MeBL1VaE
	J9HBl4TXHfbLL6hedz+ivquNdvxZKnGN7Ou3Jx5XqqXYmCQI79n9tsyT
X-Gm-Gg: AYBFou2WvMPtldG2sPtz8noWfKewFXWYSOo0j1YtklAeegoT9f13ov/yfYmjVKVQzc9
	Ar35J4jf5IR/skkVvKHjTvbmJ5uaj3+jtXLcqRqKaeDQBbbKZAucPVb/QYhuS4Tk95HaEYRHhuS
	2FZpA6lJfR+f53xGOHANkc3Ya7ZHE6nIHQ/IcZTaXhMmbO5Zm0pWSdSx8JfW7Eix70G6SdSrgDr
	SugZCNB4Goc53Z0/daiyK7bkjFNyyZlfZloSVqe8x73B6jnsLkgj5Dr8PwzHU03UFrlKEIkpxMx
	3ATPuEogJLs5yVrscDQ79Vnux4PVyOTjyEOefbkmIGzlSs7MVcNmSgbLbUC0oGUDPRpT9xQKVSg
	ARGt1HQ2kZKqLy68RTbXEW+T39qCSnhY6YaOOtDBad20tSdpK5PY77Ik41Q4ZOJcVQofztDPlGv
	PKFa7t777NIHMbNdzekCU6QLueBak9rSBwbI6I7WtiLroePnY2nTm+L8PpmipNCH5wHU/Yc9Qnz
	boS3MLYYGLI+nUIbfryamg=
X-Received: by 2002:a05:600c:3111:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a185160ba8mr53337635e9.0.1791469635592;
        Thu, 08 Oct 2026 07:27:15 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d113dasm11244781f8f.19.2026.10.08.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:15 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/27] selftests/landlock: Fix memory leak in audit_init_filter_exe()
Date: Thu,  8 Oct 2026 16:25:42 +0200
Message-ID: <20261008142604.39107-15-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

audit_init_filter_exe() does not free the buffer returned by realpath(3)
when the path is too long.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index d428ce802f49..1e533b4e26db 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -507,8 +507,10 @@ static int audit_init_filter_exe(struct audit_filter *filter, const char *path)
 
 	/* No need for the terminating NULL byte. */
 	filter->exe_len = strlen(absolute_path);
-	if (filter->exe_len > sizeof(filter->exe))
+	if (filter->exe_len > sizeof(filter->exe)) {
+		free(absolute_path);
 		return -E2BIG;
+	}
 
 	memcpy(filter->exe, absolute_path, filter->exe_len);
 	free(absolute_path);
-- 
2.56.0

