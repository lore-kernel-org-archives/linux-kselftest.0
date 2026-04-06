Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A63845A4
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486291; cv=none; b=D8w9pia6kjUUsBFynzWvtVgOm0ZPIJjTLxH+XuC1c9puMFJnOIIibpxWRsQpk+Tw7cwMI4o6B/vfzjG55vcFNgLdiZjZs7PgHhrVN+DYQNHR3DBLdXVgd/VGOSdKq9TLPyLucypUfDM+Bb1yfLyd7BSghnCe9NdPGCyEyAdTY5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486291; c=relaxed/simple;
	bh=ak6yaVgu9S/ortrE5hccn6VS1loqVuMDJsK2L8LS5HA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fpejYQsvXSsiXZK2aUsZUTRBltjOiqvWYHMKefnUD4cHmlMBoRARgWTavGOJ7Emy8Ab2LyoDehWdnBC7emBuaHJ0xys+uNwDodKqQCuRQyodUagw7pNfbGXArM84OvcUzFsS7IdfT9jFtyVYAraR15ZHuhcX1FI+hSUYxcrQ/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=EqXWGxGr; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="EqXWGxGr"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4704fb0d5b8so1461370b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775486286; x=1776091086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP+jU4JmX0ZcbJGHqewlu5EjA8WbPEq41I3kRck4Q80=;
        b=EqXWGxGrM5YUdTHEDoFu8WoasTue3p1bOzLqykXrJ7Cu8/uQYhteYnO6f0VbS0dA1w
         x21YNy/VOvfc2A8r1qAg9e1zNja+oUvyph00NYSJ8UMiNu+87CutcAOR5Y/Z3tPnuOeL
         xNKLDR6XvMiiSec7iUuxCV2Ab5x7CNTMXZif+VoBmXz/ygWiQQrCAes4mLAOItXWWmzf
         EDRyfromdnLTY//2IRuviiTN3nSHJzZ5h7F7+k1mrvePmuCyon/FdifrgrvnHMcdgTgx
         FvCvxsALF5iNm1f369NQsc2vigvOV3g2lEcLpI7b9KVw6JIolz5VgBYZFurJ1AteBRL+
         KNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486286; x=1776091086;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cP+jU4JmX0ZcbJGHqewlu5EjA8WbPEq41I3kRck4Q80=;
        b=lE9GIlxUD2aOyb5glSFXhuQ8Fb5a3Fe0UdmgjRxni3Mgv30o7/fRq8RieNXEluLBV1
         ElLBOFKxbcqk9Bhc1gZ2KE+xzLQAdDTRRFX9U10xZ+EXzeq7qEcJxFeknf0At3CYST6L
         S1cdsjRNXrwG9ni7j/+F1L2PE4XHkiH1iB+iWk10h/QensqDhNDldMxWsE2G9d0Fdh7f
         mFlrT6arAPEGiYv+pGaaO8SbWj29dJltZsWAs5kfTXlOIsJlqmqinst6ze5D3sZJJwzf
         7R93VKFfLKPwN3Jo6pRNeGG5Q5i/s+70Uy6xUlFDYmGPRqbFJkq3+P7hWVyWOpqE1pYA
         Lhyg==
X-Forwarded-Encrypted: i=1; AJvYcCXqwtMYTWKVnUkSDNu0zuAIfkb1jzXi2fDd9Ot7x12LQYhBehctW9CgXIUOB53mmnuMPeDVb2q1GJxfhkxzTo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRWv3R3br5UDciZrlv6vR2gseUb98h7+mFcfWEMgMIx6oJKPe
	zpC7NMbHWYEh/A+1WTfcx9ByTqrxcA1ON5cZjmMf2N67y4MpzjlcnKRfKOmfQAQwh6o=
X-Gm-Gg: AeBDieuDaz880jiH9MQj+UiKZHfAug69KAPgd96+q3Ik31AR+zYUqzeKAbb1dPLOkpi
	pyMlRwwFM8OsU+7z9c7od+nFlMyekAjYLMOHmTtxyxeeH96xE5Vy0HzryMbClnKIaeSI5/hH+ya
	3Sg1mMpdvjYS7/2hmH2HMZJZfwxecnq4evEuUCptkvozZF+5LrDvUMQ8qG6qq+p4/1+Ye8Yo9fw
	1xtU6N3OvxFF/LW7nQjMhM1H0VTH/PgtGfsP7VinbjBB0O6cnQ+xbTl57GOCvYhI5MmegJnCO0U
	4WIzY/QfhU9SP17K85mF5TCeyGfNsNRkdlzom1kZ5jWdf6YKoe2oGu13qKmJoPJFeIWC3eI0bhA
	6Q5Y6LQriTpggRFeluq8FrQTEoxYxMY5GWE/IB2S2pK4PdRL+heafTkRCkoCr7qLZ1R3/gVTB9z
	2QpHOjR9sk6BoSMfP0jMAmWc1TP7zBgtaAlH2DWq2sxdPFbkH2rNeSAJ2/PbYNeIsz8YHCBCEPz
	FOn
X-Received: by 2002:a05:6808:2203:b0:467:f1e5:a294 with SMTP id 5614622812f47-46f00b46690mr5674172b6e.4.1775486286255;
        Mon, 06 Apr 2026 07:38:06 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-472813cdbe7sm2038256b6e.7.2026.04.06.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 07:38:05 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, 
 "zhang, the-essence-of-life" <zhangweize9@gmail.com>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Shuah Khan <shuah@kernel.org>, Uday Shankar <ushankar@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20260405-cancel-v2-0-02d711e643c2@purestorage.com>
References: <20260405-cancel-v2-0-02d711e643c2@purestorage.com>
Subject: Re: [PATCH v2 0/2] ublk: fix infinite loop in ublk server teardown
Message-Id: <177548628476.84168.18270412241757304958.b4-ty@b4>
Date: Mon, 06 Apr 2026 08:38:04 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1


On Sun, 05 Apr 2026 22:25:29 -0600, Uday Shankar wrote:
> Fix an infinite loop in ublk server teardown which can arise when a ublk
> server dies while recovering a device. Also add a test which
> demonstrates the problem and verifies the fix.

Applied, thanks!

[1/2] ublk: reset per-IO canceled flag on each fetch
      commit: 0842186d2c4e67d2f8c8c2d1d779e8acffd41b5b
[2/2] selftests: ublk: test that teardown after incomplete recovery completes
      commit: 320f9b1c6a942a73c26be56742ee1da04f893a4f

Best regards,
-- 
Jens Axboe



