Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E2374726
	for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543062; cv=none; b=NcEQg3vDWyleMFl5ethUzvPP9o9EJ6cS2zUucsb7UYtHqGGNpPmNji3huALt+pRu22gxog7KAFywLz8n1QF00zVrIw9sUt4WbpVK80Gc8GY6EdYK4+uKbg6O4oebKhL/v0+f2Ot8r/IZ5QC6JumToZq1Ww01LCmPeiJxn+kv/Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543062; c=relaxed/simple;
	bh=w+gdOzcxRWSaMSeUWEpZmPQvNkjoo5XWgynt8DUZ3FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJfZzRjgfW3M1f4BmZwgx/8B/TJcukLQWwQ3+Sx+l7mB+iWH0JpXqSlhVG1RxqSmJ+BmMZoCgen68S5+8CYkuPNVain9l1bpCVsAQdydNqj52i5plvyv9+nWAt8Xbu3cFVGu8b5+ksojxQlRpsKWeVNSmxRcWlTFil2NJmSaptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cxb4FmAk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cxb4FmAk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c9b8e3797eso19685ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782543060; x=1783147860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+gdOzcxRWSaMSeUWEpZmPQvNkjoo5XWgynt8DUZ3FQ=;
        b=Cxb4FmAkQzELBSsn1A/KFH2gm9OpTnwbmB4LaKvltazHPOH3kTzYg0gs6u+y5a5Neh
         s6slStDt1MzxNhghC4YXAmSYFZWPIvy9zh9uBF72DRBB85HsixNbY0hBTteHvpqPqhPp
         wW/bXdbKWkdUqPZnjXeClWUa2p7v0ef3l0FxegEjAvpdVlD/oyr1gZVw0Ei/jTHqqZYW
         z7zwrbkXmncKlrxvScaafJJ06fXU8rc5YpPmhnu1JRt9obnH47PhUMzENf+dtXNEHC6O
         zAI89umd5r/k+HafLA/oHJhjws+Ilhi3Gp3SWVa/5IZBF3nEGh/r/4x6mHTeEcrJtMjO
         KWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543060; x=1783147860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+gdOzcxRWSaMSeUWEpZmPQvNkjoo5XWgynt8DUZ3FQ=;
        b=N0IPzLUNq2BGHXOeG1Eslnpyv7Wlx98qn2DX412Z31SYr/HMhmICaBOHqCBtKk+IK4
         7vd+RLRQmfBfmysUTbYEOihjsr5ouXqJM68R1i38t/bl/kcDoaZYPuzxtEEraovxjObq
         YSaMVB1SLHBvbfbco8TgL6fn4DzheAzPN9CAmG7YDxtEWMOTkZGxOpWSiGdNJJx2mxr7
         y13SZEqv5M0L0UDRU+3RqZ4b7+Eo6dobeGz1yzcBnfeXETT7MVS80jgJ2WpZJi+A86uC
         o3YjaGpEcGsR7gBNjZPDKhXJRqTTOhJwK3mU0mEKVoCOmm/o/Qcs8A/nYlfpkuhRVJi1
         +3BA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/2WUn1h6xgWwZc7zcINL0MRuX/UrUMj+lRoCpVOcJjc73XkPg1amP3LGPXMBYcXDHsbp+t63jwi8JbHj4QLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyBGCjaADthpOm9R3nlCAfEHrSx067NGTC4eycbibDlfeS/JW5
	WVrhWwX1hqVJx0My6TkvyhrYkoyCTFmMtAsyeNSgRYhQX38XYRG69NDmekkr7l8f
X-Gm-Gg: AfdE7clnWQkwiGn/S/OiEjM6eDGbtQUmWjRQQE0SUwR74eCABu+n+kGGb+Ssmjpr9A5
	ppwc3s9K8hm49Guk4bFmLxkcKYLDKUrJHsWcpBPO6mveVl7SWnWjt/draree72S8qDMljzekNlz
	AC9aYKE4iiu4weFx7KN/0HAswPDYU7Wl9DjsdFXkS3FUNkloNhH6qS8uuniJKFKZfjHJL1xrBdH
	FWWvOnvTSNsBMbT5+K8LKbYAWp7pW3/QFUGo8hSmjghOy7JFkyrIMPqdeWfYtNXS0z/NqqWfsUS
	Tl2zII71ggqIG/C/ILXio2EiGrjIyNn+FSUqJPhW5ScH7LPP1rT8Xur1Z6027lkSOEklxe+1AF5
	kVfthZ92hpSUWfT831x32TK/UKbPnlXl0LuD0Gx8fmDAUrRkfbocTu4HlBwwY1NLum1a2j5oc0a
	AUS+3zo1Ve7v0=
X-Received: by 2002:a17:903:1b2e:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2c98287fd72mr20884195ad.3.1782543059830;
        Fri, 26 Jun 2026 23:50:59 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d0dc7sm52055845ad.57.2026.06.26.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:50:59 -0700 (PDT)
Date: Sat, 27 Jun 2026 15:50:56 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests: filelock: add .gitignore for ofdlocks
Message-ID: <aj9y0CaM2Uq21eEd@elitemini>
References: <20260621-selftests-filelock-gitignore-v1-1-119da1a4ee27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621-selftests-filelock-gitignore-v1-1-119da1a4ee27@gmail.com>

Please drop this - it's a duplicate of commit b3c726f9f466
("kselftest/filelock: add a .gitignore file"), already in mainline.

Thanks,
Masaharu
