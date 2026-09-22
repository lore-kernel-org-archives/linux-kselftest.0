Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E18320A00;
	Tue, 22 Sep 2026 00:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790037374; cv=none; b=AWWB9DILAYrd+5WZDhfcbLOLrpYOcaQKAMqs737XbWvfzo4y5ii1UzFd7Px8s5UcL74SMnGu2+k1PhgJhK3f2kAE19Zvd/htn2DvbobhwJmr7dmUMdQ2O+mbn2L6A+Q9TYcOhdS3WDQVDsI6sXi+6dlTZfKOGZgjvTFg9vwPY8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790037374; c=relaxed/simple;
	bh=1VC12kYjpENUYcMmvnSMpZVIs8EcE6KjVJ7fmJQCJ+w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P3+W+RJL/OlpauFD/v1HhgL5dJEWLCJhD4s5m8JfnRlHUgepaS6Dmt3NVOnwQuQnPbndMoE/JYaOhaQhmY19i6leS3oE++4QiYxPc65D5B9xaLiH1kdRDgwByGbV+uAFo7yeCVq/4/yHirRGCo/momhMF4+LKeTdlkLEWCPVWxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FV71XCkH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FV71XCkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943131F000FF;
	Tue, 22 Sep 2026 00:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790037368;
	bh=1VC12kYjpENUYcMmvnSMpZVIs8EcE6KjVJ7fmJQCJ+w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FV71XCkHMF+F549G+dCRXBFV8fkbU0/Bn9Cb/natS+/6mzVnPj79c3xGieqenEIpe
	 SYFrYHC4MTWjKdBoWjxwwD6B0O+XpD10si7YGmPQk2riXeutKLbrCjGbsZwHYTvg9e
	 DTibXzArggQE++DRuYrse5R4jm/JOIQaChsTlbmSpJl/Zeb0klaDKVTBmfvNgl1vGn
	 DrbtLzboImFteaYA8MfReuaQookSraBbciRG1bH0Jrjv5cqtbY05cKNIxiuuXoXRJ4
	 FZuYtvt5Tt4KG59drDdCDSOIVl9lN0y0jOtx8RLLprO9c9dH1GDMkn65XxAsqgcvKW
	 pPtQmkzeOPvgA==
Date: Mon, 21 Sep 2026 17:36:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Oleg Nesterov
 <oleg@redhat.com>, Joel Granados <joel.granados@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests: net: fix CONFIG_SYSCTL sort order in
 configs
Message-ID: <20260921173606.611c34b1@kernel.org>
In-Reply-To: <20260918-selftests-net-config-sort-v1-1-968ea6e8c1b7@gmail.com>
References: <20260918-selftests-net-config-sort-v1-1-968ea6e8c1b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 22:49:30 +0900 Yuya Kusakabe wrote:
> Commit 8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors
> CONFIG_SYSCTL") renamed CONFIG_PROC_SYSCTL to CONFIG_SYSCTL in place,
> which left the entry out of alphabetical order in the net and
> packetdrill configs. The netdev CI check for sorted selftest configs
> now fails for every patch that touches either file.

Thanks a lot for fixing it up!
