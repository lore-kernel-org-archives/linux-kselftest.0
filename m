Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B1C413D99
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804358; cv=none; b=tGD8wMEEIKfezxkYYnqRabV8WE88uqrEiZr9olbRM/JzP9Qz+W9/MIraNpo5EqmPM46NVxnoosLXRgPOuwn7W/g7UrnJdg8/jxyxe3Q2OGfOStNdwoGyDCZsJhcl6TYhDxVk+ecl4G1ieH1x/eGu4ThY2a5sflDuG53vVI1493I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804358; c=relaxed/simple;
	bh=jJZ2weKHhkNfXMFJ22b0RW7OCDsQCS4qAKK3lUmiR4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HS4O91p72Y7KDeNpZC8RZJ/k7CBbbPfydSC64DTTWx0lBHtJIqXODjS9UZhsL3mVQZFaT+soSv0ttVX2YxJfKZbfM4tMuWjOmUlFbkMXeLNpW2rM7zoZu6jUTc98VR7Q0J/SDlQFqdxwE1N2v+1iFRcZcfbpBVoJAdLjVeCDaVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIeYh1xA; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIeYh1xA"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab8309dcbaso1215342a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791804356; x=1792409156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJZ2weKHhkNfXMFJ22b0RW7OCDsQCS4qAKK3lUmiR4I=;
        b=JIeYh1xAiGNjN3AvWL5yfzL4h6yWxGfQ9uPB4TCUAM+4I6Czbd92KK/k5SRCsJSJ7F
         +Sf269kZD8JHzaXxFPfqGtgpsrDXvi8j5LvK98zEFbudKpPYNZcfSNjtCr5TkXcYtdJq
         5+yqVmD5mtpFwX/My0N02WK64WpE8UgcJ9SyzCoPLg8jjM1m3+wt1E9aP+vqwul4fk+b
         j+deKZCm1bWFXAPmiBN4LX5k8CqQdEb4ueotrF1rxUUuKwZ7SOtbKho3qrNKFJkzfVg+
         tzKHgzR4Houc6hGo0FQYDto2Gc/W3lfETkKkogUg0RgSzt1JklA6FKUHCYHp5OiQHsEL
         HwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804356; x=1792409156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jJZ2weKHhkNfXMFJ22b0RW7OCDsQCS4qAKK3lUmiR4I=;
        b=dte4vwt7iCXZ5PoW8xkQ2xPYlqUFZx+pd/UaN+iQ6NdKWz9ynRuJVx7Y4fSLXU7jyR
         JtYMOfha7DyrEp3MYUQK+dnkkwR/2222+d3Xd0YAjF2cVQTsL5D2k2VG+cA0mOCUtnqo
         caynzSFp+QyDdQiCVnV3euZconuNa4ur9gotEy8XCXVKFq5JA6d3IBV2dTDRqgvVup6k
         1w11FnnghljPYC1afo3w0ayKw6GS2pjLOnSiU0Rh3qixy0bt7CpP09ft5klkc6veIviE
         7NQ3ezOCFSHMrwPToXFNI6QepPRBgpyYQ/mumbcL4VBjMSOTOxSo9VYvSTAjIPU1ayQF
         rjFg==
X-Forwarded-Encrypted: i=1; AKwUvBysHdq/dRD5pAtr6T3Gbg3InB/VpKRlXZKW85qo2lIEpWyJ4V7/PMBDIW5wze+GsQhAoqYm+LMQxyDn6JlbLA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrAweqBHwIkFO7QWYtn9fY4owGgFCV6T9751yeFYgaOAIQeT9B
	NFVNiebI+rB9fZpYn829+543eBItYYABoWr0/NdCkEwK4WU2nC5GZ72D
X-Gm-Gg: AYBFou3aGsD08wUW72ImU5E41RE84CKEMV/T37LHBBKhIE/JY3k+XPYjbfRohufqjsO
	CUq8OLYibC8dteivFu1Z0i9JxO/Nam+kmU6r84eDDJxUl2js1yTCdY15AJX7s2Bj2Pxz0UprcmZ
	HI3LECpGWedWu66qUG/8De9SXNt6Jn4u4JqYQhX6mjHOATGrWKqcy0RIDS6acyEkYibQfiO3Y2v
	D5pw53hTcJcKR6pEVxmBGROC1gVdEy3lFtgIywKZySEo68S8wr3Fx6hrSqdh74/6aVMDKBGPzOy
	4l2h5JOgsZ9d5zdzb7U064FUG+v4XvkV9Yo7IIo9medaqQX/CVW3jzzMsm+3CjZgOHWKrLSNIvJ
	J+OJwi/antm1k3DyVIYOToMl5K8ide2SrFNFvX9qO3Sqr1T6VPS1qq4jr9OBZwLV4+fBr6pNU6p
	bmFF49MP2PB6Bsa1zcIGbm6ihWYCeHtYgOhXaqcavNDZYgG15167UFvZnb0yxqDnA84uq0Lswxg
	5R8Izp88SS18tX2CXqLff5W/kE=
X-Received: by 2002:a17:90a:e70c:b0:3ab:1a5:cd2 with SMTP id 98e67ed59e1d1-3ab3ac9b310mr5103674a91.35.1791804356368;
        Mon, 12 Oct 2026 04:25:56 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab396620e2sm9808526a91.3.2026.10.12.04.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:25:55 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/net: test tcp_rmem lower bound
Date: Mon, 12 Oct 2026 16:56:34 +0530
Message-ID: <20261012112634.3371756-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9b4b59ac-6e64-4dd2-88c1-c3f7844bbd36@kernel.org>
References: <20261007054508.1059927-1-sahaj123.sc@gmail.com> <9b4b59ac-6e64-4dd2-88c1-c3f7844bbd36@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Eric,

Thanks for the review. I agree that a separate test for each sysctl bound
does not scale and that this focused tcp_rmem test is not the right fit. I
won't send a v2 of it.

Your points about the non-portable 4096 assumption and partial updates are
also noted. The generic network-sysctl test you described is broader work;
I'll treat it separately rather than expanding this patch.

Thanks,
Sahaj
