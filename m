Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207394120D
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Nov 2023 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F051C433C9;
	Thu, 23 Nov 2023 19:26:10 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix output formatting for za-fork
Date: Thu, 23 Nov 2023 19:26:08 +0000
Message-Id: <170076756598.3159824.7681360032827191396.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231116-arm64-fix-za-fork-output-v1-1-42c03d4f5759@kernel.org>
References: <20231116-arm64-fix-za-fork-output-v1-1-42c03d4f5759@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 16 Nov 2023 12:52:29 +0000, Mark Brown wrote:
> The za-fork test does not output a newline when reporting the result of
> the one test it runs, causing the counts printed by kselftest to be
> included in the test name.  Add the newline.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] kselftest/arm64: Fix output formatting for za-fork
      https://git.kernel.org/arm64/c/460e462d2254

-- 
Catalin

