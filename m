Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D0F9C0
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 02:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773023314; cv=none; b=L9Uc7QEarezCUTXtoqhuu1piRbLL17ytA+gFMw5V67IAmWoq1YZwpNsUF2P1T3uqk201z6T/uAbng8lI9fT50axRbvzmugj8u2MrCbnW1eIWZ/YM1XvaX4FcAkWp9Y2bKJRPDqSvFNV0cxLQI2sFLhYZBBaF2VCNh28BZZWJIHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773023314; c=relaxed/simple;
	bh=0PnHXD/eeR2S7L31MiPzD6lKHnVR5jRoYM2/It/mKp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2zTW5GL0j5FSqoad1F0qES5xEnhw21xH3usAcHWs8IZTWEDWwkzX+T+C+XuGkUjKYfTUsbmqjkWvObrF65pZa9Xh1pSYuldeZvXOEKeIMmmilk3b7AdEQH6kRCpwL7TvcBdSvDXJhgHUXQHAXlYuaG5yXs0u01MdV1ZLyTW45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+nJB2cC; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+nJB2cC"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1279eced0b9so10086927c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 19:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773023312; x=1773628112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps1Hfv9yWFYK/K2noVGj+dmwqc5tyuYyDUSGFJyxTPQ=;
        b=f+nJB2cCym1+ND8xUO2mrmtxcHy4ZhGBuzpCLNKQH7mXJn/X3B0RNAMWbWfOFbbH/7
         hTaK/ej2XrpfF7MBICDhvW4m8dgsN+E1mOkSSkxeu/RrL/amLzE9psRnCnV3DLyU7sC4
         DKk4U6KjxetnqKFAje08SFicMeURkK3eeKBLNx+DY8oU5sO+0GKmXnztPBa+HkcTA/Wb
         tAnyf3TxKZD3xOeiPjrzY05DO9hNMhbPcjU5YPWO+GgiSBcLZpQsHWhPj1UoICpi1K7W
         0Qcu1s2b52qLTApF03b2g/XEYWknIGjw72xytGBYHSx6ZDa8NesgVXcRauwRAJYmrBLB
         I9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773023312; x=1773628112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ps1Hfv9yWFYK/K2noVGj+dmwqc5tyuYyDUSGFJyxTPQ=;
        b=eOUontimK2623U1kSKqmyPk/6p8h2ixF2B9f6Fz5AL1kefSt8tlZO/K1LmX7AtClod
         7Z9xXc1Eo+QRQHa0wBc9eKFEOx366tsaLjisauR18ploIYq6F4WYaluRn1mYKtY29sNN
         0RlK8BCEya/7Af2Sb2+hx+q//lEvJbosryz0XkTdQKtKWDRFC4zNLxfvDz62uGHFzf9z
         k3FI0ewQHnHfPhCe3F/lUo6HrcH5RS1ZMMjK0amRo+8tq7NgOaZKdjOstwWRNJ9Ke4Gk
         4l8DDDtWpatZ85mj5aoWqTw6RVF6PiSbYGs44++NuOOtuAwnHN8b/fkcPobx8xrBLqME
         ViaA==
X-Forwarded-Encrypted: i=1; AJvYcCV1kWxlPRtG9CtEbZPmPCukCHx0jegilW/1+flWRP8eYz5E2GESETX3nbuo4P/ft2CQrNH323UIcP0QNQ9thOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsFK4Ri3HzsB5C3zWo2V0PqxwQn+BF6d8xs2s+PA3aBIkN+0cR
	Y6QNtl/SvNccUwNI6DK9YvfF/uL0kJw+UwXS+Fhp67Yo1ry0ZklVtlE8
X-Gm-Gg: ATEYQzwU1B1PIO+IEfuItgPraomvS/qM+gFEk+KUpiJQQc1WmjcTGMwjTN9/0mGEYSN
	gSTXdr0YXxax97iWWr9zVSn4Y7ZsNYw0KuTWizcORRiB7K+MXENR+CDGsNaOW3bieXiX/ksUvTQ
	9J5SUVzRG/LNuQMmClRyEdfxzHMd3Ig8Y/4Av5o6tud6YeR31UfVQzYEyiY+gSxzMyqM9z/GuOC
	aE0MynVSLr3piWULEWf0Jpbemr2KvO7K/E3hwZn0LEx8+qgCiYthFdTln0MkLt0Irpngeq8FiM5
	Ak/3YFic+iYuJk3+tZ4WH2fK/KcBVpPlZx/r8xabvTzSUfSpJfFaj8iyIqlps4tYNHJxDrefFQL
	HEXhNNwN/RDgwOnwoMt7vfQpUNRm3Rl5qIkP80MWkHzUhVKEPsy7ByZLID6qddeRBFaxDz/wj3p
	suyd1jV4ayNlCxogJpcR5tlo3eDlRWImh+Plk=
X-Received: by 2002:a05:7022:4186:b0:128:d5bd:3572 with SMTP id a92af1059eb24-128d5bd39b3mr713023c88.31.1773023311637;
        Sun, 08 Mar 2026 19:28:31 -0700 (PDT)
Received: from localhost.localdomain ([104.28.165.128])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3d5a85dsm6728418c88.3.2026.03.08.19.28.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Mar 2026 19:28:31 -0700 (PDT)
From: wang lian <lianux.mm@gmail.com>
To: sj@kernel.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	brendan.higgins@linux.dev,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	davidgow@google.com,
	kunit-dev@googlegroups.com,
	lianux.mm@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	skhan@linuxfoundation.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH 0/7] mm/damon: improve/fixup/update ratio calculation, test and documentation
Date: Mon,  9 Mar 2026 10:27:59 +0800
Message-ID: <20260309022759.9010-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260307195356.203753-1-sj@kernel.org>
References: <20260307195356.203753-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Yet another batch of misc/minor improvements and fixups.  Use
> mult_frac() instead of the worse open-coding for rate calculations
> (patch 1).  Add a test for a previously found and fixed bug (patch 2).
> Improve and update comments and documentations for easier code review
> and up-to-date information (patches 3-6).  Finally, fix an obvious typo
> (patch 7).

Hi SeongJae,

Thanks for the patches and the CC!

I've reviewed the entire series and conducted functional testing on my arm64 environment (native VM). 
All 28 KUnit tests passed successfully, including
the newly added damon_test_is_last_region.

Acked-by: wang lian <lianux.mm@gmail.com>
--
Best Regards,
wang lian
