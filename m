Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1022038B133
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469610; cv=none; b=LmaKoPouGFPEuvU+5ColGTttksKf6T6STa/JyzdhvV2ULEQLo8xI0zmKA8FOuUqdDJhqt9NiB/3p0vf1E601+iQz0kKCDy0NYiA2VZbe2cl4ullsKV5WqfNtjf6n6XmQWBf9FJFxqUxQWEQy/FB2GE9ldeDR/cKgSqUuX+Kdb4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469610; c=relaxed/simple;
	bh=QaPYYNQyOGRWS80Oiyw0TFXYSpFN2iuoAICrlp5a5BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcD8SCier5W9qpJwEFfF7rFFxLGrRNIXy3b/pTcC08n3eW2vE90uuWtF3ZaSksXJOvoqPsCPVUaJxIoB6fM+6/DEIEEI9x8hdTk2gJM+itp/mdb/Z4waZMNS2S8Xwg/wVk2zzGD/GSfe1j4IMBkhN33VaM8nOoefc/vBTTq+aZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4/vmmre; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4/vmmre"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so4008775e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469607; x=1792074407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43yKwHnHP/WZ1jZvgC+UcjcrGZuSSGiPrkzlw9Y42Ws=;
        b=H4/vmmreflTCk6hgkiycfgHJnii+outZ89Tz6KkxeIncH3pxB2kFW4N9jXBiNCJv2o
         YF1u5j1WtIWqxyZ1Y5NuX5a8fwgvkqT2TRFgw+FXhsiE2wyDpiYXwpOXMXy+lG7H5QJb
         Z99A2moWt863EQckV/lb04kNaJZAAgNrLXNZy6CExUL+qsVnfFOBOh9w+v9Hcw+Iiws/
         rFqz1Iyh+ylroziZ4abRxUyK+/bK2Tb+N0eSCFwXligRBh2TWn5fHYQGef0voCh5hsfA
         gjKz3V4gIKVF3DqHS93KA2o1O+YnDmXwHWCggVBAO0jqqziN1OSyezoFZ41AuoHz9kjB
         //2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469607; x=1792074407;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43yKwHnHP/WZ1jZvgC+UcjcrGZuSSGiPrkzlw9Y42Ws=;
        b=nT4AV9RHKcLTTVuTaRSfGVBSCd4Pw8i0gHsnHoFYxhehZ6625M/zk1Rs3DsF+hKFqy
         XUwN8a9LjVwWVyxh8hQtaghQTfB2sJgexeiClW36o0llYWP8EyhW0eNBcHimS+wHE5yE
         QJaDyoeszORQg5c+fWimA16HVg0+EeOZielWBKtE1uPB45hgvXud6s+AEoVLOKlUBkl0
         2binW8JpWuTic1BDnF3G2CIXppJVisd9ZVI/GKhbSoWX4+OilFIbxfSRerAkmXc6FX+B
         x2mSfmCGLk/1w6ONrAQUOi7MyltFdyb8iyHZvlrpAnh3/kv41wZBqpCT3ls/PWdUbEBl
         D8DA==
X-Forwarded-Encrypted: i=1; AKwUvBygVQWoPN5d66JPeftGtnBhQuFmoTXZXrvn9Uh7st+dw58GNfuo6yU4C3TaYOXfZvYHYolGQCDw65lh/CK4rB4=@vger.kernel.org
X-Gm-Message-State: AFuF++kjlZfz8mCDxlP8jIBVxTuQagQybGegr05aW5XXJeGgi0T7S/MM
	W/b+CvGVZNBmZCSVVkP+ZKB97XTacz+tJRaNwVjCIQ5YQUIMSAo3Dy8c
X-Gm-Gg: AYBFou07IRuZFIYAihQsX2i+vClpUpKT4AKw4VFHsljGgu9d2xF/wTRGh1kQB4U1QO7
	hqxMn/tN7P2yKVI2i5sAZhJlB8YUrfv7vegf6P3IRfAaBkOiHtiOKlU/ZoodbqZMZFApNerrkNx
	t1sNA3vd5lVB5X/3CIS8ijOKoNv/3OmSul8PNGdYgSUDJGa9/Qak/Cck2A4s9Ib1ZGkkpSm5SqI
	cUD96MBL/Et8qNMgkUzL5N841MxiI/YLVYE2EdGMyWn9zQ0owIQZtH+fd0KWo8WHHhtSEo4TCE3
	tdNX9RZDo/nLO5VuXfvVQBNz/IHRA7hS4iDqah4ZCqAqDS0IjMvNAFFCqZlAh3jRteBga9+h0yM
	kzzc6uDnp2yw1xBgt9gcQ9DSw3sEN2Buxflt9cfNzowVG/gxQVp/N3org8+ynDqE/nN6i61eZCw
	ciql0LyuAiDcmR5rtphIplqQbW7JOkj1ZIBpOxJMsBrZaBUczgmpNkXXYsDY3uOe5W5/pbNRijh
	OCR+MPejtlqkBWyK5OZ0G0=
X-Received: by 2002:a05:600c:1c22:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a180424698mr124373615e9.16.1791469607192;
        Thu, 08 Oct 2026 07:26:47 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm12022355f8f.51.2026.10.08.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:26:45 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/27] selftests/landlock: Propagate grandchild failures in unix_scoping
Date: Thu,  8 Oct 2026 16:25:30 +0200
Message-ID: <20261008142604.39107-3-gnoack3000@gmail.com>
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

scoped_vs_unscoped.unix_scoping starts a child process and a
grandchild process.  Add the missing check for the grandchild's exit
status and propagate it upwards.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/scoped_abstract_unix_test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index 5dc0debacb2a..e006dba61652 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -608,6 +608,11 @@ TEST_F(scoped_vs_unscoped, unix_scoping)
 		ASSERT_EQ(grand_child, waitpid(grand_child, &status, 0));
 		EXPECT_EQ(0, close(stream_server_child));
 		EXPECT_EQ(0, close(dgram_server_child));
+
+		if (WIFSIGNALED(status) || !WIFEXITED(status) ||
+		    WEXITSTATUS(status) != EXIT_SUCCESS)
+			_metadata->exit_code = KSFT_FAIL;
+		_exit(_metadata->exit_code);
 		return;
 	}
 	EXPECT_EQ(0, close(pipe_parent[0]));
-- 
2.56.0

