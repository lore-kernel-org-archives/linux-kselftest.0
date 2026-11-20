Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156227;
	b=Z33dpWX4w7G5TJZrnNlWQhfUEg9kRqBEUTUVXOqsn0yWnI97dLI7sghEQUC6N8VhB1Jc
	 tuEd8Ph4Um2W9HGy+b3aFdst5epAnBVAqstdQsQqFU+Ho0ZrFI+mOLTXLgY2JXu5e4SF5
	 jlKymyuBEL7IV4BIUIgIyXzESgN8ru7HgYo7tDW8yt3tQbfuT7G7U0l6AD2IDokfMDYbR
	 jTI9vr8IqqF/Y0k+Emm5zCfBD8PDFDjgmv+u0yhqYomkOHNy6c19QLtUnbpWQsqPy35G7
	 ZzvL1Wsefb+2XPKCzGtOzCF0usBRO8gsaiXTyhETcim9FhN0n8EoCSwb6f/gtc0cQfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
	b=ek16y12FPuum6RSQexKuu4XxKFEMV7Tn5l7elyrF7zU7Fpndg1oLqjDULbcE1xusv5tk
	 J+fJyIoU/yEtWxrfPDSyqNa7+V6HObsDF6osSfGjqu+t/bT8x3G9Ci1roggDAQNq9Mfwq
	 AwNsxxWvp/Vn59OHJoL806gDcMBdTpsnezlkQ4aqDGYJE5FRSWawO3uPxEAOn3sEww4tO
	 ShWj3HX7QDqfo1Fn7zlQM+UTb/D+ULxXeHWkhNOxv1qiACk6Etoh8/5N4F59RjK2Tnpiw
	 v3LDZGWmyVi4ddoW4CiRJ/eSZBb3FT2wKHBGhb7FmLZxIc5znWjkh5IF7jtMX+YWEHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrKwf29R;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D78606A330
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 06:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D78606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrKwf29R
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a8eed31158so18390f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 22:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795156225; x=1795761025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
        b=rrKwf29RxJaLqeRRwX0Hr8VMInzojJKS4lEs/16ybfr09oIYUUK6GVEHgx8Gek+Io4
         yL2RIjKhBZ+Z4ViGC34h/PjIMMdCZE6KaWf8lRpbnjeWJNJsaJCdwKmI+Xa5aS+IUN7D
         cL3fUcLe/z5vWV7qLDRT+qGF5DyNUQEMAYn7acLo/KJGrGsnKIR1QaMxIDwW/kLG7mtm
         SbJc9YVVlx4Tf39gy5a4PLW+pNcruFddWwZNkEFVe1GwZA+zW7TRDwcmYuwTnzViOOhd
         znp0YNI8AirzHUDgnJJbBCHQJG09WECBSU46BjuSmQMA2eWO5pEfFh8UKh9fHuAqQz+C
         ZcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156225; x=1795761025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0n4SWJn0eCkT+PucpRBq7zBOVrkhlFT1562vZMNT6LY=;
        b=s8XQQAfwjqoHv1t/zqBcHISqQu9b1YyMP9qA5pbCRzLlaMZOCn87i9/g5QfHZ3FH+V
         ca6IQCYusJE6Sha4R7Hap9+Irx9hhyDlz6z4k/5R+omexEKL4AePsEnacZqy7lTBviCm
         eL2mMbW7hN1bDsd99Rt0AVzd+pJAT33HwovAxVcKfL0EB5Zn7+JXIPyU1LrE3K8r+GtE
         6egSiTKX/CZp/0xYcSQC0ce96hLD/oZLQ6+z2U7dnSvNVc/fgPhtGavlPrETFDd5FA+V
         glatvdVR4r+Ns7qP9hhxbzqXcpYjk75k9F7fb4jICurhInLLb9QVTTduh5B86VYmdbn0
         dMpA==
X-Forwarded-Encrypted: i=1; AL+hErG4L5dnk3/IHZVzhZHSZd2uKr1FIDWVxzH7zZm98sbqAmmkz2EkyE8xS6dD/6FEtfYbg5UsS15DY1yiYtLDeqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vErvydrZfn2qgiBs5W0Ch0Rg66nRQYTzcSWu9FUlykuRlfxUg
	wFRD8T2DVv3vS9n/zhVuVh89AzY+Uh0w/gHI0OaEfN1fiumBnQ6qu60j
X-Gm-Gg: AYBFou1VuxgcSWWK96Rl8O1SH6R6URPOLH1i8iM2KCzse4InisV64ihAOauLYRMT4iM
	9VePCTirKq4xCQv7RkGvAQVXuAbP6qdnhC4tQWt2xC5x/Rsgno5nMnyhg0q2//CMhJJkU42koWl
	pbh5eE895Wyk/VQ/hBNUEL7KEH/QNlQyeoUHMVj8Mv9PBZMJ31FHd+caMgLa6AktR9ZJbANtDFd
	1lB7ToKPDOChpBLiWidYPJmE2cCBykPDoxeMukFL3MHTfu56yIlox15FtkaofV6XRORNe3a8omX
	DXlUrdtNXluA6tE6KnMNfxXaLZj1Ywe6mIgZAgCZHyXZU7vg4l5UjOEF4giH/WQ9GLO1h84zEFr
	xhnWlQ/UhLbYATpw01yFdik9v2+2JknYBqSdnQ3u8zXTAA4YwtHT0JERsrfd+Y7wkFZRZkWVI+Y
	+tabnYPm9TVaqfuj+42rCVVqIc7GIqUhdc7PP3GoT6VtGKRjf3peBf07wlc0wpaiXfdV537r51i
	3KOY2wgKcPwN2okr/ihUToWxOHO+l2aymu7hTNS9zNbS2XCgMMeu8Zo4B8qCi8yMMf9RwLmARx0
	OdHlXYiGvwTYLJgCQLJi40R06hPm/kuk77L1ZbxFLCHbfm7e1MiICeBnTsiVB9vd2nnWRA==
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr30363775e9.1.1795156225028;
        Thu, 19 Nov 2026 22:30:25 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm77798865e9.9.2026.11.19.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:30:24 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Fri, 20 Nov 2026 07:30:11 +0100
Message-ID: <20261120063011.21557-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The connect() failure branch reports "bind fd2", copy-pasted from the
bind() block above. Name the failing call.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/sk_connect_zero_addr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/sk_connect_zero_addr.c b/tools/testing/selftests/net/sk_connect_zero_addr.c
index 4be418aefd9f7..4441e9c62fde5 100644
--- a/tools/testing/selftests/net/sk_connect_zero_addr.c
+++ b/tools/testing/selftests/net/sk_connect_zero_addr.c
@@ -46,7 +46,7 @@ int main(void)
 	}
 e
 	if (connect(fd2, (struct sockaddr *)&bind_addr, sizeof(bind_addr))) {
-		error(1, errno, "bind fd2");
+		error(1, errno, "connect fd2");
 		goto out_err2;
 	}
 
-- 
2.43.0

