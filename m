Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A270836
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370243; cv=none; b=gNzgKLOycV1HgOoYqDOh1kDiokFYAzgJRHEGfY543XR4ZrEjyxTw4KeWLn0799Y06Rh1LMg4m8dkeFx0gvCQKwJ2Fm2Xi4T2fdM2wvNXrI6tFmnR6AkFFyrfgcUVl9+G6X0ey5y1JI8h99MIfjNi8C06bhWnFjfiCy2cKZ14Tvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370243; c=relaxed/simple;
	bh=Dt2dFPyPh1ts6XuKsSKJICPZIpbd882zbThrm/OEsps=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBMOBQd14cHOzZlhj/8VZoobn5ZLmnLnF8JFgGLJW8BStfsCjWdTKPXYfU+rpcNry5JvxutD+5JGF6O4un4d7hRDnae9TtUtiJvOMM/i+7MR/sa796mJ3BPp61HGHp9upmYKz5OUDnVW3NGZpvCKVDQGcOk4JyFOPOE4lsjmFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Jc0goBFa; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Jc0goBFa"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517654b8e28so5494571cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 20:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370241; x=1780975041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tW8ZkJFH1s/aeCdAEiQB7eOXHeRrYqV2OpgEHHCsa8=;
        b=Jc0goBFaHhvMOUNWHpB2OFY1+3Z2ZG2bVrLp14LmjWpFEj1F96fEgV4sx+AfBbDxkf
         YAL9w4sbxE0n179cV8HIBOXxYZLCn552xtJBnI2r4inWzzDmJAIgZiVPMVTUrmPRPfEt
         LCsnkIksFMmQspiZ+6wGR7RFgRdezeKLasxtN+XMC3WMOr5HAQP03sRtIpObnjhGRoKp
         1vrwm2vK/a05QiJrI6PNXrZ9ZXvnbE53j1pTb0zKXr3Ip7FT/x8DdBadERgxeB96KGFF
         WDAFJYRc246m2lQRdvMR39bvLdXOY24f3DyPwtuH3kW/Q0P3qokC9B6Pb52f9ZN1c8F0
         WfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370241; x=1780975041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tW8ZkJFH1s/aeCdAEiQB7eOXHeRrYqV2OpgEHHCsa8=;
        b=W0DQI3lgXGIvn71esjjbXqNq8LypI94atXqyeLIWr9NWGINrq+oVQJwS32K0SdmAgv
         5hmsp0o4RWREHSPzt89NVe/0C41PeHo8QiViD0zZEqpL8Nol+dr8EIzyGBGewEAz5kG3
         eeVysyMUCSfOapD/ApfJuAoi90V1IgGBlHBn8uPBVpjoHkjc5QWV9LVZpW02qGBh1V98
         54mYCeyyUcL1lR2H1MHaw/ZhdQ3y3Q4fQzbNHdAEDDYsSqekqTBJdCMrW9omdHQtZ2i/
         CGH/P0pOxvKwA9e7mZ1pB9GGUwfLbdlqnxJC5OKDzSbH4McKVhRmyXFMCzFiwkTCfcZy
         4zBQ==
X-Gm-Message-State: AOJu0YzmJvmBsRrXxXQyhL1otVm89iL9meRdClvRSubaLpWRAr593FOy
	ex0WQ3c1N/Ua6vxYfMfTnkJ7zVtWkD1YcG5QY7eo5YGHiV0QYtldhF6n/eDi4k6i7hnGd4s/j4U
	e7Wzl
X-Gm-Gg: Acq92OETQ4d5fXSjf3EFlJqCVL+2xVk0ZBXFixsMSqncfHdDX6ToXXTZHlQN8/y8izj
	OjLCOABFhbrgnLFmd2DCnZYmgnVkXL3ozRlWF5k3B9VO/PmBceZbStL+BuU1vlehMsL3NTwVXLJ
	iUUS3Xn7x601YgyHjFhtgApwnivStXlSWn6mCIbu+WPQC7xVCalyZxaUIFwHDpOkeWfGL5CNGrj
	l0AnjK2Tx4Np8nezg0FV3fx2JRzzbDhUVoR8Nb7jKezBa07lk2xf0ANAgIEYWZEeUTdd0jfpG5y
	7xou7C0uVBJ3PKcu+i7GPzbMo8HK00Xnp7nlu10+Pp+KgN8HMbwvIolqnPMvtdS1SRrSnqX7Wzl
	dF3QfE186D8n97Q3iwvDg14XpqarpL6YPXJebhOaj0jhhHOqIWqoF3rwXibluuQvnrbC8yagiP6
	orcUiLzfWd1C4+65KBTvCQXrLQy/pKYgPNjZUmPEiJssaDx0YV76Ons5fvEKamtg==
X-Received: by 2002:a05:622a:4c14:b0:50e:6377:197d with SMTP id d75a77b69052e-5173a6197f2mr192694801cf.8.1780370241637;
        Mon, 01 Jun 2026 20:17:21 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:21 -0700 (PDT)
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
Subject: [PATCH v5 02/13] liveupdate: avoid mixing cleanup guards with goto in luo_session_retrieve_fd
Date: Tue,  2 Jun 2026 03:17:06 +0000
Message-ID: <20260602031717.197696-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
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
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 5c6cebc6e326..7b2f9cbabb05 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 	if (argp->fd < 0)
 		return argp->fd;
 
-	guard(mutex)(&session->mutex);
-	err = luo_retrieve_file(&session->file_set, argp->token, &file);
-	if (err < 0)
-		goto  err_put_fd;
+	scoped_guard(mutex, &session->mutex) {
+		err = luo_retrieve_file(&session->file_set, argp->token, &file);
+		if (err < 0) {
+			put_unused_fd(argp->fd);
+			return err;
+		}
+	}
 
 	err = luo_ucmd_respond(ucmd, sizeof(*argp));
-	if (err)
-		goto err_put_file;
+	if (err) {
+		fput(file);
+		put_unused_fd(argp->fd);
+		return err;
+	}
 
 	fd_install(argp->fd, file);
 
 	return 0;
-
-err_put_file:
-	fput(file);
-err_put_fd:
-	put_unused_fd(argp->fd);
-
-	return err;
 }
 
 static int luo_session_finish(struct luo_session *session,
-- 
2.53.0

