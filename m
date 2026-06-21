Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B6D36AB72
	for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782053021; cv=none; b=AKqwn1xvC+A0KmImz+n7CfIooWLZxsJbaZoktM2DCL8CZrfYFRQt5sui3afXekWCSNVx+G1KWajebjNW0YCaIFD9fmC5brFoPkbqeUED3Q+AxEdLfngWnDzaLbAetFcPmNDTttYSyQmpkBGFqOZWEELEV9OtYYw/foKCIXHEhQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782053021; c=relaxed/simple;
	bh=y4Z/Chbl8d1fW8FeQ7mLZsT8Hhkc5v336Kn293SDZZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQbJfF7TlBQa9Fo3syfgmsBQmZ+uYvw1AcOzGZ0sKo2exyOUSvln9T4i4TFqJdqAq9J2LIgnGx+M5KTa2CfG6KCDLbB/a5xUyciiewE8bEXl3tEHspBf8FJpSByx+kleYErKhybn5/W+WSOWfY9NVpNdo+1nGzQswpZQVs35vWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOZnn2rs; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOZnn2rs"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84236f9b638so1537151b3a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053020; x=1782657820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdV1fV0Fid/R2q9Vczf4SGtHhC3UkfiLS8XxvVVRGDM=;
        b=eOZnn2rs4WyGTVJWlz4pcHsKfd4vCu2zoFY0Khii+cQM8InNGlMbbY4m02ZiOaJ1f1
         XbGF/8D5ZE4jQTJvohk3w8yA2Gpvw+vSVecz3ZRSbrneTachoKZSHw7VvlO4Q99k9m7z
         D43Vj7tEOc3Qx+R7Hvz+IPutFjM4hQnisQ7+rGuTzze+YG0deS4MoaQhsPxBQ/UeXJOc
         tOP+zMWdpMNpTpA+zjwgEbPDZpRb/xMau4d8aXcqO5jC+1tseGhbNG8Gw77yEnY8Z/xW
         VEoPRyGt8T5atp6At/yKMJwyVJfMyNQRCEh7I4hMzSQXrFX3HQI3UpSKfgvtUslq+p91
         A99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053020; x=1782657820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xdV1fV0Fid/R2q9Vczf4SGtHhC3UkfiLS8XxvVVRGDM=;
        b=K2Vp3BrWFTSp5ewpDf5pJwCXNDMTArYfJuEZwcifP0gd7Cy6a4rkrBxHg3GS7IcLJs
         D6uc667Ndzp5Wya84BJMShftXDChEDG4OL5rfURAXF0P4htTHFRMvETkkLx+MKHIr/QA
         2Mt8vnRnFUsXMue5hDF3BYkJ91k6CX3MT3oru3trqIyWDMWYYAU6NsfCqVJEGZZJPhuG
         aUX06aA3L29fAMOke+4uz7BuG2CKcy8WHZwtVj0ouqFeiSpWBAx8r25y6Xn9nVJ8YNmZ
         ec/hphGRvTOQnYeqE/tpP5bwFjQgN2ddXR64xhZEk3DhNDVEo93DJaH7oUs/5rWO2OnX
         E2kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/M95E1WZ4AC0EMGrsPp+cRmuOcU7r9vwwEKk7I1otZ5s6nGr/eHtUKWgh/DmuPJXnMXBRR55WtPzrQj18p4zQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5WaKYxCW/wtzsswJqZQZyLMtDPfTUFaw1UyG/THbye65QAHT
	dvLjUMUjBY2/GFTzZqdqbia2YI/pJfRmNbmwHjztK8i2KP2Vy8Fab+6r
X-Gm-Gg: AfdE7clitE/ut6XSs8x4GfOjEMHWuKi8yDoRg9OmgttlT+HES3pN8tv0AZOSLEMft8i
	8MfLLYc2GWXAkZo5LgN8Oj0bXEXbJrKEo9k5qMm9Ycqc+abCrH1MZxCv0BWLm9qkiCoIHeEOiSl
	95sFy7zPeRUzdHdfe2AUd+fvsUP1jR9WWghWLQHcKdbT89GBDAdwJeUc6SxeQVwNoVymn38rClR
	j/8pxr2U1IgUdnpf3lJtBeGOOmsrj8YC1eIzKjgkBCAiIP4RQ6D9qs1J95A511g4Q6gJGDTzNe5
	xHQ5GmizamIz7S59cKe0Pw37u9IdpV3lHdWcsoKR5wg8fkPWakSVd6ou6gAvkkVtTTY1fNpjO1c
	xQL05rb/g807CT6JZ7gEzc47CSfftY33TXRB+Im8I9v+g6TJ1iLhD6zmNP6/FK9/GP0WfPUJJB0
	JsrAQkhkhNmh4xla/GIphxLFZF5udR
X-Received: by 2002:a05:6a00:1d97:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-845508a70c9mr10966516b3a.30.1782053019778;
        Sun, 21 Jun 2026 07:43:39 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7687csm4963254b3a.35.2026.06.21.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:43:39 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 3/3] riscv, bpf: Remove BPF exceptions from BPF CI denylist
Date: Sun, 21 Jun 2026 20:12:59 +0530
Message-ID: <20260621144259.288135-4-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621144259.288135-1-varunrmallya@gmail.com>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes BPF exceptions from riscv64 denylist on
BPF selftests since support for exceptions has been added now.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 tools/testing/selftests/bpf/DENYLIST.riscv64 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
index 4fc4dfdde293..9268351ce4c1 100644
--- a/tools/testing/selftests/bpf/DENYLIST.riscv64
+++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
@@ -1,3 +1,2 @@
 # riscv64 deny list for BPF CI and local vmtest
-exceptions					# JIT does not support exceptions
 tailcalls/tailcall_bpf2bpf*			# JIT does not support mixing bpf2bpf and tailcalls
-- 
2.54.0

