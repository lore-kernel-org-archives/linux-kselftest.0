Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63732749DA
	for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542497; cv=none; b=lf8tZS3c6J4g3mOmxeUgpMmDGAiXgdJLiQm/LTDiJuWD4nrUQpUNbl3Syx5ZPsHkMm6RDc2XnNZX+3FmqqshLzMdM63FdLv6oy8l51GtBC5jDpqp5ZtzPBe0OMZxz6i/b9AQxv/x/wlXK+Kyf4fSHqPEtEsjdosfSdgyavc+1yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542497; c=relaxed/simple;
	bh=4s019A5XluhkMkodS+DKuqgV/LQVvPoIHxE5EgwLkoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKKVv6v5CRJVkCnZZxBRmMgrnR9H+/eaejfKrv0FsAYTpi/JBJyfKtfUplia47ugXl/XbybITZHXUuVRzgTtjCFsdFJV1CWk/qlIUvxSEsGaxUHalB1rSYmtwWROug6R35AUAmRq6R4uh0ms/sl++4sWbVq1TMTpwBHwsFR7LCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV3zEtr2; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV3zEtr2"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f80e3f72so453901e87.0
        for <linux-kselftest@vger.kernel.org>; Sun, 27 Sep 2026 13:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542494; x=1791147294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4s019A5XluhkMkodS+DKuqgV/LQVvPoIHxE5EgwLkoU=;
        b=cV3zEtr2GkUYkAwquKR33xd0jNIqbUhwVHyIWW27cQ+MNtVaP/RmpMuFkzRFJr99S9
         adxW5ZtZ1zL6BFNZhOFK52bvITzGeNfNF57fda/N7BbRRTC8klVM8yRcyQNFCx8FKHRo
         Fm9yWMYBs0h06lwmBJbDgM+w6qGwykLnKj03SNC2o6sUKA9zCNfDVzm2ICVC9pu0ijpJ
         Ds/EpOv+dxdYLvEfQ+7sF0DkRYC7n/Zl3Q54OJ6LAfHOqhWPKKM4pixA7rx3p6ewBCIg
         7MDX46+cbxVOj/hefojrjtRYfErXxXR2/4VtA5P/GefvmYxoxy2M6xdzYv8Q/PTZLw7p
         KoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542494; x=1791147294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4s019A5XluhkMkodS+DKuqgV/LQVvPoIHxE5EgwLkoU=;
        b=essr/y7cnpGzwlOpymFnStvJAfdOtm+WtwbNnfDQtj6tuYPoOCOjVEtPzfZKnSbXAb
         wblKPzuN1OsxSJ6jOhvEdvpCfbr1sM0TL2cdtIMQiX6J884YbK9hcnfPouvJuBr9mp7X
         pa4H4tZl5JMNdxtd2FPlP6KnpUkcU8zrBysr4GVEU2TUTil5bURvliW2jO3jejWAPSzj
         6yniWsGylwsKKMyE/n9x34PqLl4RVRJm+UV8NSjKY237SmJSLYGYtx7KucMzYpV9t4XI
         hgVMLIC6WSJm6dLWO9HV+zOWzZyL22drOqQP5PKgwEW0fQSPBmSks9LjbM1e/1VWLjNB
         +nww==
X-Forwarded-Encrypted: i=1; AKwUvBwtXrTEBVOJQ0a/yE2et2zaJF1+iw0XP6rBVxiWUAmHuzOb+HYkcSeMBsGh51PfTKNQzyAVn9B6pZPMPHoIqqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl33w6W1EDQ6uPUZ/3qudPXtUfFzL0ITb2IaAk1b5HLpVElr+n
	soB+pM+92D5vQrp9QcL9niJV4ENbDwDv/3WJzItpZe7YjlTu2MQWZrcK
X-Gm-Gg: AYBFou0MC/e8vDywFQlgH6MCa6UXdNC545LosnxT0OJ3adyRD5w/3npTVlYt9zNVu0I
	4U5LAx3Uo48D/0GS3XLgx2xyvouCES288WZaxv7UQ2vzB7tjfQZ9cyC2NDa4tQ372sipOLxB2jC
	OndSWacZU9Yp0UGhgqLzfSbkItSRx6k/+MnsrVEPuedYuKjAF0PS4f4V8Cx9v/aSKXI01KvLp11
	Ug/paOYIutAQgQ0K91hEt997WSWbYmMoMuXewrRxwyGYtx1D7Wloe1y4WhU/5IW6kgZjKz28aVg
	iDtbNdFcaKB1RAei1lm6T2LyEEVqM7Ns1+66ZfIHMsfnVPj8num7+vi34ABs8ig3vXrdefqy/qk
	uK51mxyE7eZbs+nodcKPIwNQR5Pt8wp+3jTY0bYfzyAM4inXM0PoHXMSJN4u8ueyWTuyUDssWbu
	dmokcSRN09ZqnoowuH5kDG/zx+TEIYrv/Ew5cmRcrOG+1hXOOpm4DL1jzkgkGPSPwFZyJIHpx8J
	NNlJmfnz9qihco=
X-Received: by 2002:a05:6512:3c84:b0:5b6:19c9:d7b7 with SMTP id 2adb3069b0e04-5b8df0e092dmr3242374e87.26.1790542493568;
        Sun, 27 Sep 2026 13:54:53 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6b01b38sm2050914e87.54.2026.09.27.13.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:54:53 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: bpf@vger.kernel.org
Cc: Maxim Skokov <skokovmaksimevg@gmail.com>,
	qmo@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	hi@tychen.cc,
	martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Check that bpftool map dump fails for socket storage
Date: Sun, 27 Sep 2026 23:54:31 +0300
Message-ID: <20260927205436.107097-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <ed8edf2cea6ce83f46358c910ad9315650cec3e36dca87ea46de30c43ab06a75@mail.kernel.org>
References: <20260926170149.541352-1-skokovmaksimevg@gmail.com> <20260926170149.541352-3-skokovmaksimevg@gmail.com> <ed8edf2cea6ce83f46358c910ad9315650cec3e36dca87ea46de30c43ab06a75@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Someone reading only create_sk_storage_map() would think it returns a
> populated map. Should the comment say the function creates an empty socket
> storage map, or move to the caller where the element is added?

Right, the comment is left over from an earlier version. I'll make it
say the function creates an empty map.

> Covering the count path needs a map that has no BTF and can't be iterated,
> for example a queue, stack or bloom filter map created without BTF.
> Unfixed bpftool printed "Found 0 elements" for those. Otherwise the
> assertion and that part of the changelog could be dropped.

Agreed, local storage always has BTF, so plain mode goes through the
BTF writer and "Found" can't show up there. I'll add a queue map
created without BTF and check its plain dump for no "Found" line, which
the unfixed bpftool prints as "Found 0 elements". Both go into v4.
