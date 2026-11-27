Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804770;
	b=ARhgyIetsNY2BttZPuhwCYOJlO8CgQh7eGYzLY5wjS+X+KoOrU0zp+hJ4ewmLkeY7oHi
	 Yzf5vh0S8gtmX+g2HEjITqGyT5UuHcHd38lQJALNgjtnPGigiHNILulyHkaJq0xDfN+yl
	 0M/iiMVzd6hzy6N6+k/nubC9cC9XIMDBEU3zyssj9jwpOcYH6bScdJN8ullx09cq/y6/L
	 f17HvYLxGOnoDWtp8NSiQZfDiYCZ91xyAtm9XZcDMuz3LDXxv2mHitFYFt3KNigvDcbtR
	 Q9dk5WKtQrbym9qj9Y+ITetj5FmVlfy2MnqivOpnGkSIeWBZDv8ymmxIWNfcEaKodDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804770;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yC0aXwOTd+FhK1Q6mDWG08cia12ERl2ciqVd/c7hjyk=;
	b=vIJU21yCyZZRlQiO4RKqzWsObVHOUqrjgV1R0vilivzxhAY/0wJzxaj+p44oHOBauU0g
	 qZKc/OBKodl68JdcKvg1SxqyBe8A0bEgeQjeN/XklqRZbbSU3iJ4ZskFo7EPp6Y8PpegO
	 1J2/GyW8dNkXF2IGB2Auasyt7vdN+//XOYNPtyMnqfMtDJf814pJ97rWWj6YSbcHIe3KK
	 14yTFQowNVYnOVMzmP2pgt3jhuPLlnIgPPUBzHqAkLWlxn1daxTrECW/dEipPfwfRpa/J
	 WoIkZ0bhZ6J3K0qu4RVrJJOa6cAFExdZ/9u8O9AaaRKtuLBtoOpHwQI6bPczpbk0gGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bdN7/wBz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D95606A326;
	Fri, 27 Nov 2026 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdN7/wBz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A6C1F00919;
	Fri, 27 Nov 2026 18:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804770;
	bh=yC0aXwOTd+FhK1Q6mDWG08cia12ERl2ciqVd/c7hjyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bdN7/wBzcDrucfd7TsOuPsTvOHjlUs5ykqoshVl9HDOnPlac6QixoLQ65tO89fkA5
	 xFkBQ5l6VC31RqxHWSneCg5eA1jWXUTVQ0PHfwTlPOmCQYoqbJK+RqK6BBWcwEsqN2
	 Ro3nV5sEAGdxeETvJuRxAXZOY7tALzjdOgaIQ/Ti1wP8KuX8TMPTFzQ5AAWxBVw3M5
	 PA3+eOuhCiaJhmAjkXzlVjrKr1lcyrmKeK9K4J//2+97CPYwWixd1HrdeY8kvcePJl
	 u3xcGcu83/uxRkKqnTDpTQIc/7AxNVvLxMENUbkenNXSn+Ty79EaBoci4JFUXoT2fY
	 ItQ/Ss5ees2Zw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Abdalla Eldoumani <aamsdoumani@gmail.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: Re: [PATCH 0/2] kselftest/arm64: vec-syscfg exit status and VL inheritance coverage
Date: Fri, 27 Nov 2026 18:39:09 +0000
Message-ID: <179579943738.1439845.14609418363972418388.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017182455.1884-1-aamsdoumani@gmail.com>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 17 Oct 2026 12:24:52 -0600, Abdalla Eldoumani wrote:
> Two small changes to the vector length configuration test.
> 
> The first makes vec-syscfg report failures through its exit status. It
> currently always exits 0, so a kernel that fails its checks still shows
> as passing in the kselftest runner.
> 
> The second implements the "Test PR_SVE_VL_INHERIT after a double fork"
> item from the fp TODO list by also checking the VL in a grandchild, two
> fork() and exec() generations down.
> 
> [...]

Applied first patch to arm64 (for-next/selftests), thanks!

[1/2] kselftest/arm64: Report test failures in vec-syscfg's exit status
      https://git.kernel.org/arm64/c/e5c438c92dff

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
