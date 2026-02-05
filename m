Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D17D3A1D1D
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285903; cv=none; b=ZTbEMUk/uu4aBp7KDrguSxvakdqeQSfZHen3QvnEgphpY7hBjSNf0M+MHI3e//LtcblRNQWcPeTmjV73Ua0rulaHBIaIHPzCJ4udlVE4ASPIMcy3HYAIeC4oX6M8LF/n91xdevv/uTxyrMwW4FtdJldgHfzVvVt6oJ56q4MaMno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285903; c=relaxed/simple;
	bh=cUCjXOzyNXfUHrVbFUTqxxw85y4D9L+9PaTcZvGpLiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdlxkbdTWCSZ69zL9wsMQ3VhKxerkdcQEpp0HcIyAOyS8JPyMXSnM3PPO5ZgCNZ7m0emo61+huCWWNwgB/tC5Y4YaU/BrmmUSv4Q2Giar7XkVoJMafoTYyQpU9/sIJH63ghy2PsRQrrODde9MGV0sTA2HIKE8qJkU61dFDTBezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlylkwtZ; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlylkwtZ"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a94450ae14so4038045ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770285903; x=1770890703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dsv48T5s7siDt+dbP9XLn3MeHYejAgqP+nja3QugRLg=;
        b=FlylkwtZCJEhtsohuFXzHFpNibTN9in+ujtxaS4qFtOx/7om108lV8AK4iyKt7xh00
         EyCRgR2kW5qKOLExINP0NqAZ2T1OcpJVJ7VAl48+tuaiE5oYxHjUEt4D5vy6hopAWBnz
         mlRj7UQh6k4ynn+drSUvtHl+Wf3f6QwXz7lMirch0JayzGYdg8kMIGMaZo4qHSRPtrt4
         /8+AlTf88IgdFwlDmoZWdGUntbQZ8JhJur2O1YS2K3UXbtw01avkt5E2iKFxmht5wuxR
         rbK9pcolUHrBPwNCOab1pxQi7MIO99CccYJ/Sg+4MXnLfNNIxwT9egCZJhI2khmVE+vZ
         UYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285903; x=1770890703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dsv48T5s7siDt+dbP9XLn3MeHYejAgqP+nja3QugRLg=;
        b=HT2YtB95pzcpGDrnrYl5qaWqcXPYYW98QFZLGCVS9l4Ej2jVcuvTDm9tZj1c6BlQHX
         Ks1EDZR1maCHbusCLrtsQH/eLBv5lNicoV6BtHJTyGiE5hIseWoSePyvDA0iwTNF45Ad
         hM+m0xlQYaK2LSj0sBcW0mpzADsi8qTcmkNokXlvKBuwUUqUgv1MGMkmtvqFhOU2swac
         a5bG+9Q753TnW+9TfKCbScHnABTPhKrxPquL69371sdcGUmZ8LGP+OXuFZS3eXy0F/cn
         rSqFvLcvw5fc/k5w0aflqXE2//EyxnS1y6+n5q5z6uhbNXpZsjH9XFnL7oe+3P6kLevy
         AtDA==
X-Forwarded-Encrypted: i=1; AJvYcCXE5OowhaXrNGI9a1gc0PUqnhQorGMp2Wv7+r+xS1UMM44pbuYDhwUncxxDubyfRA8l1QtZnDi/7IXyi1tQuzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqhkdB0wfJWAj3F3NFzl4HXy0OJhKDA7TrcAHkrLS7dIWyQDq
	e5cn3q40yOI6BWCbxVL+zJMEmK6hC25AfMuQSDNHDIO6ihw4/9XIBaSMsiChc6UWvQ==
X-Gm-Gg: AZuq6aJg3ByfHWVnUG14nUllAfxM2b7InQX3Lqp6QGpLYC5RwFSLanDnh3bgNDVcKsL
	cfaoGjkdxXR4pPMci/YqmcIq84ESOM/f9hd2/2o3uRlXpxAOkFeDcoe/EO+nvToqYT42FoldRkB
	vuW+IOyRYKvMbe/7w4EEs0j8cWSZieZjbQzhbzE24+7nGgjMkH1mGCMP4gdFTbf9eMQGy0B3VAx
	F3FWP+KUAOxCLIOkj7jUXQWBdfopMOzXLgjfz+ZaEN8PHuw4nJGZIKKU+9q+wovSXUWxfg3ScNZ
	wfNQbeaLZ6l3HFWH6NsX4tKb3Dp3kiU/KUErLwdy1v2D8bzIyOcS+5Z2wflfprpvOcLRJM7oUws
	fKd3fw50AuR9wCNSbO+hN1hsYHfqd22awyGbgCh+N/ptIYE3vw5DXxKFKzpKf7s+TyHgMImc7RF
	qWXnatQ47UP4/cy5O6DySJE4vlTwU35w==
X-Received: by 2002:a17:902:e884:b0:29f:3042:407f with SMTP id d9443c01a7336-2a933e4082amr70434625ad.21.1770285902784;
        Thu, 05 Feb 2026 02:05:02 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93396b2eesm49360365ad.78.2026.02.05.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:05:02 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: jack@suse.cz
Cc: amir73il@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	repnop@google.com,
	shuah@kernel.org
Subject: [RFC PATCH] selftests: fanotify: Add basic create/modify/delete event
Date: Thu,  5 Feb 2026 19:04:34 +0900
Message-ID: <20260205100437.1834-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <dnncglg3x26gdsshcniw5yb4l2zlxz6qcwjqyekkpngb6v26q4@ftqnoe5eeapy>
References: <dnncglg3x26gdsshcniw5yb4l2zlxz6qcwjqyekkpngb6v26q4@ftqnoe5eeapy>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the feedback!

I agree LTP has very comprehensive fanotify/inotify tests.

However, the motivation for adding basic tests to kernel selftests is:
    - Quick and lightweight regression checking during kernel
    development/boot (no external LTP install needed)
    - Non-root basic cases (many LTP tests require root or complex setup)

Similar to how selftests/mm or selftests/net have basic syscall wrappers
even though LTP covers them deeply.

Do you think a different approach (LTP improvement instead)
would be better?

Thanks,
Jinseok
