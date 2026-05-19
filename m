Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84908400E0B;
	Tue, 19 May 2026 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204221; cv=none; b=XAd/OXUMgmwsOQRwV5OM6IrSwVTemAuIcLKOd+9sWtFrhpaMInYr+arWUALQyu+IA0QnbNvWoKxYhAZmDbEJvsJYrw5yn1Eo1/ngNvwdggCJNFpkBa68BXUdERmCReNhbdQAILhFV7TXBARu7y/cNj8GY2iD9WK/PNVQYXKFs2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204221; c=relaxed/simple;
	bh=Yn9anD6S2sdeviR6DobfIVvn2ZavCIs6s3fiL/K+EFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CF2ceu5j+ajwUBbkI0GYSCwbCMaaIM6GYZOki9wGbkvLNw/FgNMZ2Jz9FFMLMJVOoIkEEpYG2quqGqTUaqRcm/VXGTr8yygk28S2nMtbAKMDqlFVglj0dD28O8RX7sGK4rMV1xjmJ8SJ1T0k7IcPOrVGcFxuBxQ/lW/Apf9bPcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qyb/zaDk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qyb/zaDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158B3C2BCB8;
	Tue, 19 May 2026 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204221;
	bh=Yn9anD6S2sdeviR6DobfIVvn2ZavCIs6s3fiL/K+EFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qyb/zaDkk0Kxc8Y+fiFGDHHWFnP4tzKZmSMEDXArE7dhcX8sAtLaT8yW9ehnS9ppJ
	 AC1keOftP127xOq9iN139McgXqqOTEx0e8Ey00jaBiCQ0+FyaCbliWv6WN8ewFEIux
	 WfwWP0M3ARPhI/z1SQt6RC+7WpIO2/WmsI5pTGmCKO3VWrGnh9J7jck6sk2U97MDmu
	 fXuAjdvZXhM0/ekE3DwDi+dyF/tPLLPgdg7AU8mH32oF0mku5GJ+MWos2zpJphD8FM
	 o1nuPu6Tza+gJnLxCDEmB8S2HPlv059UxhZ1hm+bdJ0i4yozSMCmB/0pwwA18Y1DD/
	 0lt2lWbaV0Zmg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: Implement support for 2025 dpISA extensions
Date: Tue, 19 May 2026 16:22:55 +0100
Message-ID: <177919551472.843780.18117053245871054269.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 18 May 2026 16:07:28 +0100, Mark Brown wrote:
> The 2025 dpISA extensions introduce a number of architecture features
> all of which are fairly straightforward from a kernel point of view
> since they only introduce new instructions, not any architecture state.
> 
> 

Applied selftest update to arm64 (for-next/selftests), thanks!

[2/2] kselftest/arm64: Add 2025 dpISA coverage to hwcaps
      https://git.kernel.org/arm64/c/7da70f41da81

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
