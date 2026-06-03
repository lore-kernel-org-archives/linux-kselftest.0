Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3D3D1ABC
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501469; cv=none; b=PSh/mcB7BBShJq0MCkYKNq1h+Ysqr/Z14ZQ874T9rRQO9GgO7vEp98J9BGbnlGfPAHooKylrZ5NUdVM1OHR9vS0MYIXjUkDGOtKtNZiSGgHKvUgNgHynpb1Ck+1aC1yj5zEVZe57u7dtDxHk525w7ifWLKSgXR+vgTsVg7XHBjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501469; c=relaxed/simple;
	bh=iUmoYAejiLn461xrcMpaIUD7Gez0PFfQeM+9hwbLOIk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FB5zsbgXGCoC74W3WEaR7r+CmfIDqkBZyeqcFGybsyFZ7E+znp2oOihJCdz61Wu4sOIys4On2aR2BXWP8krDHFxKnxLABe9SPoS0d8CzR5An5sow/lc5Ob5pCUKNnYokJUvP02Nq7I/6fTY8pdv8nTcwXrvcXxYaVT9d6HCii34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MesSd6mE; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MesSd6mE"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ce9df31130so55424906d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501468; x=1781106268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8sI6lLCNHN6RKEMLtPAJ87Qc5cPrvkoDu5wACGhMgc=;
        b=MesSd6mERZzT3AZATjsAor3hWlZuvtTFFfOos2YTMKc5JqhyjwIHoMrpvAwxrJOfpP
         9n8BR2MljG5UYQwpk9I3YDjG5EARPi+SqUe6TDlEb0XZgHXF17qnzSRo7pBKShPp6iP/
         oIuz9vL9Mdi8vNErp3EnsvTmikLZ5/TbzXheknr/nouq/9TLjJ9XnoDSTqd+iN0YFLDn
         kzR6lllYLGtRnasRvoOHlwCu4fEGXJAMqf66f/AgXNdu4NWXJ8ehOIQBJCihXRvTkEaV
         HTG1DlPlK4C+B/ZEFga0jAyKT8lMsKEPuc1xVPXUgP1WLhAQZMMXybuBWL2cOlmO6S8+
         A5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501468; x=1781106268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i8sI6lLCNHN6RKEMLtPAJ87Qc5cPrvkoDu5wACGhMgc=;
        b=O89sKgPkA0jGIad6DVmqIeOQiLr4tCJij+lL6fTIHmuh0O6L8Bna4ZGwvdttURxgob
         5ITdmXHccmjGQGnMkykKioLb77T4oU+DuNvcQS0TJLuZNNVsZbwgDeE+Fvtlyuy1Mj31
         OT0AL4BeHoAP9aMmgi/pvj7+Yk0n6XPdLZ7SlYeodrDVZvGdRVfjPFigiY9JV2YyugiX
         eRvxsdG6fIp0cPyj5ZowzWOBUUXor/VPUfs7sRs1JRtpJ99My0kaGlau2MBf/mqrMpPq
         Gnyu1ctdg6LHMwd1e2FsuTiQVYzw/HAzpfyktzmQkRgVbB39Us+12pt3R1DFD9S9AOLf
         lZKQ==
X-Gm-Message-State: AOJu0YxKFbZKzzfhNnthfORtdVWXYlTA0UgruqXdHAf0TfaIGwu6QVme
	rnPkBj6xTpmLaQVyMbpVPcLqqzLSuu4MDuZEPh6ESgbZw+QzTifN+/nTjjtw3RKZAPdcALFAu3Z
	/+I5w
X-Gm-Gg: Acq92OHphnUPjUbPDCnxaZtDetSSfc5x/lInqdMQzRfEWa0RLSrCEzQvTrCX21K4YfT
	r0rIO9FpqwI4JUJMdzyn98Zln4XwETEG795KepuK8vl0Cw6ivXlzIlOp4nXq9tKgH+uBAUGO9yi
	oq0+UMIWpi5RK5CK+OAaMWRq9MOrJORtiqcZHUkZQmiVc6VOHZ/4i2sdcyH9H8qAdcjvKV7oLx/
	WbwK8CImuorpRsRwbo/K/B3WHK9e+ZbQQX4O3KspG+SnsB5lLiHluS0Xukwc022WRGfU/Hvk66F
	3pYKhFJFrE2u312f2p1xQDdhnKN0d/INnA703cbC2dzhA4AB/a/VhmCspv4SOL8T/PpkUQWotVg
	V+HT7rENxeI9q/FDv8Rzgzqv0RQKOqlxF2zpgmii4xBG+SZx0rwQeATzoBzfA6CBr2FyNWsqp93
	AcO94nvRxTJxNrahSsFYFFyst5/mUTYPwff1OxR+IslWutC9ZYb285nW8jQz8msg==
X-Received: by 2002:a05:6214:aca:b0:8bd:6baa:6a0c with SMTP id 6a1803df08f44-8cecdc28301mr58362326d6.11.1780501467702;
        Wed, 03 Jun 2026 08:44:27 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0520d3sm23311476d6.27.2026.06.03.08.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:44:27 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v7 02/13] liveupdate: avoid mixing cleanup guards with goto in luo_session_retrieve_fd
Date: Wed,  3 Jun 2026 15:43:51 +0000
Message-ID: <20260603154402.468928-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring luo_session_retrieve_fd() to avoid mixing automated
cleanup-style guards with goto-based resource release, which is not
recommended under the Linux kernel coding style.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 5c6cebc6e326..47566db64598 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -291,10 +291,11 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 	if (argp->fd < 0)
 		return argp->fd;
 
-	guard(mutex)(&session->mutex);
+	mutex_lock(&session->mutex);
 	err = luo_retrieve_file(&session->file_set, argp->token, &file);
+	mutex_unlock(&session->mutex);
 	if (err < 0)
-		goto  err_put_fd;
+		goto err_put_fd;
 
 	err = luo_ucmd_respond(ucmd, sizeof(*argp));
 	if (err)
-- 
2.53.0

