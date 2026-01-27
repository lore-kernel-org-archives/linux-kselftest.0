Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC70326D75;
	Tue, 27 Jan 2026 18:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538924; cv=none; b=r1hZLrlDGi93GxTINWbYNZMHoKYCFjMwHgIYTNAwzgh21F2G9uGhZGGBZ3Ap9r9DhIlAzvMX9+bEQTXsfk9j2RcsxGKjqDgc1KQO6gZD4ooDt0hBuAkCiuHqhApoSnqFUS8+p9+X9l89fa1A2auc0H8/eaMZG+fgRNjDctMJgV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538924; c=relaxed/simple;
	bh=DuLcxYcjzR2xmHAy5YE2AVPVcbMvwLcyMqT6hFaDYYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kdu+fJRd28YX7NZZKZvEBbNMJBIsFLsqkvm7Bb7zAlGnemRx0xhMgPAm+s0I8sef7cpsoVFVDmPTCBGRlVhCinaYhDwJ4Q0r4VKl9l31MQARXOJ6Ue6HbXJpT/HHJMvqQRfQ4ePodwzAY/1sm/Ev8aKNXYaiQAAEeQTeIzGeXUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7NqDEs8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7NqDEs8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B092DC116C6;
	Tue, 27 Jan 2026 18:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538923;
	bh=DuLcxYcjzR2xmHAy5YE2AVPVcbMvwLcyMqT6hFaDYYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I7NqDEs852BcgLp3PRvtYE6dYOsMHF2ftnJOIAEmA2Txo6C22mXTTxpHdDFVFRGwD
	 hmnlphbGN5lhzmxoGXTBJol3P3e7zcsA7G6GW1tRgEjRwUxuOGO8UP/ChPJp6M9fud
	 1xRa7bZQ+0LvZwhus08M2OQh0eect8l4XDiCxjmXCE5/Eq+i+d9fhEOGnb31hNLuCe
	 SKMW4N+lJ1GqW45hBLeZnsRhc186if5lHxjIRymbrIX0p9S7R1g2vJbseKzpSdAMkB
	 F2FocoRgyxSMMdKoZCitqIs0hf2KDEQsmW8VDWYEWh1eYjG630Vvd6z1ayG7jicRWR
	 khK6Iyvp7kgsQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Yuwen Chen <ywen.chen@foxmail.com>, bigeasy@linutronix.de, wakel@google.com
Cc: andrealmeid@igalia.com, colin.i.king@gmail.com, dave@stgolabs.net,
 dvhart@infradead.org, edliaw@google.com, justinstitt@google.com,
 kernel-team@android.com, licayy@foxmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
 morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
 peterz@infradead.org, shuah@kernel.org, usama.anjum@collabora.com, Yuwen
 Chen <ywen.chen@foxmail.com>
Subject: Re: [PATCH] selftests/futex: fix incorrect result reporting of
 futex_requeue test item
In-Reply-To: <tencent_56D79AF3D23CEFAF882E83A2196EC1F12107@qq.com>
References: <tencent_56D79AF3D23CEFAF882E83A2196EC1F12107@qq.com>
Date: Tue, 27 Jan 2026 19:35:19 +0100
Message-ID: <871pjac3a0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jan 27 2026 at 15:37, Yuwen Chen wrote:
> When using the TEST_HARNESS_MAIN macro definition to declare the main
> function, you need to use the EXPECT_ and ASSERT_ series of functions in
> conjunction. Otherwise, even if a test item fails, the test will still
> return a success result.
>
> When adding a delay in waiterfn to artificially create an incorrect test
> result, the test item has actually failed. However, the output still
> indicates that the test has passed:

This is an actual fix and wants to go _before_ adding hacks to solve the
my system is too busy to start a thread in 10 seconds "problem".

Thanks,

        tglx
