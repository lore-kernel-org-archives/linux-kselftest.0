Received: from out-zbxj-a78.jellyfish.systems (out-zbxj-a78.jellyfish.systems [198.54.127.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8879E42FCAF
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976310; cv=none; b=rSYBlsaR7b0ZDFup5xT3QtsULUnsWn1UkAEmaQXk+8h8ZCUQiWq4o0aWb1ef2j+biowdCmWoBfjflWBPrC6Xo6gnVaY1pt+7scyY2/9hCCAhEEpJQV20k4qxxWsozrkCnOoKlJtI/OPTOMinDZTFmNGSsEOwxnNqtAUg4+RVk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976310; c=relaxed/simple;
	bh=9QV5GeLE/LHGXY3ls9wQrcsOI4R+edNYDdOMmb1N9ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cGKl/BygBqyQGfeK7Zla+w1IVwZSbwCD67SJ7Pq4Kj6T0yVNu+IAO1Z9d62xdB2aSVyFBgFRbTrswy0GNVfpheRgOKj2rZmshoSpPKoJCUZ6AMfGOLBECI2Mq0TZgyitZGlFav/p+eMxCErOXUQ25CoKXNGr+gkiZN/Ik0qvz/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=TdEDr4nX; arc=none smtp.client-ip=198.54.127.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="TdEDr4nX"
Received: from [172.20.10.14] (unknown [117.136.111.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hpFSq2tSSz2x9Z;
	Mon, 21 Sep 2026 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1789976288;
	bh=9QV5GeLE/LHGXY3ls9wQrcsOI4R+edNYDdOMmb1N9ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TdEDr4nXZVhK9gMHI1WbgXTsYeBuv2KZYrmqxvP4o0punnEqJ3uioXa7KNj7BJley
	 WB6W4vhXfJXnZd74X3q4H7A3mlXYdZZb4gIMc05JmD4vBnc55xEgwshalaakm5txyC
	 GImZ+6Z5ayxgWvl/qf3TnVVIeNpM5pxenaoHiXRmPvfWM3K6LAFNbTtxmrlKskdIK/
	 JUAirBkgjUllBCMUMrAhVx1K45PAc1KFGTtJOZE2RqwUjTDJeAmzhgJ285Gy2RvL8s
	 /ZSwKn4n/mvXjs9VWFaF84TvH7lmnBLn1u4hHWAynk93g8XVISsu46K+K9EiBGddhC
	 It764B6dj1Iww==
From: Tianyi Chen <hi@tychen.cc>
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, qmo@kernel.org, andrii@kernel.org, eddyz87@gmail.com,
 ihor.solodrai@linux.dev, linux-kselftest@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@kernel.org, yonghong.song@linux.dev,
 mason@kernel.org
Subject:
 Re: [PATCH bpf-next v4 1/2] bpftool: Read ring buffer maps with event_pipe
Date: Mon, 21 Sep 2026 16:37:59 +0900
Message-ID: <178997627946.100831.3568694846158146673@tychen.cc>
In-Reply-To: <a89e2e325b87c215e0fb6e4a24284922d7656cfc0e2a247f0c8c1cd823764c23@mail.kernel.org>
References: <20260919110721.1230756-2-hi@tychen.cc> <a89e2e325b87c215e0fb6e4a24284922d7656cfc0e2a247f0c8c1cd823764c23@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Envelope-From: hi@tychen.cc

> via _bpftool_once_attr. Can this cause tab-completion to offer
> cpu/index keywords after a ring buffer map identifier?

Yes. Fixed in v5 by teaching _bpftool_map_guess_map_type() about
event_pipe and suppressing these selectors for ringbuf maps. Perf event
arrays retain cpu/index completion; unresolved map types keep the
existing fallback.

Sent as a new thread, with this review linked in the cover letter:
https://lore.kernel.org/r/20260921073556.99421-1-hi@tychen.cc

Checked id/name/pinned completion against live maps, and all 18 ringbuf
subtests pass with the rebuilt bpftool.

Thanks,
Tianyi
